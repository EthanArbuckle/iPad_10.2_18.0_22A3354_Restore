@implementation AIDAAccountNotification

- (id)_supportedServiceIDs
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE060C0];
  v5[0] = *MEMORY[0x24BE060A8];
  v5[1] = v2;
  v3 = *MEMORY[0x24BE060B0];
  v5[2] = *MEMORY[0x24BE060B8];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v37 = a6;
  _AIDALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EE8000, v10, OS_LOG_TYPE_DEFAULT, "AIDA Notification plugin running", buf, 2u);
  }

  if (a4 == 3)
  {
    objc_msgSend(v37, "accountType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDB3FE8]);

    if (v13)
    {
      v35 = v9;
      _AIDALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EE8000, v14, OS_LOG_TYPE_DEFAULT, "An Apple ID account was deleted", buf, 2u);
      }

      v45 = 0u;
      v46 = 0u;
      v44 = 0u;
      v43 = 0u;
      -[AIDAAccountNotification _supportedServiceIDs](self, "_supportedServiceIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v44 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            _AIDALogSystem();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v20;
              _os_log_impl(&dword_230EE8000, v21, OS_LOG_TYPE_DEFAULT, "Deleting %@ service token", buf, 0xCu);
            }

            v42 = 0;
            objc_msgSend(MEMORY[0x24BE00E88], "removeCredentialForAccount:clientID:error:", v37, v20, &v42);
            v22 = v42;
            if (v22)
            {
              _AIDALogSystem();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v20;
                _os_log_impl(&dword_230EE8000, v23, OS_LOG_TYPE_DEFAULT, "Error: Couldn't delete %@ credentials", buf, 0xCu);
              }

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v17);
      }

      v9 = v35;
    }
    objc_msgSend(v37, "accountType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqual:", *MEMORY[0x24BDB3FD8]);

    if (v26)
    {
      -[AIDAAccountNotification _appleIDAuthenticationAccountsMatchingAppleAccount:inStore:](self, "_appleIDAuthenticationAccountsMatchingAppleAccount:inStore:", v37, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {
        v36 = v9;
        _AIDALogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230EE8000, v28, OS_LOG_TYPE_DEFAULT, "iCloud account deleted, so removing all related AIDA accounts...", buf, 2u);
        }

        v29 = objc_alloc_init(MEMORY[0x24BDB4398]);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v30 = v27;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v39 != v33)
                objc_enumerationMutation(v30);
              objc_msgSend(v29, "removeAccount:withCompletionHandler:");
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v32);
        }

        v9 = v36;
      }

    }
  }

}

- (id)_appleIDAuthenticationAccountsMatchingAppleAccount:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  void *v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB3FE8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(v6, "_accountsWithAcountType:error:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "aida_alternateDSID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "aida_alternateDSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v14))
        {

        }
        else
        {
          objc_msgSend(v12, "username");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "username");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if (!v17)
            continue;
        }
        objc_msgSend(v22, "addObject:", v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  return v22;
}

@end
