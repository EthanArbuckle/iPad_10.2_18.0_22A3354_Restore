@implementation CNAccount

uint64_t __64__CNAccount_UIAdditions___cnui_canRequestRefreshWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;

  objc_msgSend((id)objc_opt_class(), "_cnui_accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIdentifiersEnabledToSyncDataclass:", *MEMORY[0x1E0C8F388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v4 != 0);
  return result;
}

void __61__CNAccount_UIAdditions___cnui_requestRefreshWithUserAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_cnui_accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIdentifiersEnabledToSyncDataclass:", *MEMORY[0x1E0C8F388]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
          objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "updateContentsOfAllFoldersForAccountID:andDataclasses:isUserRequested:", v8, 2, *(unsigned __int8 *)(a1 + 48));

          objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "updateFolderListForAccountID:andDataclasses:isUserRequested:", v8, 2, *(unsigned __int8 *)(a1 + 48));

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
}

@end
