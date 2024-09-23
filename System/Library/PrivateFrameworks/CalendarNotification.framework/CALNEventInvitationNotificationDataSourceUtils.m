@implementation CALNEventInvitationNotificationDataSourceUtils

+ (id)eventForNotificationOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNNotificationDataSourceUtils, "notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", v8, v9, v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationWithSourceClientIdentifier:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(v11, "notification");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CALNEventCanceledNotificationEKDataSource fetchEventCanceledNotificationWithSourceClientIdentifier:].cold.2();

LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  -[NSObject URL](v13, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_eventWithURI:checkValid:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v16;
}

+ (id)eventForEventInvitation:(id)a3 inEventStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a4;
  objc_msgSend(a3, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_eventWithURI:checkValid:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CALNEventInvitationNotificationDataSourceUtils eventForEventInvitation:inEventStore:].cold.1();

  }
  return v7;
}

+ (id)expirationDateForEventInvitation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "hasRecurrenceRules"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "CalSimulatedDateForNow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "attendees", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "proposedStartDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isAfterDate:", v6))
          {
            v13 = v12;

            v6 = v13;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v15 = v14;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateByAddingTimeInterval:", v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (void)clearEventInvitationOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v8 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  +[CALNEventInvitationNotificationDataSourceUtils eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:](CALNEventInvitationNotificationDataSourceUtils, "eventForNotificationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:", v8, v9, v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (objc_msgSend(v11, "invitationStatus"))
    {
      v16 = 0;
      v13 = objc_msgSend(v10, "setInvitationStatus:forEvent:error:", 1, v12, &v16);
      v14 = v16;
      if ((v13 & 1) == 0)
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:].cold.2();

      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v9;
        _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "Not clearing invitation status for sourceClientIdentifier %{public}@ because it is set to none", buf, 0xCu);
      }
    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CALNEventInvitationNotificationDataSourceUtils clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:].cold.1();
  }

}

+ (void)eventForEventInvitation:inEventStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to find event for notification using url (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get event (%{public}@) when attempting to clear invitation notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)clearEventInvitationOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.2()
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
  _os_log_error_impl(&dword_215D9B000, v1, OS_LOG_TYPE_ERROR, "Failed to clear invitation status for event (%{public}@): %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
