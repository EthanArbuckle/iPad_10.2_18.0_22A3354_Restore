@implementation CALNSharedCalendarInvitationResponseNotificationEKDataSource

- (CALNSharedCalendarInvitationResponseNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 preferences:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CALNSharedCalendarInvitationResponseNotificationEKDataSource *v15;
  CALNSharedCalendarInvitationResponseNotificationEKDataSource *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CALNSharedCalendarInvitationResponseNotificationEKDataSource;
  v15 = -[CALNSharedCalendarInvitationResponseNotificationEKDataSource init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v16->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v16->_notificationReferenceProvider, a5);
    objc_storeStrong((id *)&v16->_preferences, a6);
  }

  return v16;
}

- (id)fetchSharedCalendarInvitationResponseNotifications
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
  -[CALNSharedCalendarInvitationResponseNotificationEKDataSource fetchSharedCalendarInvitationResponseNotificationSourceClientIdentifiers:](self, "fetchSharedCalendarInvitationResponseNotificationSourceClientIdentifiers:", 0);
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
        -[CALNSharedCalendarInvitationResponseNotificationEKDataSource fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:](self, "fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
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
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation response notification infos. Found %{public}@ notifications", buf, 0xCu);

  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (id)fetchSharedCalendarInvitationResponseNotificationSourceClientIdentifiers:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNSharedCalendarInvitationResponseNotificationEKDataSource preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sharedCalendarNotificationsDisabled");

  if (v6)
  {
    v27 = (id)objc_opt_new();
  }
  else
  {
    -[CALNSharedCalendarInvitationResponseNotificationEKDataSource inboxNotificationProvider](self, "inboxNotificationProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventNotificationReferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    -[CALNSharedCalendarInvitationResponseNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v16, "type") == 3)
          {
            if (!v4
              || (objc_msgSend(v16, "objectID"),
                  v17 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v17, "stringRepresentation"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19 = objc_msgSend(v4, "containsObject:", v18),
                  v18,
                  v17,
                  v19))
            {
              objc_msgSend(v16, "notification");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "URL");
              v21 = objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v22 = (void *)v21;
                v23 = objc_msgSend(v20, "hiddenFromNotificationCenter");

                if ((v23 & 1) == 0)
                {
                  objc_msgSend(v20, "inviteReplyNotificationFromEventStore:", v10);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v24, "alerted") & 1) == 0)
                  {
                    +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:](CALNNotificationDataSourceUtils, "sourceClientIdentifierForNotification:", v20);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "addObject:", v25);

                  }
                }
              }

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

  }
  return v27;
}

- (id)fetchSharedCalendarInvitationResponseNotificationWithSourceClientIdentifier:(id)a3
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
    -[CALNSharedCalendarInvitationResponseNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventStore");
    v6 = objc_claimAutoreleasedReturnValue();

    -[CALNSharedCalendarInvitationResponseNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNNotificationDataSourceUtils, "notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 3, v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CALNSharedCalendarInvitationResponseNotificationEKDataSource _notificationInfoFromNotificationReference:](self, "_notificationInfoFromNotificationReference:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138543618;
        v20 = v4;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Fetched shared calendar invitation response notification with sourceClientIdentifier = %{public}@. Info = %@", (uint8_t *)&v19, 0x16u);
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

- (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CALNSharedCalendarInvitationResponseNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationDataSourceUtils clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:](CALNNotificationDataSourceUtils, "clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:", v4, v6);
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
    -[CALNSharedCalendarInvitationResponseNotificationEKDataSource _notificationInfoFromNotification:](self, "_notificationInfoFromNotification:", v4);
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
  CALNSharedCalendarInvitationResponseNotificationInfo *v9;

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
  v9 = -[CALNSharedCalendarInvitationResponseNotificationInfo initWithSourceClientIdentifier:calendarNotification:isDelegate:sourceTitle:sourceIdentifier:]([CALNSharedCalendarInvitationResponseNotificationInfo alloc], "initWithSourceClientIdentifier:calendarNotification:isDelegate:sourceTitle:sourceIdentifier:", v4, v3, v6, v7, v8);

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

- (EKNotificationPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

@end
