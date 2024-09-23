@implementation CALNEventInvitationNotificationEKDataSource

- (CALNEventInvitationNotificationEKDataSource)initWithEventStoreProvider:(id)a3 inboxNotificationProvider:(id)a4 notificationReferenceProvider:(id)a5 remoteMutator:(id)a6 dataSourceEventRepresentationProvider:(id)a7 preferences:(id)a8
{
  id v15;
  id v16;
  id v17;
  CALNEventInvitationNotificationEKDataSource *v18;
  CALNEventInvitationNotificationEKDataSource *v19;
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
  v24.super_class = (Class)CALNEventInvitationNotificationEKDataSource;
  v18 = -[CALNEventInvitationNotificationEKDataSource init](&v24, sel_init);
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

- (id)fetchEventInvitationNotifications
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
  -[CALNEventInvitationNotificationEKDataSource fetchEventInvitationNotificationSourceClientIdentifiers:](self, "fetchEventInvitationNotificationSourceClientIdentifiers:", 0);
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
        -[CALNEventInvitationNotificationEKDataSource fetchEventInvitationNotificationWithSourceClientIdentifier:](self, "fetchEventInvitationNotificationWithSourceClientIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
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

- (id)fetchEventInvitationNotificationSourceClientIdentifiers:(id)a3
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
  -[CALNEventInvitationNotificationEKDataSource preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "invitationNotificationsDisabled");

  if (!v6)
  {
    -[CALNEventInvitationNotificationEKDataSource inboxNotificationProvider](self, "inboxNotificationProvider");
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
      goto LABEL_22;
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
            if (v20 && (objc_msgSend(v19, "hiddenFromNotificationCenter") & 1) == 0)
            {
              if (objc_msgSend(v19, "type"))
              {
                v21 = objc_msgSend(v19, "type");

                if (v21 != 1)
                  goto LABEL_19;
              }
              else
              {

              }
              +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:](CALNNotificationDataSourceUtils, "sourceClientIdentifierForNotification:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v20);
            }

LABEL_19:
            continue;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v12)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
  }
  v7 = (void *)objc_opt_new();
LABEL_23:

  return v7;
}

- (id)fetchEventInvitationNotificationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CALNEventInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNEventInvitationNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNNotificationDataSourceUtils, "notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 0, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "notification");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[CALNEventInvitationNotificationEKDataSource _notificationInfoFromNotification:inEventStore:](self, "_notificationInfoFromNotification:inEventStore:", v9, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138543618;
        v26 = v4;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetched event invitation notification info with sourceClientIdentifier: %{public}@ info: %@", (uint8_t *)&v25, 0x16u);
      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CALNEventInvitationNotificationEKDataSource fetchEventInvitationNotificationWithSourceClientIdentifier:].cold.2((uint64_t)v4, v11, v18, v19, v20, v21, v22, v23);
      v10 = 0;
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CALNEventInvitationNotificationEKDataSource fetchEventInvitationNotificationWithSourceClientIdentifier:].cold.1((uint64_t)v4, v9, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }

  return v10;
}

- (void)clearEventInvitationWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CALNEventInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNEventInvitationNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 0, v4, v5, v6);

}

- (void)acceptEventInvitationWithSourceClientIdentifier:(id)a3
{
  -[CALNEventInvitationNotificationEKDataSource _setParticipantStatus:withSourceClientIdentifier:](self, "_setParticipantStatus:withSourceClientIdentifier:", 2, a3);
}

- (void)declineEventInvitationWithSourceClientIdentifier:(id)a3
{
  -[CALNEventInvitationNotificationEKDataSource _setParticipantStatus:withSourceClientIdentifier:](self, "_setParticipantStatus:withSourceClientIdentifier:", 3, a3);
}

- (void)tentativeAcceptEventInvitationWithSourceClientIdentifier:(id)a3
{
  -[CALNEventInvitationNotificationEKDataSource _setParticipantStatus:withSourceClientIdentifier:](self, "_setParticipantStatus:withSourceClientIdentifier:", 4, a3);
}

- (void)reportEventInvitationAsJunkWithSourceClientIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[CALNEventInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNEventInvitationNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 0, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "setIsJunk:shouldSave:", 1, 1);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CALNEventInvitationNotificationEKDataSource reportEventInvitationAsJunkWithSourceClientIdentifier:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

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
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CALNEventInvitationNotificationInfo *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  +[CALNNotificationDataSourceUtils sourceClientIdentifierForNotification:](CALNNotificationDataSourceUtils, "sourceClientIdentifierForNotification:", v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils expirationDateForEventInvitation:](CALNEventInvitationNotificationDataSourceUtils, "expirationDateForEventInvitation:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v7;
  +[CALNEventInvitationNotificationDataSourceUtils eventForEventInvitation:inEventStore:](CALNEventInvitationNotificationDataSourceUtils, "eventForEventInvitation:inEventStore:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "URL");
    v27 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    CUIKLaunchURLForEventInvitation();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "source");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v24, "isDelegate");
    objc_msgSend(v24, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scanForConflicts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNEventInvitationNotificationEKDataSource dataSourceEventRepresentationProvider](self, "dataSourceEventRepresentationProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "eventRepresentationDictionaryForInvitationNotification:event:date:endDate:timeZone:", v6, v9, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v27;
    LOBYTE(v20) = v12;
    v18 = -[CALNEventInvitationNotificationInfo initWithSourceClientIdentifier:launchURL:expirationDate:conflictDetails:eventInvitationNotification:eventRepresentationDictionary:eventURI:isDelegate:sourceTitle:sourceIdentifier:]([CALNEventInvitationNotificationInfo alloc], "initWithSourceClientIdentifier:launchURL:expirationDate:conflictDetails:eventInvitationNotification:eventRepresentationDictionary:eventURI:isDelegate:sourceTitle:sourceIdentifier:", v29, v25, v27, v22, v6, v17, v26, v20, v23, v21);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_setParticipantStatus:(int64_t)a3 withSourceClientIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[CALNEventInvitationNotificationEKDataSource eventStoreProvider](self, "eventStoreProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CALNEventInvitationNotificationEKDataSource notificationReferenceProvider](self, "notificationReferenceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", 0, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "setParticipationStatus:", a3);
    objc_msgSend(v10, "setInvitationStatus:", 0);
    v11 = objc_msgSend((id)objc_opt_class(), "_spanForNewStatusWithEvent:", v10);
    -[CALNEventInvitationNotificationEKDataSource remoteMutator](self, "remoteMutator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setParticipantStatus:span:event:", a3, v11, v10);

    v17 = 0;
    LOBYTE(v11) = objc_msgSend(v8, "saveEvent:span:error:", v10, v11, &v17);
    v13 = v17;
    if ((v11 & 1) == 0)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "externalURI");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v15;
        v20 = 2114;
        v21 = v16;
        v22 = 2112;
        v23 = v13;
        _os_log_error_impl(&dword_215D9B000, v14, OS_LOG_TYPE_ERROR, "Failed to save event (%{public}@) when setting participant status (%{public}@): %@", buf, 0x20u);

      }
    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CALNEventInvitationNotificationEKDataSource _setParticipantStatus:withSourceClientIdentifier:].cold.1((uint64_t)v6, a3, v13);
  }

}

+ (int64_t)_spanForNewStatusWithEvent:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "responseMustApplyToAll") & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "hasRecurrenceRules"))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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

- (void)fetchEventInvitationNotificationWithSourceClientIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Failed to get notification reference with sourceClientIdentifier %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchEventInvitationNotificationWithSourceClientIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Failed to get notification from notification reference. sourceClientIdentifier = %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)reportEventInvitationAsJunkWithSourceClientIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Failed to get event (%{public}@) when attempting to report as junk", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_setParticipantStatus:(NSObject *)a3 withSourceClientIdentifier:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_215D9B000, a3, OS_LOG_TYPE_ERROR, "Failed to get event (%{public}@) when attempting to set participant status to %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
