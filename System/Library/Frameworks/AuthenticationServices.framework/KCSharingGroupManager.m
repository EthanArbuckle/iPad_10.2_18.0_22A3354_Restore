@implementation KCSharingGroupManager

void __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_cold_1(v6, v5);
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(a2, "members");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      v11 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isMe") & 1) == 0)
          {
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
            objc_msgSend(v13, "appleID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v17[0] = v11;
            v17[1] = 3221225472;
            v17[2] = __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_13;
            v17[3] = &unk_24C950168;
            v18 = v14;
            v19 = *(id *)(a1 + 40);
            v20 = *(id *)(a1 + 32);
            v16 = v14;
            objc_msgSend(v15, "checkAvailabilityForHandle:completion:", v16, v17);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v5 = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_13(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_13_cold_1(v6, v5);
      if (!a2)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (a2)
  {
LABEL_4:
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE84A8]), "initWithHandle:permissionLevel:", *(_QWORD *)(a1 + 32), 1);
    v8 = *(id *)(a1 + 40);
    objc_sync_enter(v8);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    objc_sync_exit(v8);

  }
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Failed to fetch FAFamilyCircle with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __120__KCSharingGroupManager_AuthenticationServicesExtras__as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler___block_invoke_13_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Failed to check recipient eligibility for shared account groups with error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
