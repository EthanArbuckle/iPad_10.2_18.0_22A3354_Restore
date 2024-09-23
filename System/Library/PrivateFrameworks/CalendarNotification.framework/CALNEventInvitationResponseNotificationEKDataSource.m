@implementation CALNEventInvitationResponseNotificationEKDataSource

- (CALNEventInvitationResponseNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 dataSourceEventRepresentationProvider:(id)a6 preferences:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CALNEventInvitationResponseNotificationEKDataSource *v17;
  CALNEventInvitationResponseNotificationEKDataSource *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CALNEventInvitationResponseNotificationEKDataSource;
  v17 = -[CALNEventInvitationResponseNotificationEKDataSource init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v18->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v18->_notificationReferenceProvider, a5);
    objc_storeStrong((id *)&v18->_dataSourceEventRepresentationProvider, a6);
    objc_storeStrong((id *)&v18->_preferences, a7);
  }

  return v18;
}

- (id)fetchEventInvitationResponseNotifications
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
  -[CALNEventInvitationResponseNotificationEKDataSource fetchEventInvitationResponseNotificationSourceClientIdentifiers:](self, "fetchEventInvitationResponseNotificationSourceClientIdentifiers:", 0);
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
        -[CALNEventInvitationResponseNotificationEKDataSource fetchEventInvitationResponseNotificationWithSourceClientIdentifier:](self, "fetchEventInvitationResponseNotificationWithSourceClientIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
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
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event invitation notification infos. Found %{public}@ notifications", buf, 0xCu);

  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (id)fetchEventInvitationResponseNotificationSourceClientIdentifiers:(id)a3
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
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNEventInvitationResponseNotificationEKDataSource preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "invitationNotificationsDisabled");

  if (!v6)
  {
    -[CALNEventInvitationResponseNotificationEKDataSource inboxNotificationProvider](self, "inboxNotificationProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventNotificationReferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v11)
      goto LABEL_19;
    v12 = v11;
    v13 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v15, "type", (_QWORD)v23) == 1)
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
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20 || (objc_msgSend(v19, "hiddenFromNotificationCenter") & 1) != 0)
            {
LABEL_15:

            }
            else
            {
              v21 = objc_msgSend(v19, "type");

              if (v21 == 3)
              {
                +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:](CALNNotificationDataSourceUtils, "sourceClientIdentifierForNotification:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v20);
                goto LABEL_15;
              }
            }

            continue;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v12)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
  }
  v7 = (void *)objc_opt_new();
LABEL_20:

  return v7;
}

- (id)fetchEventInvitationResponseNotificationWithSourceClientIdentifier:(id)a3
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
  -[CALNEventInvitationResponseNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNEventInvitationResponseNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNNotificationDataSourceUtils, "notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 1, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "notification");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CALNEventInvitationResponseNotificationEKDataSource _notificationInfoFromNotification:inEventStore:](self, "_notificationInfoFromNotification:inEventStore:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543618;
        v14 = v4;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event invitation response notification info with sourceClientIdentifier: %{public}@ info: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationWithSourceClientIdentifier:].cold.2();
      v10 = 0;
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationWithSourceClientIdentifier:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (void)clearEventInvitationResponseWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CALNEventInvitationResponseNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationResponseNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 1, v4, v5, v6);

}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNEventInvitationResponseNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNEventInvitationResponseNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 1, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CALNEventInvitationResponseNotificationEKDataSource fetchEventInvitationResponseNotificationWithSourceClientIdentifier:](self, "fetchEventInvitationResponseNotificationWithSourceClientIdentifier:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      -[NSObject eventInvitationNotification](v9, "eventInvitationNotification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKNewTimeProposerForNotification();
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v25 = v10;
        v26 = v6;
        v27 = v4;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v8, "attendees");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v30 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              -[NSObject URL](v12, "URL");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "URL");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v19, "isEqual:", v20);

              if (v21)
              {
                objc_msgSend(v8, "acceptProposedTimeNotificationFromAttendee:", v18);
              }
              else if (objc_msgSend(v18, "hasProposedStartDate"))
              {
                objc_msgSend(v8, "declineProposedTimeNotificationFromAttendee:", v18);
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v15);
        }

        v28 = 0;
        v6 = v26;
        v22 = objc_msgSend(v26, "saveEvent:span:error:", v8, 0, &v28);
        v23 = v28;
        if ((v22 & 1) != 0)
        {
          v4 = v27;
        }
        else
        {
          +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
          v24 = objc_claimAutoreleasedReturnValue();
          v4 = v27;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[CALNEventInvitationResponseNotificationEKDataSource acceptEventInvitationResponseWithSourceClientIdentifier:].cold.4();

        }
        v10 = v25;
      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[CALNEventInvitationResponseNotificationEKDataSource acceptEventInvitationResponseWithSourceClientIdentifier:].cold.3();
      }

    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CALNEventInvitationResponseNotificationEKDataSource acceptEventInvitationResponseWithSourceClientIdentifier:].cold.2();
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CALNEventInvitationResponseNotificationEKDataSource acceptEventInvitationResponseWithSourceClientIdentifier:].cold.1();
  }

}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNEventInvitationResponseNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNEventInvitationResponseNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 1, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CALNEventInvitationResponseNotificationEKDataSource fetchEventInvitationResponseNotificationWithSourceClientIdentifier:](self, "fetchEventInvitationResponseNotificationWithSourceClientIdentifier:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      -[NSObject eventInvitationNotification](v9, "eventInvitationNotification");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKNewTimeProposerForNotification();
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v26 = v6;
        v27 = v4;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v8, "attendees");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v30;
          v25 = v8;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v30 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              -[NSObject URL](v12, "URL", v25);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "URL");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v19, "isEqual:", v20);

              if (v21)
              {
                v8 = v25;
                objc_msgSend(v25, "declineProposedTimeNotificationFromAttendee:", v18);
                goto LABEL_18;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            v8 = v25;
            if (v15)
              continue;
            break;
          }
        }
LABEL_18:

        v28 = 0;
        v6 = v26;
        v22 = objc_msgSend(v26, "saveEvent:span:error:", v8, 0, &v28);
        v23 = v28;
        if ((v22 & 1) != 0)
        {
          v4 = v27;
        }
        else
        {
          +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
          v24 = objc_claimAutoreleasedReturnValue();
          v4 = v27;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[CALNEventInvitationResponseNotificationEKDataSource declineEventInvitationResponseWithSourceClientIdentifier:].cold.4();

        }
      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[CALNEventInvitationResponseNotificationEKDataSource declineEventInvitationResponseWithSourceClientIdentifier:].cold.3();
      }

    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CALNEventInvitationResponseNotificationEKDataSource declineEventInvitationResponseWithSourceClientIdentifier:].cold.2();
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CALNEventInvitationResponseNotificationEKDataSource declineEventInvitationResponseWithSourceClientIdentifier:].cold.1();
  }

}

- (id)_notificationInfoFromNotification:(id)a3 inEventStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CALNEventInvitationResponseNotificationInfo *v19;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;

  v6 = a3;
  v7 = a4;
  +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:](CALNNotificationDataSourceUtils, "sourceClientIdentifierForNotification:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils expirationDateForEventInvitation:](CALNEventInvitationNotificationDataSourceUtils, "expirationDateForEventInvitation:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils eventForEventInvitation:inEventStore:](CALNEventInvitationNotificationDataSourceUtils, "eventForEventInvitation:inEventStore:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v11, "isDelegate");
    objc_msgSend(v11, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKLaunchURLForEventInvitation();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNEventInvitationResponseNotificationEKDataSource dataSourceEventRepresentationProvider](self, "dataSourceEventRepresentationProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v14 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeZone");
    v16 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "eventRepresentationDictionaryForInvitationNotification:event:date:endDate:timeZone:", v6, v10, v13, v15, v17);
    v25 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v16;
    v9 = v14;

    v19 = -[CALNEventInvitationResponseNotificationInfo initWithSourceClientIdentifier:launchURL:expirationDate:eventInvitationNotification:eventRepresentationDictionary:isDelegate:sourceTitle:sourceIdentifier:]([CALNEventInvitationResponseNotificationInfo alloc], "initWithSourceClientIdentifier:launchURL:expirationDate:eventInvitationNotification:eventRepresentationDictionary:isDelegate:sourceTitle:sourceIdentifier:", v16, v21, v14, v6, v18, v24, v23, v22);
    v7 = v25;

  }
  else
  {
    v19 = 0;
  }

  return v19;
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

- (CALNDataSourceEventRepresentationProvider)dataSourceEventRepresentationProvider
{
  return self->_dataSourceEventRepresentationProvider;
}

- (EKNotificationPreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dataSourceEventRepresentationProvider, 0);
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get event (%{public}@) when attempting to accept invitation response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get notification info for sourceClientIdentifier (%{public}@) when attempting to accept invitation response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get a proposer when attempting to accept and invitation response notification that should have been a proposed new time notification (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)acceptEventInvitationResponseWithSourceClientIdentifier:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Error saving event store after accepting proposed new time for sourceClientIdentifier (%{public}@), error = %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get event (%{public}@) when attempting to decline invitation response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get notification info for sourceClientIdentifier (%{public}@) when attempting to decline invitation response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get a proposer when attempting to decline an invitation response notification that should have been a proposed new time notification (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)declineEventInvitationResponseWithSourceClientIdentifier:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Error saving event store after declining proposed new time for sourceClientIdentifier (%{public}@), error = %@");
  OUTLINED_FUNCTION_1_0();
}

@end
