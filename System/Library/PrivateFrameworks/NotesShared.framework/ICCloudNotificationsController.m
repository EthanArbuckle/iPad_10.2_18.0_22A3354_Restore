@implementation ICCloudNotificationsController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ICCloudNotificationsController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (id)sharedController_controller;
}

void __50__ICCloudNotificationsController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v1;

}

+ (void)registerForUserNotificationsWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[ICCloudNotificationsController registerForUserNotificationsWithCompletionHandler:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E76C8F60;
  v21 = v3;
  v14 = v3;
  objc_msgSend(v12, "requestAuthorizationWithOptions:completionHandler:", 7, v20);

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "workerManagedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_25;
  v18[3] = &unk_1E76C73F8;
  v19 = v16;
  v17 = v16;
  objc_msgSend(v17, "performBlock:", v18);

}

void __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = os_log_create("com.apple.notes", "Notifications");
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_cold_2();
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "User did not grant authorization for user notifications", v17, 2u);
    }
  }

  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(void))(v15 + 16))();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("ICUserNotificationRegistrationCompleted"), 0);

}

void __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  id v2;

  +[ICCloudNotificationsController sharedController](ICCloudNotificationsController, "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "batchUpdateTopicSubscriptionsAllAccountsInContext:", *(_QWORD *)(a1 + 32));

}

- (PDSRegistrar)pdsClient
{
  if (pdsClient_onceToken != -1)
    dispatch_once(&pdsClient_onceToken, &__block_literal_global_11);
  return (PDSRegistrar *)(id)pdsClient_client;
}

void __43__ICCloudNotificationsController_pdsClient__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  BOOL v3;
  NSObject *v4;
  id v5;

  v5 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D65220]), "initWithClientID:error:", CFSTR("Notes"), &v5);
  v1 = v5;
  v2 = (void *)pdsClient_client;
  pdsClient_client = v0;

  if (pdsClient_client)
    v3 = v1 == 0;
  else
    v3 = 0;
  if (!v3)
  {
    v4 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__ICCloudNotificationsController_pdsClient__block_invoke_cold_1();

  }
}

- (BOOL)isSubscribedToMentionNotificationsForAccount:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("ICMentionsShouldNotifyMeDefaultsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (void)updateSubscriptionPreferenceForMentionNotifications:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0D64270];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("ICMentionsShouldNotifyMeDefaultsKey"));

  objc_msgSend(v8, "managedObjectContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICCloudNotificationsController batchUpdateTopicSubscriptionsAllAccountsInContext:](self, "batchUpdateTopicSubscriptionsAllAccountsInContext:", v10);
}

- (void)removeAllTopicSubscriptionsForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D65230], "userWithDSID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudNotificationsController removeAllPDSRegistrationsForUser:](self, "removeAllPDSRegistrationsForUser:", v6);

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICCloudNotificationsController removeAllTopicSubscriptionsForAccount:].cold.1(v4, v7);

  }
}

- (void)batchUpdateTopicSubscriptionsAllAccountsInContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[ICAccount allCloudKitAccountsInContext:](ICAccount, "allCloudKitAccountsInContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[ICCloudNotificationsController isSubscribedToMentionNotificationsForAccount:](self, "isSubscribedToMentionNotificationsForAccount:", v11, (_QWORD)v13))
        {
          objc_msgSend(v11, "dsid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "ic_addNonNilObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[ICCloudNotificationsController batchUpdateTopicSubscriptionsForDSIDs:](self, "batchUpdateTopicSubscriptionsForDSIDs:", v5);
}

- (void)batchUpdateTopicSubscriptionsForDSIDs:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  char v34;
  __int128 v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICCloudNotificationsController batchUpdateTopicSubscriptionsForDSIDs:].cold.2(v3, v4);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v44;
    *(_QWORD *)&v7 = 138412802;
    v35 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0D65230], "userWithDSID:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i), v35);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D65228]), "initWithTopic:qualifier:pushEnvironment:", CFSTR("com.apple.notes.mentions"), &stru_1E76DB108, 0);
        -[ICCloudNotificationsController pdsClient](self, "pdsClient");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0;
        v15 = objc_msgSend(v13, "batchUpdateRegistrations:forUser:error:", v14, v11, &v42);
        v16 = v42;

        if (v15)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
        {
          v20 = os_log_create("com.apple.notes", "Notifications");
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            goto LABEL_20;
          *(_DWORD *)buf = 138412546;
          v49 = v12;
          v50 = 2112;
          v51 = v11;
          v21 = v20;
          v22 = "Successfully updated PDS registration (%@) for user (%@)";
          goto LABEL_17;
        }
        v18 = objc_msgSend(v16, "code");
        v19 = os_log_create("com.apple.notes", "Notifications");
        v20 = v19;
        if (v18 == -202)
        {
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            goto LABEL_20;
          *(_DWORD *)buf = 138412546;
          v49 = v12;
          v50 = 2112;
          v51 = v11;
          v21 = v20;
          v22 = "Successfully updated PDS registration (ignoring PDSRegistrarErrorCodeFailedPersisting -- see rdar://7240"
                "0974) (%@) for user (%@)";
LABEL_17:
          _os_log_debug_impl(&dword_1BD918000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 0x16u);
          goto LABEL_20;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          v49 = v12;
          v50 = 2112;
          v51 = v11;
          v52 = 2112;
          v53 = v16;
          _os_log_error_impl(&dword_1BD918000, v20, OS_LOG_TYPE_ERROR, "Error updating PDS registration (%@) for user (%@): %@", buf, 0x20u);
        }
LABEL_20:

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v8);
  }

  -[ICCloudNotificationsController pdsClient](self, "pdsClient");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v23, "activeUsersWithError:", &v41);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v41;

  if (!v24 || v25)
  {
    v26 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ICCloudNotificationsController batchUpdateTopicSubscriptionsForDSIDs:].cold.1();

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v27 = v24;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v32, "userID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v5, "containsObject:", v33);

        if ((v34 & 1) == 0)
          -[ICCloudNotificationsController removeAllPDSRegistrationsForUser:](self, "removeAllPDSRegistrationsForUser:", v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v29);
  }

}

- (void)removeAllPDSRegistrationsForUser:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCloudNotificationsController removeAllPDSRegistrationsForUser:].cold.3();

  -[ICCloudNotificationsController pdsClient](self, "pdsClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v6, "removeAllRegistrationsFromUser:error:", v4, &v11);
  v8 = v11;

  v9 = os_log_create("com.apple.notes", "Notifications");
  v10 = v9;
  if (!v7 || v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICCloudNotificationsController removeAllPDSRegistrationsForUser:].cold.2();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[ICCloudNotificationsController removeAllPDSRegistrationsForUser:].cold.1();
  }

}

- (void)sendMentionNotificationToParticipant:(id)a3 inlineAttachmentRecordName:(id)a4 shareRecordName:(id)a5 shareOwnerUserId:(id)a6 accountId:(id)a7 noteRecordName:(id)a8 senderName:(id)a9 noteTitle:(id)a10 mentionSnippet:(id)a11 callback:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v29;

  v27 = a12;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  +[ICCloudContext sharedContext](ICCloudContext, "sharedContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "invernessClientForAccountID:", v21);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "sendMentionNotificationWithRecipientUserId:senderName:noteTitle:mentionSnippet:shareRecordName:shareOwnerUserId:noteRecordName:inlineAttachmentRecordName:callback:", v25, v19, v18, v17, v23, v22, v20, v24, v27);
}

+ (void)registerForUserNotificationsWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Requesting authorization to show notifications", a5, a6, a7, a8, 0);
}

void __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "User granted authorization for user notifications", a5, a6, a7, a8, 0);
}

void __84__ICCloudNotificationsController_registerForUserNotificationsWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error requesting authorization for user notifications: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __43__ICCloudNotificationsController_pdsClient__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Failed creating PDS registrar: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeAllTopicSubscriptionsForAccount:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, a2, v4, "Unable to find DSID for account (%@). Cannot remove PDS registrations.", v5);

}

- (void)batchUpdateTopicSubscriptionsForDSIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error fetching active users from PDS: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)batchUpdateTopicSubscriptionsForDSIDs:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v5, "Batch updating topic subscriptions for DSIDs: %@", v6);

}

- (void)removeAllPDSRegistrationsForUser:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Successfully removed all PDS registrations for user: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeAllPDSRegistrationsForUser:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1BD918000, v1, OS_LOG_TYPE_ERROR, "Error removing all PDS registrations for user (%@): %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeAllPDSRegistrationsForUser:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Attempting removal of all PDS regisrations for user: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
