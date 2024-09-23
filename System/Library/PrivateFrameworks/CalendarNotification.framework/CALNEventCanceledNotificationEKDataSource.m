@implementation CALNEventCanceledNotificationEKDataSource

- (CALNEventCanceledNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 remoteMutator:(id)a6 dataSourceEventRepresentationProvider:(id)a7 preferences:(id)a8
{
  id v15;
  id v16;
  id v17;
  CALNEventCanceledNotificationEKDataSource *v18;
  CALNEventCanceledNotificationEKDataSource *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CALNEventCanceledNotificationEKDataSource;
  v18 = -[CALNEventCanceledNotificationEKDataSource init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventStoreProvider, a3);
    objc_storeStrong((id *)&v19->_inboxNotificationProvider, a4);
    objc_storeStrong((id *)&v19->_notificationReferenceProvider, a5);
    objc_storeStrong((id *)&v19->_remoteMutator, a6);
    objc_storeStrong((id *)&v19->_dataSourceEventRepresentationProvider, a7);
    objc_storeStrong((id *)&v19->_preferences, a8);
  }

  return v19;
}

- (id)fetchEventCanceledNotifications
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
  -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationSourceClientIdentifiers:](self, "fetchEventCanceledNotificationSourceClientIdentifiers:", 0);
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
        -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationWithSourceClientIdentifier:](self, "fetchEventCanceledNotificationWithSourceClientIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
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
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event canceled notification infos. Found %{public}@ notifications", buf, 0xCu);

  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (id)fetchEventCanceledNotificationSourceClientIdentifiers:(id)a3
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
  -[CALNEventCanceledNotificationEKDataSource preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "invitationNotificationsDisabled");

  if (!v6)
  {
    -[CALNEventCanceledNotificationEKDataSource inboxNotificationProvider](self, "inboxNotificationProvider");
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
        if (!objc_msgSend(v15, "type", (_QWORD)v23))
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

              if (v21 == 2)
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

- (id)fetchEventCanceledNotificationWithSourceClientIdentifier:(id)a3
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
  -[CALNEventCanceledNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNEventCanceledNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNNotificationDataSourceUtils, "notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 0, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "notification");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CALNEventCanceledNotificationEKDataSource _notificationInfoFromNotification:inEventStore:](self, "_notificationInfoFromNotification:inEventStore:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543618;
        v14 = v4;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event canceled notification info with sourceClientIdentifier: %{public}@ info: %@", (uint8_t *)&v13, 0x16u);
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

- (void)clearCanceledEventNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CALNEventCanceledNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventCanceledNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 0, v4, v5, v6);

}

- (void)deleteCanceledEventWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  id v13;

  v4 = a3;
  -[CALNEventCanceledNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNEventCanceledNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 0, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CALNEventCanceledNotificationEKDataSource remoteMutator](self, "remoteMutator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v10 = +[CALNRemoteMutatorShared deleteEvent:inEventStore:withSpan:usingRemoteMutator:error:](CALNRemoteMutatorShared, "deleteEvent:inEventStore:withSpan:usingRemoteMutator:error:", v8, v6, 2, v9, &v13);
    v11 = v13;

    if (!v10)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CALNEventCanceledNotificationEKDataSource deleteCanceledEventWithSourceClientIdentifier:].cold.2();

    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CALNEventCanceledNotificationEKDataSource deleteCanceledEventWithSourceClientIdentifier:].cold.1();
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
  CALNEventCanceledNotificationInfo *v19;
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
    -[CALNEventCanceledNotificationEKDataSource dataSourceEventRepresentationProvider](self, "dataSourceEventRepresentationProvider");
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

    v19 = -[CALNEventCanceledNotificationInfo initWithSourceClientIdentifier:launchURL:expirationDate:eventInvitationNotification:eventRepresentationDictionary:isDelegate:sourceTitle:sourceIdentifier:]([CALNEventCanceledNotificationInfo alloc], "initWithSourceClientIdentifier:launchURL:expirationDate:eventInvitationNotification:eventRepresentationDictionary:isDelegate:sourceTitle:sourceIdentifier:", v16, v21, v14, v6, v18, v24, v23, v22);
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

- (CALNRemoteMutator)remoteMutator
{
  return self->_remoteMutator;
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
  objc_storeStrong((id *)&self->_remoteMutator, 0);
  objc_storeStrong((id *)&self->_notificationReferenceProvider, 0);
  objc_storeStrong((id *)&self->_inboxNotificationProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
}

- (void)fetchEventCanceledNotificationWithSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get notification reference with sourceClientIdentifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchEventCanceledNotificationWithSourceClientIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get notification from notification reference. sourceClientIdentifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteCanceledEventWithSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get canceled event (%{public}@) when trying to delete it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)deleteCanceledEventWithSourceClientIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_215D9B000, v1, OS_LOG_TYPE_ERROR, "Failed to delete canceled event (%{public}@): %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
