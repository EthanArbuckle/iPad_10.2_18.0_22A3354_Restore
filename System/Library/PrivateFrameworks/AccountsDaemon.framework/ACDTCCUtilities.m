@implementation ACDTCCUtilities

+ (int)TCCStateForClient:(id)a3 accountTypeID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_TCCServiceForAccountTypeID:", v7))
  {
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = (id)TCCAccessCopyInformation();
    v9 = (void *)-[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v19 = v7;
      v10 = *(_QWORD *)v21;
      v11 = (_QWORD *)MEMORY[0x24BEB3810];
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "objectForKeyedSubscript:", *v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            CFBundleGetIdentifier((CFBundleRef)v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "bundleID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if (v17)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BEB3818]);
              v9 = (void *)objc_claimAutoreleasedReturnValue();

              if (v9)
              {
                if (CFBooleanGetValue((CFBooleanRef)v9))
                  LODWORD(v9) = 1;
                else
                  LODWORD(v9) = 2;
              }
              v7 = v19;

              goto LABEL_21;
            }

          }
        }
        v9 = (void *)-[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          continue;
        break;
      }
      v7 = v19;
    }
LABEL_21:

  }
  else
  {
    _ACDLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ACDTCCUtilities TCCStateForClient:accountTypeID:].cold.1();
    LODWORD(v9) = 0;
  }

  return (int)v9;
}

+ (__CFString)_TCCServiceForAccountTypeID:(id)a3
{
  id v3;
  __CFString **v4;
  __CFString *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4040]))
  {
    v4 = (__CFString **)MEMORY[0x24BEB3890];
LABEL_7:
    v5 = *v4;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4150]))
  {
    v4 = (__CFString **)MEMORY[0x24BEB3970];
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4120]))
  {
    v4 = (__CFString **)MEMORY[0x24BEB3950];
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB4138]))
    v5 = (__CFString *)*MEMORY[0x24BEB3968];
  else
    v5 = 0;
LABEL_8:

  return v5;
}

+ (void)TCCStateForClient:accountTypeID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Cannot check access to a private account type: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (BOOL)TCCSupportedForAccountTypeID:(id)a3
{
  return objc_msgSend(a1, "_TCCServiceForAccountTypeID:", a3) != 0;
}

+ (BOOL)setTCCStateForClient:(id)a3 accountTypeID:(id)a4 toGranted:(BOOL)a5
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(a1, "_TCCServiceForAccountTypeID:", v8))
  {
    _ACDLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:].cold.1();
    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "bundle"))
  {
    _ACDLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:].cold.2();
LABEL_10:

    v11 = 0;
    goto LABEL_11;
  }
  v9 = TCCAccessSetForBundle();
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[ACDTCCUtilities setTCCStateForClient:accountTypeID:toGranted:].cold.3(v9, v10);

  v11 = v9 != 0;
LABEL_11:

  return v11;
}

+ (BOOL)clearTCCStateForClient:(id)a3 accountTypeID:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(a1, "_TCCServiceForAccountTypeID:", v7))
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ACDTCCUtilities clearTCCStateForClient:accountTypeID:].cold.1();
    goto LABEL_8;
  }
  if (!objc_msgSend(v6, "bundle"))
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ACDTCCUtilities clearTCCStateForClient:accountTypeID:].cold.2();
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_TCCServiceForAccountTypeID:", v7);
  objc_msgSend(v6, "bundle");
  v8 = TCCAccessResetForBundle() != 0;
LABEL_9:

  return v8;
}

+ (id)allTCCStatesForAccountTypeID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "_TCCServiceForAccountTypeID:", v4))
  {
    v5 = (void *)TCCAccessCopyInformation();
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v21 = v5;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        v11 = (_QWORD *)MEMORY[0x24BEB3810];
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(v13, "objectForKeyedSubscript:", *v11, v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              CFBundleGetIdentifier((CFBundleRef)v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BEB3818]);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", CFBooleanGetValue((CFBooleanRef)v16));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKey:", v17, v15);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v9);
      }

      v5 = v21;
    }
    else
    {
      v6 = 0;
    }
    v18 = v6;

    v19 = v18;
  }
  else
  {
    _ACDLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[ACDTCCUtilities TCCStateForClient:accountTypeID:].cold.1();
    v19 = 0;
  }

  return v19;
}

+ (BOOL)clearAllTCCStatesForAccountTypeID:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;

  v4 = a3;
  if (objc_msgSend(a1, "_TCCServiceForAccountTypeID:", v4))
  {
    v5 = TCCAccessReset() != 0;
  }
  else
  {
    _ACDLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[ACDTCCUtilities TCCStateForClient:accountTypeID:].cold.1();

    v5 = 0;
  }

  return v5;
}

+ (void)setTCCStateForClient:accountTypeID:toGranted:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_20D8CB000, v1, OS_LOG_TYPE_ERROR, "\"%@ is requesting access to a private account type: %@\", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

+ (void)setTCCStateForClient:accountTypeID:toGranted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"%@ seems to have a NULL bundle. Sorry can't work with that.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)setTCCStateForClient:(unsigned __int8)a1 accountTypeID:(NSObject *)a2 toGranted:.cold.3(unsigned __int8 a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_DEBUG, "\"Setting TCC access bit returned: %@\", v4, 0xCu);

}

+ (void)clearTCCStateForClient:accountTypeID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Cannot clear access for account type %@, which has no backing TCC service.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)clearTCCStateForClient:accountTypeID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Cannot reset TCC Access with nil bundle: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
