@implementation AKPasswordGeneratorHook

- (AKPasswordGeneratorHook)init
{
  AKPasswordGeneratorHook *v2;
  SFStrongPasswordGenerator *v3;
  SFStrongPasswordGenerator *passwordGenerator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKPasswordGeneratorHook;
  v2 = -[AKPasswordGeneratorHook init](&v6, sel_init);
  if (v2)
  {
    v3 = (SFStrongPasswordGenerator *)objc_alloc_init((Class)getSFStrongPasswordGeneratorClass());
    passwordGenerator = v2->_passwordGenerator;
    v2->_passwordGenerator = v3;

  }
  return v2;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  NSObject *v9;

  v8 = a6;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AKPasswordGeneratorHook processElement:attributes:objectModel:completion:].cold.1((uint64_t)self, a2, v9);

  (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
}

- (BOOL)shouldMatchElement:(id)a3
{
  return 0;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("password:generate"), "isEqualToString:", v5))
  {
    objc_msgSend(v3, "clientInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("passwordFieldId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_autogeneratePasswordForObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  AKPasswordGeneratorHook *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("passwordFieldId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v6, "clientInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("passwordRules"));
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;
    else
      v13 = CFSTR("minlength: 8; maxlength: 63; required: lower; required: upper; required: digit; allowed: ascii-printable;");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKPasswordGeneratorHook _generatePasswordForAppWithAppID:passwordRules:](self, "_generatePasswordForAppWithAppID:passwordRules:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _AKLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[AKPasswordGeneratorHook _autogeneratePasswordForObjectModel:completion:].cold.4();

      -[AKPasswordGeneratorHook _fetchAndPopulatePasswordRows:objectModel:password:](self, "_fetchAndPopulatePasswordRows:objectModel:password:", v10, v6, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "count"))
      {
        v27 = self;
        v28 = v7;
        _AKLogSystem();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[AKPasswordGeneratorHook _autogeneratePasswordForObjectModel:completion:].cold.3();

        v26 = objc_alloc_init(MEMORY[0x1E0D872E0]);
        v20 = (void *)objc_opt_new();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v21 = v10;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v30;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v30 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(v20, "setObject:forKey:", v16, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25++));
            }
            while (v23 != v25);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v23);
        }

        objc_msgSend(v26, "setAdditionalPayload:", v20);
        -[AKPasswordGeneratorHook setServerHookResponse:](v27, "setServerHookResponse:", v26);
        v7 = v28;
        (*((void (**)(id, uint64_t, _QWORD))v28 + 2))(v28, 1, 0);

      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[AKPasswordGeneratorHook _autogeneratePasswordForObjectModel:completion:].cold.2();
    }

  }
  else
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AKPasswordGeneratorHook _autogeneratePasswordForObjectModel:completion:].cold.1();
  }

}

- (id)_fetchAndPopulatePasswordRows:(id)a3 objectModel:(id)a4 password:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  __int128 v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v28 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "mutableCopy");

  if (!v11)
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v30;
    *(_QWORD *)&v14 = 138412290;
    v26 = v14;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[AKPasswordGeneratorHook _tableViewRowWithID:inObjectModel:](self, "_tableViewRowWithID:inObjectModel:", v18, v9, v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          objc_msgSend(v19, "setValueFromString:", v28);
          objc_msgSend(v27, "addObject:", v20);
        }
        else
        {
          v21 = v12;
          v22 = v11;
          _AKLogSystem();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v26;
            v34 = v18;
            _os_log_debug_impl(&dword_1BD795000, v23, OS_LOG_TYPE_DEBUG, "Row with row id: %@ does not exist, adding it to updateInfo", buf, 0xCu);
          }

          v11 = v22;
          objc_msgSend(v22, "setObject:forKey:", v28, v18);
          v12 = v21;
        }

      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v15);
  }

  objc_msgSend(v9, "setUpdateInfo:", v11);
  _AKLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[AKPasswordGeneratorHook _fetchAndPopulatePasswordRows:objectModel:password:].cold.1((uint64_t)v11, v24);

  return v27;
}

- (id)_generatePasswordForAppWithAppID:(id)a3 passwordRules:(id)a4
{
  return (id)-[SFStrongPasswordGenerator generatedPasswordForAppWithAppID:associatedDomains:passwordRules:confirmPasswordRules:](self->_passwordGenerator, "generatedPasswordForAppWithAppID:associatedDomains:passwordRules:confirmPasswordRules:", a3, 0, a4, 0);
}

- (id)_tableViewRowWithID:(id)a3 inObjectModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a4, "allPages", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "hasTableView") & 1) != 0)
        {
          objc_msgSend(v10, "tableViewOM");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "rowWithIdentifier:", v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverHookResponse, a3);
}

- (SFStrongPasswordGenerator)passwordGenerator
{
  return self->_passwordGenerator;
}

- (void)setPasswordGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_passwordGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordGenerator, 0);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)processElement:(NSObject *)a3 attributes:objectModel:completion:.cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_1BD795000, a3, OS_LOG_TYPE_DEBUG, "%@: %@ is not supported.", (uint8_t *)&v8, 0x16u);

}

- (void)_autogeneratePasswordForObjectModel:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Failed to parse password row ids from server response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_autogeneratePasswordForObjectModel:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1BD795000, v0, v1, "Failed to generate strong password", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_autogeneratePasswordForObjectModel:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Failed to find any rowIDs returned from client info, postBack to server for silent auth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_autogeneratePasswordForObjectModel:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Successfully generated strong password", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_fetchAndPopulatePasswordRows:(uint64_t)a1 objectModel:(NSObject *)a2 password:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Object model updateInfo: %@", (uint8_t *)&v2, 0xCu);
}

@end
