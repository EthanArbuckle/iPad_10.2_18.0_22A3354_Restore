@implementation CALNSharedCalendarInvitationNotificationEKDataSource

- (CALNSharedCalendarInvitationNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 dataAccessExpressConnection:(id)a6 preferences:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CALNSharedCalendarInvitationNotificationEKDataSource *v17;
  CALNSharedCalendarInvitationNotificationEKDataSource *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CALNSharedCalendarInvitationNotificationEKDataSource;
  v17 = -[CALNSharedCalendarInvitationNotificationEKDataSource init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v18->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v18->_notificationReferenceProvider, a5);
    objc_storeStrong((id *)&v18->_dataAccessExpressConnection, a6);
    objc_storeStrong((id *)&v18->_preferences, a7);
  }

  return v18;
}

- (id)fetchSharedCalendarInvitationNotifications
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
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CALNSharedCalendarInvitationNotificationEKDataSource fetchSharedCalendarInvitationNotificationSourceClientIdentifiers:](self, "fetchSharedCalendarInvitationNotificationSourceClientIdentifiers:", 0);
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
        -[CALNSharedCalendarInvitationNotificationEKDataSource fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:](self, "fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
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
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation notification infos. Found %{public}@ notifications", buf, 0xCu);

  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (id)fetchSharedCalendarInvitationNotificationSourceClientIdentifiers:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNSharedCalendarInvitationNotificationEKDataSource preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sharedCalendarNotificationsDisabled");

  if (v6)
  {
    v7 = (void *)objc_opt_new();
  }
  else
  {
    -[CALNSharedCalendarInvitationNotificationEKDataSource inboxNotificationProvider](self, "inboxNotificationProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventNotificationReferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v15, "type", (_QWORD)v25) == 2)
          {
            if (!v4
              || (objc_msgSend(v15, "objectID"),
                  v16 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v16, "stringRepresentation"),
                  v17 = (void *)objc_claimAutoreleasedReturnValue(),
                  v18 = objc_msgSend(v4, "containsObject:", v17),
                  v17,
                  v16,
                  v18))
            {
              objc_msgSend(v15, "notification");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "URL");
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v21 = (void *)v20;
                v22 = objc_msgSend(v19, "hiddenFromNotificationCenter");

                if ((v22 & 1) == 0)
                {
                  +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:](CALNNotificationDataSourceUtils, "sourceClientIdentifierForNotification:", v19);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "addObject:", v23);

                }
              }

            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

  }
  return v7;
}

- (id)fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[CALNSharedCalendarInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventStore");
    v6 = objc_claimAutoreleasedReturnValue();

    -[CALNSharedCalendarInvitationNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNNotificationDataSourceUtils, "notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 2, v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CALNSharedCalendarInvitationNotificationEKDataSource _notificationInfoFromNotificationReference:](self, "_notificationInfoFromNotificationReference:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138543618;
        v20 = v4;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation notification with sourceClientIdentifier = %{public}@. Info = %@", (uint8_t *)&v19, 0x16u);
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CALNSharedCalendarInvitationNotificationEKDataSource fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:].cold.1(v6, v11, v12, v13, v14, v15, v16, v17);
    v9 = 0;
  }

  return v9;
}

- (void)clearSharedCalendarInvitationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CALNSharedCalendarInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:inEventStore:](CALNNotificationDataSourceUtils, "calendarWithSourceClientIdentifier:inEventStore:", v4, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    +[CALNNotificationDataSourceUtils hideCalendarFromNotificationCenter:inEventStore:](CALNNotificationDataSourceUtils, "hideCalendarFromNotificationCenter:inEventStore:", v6, v7);

}

- (void)joinSharedCalendarWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CALNSharedCalendarInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CALNSharedCalendarInvitationNotificationEKDataSource dataAccessExpressConnection](self, "dataAccessExpressConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationDataSourceUtils respondToSharedCalendarInvitationWithSourceClientIdentifier:inEventStore:withDataAccessExpressConnection:accept:](CALNNotificationDataSourceUtils, "respondToSharedCalendarInvitationWithSourceClientIdentifier:inEventStore:withDataAccessExpressConnection:accept:", v4, v7, v6, 1);

}

- (void)declineSharedCalendarWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CALNSharedCalendarInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CALNSharedCalendarInvitationNotificationEKDataSource dataAccessExpressConnection](self, "dataAccessExpressConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationDataSourceUtils respondToSharedCalendarInvitationWithSourceClientIdentifier:inEventStore:withDataAccessExpressConnection:accept:](CALNNotificationDataSourceUtils, "respondToSharedCalendarInvitationWithSourceClientIdentifier:inEventStore:withDataAccessExpressConnection:accept:", v4, v7, v6, 0);

}

- (void)reportSharedCalendarAsJunkWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CALNSharedCalendarInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationDataSourceUtils reportSharedCalendarInvitationAsJunkWithSourceClientIdentifier:inEventStore:](CALNNotificationDataSourceUtils, "reportSharedCalendarInvitationAsJunkWithSourceClientIdentifier:inEventStore:", v4, v6);
}

- (id)_notificationInfoFromNotificationReference:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(a3, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CALNSharedCalendarInvitationNotificationEKDataSource _notificationInfoFromNotification:](self, "_notificationInfoFromNotification:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CALNSharedCalendarInvitationNotificationEKDataSource _notificationInfoFromNotificationReference:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v5 = 0;
  }

  return v5;
}

- (id)_notificationInfoFromNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CALNSharedCalendarInvitationNotificationInfo *v9;

  v3 = a3;
  +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:](CALNNotificationDataSourceUtils, "sourceClientIdentifierForNotification:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDelegate");
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CALNSharedCalendarInvitationNotificationInfo initWithSourceClientIdentifier:calendarNotification:isDelegate:sourceTitle:sourceIdentifier:]([CALNSharedCalendarInvitationNotificationInfo alloc], "initWithSourceClientIdentifier:calendarNotification:isDelegate:sourceTitle:sourceIdentifier:", v4, v3, v6, v7, v8);

  return v9;
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

- (CALNDataAccessExpressConnection)dataAccessExpressConnection
{
  return self->_dataAccessExpressConnection;
}

- (EKNotificationPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dataAccessExpressConnection, 0);
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)fetchSharedCalendarInvitationNotificationWithSourceClientIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_215D9B000, a1, a3, "sourceClientIdentifier was nil. Bailing.", a5, a6, a7, a8, 0);
}

- (void)_notificationInfoFromNotificationReference:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_215D9B000, a1, a3, "Failed to get notification object from notification reference. Bailing.", a5, a6, a7, a8, 0);
}

@end
