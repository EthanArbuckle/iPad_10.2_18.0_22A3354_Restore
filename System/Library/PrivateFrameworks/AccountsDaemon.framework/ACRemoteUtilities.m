@implementation ACRemoteUtilities

+ (id)localAccountMatchingRemoteAccount:(id)a3 inAccountStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v37;
  id v38;
  id obj;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _ACLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[ACRemoteUtilities localAccountMatchingRemoteAccount:inAccountStore:].cold.3((uint64_t)v5, (uint64_t)v8, v9);

    v10 = v8;
    goto LABEL_33;
  }
  objc_msgSend(v5, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11
    || (objc_msgSend(v11, "identifier"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    v10 = 0;
    goto LABEL_32;
  }
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v10 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v6, "accountsWithAccountType:", v15);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v16)
  {
    v10 = 0;
    goto LABEL_30;
  }
  v17 = v16;
  v37 = v15;
  v38 = v6;
  v18 = *(_QWORD *)v42;
  v19 = *MEMORY[0x24BDB4180];
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v42 != v18)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend(v12, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", v19) & 1) != 0)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("dsid"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dsid"));
        v24 = v21;
        v25 = v5;
        v26 = v17;
        v27 = v19;
        v28 = v18;
        v29 = v12;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v23, "isEqual:", v30);

        v12 = v29;
        v18 = v28;
        v19 = v27;
        v17 = v26;
        v5 = v25;
        v21 = v24;

        if (v40)
        {
          _ACLogSystem();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            +[ACRemoteUtilities localAccountMatchingRemoteAccount:inAccountStore:].cold.1();
LABEL_28:
          v15 = v37;

          v10 = v21;
          v6 = v38;
          goto LABEL_29;
        }
      }
      else
      {

      }
      objc_msgSend(v21, "username");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "username");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqualToString:", v32);

      if (v33)
      {
        _ACLogSystem();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          +[ACRemoteUtilities localAccountMatchingRemoteAccount:inAccountStore:].cold.2();
        goto LABEL_28;
      }
    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v17)
      continue;
    break;
  }
  v10 = 0;
  v6 = v38;
  v15 = v37;
LABEL_29:
  v8 = 0;
LABEL_30:

LABEL_31:
LABEL_32:

LABEL_33:
  return v10;
}

+ (void)localAccountMatchingRemoteAccount:inAccountStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, v1, "\"Remote account '%@' matched local iTunes account '%@' dsid\", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)localAccountMatchingRemoteAccount:inAccountStore:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, v1, "\"Remote account '%@' matched local account '%@' by accountType and username\", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)localAccountMatchingRemoteAccount:(NSObject *)a3 inAccountStore:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_19(&dword_20D8CB000, a3, (uint64_t)a3, "\"Remote account '%@' matched local account '%@' by identifier\", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

@end
