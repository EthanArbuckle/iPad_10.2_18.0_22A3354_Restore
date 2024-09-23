@implementation ASCredentialSharingGroupsNotificationManager

- (ASCredentialSharingGroupsNotificationManager)init
{
  ASCredentialSharingGroupsNotificationManager *v2;
  uint64_t v3;
  UNUserNotificationCenter *notificationCenter;
  ASCredentialSharingGroupsNotificationManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCredentialSharingGroupsNotificationManager;
  v2 = -[ASCredentialSharingGroupsNotificationManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", *MEMORY[0x24BE82F68]);
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)_presentNotificationWithRequestIdentifier:(id)a3 content:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ASCredentialSharingGroupsNotificationManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(17, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke;
  v15[3] = &unk_24C94F718;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", a1[4], a1[5], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[7];
  v4 = *(void **)(a1[6] + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke_2;
  v5[3] = &unk_24C951760;
  v6 = v3;
  objc_msgSend(v4, "addNotificationRequest:withCompletionHandler:", v2, v5);

}

void __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke_2_cold_1(v4, v3);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

- (void)notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ASCredentialSharingGroupsNotificationManager *v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  _QWORD v21[3];
  BOOL v22;

  v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  objc_msgSend(MEMORY[0x24BE82CE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "keyBagLockStatus") != 0;

  v22 = v6;
  objc_msgSend(MEMORY[0x24BE82CE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke;
  v20[3] = &unk_24C94F880;
  v20[4] = v21;
  objc_msgSend(v7, "addKeyBagLockStatusChangedObserverWithHandler:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reset");

  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(17, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_2;
  v15[3] = &unk_24C951788;
  v13 = v9;
  v16 = v13;
  v14 = v4;
  v18 = v14;
  v19 = v21;
  v17 = self;
  objc_msgSend(v11, "performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:task:", v12, v15);

  _Block_object_dispose(v21, 8);
}

void __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE82CE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyBagLockStatus");

  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  void *v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedSavedAccountsInRecentlyDeletedToNotifyUserAbout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82CE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeKeyBagLockStatusChangedObserver:", *(_QWORD *)(a1 + 32));

  if (objc_msgSend(v3, "count"))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_5;
      v10[3] = &unk_24C94FE10;
      v9 = *(void **)(a1 + 40);
      v11 = *(id *)(a1 + 48);
      objc_msgSend(v9, "_notifyUserAboutSharedSavedAccountsInRecentlyDeleted:completionHandler:", v3, v10);

      goto LABEL_9;
    }
    v5 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_2_cold_1(v5, v6, v7);
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v8();
LABEL_9:

}

uint64_t __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_notifyUserAboutSharedSavedAccountsInRecentlyDeleted:(id)a3 completionHandler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;

  v6 = (objc_class *)MEMORY[0x24BDF8800];
  v7 = a4;
  v8 = a3;
  v16 = objc_alloc_init(v6);
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v9);

  -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForSharedRecentlyDeletedSavedAccounts:](self, "_notificationBodyStringForSharedRecentlyDeletedSavedAccounts:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setBody:", v10);
  if (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    objc_msgSend(MEMORY[0x24BE82D28], "passwordManagerURLForRecentlyDeleted");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BE82D28], "resourceSpecifierEncodedKey:value:", *MEMORY[0x24BE82EF8], *MEMORY[0x24BE82F50]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("prefs:root=PASSWORDS&"), "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v16, "setDefaultActionURL:", v11);

  if (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
    v15 = (__CFString *)(id)*MEMORY[0x24BE82F80];
  else
    v15 = CFSTR("com.apple.AuthenticationServices.CredentialSharingGroups.RecentlyDeleted");
  -[ASCredentialSharingGroupsNotificationManager _presentNotificationWithRequestIdentifier:content:completionHandler:](self, "_presentNotificationWithRequestIdentifier:content:completionHandler:", v15, v16, v7);

}

- (void)setDebugIgnoreDateChecksForRecentlyDeletedNotificationsDefault:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("DebugIgnoreLastNotificationDateAndFiveDayGracePeriodForRecentlyDeletedNotifications"));

}

- (void)leaveGroupWithID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__ASCredentialSharingGroupsNotificationManager_leaveGroupWithID_completionHandler___block_invoke;
  v10[3] = &unk_24C9517B0;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performTaskEnsuringGroupsAreLoadedOnQueue:task:", MEMORY[0x24BDAC9B8], v10);

}

void __83__ASCredentialSharingGroupsNotificationManager_leaveGroupWithID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedGroupWithID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE82E38];
    v12 = CFSTR("Failed to find group with provided group ID.");
    v13 = 1;
LABEL_8:
    objc_msgSend(v10, "safari_errorWithDomain:code:privacyPreservingDescription:", v11, v13, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:isForAlreadyExitedGroup:", *(_QWORD *)(a1 + 32), 0);

  if ((v6 & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE82E38];
    v12 = CFSTR("Failed to move credentials back to personal keychain.");
    v13 = 2;
    goto LABEL_8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE8490]), "initWithGroupID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__ASCredentialSharingGroupsNotificationManager_leaveGroupWithID_completionHandler___block_invoke_2;
  v14[3] = &unk_24C9517B0;
  v16 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v8, "leaveGroupWithRequest:completion:", v7, v14);

LABEL_9:
}

void __83__ASCredentialSharingGroupsNotificationManager_leaveGroupWithID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_recordGroupIdentifierForExitCleanup:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)deleteGroupWithID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__ASCredentialSharingGroupsNotificationManager_deleteGroupWithID_completionHandler___block_invoke;
  v10[3] = &unk_24C9517B0;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performTaskEnsuringGroupsAreLoadedOnQueue:task:", MEMORY[0x24BDAC9B8], v10);

}

void __84__ASCredentialSharingGroupsNotificationManager_deleteGroupWithID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedGroupWithID:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE82E38];
    v12 = CFSTR("Failed to find group with provided group ID.");
    v13 = 1;
LABEL_8:
    objc_msgSend(v10, "safari_errorWithDomain:code:privacyPreservingDescription:", v11, v13, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:isForAlreadyExitedGroup:", *(_QWORD *)(a1 + 32), 0);

  if ((v6 & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BE82E38];
    v12 = CFSTR("Failed to move credentials back to personal keychain.");
    v13 = 2;
    goto LABEL_8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE8480]), "initWithGroupID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __84__ASCredentialSharingGroupsNotificationManager_deleteGroupWithID_completionHandler___block_invoke_2;
  v14[3] = &unk_24C9517B0;
  v16 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v8, "deleteGroupWithRequest:completion:", v7, v14);

LABEL_9:
}

void __84__ASCredentialSharingGroupsNotificationManager_deleteGroupWithID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_recordGroupIdentifierForExitCleanup:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)groupsUpdatedWithInfos:(id)a3 shouldForceShowingNotifications:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void (**v33)(_QWORD);
  _BOOL4 v34;
  id v35;
  uint8_t v37;
  _BYTE v38[15];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v34 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33 = (void (**)(_QWORD))a5;
  v7 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E4D9000, v7, OS_LOG_TYPE_INFO, "Authentication Services Agent received group updates.", buf, 2u);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    v12 = "Authentication Services Agent received updates via groupsUpdatedWithInfos.";
    v35 = v8;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        v15 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20E4D9000, v15, OS_LOG_TYPE_INFO, v12, buf, 2u);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v16 = objc_msgSend(v14, "updateType");
          if (v16 != 1)
          {
            if (v16)
              goto LABEL_26;
            v17 = v12;
            v18 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = v18;
              objc_msgSend(v14, "updatedGroup");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "groupID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v44 = v21;
              _os_log_impl(&dword_20E4D9000, v19, OS_LOG_TYPE_INFO, "Authentication Services Agent received group member addition update for group with ID: %@.", buf, 0xCu);

            }
            objc_msgSend(v14, "updatedGroup");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addedParticipants");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "count"))
            {
              objc_msgSend(v22, "currentUserParticipant");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "ownerParticipant");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24 != v25)
              {

                goto LABEL_24;
              }

              if (!v34)
              {
LABEL_25:

                v12 = v17;
                v8 = v35;
                goto LABEL_26;
              }
            }
            else
            {

              if (!v34)
                goto LABEL_25;
            }
LABEL_24:
            objc_msgSend(v14, "addedParticipants");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASCredentialSharingGroupsNotificationManager _notifyUserAboutGroupMembers:addedToGroup:](self, "_notifyUserAboutGroupMembers:addedToGroup:", v31, v22);

            goto LABEL_25;
          }
          v27 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = v27;
            objc_msgSend(v14, "departedGroupID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v44 = v29;
            _os_log_impl(&dword_20E4D9000, v28, OS_LOG_TYPE_INFO, "Authentication Services Agent received group departure update for group with ID: %@.", buf, 0xCu);

          }
          objc_msgSend(v14, "departedGroupID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCredentialSharingGroupsNotificationManager _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:](self, "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:", v30);

        }
        else
        {
          v26 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[ASCredentialSharingGroupsNotificationManager groupsUpdatedWithInfos:shouldForceShowingNotifications:completionHandler:].cold.1(&v37, v38, v26);
        }
LABEL_26:
        ++v13;
      }
      while (v10 != v13);
      v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      v10 = v32;
    }
    while (v32);
  }

  v33[2](v33);
}

- (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3
{
  +[_ASAccountManagerTipManager fetchSharingGroupsThatIncludeFamilyMembers:](_ASAccountManagerTipManager, "fetchSharingGroupsThatIncludeFamilyMembers:", a3);
}

- (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __107__ASCredentialSharingGroupsNotificationManager_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke;
  v7[3] = &unk_24C94FE10;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:task:", v5, v7);

}

void __107__ASCredentialSharingGroupsNotificationManager_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "savedAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v4, 0);

}

- (void)groupsUpdatedWithInfos:(id)a3
{
  -[ASCredentialSharingGroupsNotificationManager groupsUpdatedWithInfos:shouldForceShowingNotifications:completionHandler:](self, "groupsUpdatedWithInfos:shouldForceShowingNotifications:completionHandler:", a3, 0, &__block_literal_global_26);
}

- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForSharedRecentlyDeletedSavedAccount:](self, "_notificationBodyStringForSharedRecentlyDeletedSavedAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "safari_setByApplyingBlock:", &__block_literal_global_27_1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 < 2)
      -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:](self, "_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:", v4);
    else
      -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromMultipleGroups:](self, "_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromMultipleGroups:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id __109__ASCredentialSharingGroupsNotificationManager__notificationBodyStringForSharedRecentlyDeletedSavedAccounts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isSavedInSharedGroup"))
  {
    objc_msgSend(v2, "sharedGroupID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastModifiedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, 30, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safari_numberOfDaysUntilDate:", v6) + 1;

  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedGroupID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedGroupWithID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForSharedRecentlyDeletedSavedAccount:].cold.1(v12, v3);
  }
  v13 = objc_msgSend(v3, "credentialTypes");
  if (v13 == 3)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    if (v11)
      goto LABEL_11;
    goto LABEL_12;
  }
  if (v13 == 2)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    if (v11)
      goto LABEL_11;
LABEL_12:
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "highLevelDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v15, v16, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  if (!v11)
    goto LABEL_12;
LABEL_11:
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highLevelDomain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v15, v16, v17, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v18;
}

- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v21 = 0;
  v22 = 0;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedGroupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedGroupWithID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:].cold.1();
  }
  -[ASCredentialSharingGroupsNotificationManager _getNumberOfPasswords:numberOfPasskeys:inSavedAccounts:](self, "_getNumberOfPasswords:numberOfPasskeys:inSavedAccounts:", &v22, &v21, v4);
  v10 = (void *)MEMORY[0x24BDD17C8];
  if (!v22 || !v21)
  {
    if (v22)
    {
      if (v8)
      {
        _WBSLocalizedString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v22;
LABEL_14:
        objc_msgSend(v8, "displayName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v11, v15, v14, v20);
        goto LABEL_15;
      }
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v22;
    }
    else
    {
      if (v8)
      {
        _WBSLocalizedString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v21;
        goto LABEL_14;
      }
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v21;
    }
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v17, v19);
    goto LABEL_19;
  }
  if (!v8)
  {
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v22, v21);
LABEL_19:
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  v12 = v22;
  objc_msgSend(v8, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v12, v13, v14);
LABEL_15:
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v16;
}

- (void)_getNumberOfPasswords:(unint64_t *)a3 numberOfPasskeys:(unint64_t *)a4 inSavedAccounts:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 += objc_msgSend(v14, "credentialTypes") & 1;
        v10 += ((unint64_t)objc_msgSend(v14, "credentialTypes") >> 1) & 1;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  *a3 = v11;
  *a4 = v10;

}

- (id)_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromMultipleGroups:(id)a3
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  -[ASCredentialSharingGroupsNotificationManager _getNumberOfPasswords:numberOfPasskeys:inSavedAccounts:](self, "_getNumberOfPasswords:numberOfPasskeys:inSavedAccounts:", &v11, &v10, a3);
  v3 = (void *)MEMORY[0x24BDD17C8];
  if (v11)
    v4 = v10 == 0;
  else
    v4 = 1;
  if (v4)
  {
    if (v11)
    {
      _WBSLocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v11;
    }
    else
    {
      _WBSLocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
    }
    objc_msgSend(v3, "localizedStringWithFormat:", v6, v5, v9);
  }
  else
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v6, v11, v10);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_notifyUserAboutGroupMembers:(id)a3 addedToGroup:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;

  v6 = (objc_class *)MEMORY[0x24BDF8800];
  v7 = a4;
  v8 = a3;
  v17 = objc_alloc_init(v6);
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:", v9);

  -[ASCredentialSharingGroupsNotificationManager _notificationBodyStringForGroupMembers:addedToGroup:](self, "_notificationBodyStringForGroupMembers:addedToGroup:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setBody:", v10);
  objc_msgSend(v7, "groupID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
  {
    objc_msgSend(MEMORY[0x24BE82D28], "passwordManagerURLForGroupWithID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BE82D28], "resourceSpecifierEncodedKey:value:", *MEMORY[0x24BE82F40], v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("prefs:root=PASSWORDS&"), "stringByAppendingString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLWithString:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v17, "setDefaultActionURL:", v12);

  if (objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled"))
    v16 = (__CFString *)(id)*MEMORY[0x24BE82F70];
  else
    v16 = CFSTR("com.apple.AuthenticationServices.CredentialSharingGroups.GroupUpdate");
  -[ASCredentialSharingGroupsNotificationManager _presentNotificationWithRequestIdentifier:content:completionHandler:](self, "_presentNotificationWithRequestIdentifier:content:completionHandler:", v16, v17, 0);

}

- (id)_notificationBodyStringForGroupMembers:(id)a3 addedToGroup:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  void *v28;

  v5 = a4;
  v6 = a3;
  +[_ASAccountSharingGroupMemberDataManager sharedManager](_ASAccountSharingGroupMemberDataManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupMemberDataForGroupParticipants:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (v9 == 3)
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayName");
    v17 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v11, v13, v27, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v17;
    goto LABEL_9;
  }
  if (v9 == 2)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithFormat:", v11, v13, v21, v22, v26);
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (v9 != 1)
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v8, "count") - 2;
    objc_msgSend(v5, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringWithFormat:", v11, v13, v21, v24, v22);
    goto LABEL_8;
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v15;
}

- (void)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:isForAlreadyExitedGroup:", v3, 1);

  if ((v5 & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ASCredentialSharingGroupsNotificationManager _moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:].cold.1();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

void __116__ASCredentialSharingGroupsNotificationManager__presentNotificationWithRequestIdentifier_content_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v3, v5, "Failed to present notification with error: %@", v6);

  OUTLINED_FUNCTION_1_0();
}

void __100__ASCredentialSharingGroupsNotificationManager_notifyUserAboutSharedSavedAccountsInRecentlyDeleted___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_3(&dword_20E4D9000, a1, a3, "Skipping Recently Deleted shared accounts notification because the key bag was locked.", v3);
}

- (void)groupsUpdatedWithInfos:(uint8_t *)a1 shouldForceShowingNotifications:(_BYTE *)a2 completionHandler:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_3(&dword_20E4D9000, a3, (uint64_t)a3, "updateType SPI not available on group update info.", a1);
}

- (void)_notificationBodyStringForSharedRecentlyDeletedSavedAccount:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "sharedGroupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v3, v5, "Failed to get group display name for group ID for sharing notification: %{private}@", v6);

  OUTLINED_FUNCTION_1_0();
}

- (void)_notificationBodyStringForSharedRecentlyDeletedSavedAccountsFromSingleGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v0, v1, "Failed to get group display name for group ID for sharing notification: %{private}@", v2);
}

- (void)_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v0, v1, "Failed to move contributed credentials back from group ID: %@", v2);
}

@end
