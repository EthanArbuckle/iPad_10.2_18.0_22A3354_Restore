@implementation AKAuthorizationValidator

+ (BOOL)canPerformCredentialRequest:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v14;
  id v15;

  v15 = 0;
  v6 = a3;
  v7 = objc_msgSend(a1, "canPerformAuthorizationRequest:error:", v6, &v15);
  v8 = v15;
  v14 = 0;
  LOBYTE(a1) = objc_msgSend(a1, "canPerformPasswordRequest:error:", v6, &v14);

  v9 = v14;
  v10 = v9;
  v11 = v7 | a1;
  if ((v11 & 1) == 0)
  {
    if (v8)
    {
      if (a4)
      {
        v9 = v8;
        goto LABEL_7;
      }
    }
    else
    {
      if (!v9)
      {
        if (!a4)
          goto LABEL_9;
        objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7001);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      if (a4)
      {
LABEL_7:
        v12 = objc_retainAutorelease(v9);
LABEL_8:
        *a4 = v12;
      }
    }
  }
LABEL_9:

  return v11;
}

+ (BOOL)canPerformAuthorizationRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  int v28;
  char v29;
  char v30;
  char v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  int v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "authorizationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _AKLogSiwa();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.1();

    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = -7044;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (!objc_msgSend(a1, "_requirePasscodeSet"))
  {
    objc_msgSend(v7, "authkitAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "altDSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "iCloudAccountForAltDSID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "authkitAccount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "_isItunesLogin") & 1) == 0 && !v15)
      {
        _AKLogSiwa();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.9();

        if (a4)
        {
          v18 = -7022;
LABEL_33:
          objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", v18);
          v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:

          goto LABEL_60;
        }
        goto LABEL_58;
      }
      if (objc_msgSend(v13, "securityLevelForAccount:", v16) == 5)
      {
        +[AKDevice currentDevice](AKDevice, "currentDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isMultiUserMode");

        if (v22)
        {
          _AKLogSiwa();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.4();
          goto LABEL_31;
        }
      }
      else
      {
        if (objc_msgSend(v13, "authenticationModeForAccount:", v16) == 2)
        {
          _AKLogSiwa();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.5();
LABEL_31:

          if (a4)
          {
            v18 = -7027;
            goto LABEL_33;
          }
LABEL_58:
          v20 = 0;
          goto LABEL_59;
        }
        if (objc_msgSend(v13, "userUnderAgeForAccount:", v16)
          && (objc_msgSend(v6, "_isFirstPartyLogin") & 1) == 0)
        {
          +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isTiburonU13Enabled");

          if (!v25)
          {
            _AKLogSiwa();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.8();

            if (a4)
            {
              v18 = -7076;
              goto LABEL_33;
            }
            goto LABEL_58;
          }
          _AKLogSystem();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v36 = 138477827;
            v37 = CFSTR("Allowing underage user to perform request");
            _os_log_impl(&dword_19202F000, v26, OS_LOG_TYPE_DEFAULT, "%{private}@", (uint8_t *)&v36, 0xCu);
          }

        }
        if (objc_msgSend(v13, "securityLevelForAccount:", v16) != 4)
        {
          _AKLogSiwa();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.7();

          if (a4)
          {
            v18 = -7070;
            goto LABEL_33;
          }
          goto LABEL_58;
        }
        objc_msgSend(v7, "requestedScopes");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "containsObject:", CFSTR("email"));

        if (v28)
        {
          v29 = objc_msgSend(v13, "isPrimaryiCloudAccountEmailVerified:", v15);
          v30 = objc_msgSend(v13, "verifiedPrimaryEmailForAccount:", v16);
          v31 = objc_msgSend(v13, "phoneAsAppleIDForAccount:", v16);
          v20 = 1;
          if ((v29 & 1) != 0 || (v30 & 1) != 0 || (v31 & 1) != 0)
            goto LABEL_59;
          _AKLogSiwa();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.6();

          if (a4)
          {
            v18 = -7072;
            goto LABEL_33;
          }
          goto LABEL_58;
        }
      }
      v20 = 1;
      goto LABEL_59;
    }
    _AKLogSiwa();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.3();

    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = -7022;
      goto LABEL_22;
    }
LABEL_23:
    v20 = 0;
    goto LABEL_60;
  }
  _AKLogSiwa();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.2();

  if (!a4)
    goto LABEL_23;
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = -7080;
LABEL_22:
  objc_msgSend(v9, "ak_errorWithCode:", v10);
  v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:

  return v20;
}

+ (BOOL)canPerformPasswordRequest:(id)a3 error:(id *)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;

  objc_msgSend(a3, "passwordRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _AKLogSiwa();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[AKAuthorizationValidator canPerformPasswordRequest:error:].cold.1();

    if (a4)
    {
      v8 = -7026;
      goto LABEL_11;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(a1, "_requirePasscodeSet"))
  {
    v10 = 1;
    goto LABEL_14;
  }
  _AKLogSiwa();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[AKAuthorizationValidator canPerformAuthorizationRequest:error:].cold.2();

  if (!a4)
    goto LABEL_13;
  v8 = -7080;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", v8);
  v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v10;
}

+ (BOOL)shouldContinueWithResponse:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v5 = a3;
  objc_msgSend(v5, "userSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 && (objc_msgSend(v5, "hasSelectedSharedAccountForLogin") & 1) == 0)
  {
    objc_msgSend(v5, "selectedRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestedScopes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", CFSTR("name"));

    if (v12)
    {
      objc_msgSend(v6, "userInformation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "givenName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {

      }
      else
      {
        objc_msgSend(v6, "userInformation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "familyName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (!v17)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7012);
            v9 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = 0;
          }
          goto LABEL_17;
        }
      }
    }
    objc_msgSend(v10, "requestedScopes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", CFSTR("email"));

    if (v19)
    {
      +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "authkitAccount");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v20, "isManagedAppleIDForAccount:", v21);

      if ((v9 & 1) != 0)
      {
LABEL_14:

LABEL_17:
        goto LABEL_18;
      }
      objc_msgSend(v10, "authkitAccount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "phoneAsAppleIDForAccount:", v22);

      objc_msgSend(v6, "userInformation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "selectedEmail");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      if (!v26 && (v23 & 1) == 0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7012);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_14;
      }

    }
    v9 = 1;
    goto LABEL_17;
  }
  v9 = 1;
LABEL_18:

  return v9;
}

+ (BOOL)_requirePasscodeSet
{
  return 0;
}

+ (void)canPerformAuthorizationRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - Missing authorization request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformAuthorizationRequest:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - Current platform require passcode setup", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformAuthorizationRequest:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - Missing account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformAuthorizationRequest:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - Managed Accounts Not Permitted on Shared iPad", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformAuthorizationRequest:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - FedAuth Accounts Not Permitted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformAuthorizationRequest:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - Account not verified.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformAuthorizationRequest:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - Insufficient security level", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformAuthorizationRequest:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - Invalid age", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformAuthorizationRequest:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform request - Missing AppleAccount", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)canPerformPasswordRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Cannot perform password request without password request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
