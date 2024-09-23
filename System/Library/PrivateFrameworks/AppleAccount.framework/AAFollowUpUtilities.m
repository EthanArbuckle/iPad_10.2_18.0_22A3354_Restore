@implementation AAFollowUpUtilities

+ (BOOL)hasValidIDMSAccountForUserInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  int v28;
  NSObject *v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf;
  char v45[15];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", AAFollowUpUserInfoAccountIdentifier[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.1(v7);
    goto LABEL_32;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.7();

  objc_msgSend(v4, "accountWithIdentifier:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_32:
    v30 = 0;
    goto LABEL_38;
  }
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.6();

  v9 = 0x1E0D00000uLL;
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allAuthKitAccounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = v11;
  v38 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v47;
    v34 = v5;
    v35 = v4;
    v36 = v3;
    v37 = v12;
    while (2)
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v47 != v39)
          objc_enumerationMutation(v12);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v14, "username");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject username](v7, "username");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if (v17)
        {
          _AALogSystem();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.3();

          v30 = 1;
LABEL_36:
          v29 = v12;
          v4 = v35;
          v3 = v36;
          v5 = v34;
          goto LABEL_37;
        }
        objc_msgSend(*(id *)(v9 + 256), "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "aliasesForAccount:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          _AALogSystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.5(&buf, v45, v20);

          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v21 = v19;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v41;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v41 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
                -[NSObject username](v7, "username");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isEqualToString:", v26);

                if (v28)
                {
                  _AALogSystem();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                    +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.4();

                  v30 = 1;
                  v12 = v37;
                  goto LABEL_36;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
              if (v23)
                continue;
              break;
            }
          }

          v12 = v37;
          v9 = 0x1E0D00000;
        }

      }
      v4 = v35;
      v3 = v36;
      v5 = v34;
      v38 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v38)
        continue;
      break;
    }
  }

  _AALogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    +[AAFollowUpUtilities hasValidIDMSAccountForUserInfo:].cold.2(v7, v29);
  v30 = 0;
LABEL_37:

LABEL_38:
  return v30;
}

+ (void)hasValidIDMSAccountForUserInfo:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "No account identifier found in userInfo!", v1, 2u);
}

+ (void)hasValidIDMSAccountForUserInfo:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_19EACA000, a2, OS_LOG_TYPE_FAULT, "AAFollowUpUtilities: Unable to find valid account for followup with account type %{public}@. Clearing item.", v5, 0xCu);

}

+ (void)hasValidIDMSAccountForUserInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "AAFollowUpUtilities: Found valid IDMS account for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)hasValidIDMSAccountForUserInfo:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "AAFollowUpUtilities: alias %@ found!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)hasValidIDMSAccountForUserInfo:(os_log_t)log .cold.5(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "AAFollowUpUtilities: Checking aliases...", buf, 2u);
}

+ (void)hasValidIDMSAccountForUserInfo:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "AAFollowUpUtilities: Found account %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)hasValidIDMSAccountForUserInfo:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "AAFollowUpUtilities: Follow up has account identifier %@ in userInfo", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
