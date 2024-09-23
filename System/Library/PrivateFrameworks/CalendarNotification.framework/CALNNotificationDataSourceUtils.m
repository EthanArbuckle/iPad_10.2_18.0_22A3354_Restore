@implementation CALNNotificationDataSourceUtils

+ (id)objectIDWithSourceClientIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[CALNNotificationDataSourceUtils objectIDWithSourceClientIdentifier:].cold.1();
    v5 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDC74F8], "objectIDWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[CALNNotificationDataSourceUtils objectIDWithSourceClientIdentifier:].cold.2();
LABEL_8:

  }
  return v5;
}

+ (id)sourceClientIdentifierForNotification:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  if (v4 > 0xE)
  {
    v6 = 0;
  }
  else
  {
    if (((1 << v4) & 0x7EF0) != 0)
    {
      objc_msgSend(v3, "objectID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringRepresentation");
    }
    else
    {
      objc_msgSend(v3, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteString");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)notificationReferenceOfType:(int)a3 withSourceClientIdentifier:(id)a4 inEventStore:(id)a5 withNotificationReferenceProvider:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((v8 - 3) < 3)
  {
    objc_msgSend(a1, "objectIDWithSourceClientIdentifier:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_13;
  }
  else
  {
    if (v8 >= 2)
    {
      if ((_DWORD)v8 != 2)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(a1, "calendarWithSourceClientIdentifier:inEventStore:", v10, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectID");
        v14 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:].cold.3();

        v14 = 0;
      }
    }
    else
    {
      objc_msgSend(a1, "eventWithSourceClientIdentifier:inEventStore:", v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectID");
      v14 = objc_claimAutoreleasedReturnValue();
    }

    if (v14)
    {
LABEL_13:
      objc_msgSend(v12, "notificationReferenceForObjectID:withType:inEventStore:", v14, v8, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:].cold.2();

      }
      goto LABEL_20;
    }
  }
LABEL_17:
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[CALNNotificationDataSourceUtils notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:].cold.1((uint64_t)v10, v8, v14);
  v17 = 0;
LABEL_20:

  return v17;
}

+ (id)eventWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "_eventWithURI:checkValid:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CALNNotificationDataSourceUtils eventWithSourceClientIdentifier:inEventStore:].cold.1();

    v8 = 0;
  }

  return v8;
}

+ (id)calendarWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "calendarWithExternalURI:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v9 = v8;
        v10 = v9;
      }
      else
      {
        +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:inEventStore:].cold.3();

        v10 = 0;
      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:inEventStore:].cold.2();
      v10 = 0;
    }

  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CALNNotificationDataSourceUtils calendarWithSourceClientIdentifier:inEventStore:].cold.1(v7);
    v10 = 0;
  }

  return v10;
}

+ (void)respondToSharedCalendarInvitationWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4 withDataAccessExpressConnection:(id)a5 accept:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a6;
  v21 = a4;
  v10 = a5;
  objc_msgSend(a1, "calendarWithSourceClientIdentifier:inEventStore:", a3, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (v6)
      v13 = 1;
    else
      v13 = 2;
    objc_msgSend(v11, "calendarIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "externalID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondToSharedCalendarInvite:forCalendarWithID:accountID:queue:completionBlock:", v13, v14, v16, MEMORY[0x24BDAC9B8], 0);

    if (v6)
    {
      objc_msgSend(a1, "hideCalendarFromNotificationCenter:inEventStore:", v12, v21);
      v17 = (void *)MEMORY[0x24BDC7508];
      objc_msgSend(v12, "sharedOwnerName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sharedOwnerEmail");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sharedOwnerPhoneNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "recordRecentForContactWithName:emailAddress:phoneNumber:", v18, v19, v20);

    }
  }

}

+ (void)reportSharedCalendarInvitationAsJunkWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4
{
  void *v4;
  id v5;

  objc_msgSend(a1, "calendarWithSourceClientIdentifier:inEventStore:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setIsJunk:", 1);
    v4 = v5;
  }

}

+ (void)hideCalendarFromNotificationCenter:(id)a3 inEventStore:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13[0] = v5;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v7, "hideCalendarsFromNotificationCenter:error:", v8, &v12);

  v10 = v12;
  if ((v9 & 1) == 0)
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CALNNotificationDataSourceUtils hideCalendarFromNotificationCenter:inEventStore:].cold.1(v5, (uint64_t)v10, v11);

  }
}

+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:(id)a3 inEventStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectIDWithSourceClientIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "entityType") == 16)
    {
      objc_msgSend(v7, "publicObjectWithObjectID:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v14 = 0;
        v11 = objc_msgSend(v7, "removeInviteReplyNotification:error:", v10, &v14);
        v12 = v14;
        if ((v11 & 1) == 0)
        {
          +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            +[CALNNotificationDataSourceUtils clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:].cold.2();

        }
      }
      else
      {
        +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          +[CALNNotificationDataSourceUtils clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:].cold.1();
      }

    }
    else
    {
      +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CALNNotificationDataSourceUtils clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:].cold.3(v9, (uint64_t)v6, v10);
    }

  }
}

+ (void)objectIDWithSourceClientIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to construct URL from sourceClientIdentifier (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)objectIDWithSourceClientIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to construct objectID from sourceClientIdentifier (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)notificationReferenceOfType:(os_log_t)log withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Failed to get objectID for notification of type %d with sourceClientIdentifier %{public}@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to load notification reference for sourceClientIdentifier (%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)notificationReferenceOfType:withSourceClientIdentifier:inEventStore:withNotificationReferenceProvider:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to construct calendarURI for shared calendar invitation with sourceClientIdentifier = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)eventWithSourceClientIdentifier:inEventStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to construct eventURI with sourceClientIdentifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)calendarWithSourceClientIdentifier:(os_log_t)log inEventStore:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "sourceClientIdentifier was nil. Bailing.", v1, 2u);
}

+ (void)calendarWithSourceClientIdentifier:inEventStore:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to construct calendarURI for sourceClientIdentifier (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)calendarWithSourceClientIdentifier:inEventStore:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get calendar for sourceClientIdentifier (%{public}@).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)hideCalendarFromNotificationCenter:(NSObject *)a3 inEventStore:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v8 = a2;
  OUTLINED_FUNCTION_0_2(&dword_215D9B000, a3, v6, "Failed to hide calendar (%{public}@) from notification center: %@", v7);

  OUTLINED_FUNCTION_1();
}

+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Failed to get invite reply notification with sourceClientIdentifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:inEventStore:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = v0;
  OUTLINED_FUNCTION_0_2(&dword_215D9B000, v1, (uint64_t)v1, "Failed to remove invite reply notification with sourceClientIdentifier %{public}@: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)clearSharedCalendarInvitationResponseWithSourceClientIdentifier:(NSObject *)a3 inEventStore:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "entityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  v8 = 2114;
  v9 = a2;
  OUTLINED_FUNCTION_0_2(&dword_215D9B000, a3, v6, "Unexpected entity type %{public}@ when trying to get EKInviteReplyNotification with sourceClientIdentifier %{public}@", v7);

  OUTLINED_FUNCTION_1();
}

@end
