@implementation ACAccountStore

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    v8 = os_log_GKDaemon;
    if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "NOT GRANTED ACCESS TO GAME CENTER ACCOUNTS DUE TO AN ACCOUNT INTERNAL ERROR", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_62;
    v10[3] = &unk_1E75B5638;
    v10[4] = v9;
    v11 = v5;
    v13 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v9, "requestAccessToAccountsWithType:options:completion:", v11, 0, v10);

  }
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *MEMORY[0x1E0C8F098];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_2;
  v7[3] = &unk_1E75B5660;
  v5 = *(void **)(a1 + 32);
  v9 = v3;
  v7[4] = v5;
  v10 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v5, "accountTypeWithIdentifier:completion:", v4, v7);

}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_71(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_71_cold_1(a1, v5, v7, v8, v9, v10, v11, v12);

}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_62(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint64_t v63;
  _QWORD v64[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  _QWORD v70[4];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountsWithAccountType:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v5;
    if (!objc_msgSend(v6, "count"))
    {
      obj = v6;
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("username"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v11 = v10;
    obj = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v12)
    {
      v13 = v12;
      v52 = v9;
      v53 = v8;
      v11 = 0;
      v14 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v73 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          if (v11)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "username");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "username");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if ((v19 & 1) != 0)
            {
              objc_msgSend(v16, "creationDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "creationDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "compare:", v21);

              v23 = *(void **)(a1 + 32);
              if (v22 == 1)
              {
                v70[0] = MEMORY[0x1E0C809B0];
                v70[1] = 3221225472;
                v70[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_67;
                v70[3] = &unk_1E75B55E8;
                v71 = v11;
                v24 = v11;
                objc_msgSend(v23, "removeAccount:withCompletionHandler:", v24, v70);
                v11 = v16;

              }
              else
              {
                v69[0] = MEMORY[0x1E0C809B0];
                v69[1] = 3221225472;
                v69[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_69;
                v69[3] = &unk_1E75B55E8;
                v69[4] = v16;
                objc_msgSend(v23, "removeAccount:withCompletionHandler:", v16, v69);
              }
            }
            else
            {
              objc_msgSend(v7, "addObject:", v11);
              v25 = v16;

              v11 = v25;
            }
          }
          else
          {
            v11 = v16;
          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      }
      while (v13);

      v8 = v53;
      v9 = v52;
      if (!v11)
        goto LABEL_20;
      objc_msgSend(v7, "addObject:", v11);
    }

LABEL_20:
    v5 = v51;
LABEL_26:
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_alloc_init(MEMORY[0x1E0D00130]);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v50 = v7;
      v29 = v7;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v66 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            objc_msgSend(v34, "accountPropertyForKey:", CFSTR("playerID"), v50);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v35, "length"))
            {
              objc_msgSend(v28, "objectForKeyedSubscript:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                objc_msgSend(v28, "objectForKeyedSubscript:", v35);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "addObject:", v34);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v34);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, v35);
              }
            }
            else
            {
              objc_msgSend(v34, "accountPropertyForKey:", CFSTR("altDSID"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                v38 = os_log_GKGeneral;
                if (!os_log_GKGeneral)
                {
                  v39 = GKOSLoggers();
                  v38 = os_log_GKGeneral;
                }
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v37;
                  _os_log_debug_impl(&dword_1BCDE3000, v38, OS_LOG_TYPE_DEBUG, "GKAuth:telling authkit account is not in use using altDSID:%@", buf, 0xCu);
                }
                objc_msgSend(v54, "setAppleIDWithAltDSID:inUse:forService:", v37, 0, 6);
              }
              objc_msgSend(v29, "removeObject:", v34);
              v40 = *(void **)(a1 + 32);
              v64[0] = MEMORY[0x1E0C809B0];
              v64[1] = 3221225472;
              v64[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_71;
              v64[3] = &unk_1E75B55E8;
              v64[4] = v34;
              objc_msgSend(v40, "removeAccount:withCompletionHandler:", v34, v64);
            }

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
        }
        while (v31);
      }

      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_72;
      v60[3] = &unk_1E75B5610;
      v61 = v54;
      v41 = v29;
      v42 = *(_QWORD *)(a1 + 32);
      v62 = v41;
      v63 = v42;
      v43 = v54;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v60);

      v7 = v50;
      v5 = v51;
    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v44 = v7;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v57 != v47)
            objc_enumerationMutation(v44);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v49, "count"))
            objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v49);

        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
      }
      while (v46);
    }

    goto LABEL_56;
  }
  if (!os_log_GKGeneral)
    v26 = GKOSLoggers();
  v27 = os_log_GKDaemon;
  if (os_log_type_enabled((os_log_t)os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v27, OS_LOG_TYPE_INFO, "NOT GRANTED ACCESS TO GAME CENTER ACCOUNTS", buf, 2u);
  }
LABEL_56:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_67(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 1024;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_DEBUG, "DELETE ACCOUNT(%@): success:%d error:%@", (uint8_t *)&v9, 0x1Cu);
  }

}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_69(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 1024;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_DEBUG, "DELETE ACCOUNT(%@): success:%d error:%@", (uint8_t *)&v9, 0x1Cu);
  }

}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_72(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id obj;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "accountPropertyForKey:", CFSTR("altDSID"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = os_log_GKGeneral;
            if (!os_log_GKGeneral)
            {
              v12 = GKOSLoggers();
              v11 = os_log_GKGeneral;
            }
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v22 = v10;
              _os_log_debug_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_DEBUG, "GKAuth:telling authkit account is not in use using altDSID:%@", buf, 0xCu);
            }
            objc_msgSend(*(id *)(a1 + 32), "setAppleIDWithAltDSID:inUse:forService:", v10, 0, 6);
          }
          objc_msgSend(*(id *)(a1 + 40), "removeObject:", v9);
          v13 = *(void **)(a1 + 48);
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_73;
          v16[3] = &unk_1E75B55E8;
          v16[4] = v9;
          objc_msgSend(v13, "removeAccount:withCompletionHandler:", v9, v16);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v6);
    }

    v4 = v14;
  }

}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_73(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_73_cold_1(a1, v5, v7, v8, v9, v10, v11, v12);

}

void __74__ACAccountStore_GameCenter___gkSetScope_forCredential_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    if (!os_log_GKGeneral)
      v6 = GKOSLoggers();
    v7 = (void *)os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_ERROR))
      __74__ACAccountStore_GameCenter___gkSetScope_forCredential_completionHandler___block_invoke_cold_1(a1, v7, (uint64_t)v5);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);

}

uint64_t __47__ACAccountStore_GameCenter___gkAllCredentials__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_gkCredentials");
}

uint64_t __62__ACAccountStore_GameCenter___gkAllCredentialsForEnvironment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_gkCredentialsForEnvironment:", *(_QWORD *)(a1 + 32));
}

uint64_t __65__ACAccountStore_GameCenter___gkPrimaryCredentialForEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "scopeModificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopeModificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __65__ACAccountStore_GameCenter___gkPrimaryCredentialForEnvironment___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "scope") & 4) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

id __51__ACAccountStore_GameCenter___gkAccountForAppleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *MEMORY[0x1E0C8F0C8];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2;
  v8[3] = &unk_1E75B57C8;
  v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v11 = v3;
  v8[4] = v6;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v6, "accountTypeWithIdentifier:completion:", v4, v8);

}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_85;
    v11[3] = &unk_1E75B57A0;
    v8 = *(void **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v8, "requestAccessToAccountsWithType:options:completion:", v14, 0, v11);

  }
}

uint64_t __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_85(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setResult:", 0);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "accountsWithAccountType:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v18 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v10, "username", (_QWORD)v17);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "accountName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqualToString:", v12);

            if (v13)
            {
              objc_msgSend(v10, "aa_altDSID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "setResult:", v15);

              goto LABEL_17;
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_17:

    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v14 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_85_cold_1();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_86(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

void __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke_2;
  v7[3] = &unk_1E75B57F0;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "saveVerifiedAccount:withCompletionHandler:", v5, v7);

}

void __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138412802;
    v10 = v8;
    v11 = 1024;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_DEBUG, "SAVED ACCOUNT: %@ success:%d error:%@", (uint8_t *)&v9, 0x1Cu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __66__ACAccountStore_GameCenter___gkSaveCredential_completionHandler___block_invoke_91(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke_2;
  v7[3] = &unk_1E75B5818;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  v11 = v3;
  v6 = v3;
  objc_msgSend(v4, "removeAccount:withCompletionHandler:", v5, v7);

}

void __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setError:", v5);
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138413058;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = a2;
    v16 = 2112;
    v17 = v5;
    _os_log_debug_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_DEBUG, "DELETE ACCOUNT(%@): REMOVED:%@ success:%d error:%@", (uint8_t *)&v10, 0x26u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __68__ACAccountStore_GameCenter___gkDeleteCredential_completionHandler___block_invoke_92(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_71_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, a2, a3, "GKAuth:removed malformed legacy account(%@)- it will be automatically re-added with correct format", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__ACAccountStore_GameCenter___gkMapAccountsWithBlock___block_invoke_73_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, a2, a3, "GKAuth:removed duplicate account(%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __74__ACAccountStore_GameCenter___gkSetScope_forCredential_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(const char **)(a1 + 48);
  v5 = a2;
  NSStringFromSelector(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  v9 = 2112;
  v10 = v7;
  v11 = 2112;
  v12 = a3;
  _os_log_error_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_ERROR, "%@: Failed to save credential %@ (%@)", v8, 0x20u);

}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "NOT GRANTED ACCESS TO IDMS ACCOUNTS DUE TO AN ACCOUNT INTERNAL ERROR - NOT FATAL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__ACAccountStore_GameCenter___getAltDSIDFromIDMSForCredential_completionHandler___block_invoke_85_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, v0, v1, "NOT GRANTED ACCESS TO IDMS ACCOUNTS. PLEASE VERIFY ENTITLEMENTS FOR CURRENT DAEMON", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
