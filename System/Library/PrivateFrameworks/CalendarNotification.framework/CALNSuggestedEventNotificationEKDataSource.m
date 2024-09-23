@implementation CALNSuggestedEventNotificationEKDataSource

- (CALNSuggestedEventNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CALNSuggestedEventNotificationEKDataSource *v12;
  CALNSuggestedEventNotificationEKDataSource *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CALNSuggestedEventNotificationEKDataSource;
  v12 = -[CALNSuggestedEventNotificationEKDataSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v13->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v13->_notificationReferenceProvider, a5);
  }

  return v13;
}

- (id)fetchSuggestedEventNotifications
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationObjectIDs](self, "fetchSuggestedEventNotificationObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:](self, "fetchSuggestedEventNotificationWithObjectID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v20 = v12;
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched (%lu) suggested event notifications", buf, 0xCu);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (id)fetchSuggestedEventNotificationObjectIDs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v18;
  _BYTE v19[15];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[CALNSuggestedEventNotificationEKDataSource inboxNotificationProvider](self, "inboxNotificationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventNotificationReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        if (objc_msgSend(v10, "type") == 5)
        {
          objc_msgSend(v10, "notification");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "URL");
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13 && objc_msgSend(v12, "needsAlert"))
            {
              if (objc_msgSend(v12, "type") == 12 || objc_msgSend(v12, "type") == 14)
              {

                goto LABEL_13;
              }
              v15 = objc_msgSend(v12, "type");

              if (v15 != 13)
              {
LABEL_17:

                goto LABEL_18;
              }
LABEL_13:
              objc_msgSend(v12, "objectID");
              v13 = objc_claimAutoreleasedReturnValue();
              -[NSObject stringRepresentation](v13, "stringRepresentation");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v14);

            }
          }
          else
          {
            +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationObjectIDs].cold.1(&v18, v19, v13);
          }

          goto LABEL_17;
        }
LABEL_18:
        ++v9;
      }
      while (v7 != v9);
      v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v7 = v16;
    }
    while (v16);
  }

  return v4;
}

- (id)fetchSuggestedEventNotificationsWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNSuggestedEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v4;
  objc_msgSend(v6, "predicateForEventsCreatedFromSuggestionWithExtractionGroupIdentifier:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventsMatchingPredicate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v13), "eventIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v11);
  }

  -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationObjectIDs](self, "fetchSuggestedEventNotificationObjectIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
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
        -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:](self, "fetchSuggestedEventNotificationWithObjectID:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v19);
  }

  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __105__CALNSuggestedEventNotificationEKDataSource_fetchSuggestedEventNotificationsWithSourceClientIdentifier___block_invoke;
  v29[3] = &unk_24D484E80;
  v30 = v8;
  v23 = v8;
  objc_msgSend(v16, "indexesOfObjectsPassingTest:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectsAtIndexes:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __105__CALNSuggestedEventNotificationEKDataSource_fetchSuggestedEventNotificationsWithSourceClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "suggestionNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  return v5;
}

- (id)fetchSuggestedEventNotificationWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNSuggestedEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNSuggestedEventNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNNotificationDataSourceUtils, "notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 5, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "notification");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CALNSuggestedEventNotificationEKDataSource _notificationInfoFromNotification:inEventStore:](self, "_notificationInfoFromNotification:inEventStore:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543618;
        v14 = v4;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched suggested event notification with objectID = %{public}@, notification info = %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:].cold.2();
      v10 = 0;
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (void)confirmSuggestedEventWithSourceClientIdentifier:(id)a3
{
  -[CALNSuggestedEventNotificationEKDataSource _acknowledgeSuggestedEventWithSourceClientIdentifier:accept:](self, "_acknowledgeSuggestedEventWithSourceClientIdentifier:accept:", a3, 1);
}

- (void)ignoreSuggestedEventWithSourceClientIdentifier:(id)a3
{
  -[CALNSuggestedEventNotificationEKDataSource _acknowledgeSuggestedEventWithSourceClientIdentifier:accept:](self, "_acknowledgeSuggestedEventWithSourceClientIdentifier:accept:", a3, 0);
}

- (void)deleteCanceledSuggestedEventWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  -[CALNSuggestedEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNSuggestedEventNotificationEKDataSource _eventForSourceClientIdentifier:eventStore:](self, "_eventForSourceClientIdentifier:eventStore:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = 0;
    v8 = objc_msgSend(v6, "removeEvent:span:error:", v7, 2, &v11);
    v9 = v11;
    if ((v8 & 1) == 0)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CALNSuggestedEventNotificationEKDataSource deleteCanceledSuggestedEventWithSourceClientIdentifier:].cold.2();

    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CALNSuggestedEventNotificationEKDataSource deleteCanceledSuggestedEventWithSourceClientIdentifier:].cold.1();
  }

}

- (void)clearSuggestedEventNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Clearing suggested event notification with source client identifier = %{public}@", buf, 0xCu);
  }

  -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationObjectIDs](self, "fetchSuggestedEventNotificationObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[CALNSuggestedEventNotificationEKDataSource _clearSuggestedEventNotificationWithObjectID:](self, "_clearSuggestedEventNotificationWithObjectID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_clearSuggestedEventNotificationWithObjectID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Clearing suggested event notification with object ID = %{public}@", buf, 0xCu);
  }

  -[CALNSuggestedEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNSuggestedEventNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNNotificationDataSourceUtils, "notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 5, v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "notification");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      -[NSObject resourceChangeFromEventStore:](v10, "resourceChangeFromEventStore:", v7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v18 = 0;
        v13 = objc_msgSend(v7, "markResourceChangeAlertedAndSave:error:", v12, &v18);
        v14 = v18;
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if ((v13 & 1) != 0)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject objectID](v11, "objectID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v20 = v17;
            _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, "Cleared suggested event notification with objectID %{public}@", buf, 0xCu);

          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          -[CALNSuggestedEventNotificationEKDataSource _clearSuggestedEventNotificationWithObjectID:].cold.4(v11);
        }

      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CALNSuggestedEventNotificationEKDataSource _clearSuggestedEventNotificationWithObjectID:].cold.3(v11, v14);
      }

    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CALNSuggestedEventNotificationEKDataSource _clearSuggestedEventNotificationWithObjectID:].cold.2(v12);
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CALNSuggestedEventNotificationEKDataSource fetchSuggestedEventNotificationWithObjectID:].cold.1();
  }

}

- (void)_acknowledgeSuggestedEventWithSourceClientIdentifier:(id)a3 accept:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a4;
  v6 = a3;
  -[CALNSuggestedEventNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNSuggestedEventNotificationEKDataSource _eventForSourceClientIdentifier:eventStore:](self, "_eventForSourceClientIdentifier:eventStore:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (v4)
    {
      objc_msgSend(v8, "acceptSuggestedEvent:", v9);
      v11 = (void *)MEMORY[0x24BE14000];
      objc_msgSend(v10, "suggestionInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEventConfirmedNotificationWithUniqueKey:", v13);

    }
    else
    {
      v15 = (void *)MEMORY[0x24BE14000];
      objc_msgSend(v9, "suggestionInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uniqueKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logEventRejectedNotificationWithUniqueKey:", v17);

      objc_msgSend(v8, "deleteSuggestedEvent:", v10);
    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CALNSuggestedEventNotificationEKDataSource _acknowledgeSuggestedEventWithSourceClientIdentifier:accept:].cold.1();

  }
}

- (id)_eventForSourceClientIdentifier:(id)a3 eventStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "predicateForEventsCreatedFromSuggestionWithExtractionGroupIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventsMatchingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBD1A8];
  if (v8)
    v9 = v8;
  v10 = v9;

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CALNSuggestedEventNotificationEKDataSource _eventForSourceClientIdentifier:eventStore:].cold.1((uint64_t)v5, v10);

  }
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CALNSuggestedEventNotificationInfo *v12;
  NSObject *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "suggestedEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "origin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "externalKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[CALNResourceChangedNotificationDataSourceUtils expirationDateForNotification:](CALNResourceChangedNotificationDataSourceUtils, "expirationDateForNotification:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNResourceChangedNotificationDataSourceUtils launchURLForNotification:inEventStore:](CALNResourceChangedNotificationDataSourceUtils, "launchURLForNotification:inEventStore:", v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CALNSuggestedEventNotificationInfo initWithSourceClientIdentifier:launchURL:expirationDate:suggestionNotification:]([CALNSuggestedEventNotificationInfo alloc], "initWithSourceClientIdentifier:launchURL:expirationDate:suggestionNotification:", v9, v11, v10, v5);

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CALNSuggestedEventNotificationEKDataSource _notificationInfoFromNotification:inEventStore:].cold.1(v5, v13);

    v12 = 0;
  }

  return v12;
}

- (EKEventStoreProvider)eventStoreProvider
{
  return self->_eventStoreProvider;
}

- (CALNInboxNotificationProvider)inboxNotificationProvider
{
  return self->_inboxNotificationProvider;
}

- (CALNEKCalendarNotificationReferenceProvider)notificationReferenceProvider
{
  return self->_notificationReferenceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)fetchSuggestedEventNotificationObjectIDs
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Failed to get notification from notification reference.", buf, 2u);
}

- (void)fetchSuggestedEventNotificationWithObjectID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Failed to get suggested event notification reference with objectID %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchSuggestedEventNotificationWithObjectID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Failed to get suggested event notification from notification reference. objectID = %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteCanceledSuggestedEventWithSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Could not get event. Cannot delete suggested event for source client identifier = %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteCanceledSuggestedEventWithSourceClientIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Error deleting canceled suggested event: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_clearSuggestedEventNotificationWithObjectID:(NSObject *)a1 .cold.2(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(0, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, a1, v3, "Failed to get notification object from notification reference. Bailing. notification objectID = %@", v4);

  OUTLINED_FUNCTION_4_1();
}

- (void)_clearSuggestedEventNotificationWithObjectID:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, a2, v4, "Failed to get resource change for notification with objectID %{public}@", v5);

  OUTLINED_FUNCTION_4_1();
}

- (void)_clearSuggestedEventNotificationWithObjectID:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v2, v3, "Failed to mark resource change as alerted for notification with objectID %{public}@, error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)_acknowledgeSuggestedEventWithSourceClientIdentifier:accept:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, v0, v1, "Could not get event. Cannot acknowledge event for source client identifier = %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_eventForSourceClientIdentifier:(uint64_t)a1 eventStore:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v2, v3, "Unexpectedly found more than 1 event with extraction group identifier = %{public}@. Found (%lu) events", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)_notificationInfoFromNotification:(void *)a1 inEventStore:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_215D9B000, a2, v5, "Cannot create notification info from notification without source client identifier, notification object ID = %{public}@", v6);

  OUTLINED_FUNCTION_1();
}

@end
