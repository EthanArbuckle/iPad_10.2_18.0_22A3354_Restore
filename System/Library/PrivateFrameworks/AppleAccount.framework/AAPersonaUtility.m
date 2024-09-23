@implementation AAPersonaUtility

+ (id)findEnterprisePersonaIdentifier
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listAllPersonaWithAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[AAPersonaUtility findEnterprisePersonaIdentifier].cold.1((uint64_t)v3, v4);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    *(_QWORD *)&v7 = 138412290;
    v16 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEnterprisePersona", v16, (_QWORD)v17))
        {
          objc_msgSend(v12, "userPersonaUniqueString");
          v13 = objc_claimAutoreleasedReturnValue();

          _AALogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v16;
            v22 = v13;
            _os_log_debug_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEBUG, "Found the enterprise persona (%@)!", buf, 0xCu);
          }

          v9 = (void *)v13;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)personaConsistencyCheck:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "isEqualToPersona:", v5);
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[AAPersonaUtility personaConsistencyCheck:].cold.1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    +[AAPersonaUtility personaConsistencyCheck:].cold.2();
  }

  return v6;
}

+ (void)verifyAndFixPersonaIfNeeded:(id)a3 desiredContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "isEqualToPersona:", v9);
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[AAPersonaUtility verifyAndFixPersonaIfNeeded:desiredContext:].cold.1();

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[AAPersonaUtility verifyAndFixPersonaIfNeeded:desiredContext:].cold.2();

    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentPersona");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "restorePersonaWithSavedPersonaContext:", v7);

    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentPersona");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "personaConsistencyCheck:", v6);
    v9 = (void *)v17;
  }

}

+ (BOOL)isDataSeparatedAccount:(id)a3
{
  return objc_msgSend(a3, "isDataSeparatedAccount");
}

+ (void)findEnterprisePersonaIdentifier
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19EACA000, a2, OS_LOG_TYPE_DEBUG, "personaAttributes: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)personaConsistencyCheck:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_2_1();
  objc_msgSend(v3, "userPersonaNickName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "userPersonaUniqueString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "userPersonaNickName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "userPersonaUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_1(&dword_19EACA000, v5, v6, "%s Desired persona (%@, %@) is equal to current persona (%@, %@)", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_3();
}

+ (void)personaConsistencyCheck:.cold.2()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  int v6[14];
  uint64_t v7;

  OUTLINED_FUNCTION_2_1();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v4, "userPersonaNickName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "userPersonaUniqueString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "userPersonaNickName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "userPersonaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136316162;
  OUTLINED_FUNCTION_0_7();
  _os_log_fault_impl(&dword_19EACA000, v1, OS_LOG_TYPE_FAULT, "%s Desired persona (%@, %@) is not equal to current persona (%@, %@)", (uint8_t *)v6, 0x34u);

  OUTLINED_FUNCTION_1_3();
}

+ (void)verifyAndFixPersonaIfNeeded:desiredContext:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_2_1();
  objc_msgSend(v3, "userPersonaUniqueString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "userPersonaNickName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "userPersonaUniqueString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "userPersonaNickName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_3_1(&dword_19EACA000, v5, v6, "%s Desired persona (%@, %@) is equal to (%@, %@)", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_3();
}

+ (void)verifyAndFixPersonaIfNeeded:desiredContext:.cold.2()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  int v6[14];
  uint64_t v7;

  OUTLINED_FUNCTION_2_1();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v4, "userPersonaUniqueString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "userPersonaNickName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "userPersonaUniqueString");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "userPersonaNickName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136316162;
  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl(&dword_19EACA000, v1, OS_LOG_TYPE_ERROR, "%s Desired persona (%@, %@) is not equal current persona (%@, %@). Will attempt to correct", (uint8_t *)v6, 0x34u);

  OUTLINED_FUNCTION_1_3();
}

@end
