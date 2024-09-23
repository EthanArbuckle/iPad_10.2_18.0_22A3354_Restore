@implementation ASAccountManagerTipManager

void __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_2;
  v5[3] = &unk_24C94FAA8;
  v2 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "_checkEligibilityForiCloudKeychainTipWithCompletionHandler:", v5);

}

void __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_2(uint64_t a1, int a2)
{
  void (*v3)(void);
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (a2)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if ((objc_msgSend(MEMORY[0x24BE82CC8], "isOngoingCredentialSharingEnabled") & 1) != 0)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_3;
      v7[3] = &unk_24C94FAA8;
      v4 = *(void **)(a1 + 40);
      v5 = *(id *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = v5;
      v9 = v6;
      objc_msgSend(v4, "_checkEligibilityForFamilySharingTipWithCompletionHandler:", v7);

      return;
    }
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v3();
}

void __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_3(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_4;
    v3[3] = &unk_24C94FA80;
    v2 = *(void **)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v2, "_checkEligibilityForGeneralSharingTipWithCompletionHandler:", v3);

  }
}

uint64_t __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 3;
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void (*v10)(void);
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "members");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > 1)
  {
    objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isKeychainSyncEnabled");

    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE8488], "all");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_25;
      v17[3] = &unk_24C94FB50;
      v19 = *(id *)(a1 + 32);
      v18 = v5;
      objc_msgSend(v13, "getGroupsWithRequest:completion:", v14, v17);

    }
    else
    {
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("_ASAccountManagerTipManagerErrorDomain"), 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    }
  }
  else
  {
    if (v6)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_cold_1(v9);
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v10();
  }

}

void __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_25_cold_1(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v24 = a1;
    v8 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "members");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = v5;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v17, "participants");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "safari_mapObjectsUsingBlock:", &__block_literal_global_31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "intersectsSet:", v21))
            objc_msgSend(v26, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v14);
    }

    v22 = *(_QWORD *)(v24 + 40);
    v23 = (void *)objc_msgSend(v26, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

    v6 = 0;
    v5 = v25;
  }

}

id __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isMe") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "appleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handle");
}

void __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "members");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > 1)
  {
    objc_msgSend(v5, "members");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_firstObjectPassingTest:", &__block_literal_global_40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isChildAccount"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_acknowledgeTip:", 2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE8488], "all");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_2;
      v16[3] = &unk_24C94FC08;
      v18 = *(id *)(a1 + 32);
      v14 = v5;
      v15 = *(_QWORD *)(a1 + 40);
      v17 = v14;
      v19 = v15;
      objc_msgSend(v12, "getGroupsWithRequest:completion:", v13, v16);

    }
  }
  else
  {
    if (v6)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_cold_1(v9);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMe");
}

void __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_25_cold_1(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v25 = a1;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v14, "participants");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                if ((objc_msgSend(v20, "isCurrentUser") & 1) == 0)
                {
                  objc_msgSend(v20, "handle");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "addObject:", v21);

                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v17);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(v25 + 32), "members");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_42;
    v27[3] = &unk_24C94FBE0;
    v28 = v8;
    v23 = v8;
    v24 = objc_msgSend(v22, "safari_containsObjectPassingTest:", v27);

    if (v24)
      objc_msgSend(*(id *)(v25 + 48), "_acknowledgeTip:", 2);
    (*(void (**)(void))(*(_QWORD *)(v25 + 40) + 16))();
    v6 = 0;
    v5 = v26;

  }
}

uint64_t __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v3, v4, "Failed to get FamilyCircle with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke_25_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v3, v4, "Failed to fetch groups with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
