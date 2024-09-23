@implementation ICAuthentication

+ (ICAuthentication)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_76);
  return (ICAuthentication *)(id)shared_shared_0;
}

void __26__ICAuthentication_shared__block_invoke()
{
  ICAuthentication *v0;
  void *v1;

  v0 = objc_alloc_init(ICAuthentication);
  v1 = (void *)shared_shared_0;
  shared_shared_0 = (uint64_t)v0;

}

- (BOOL)isAuthenticating
{
  void *v2;
  BOOL v3;

  -[ICAuthentication currentAuthenticationController](self, "currentAuthenticationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)authenticateWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  ICAuthentication *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  ICAuthentication *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v8;
    v29 = 2080;
    v30 = "-[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:]";
    v31 = 1024;
    v32 = 120;
    _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "Authenticating… {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (!-[ICAuthentication isAuthenticating](self, "isAuthenticating"))
  {
    objc_msgSend(v8, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountDataCreateIfNecessary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "updateSupportsV1Neo:", 0);
    if (objc_msgSend(v8, "needsUserRecordUpdate")
      && objc_msgSend(v8, "updatesUserRecordIfNeeded"))
    {
      objc_msgSend(v8, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __75__ICAuthentication_authenticateWithPrompt_displayWindow_completionHandler___block_invoke;
      v22[3] = &unk_1E5C21C78;
      v23 = v8;
      v24 = self;
      v25 = v9;
      v26 = v10;
      -[ICAuthentication updateUserRecordForAccount:completionHandler:](self, "updateUserRecordForAccount:completionHandler:", v15, v22);

    }
    else
    {
      v16 = objc_msgSend(v8, "authenticationAction");
      if (v16 == 3)
      {
        -[ICAuthentication setCustomPasswordWithPrompt:displayWindow:completionHandler:](self, "setCustomPasswordWithPrompt:displayWindow:completionHandler:", v8, v9, v10);
      }
      else
      {
        if (v16 == 1)
        {
          v21 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:].cold.4();
LABEL_21:

          v18 = self;
          v19 = v8;
          v20 = 1;
        }
        else
        {
          if (v16)
          {
            switch(objc_msgSend(v8, "authenticationMechanism"))
            {
              case 0:
                v21 = os_log_create("com.apple.notes", "Crypto");
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:].cold.2();
                goto LABEL_21;
              case 1:
              case 2:
              case 3:
                -[ICAuthentication authenticateBiometricsWithPrompt:displayWindow:completionHandler:](self, "authenticateBiometricsWithPrompt:displayWindow:completionHandler:", v8, v9, v10);
                break;
              case 4:
                -[ICAuthentication authenticateCustomPasswordWithPrompt:displayWindow:completionHandler:](self, "authenticateCustomPasswordWithPrompt:displayWindow:completionHandler:", v8, v9, v10);
                break;
              case 5:
                -[ICAuthentication authenticateDevicePasswordWithPrompt:displayWindow:completionHandler:](self, "authenticateDevicePasswordWithPrompt:displayWindow:completionHandler:", v8, v9, v10);
                break;
              case 6:
                -[ICAuthentication authenticateCloudPasswordWithPrompt:displayWindow:completionHandler:](self, "authenticateCloudPasswordWithPrompt:displayWindow:completionHandler:", v8, v9, v10);
                break;
              default:
                goto LABEL_23;
            }
            goto LABEL_23;
          }
          v17 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:].cold.3();

          v18 = self;
          v19 = v8;
          v20 = 2;
        }
        -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:](v18, "didAuthenticateWithPrompt:result:displayWindow:completionHandler:", v19, v20, v9, v10);
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  v12 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:].cold.1();

  -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:](self, "didAuthenticateWithPrompt:result:displayWindow:completionHandler:", v8, 0, v9, v10);
LABEL_24:

}

uint64_t __75__ICAuthentication_authenticateWithPrompt_displayWindow_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUpdatesUserRecordIfNeeded:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "authenticateWithPrompt:displayWindow:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)didAuthenticateWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("Cancel");
    if (a4 == 1)
      v14 = CFSTR("Failure");
    *(_DWORD *)buf = 138413058;
    v32 = v10;
    if (a4 == 2)
      v14 = CFSTR("Success");
    v33 = 2112;
    v34 = v14;
    v35 = 2080;
    v36 = "-[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:]";
    v37 = 1024;
    v38 = 196;
    v15 = v14;
    _os_log_impl(&dword_1AC7A1000, v13, OS_LOG_TYPE_DEFAULT, "Authenticated with prompt {prompt: %@, result: %@}%s:%d", buf, 0x26u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (a4 == 1)
  {
    if (!objc_msgSend(v10, "allowsAlternativeAuthentication")
      || (objc_msgSend(v10, "usesAlternativeAuthenticationIfAvailable") & 1) != 0)
    {
      objc_msgSend(v10, "failureAlerts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __85__ICAuthentication_didAuthenticateWithPrompt_result_displayWindow_completionHandler___block_invoke_2;
      v25[3] = &unk_1E5C233F0;
      v26 = v12;
      v27 = 1;
      +[ICAuthenticationAlert presentAlertsIfNeeded:window:completionHandler:](ICAuthenticationAlert, "presentAlertsIfNeeded:window:completionHandler:", v22, v11, v25);

      goto LABEL_28;
    }
    v24 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:].cold.2();

    objc_msgSend(v10, "setUsesAlternativeAuthenticationIfAvailable:", 1);
    goto LABEL_27;
  }
  if (a4 == 2)
  {
    if (!objc_msgSend(v10, "needsSecondaryAuthentication")
      || (objc_msgSend(v10, "usesSecondaryAuthenticationIfAvailable") & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v10, "object");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        +[ICPasswordUtilities sharedInstance](ICPasswordUtilities, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "accessibilityAnnounceAuthSuccessForIntent:withNote:", objc_msgSend(v10, "intent"), v17);

        objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addMainKeyToKeychainForObject:", v17);

      }
      +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "generatePreviewsIfNeeded");

      objc_msgSend(v10, "successAlerts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __85__ICAuthentication_didAuthenticateWithPrompt_result_displayWindow_completionHandler___block_invoke;
      v28[3] = &unk_1E5C233F0;
      v29 = v12;
      v30 = 2;
      +[ICAuthenticationAlert presentAlertsIfNeeded:window:completionHandler:](ICAuthenticationAlert, "presentAlertsIfNeeded:window:completionHandler:", v21, v11, v28);

      goto LABEL_28;
    }
    v23 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:].cold.1();

    objc_msgSend(v10, "setUsesSecondaryAuthenticationIfAvailable:", 1);
LABEL_27:
    -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:](self, "authenticateWithPrompt:displayWindow:completionHandler:", v10, v11, v12);
    goto LABEL_28;
  }
  if (v12)
    (*((void (**)(id, unint64_t))v12 + 2))(v12, a4);
LABEL_28:

}

uint64_t __85__ICAuthentication_didAuthenticateWithPrompt_result_displayWindow_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __85__ICAuthentication_didAuthenticateWithPrompt_result_displayWindow_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)authenticateBiometricsWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD v31[6];
  _QWORD v32[6];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v34 = v8;
    v35 = 2080;
    v36 = "-[ICAuthentication authenticateBiometricsWithPrompt:displayWindow:completionHandler:]";
    v37 = 1024;
    v38 = 256;
    _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "Authenticating biometrics… {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication authenticateBiometricsWithPrompt:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  v31[0] = &unk_1E5C71F88;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes"), CFSTR("Notes"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v12;
  v31[1] = &unk_1E5C71FA0;
  objc_msgSend(v8, "reason");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E5C2F8C0;
  v32[1] = v15;
  v31[2] = &unk_1E5C71FB8;
  objc_msgSend(v8, "fallbackButtonTitle");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1E5C2F8C0;
  v32[2] = v18;
  v32[3] = &unk_1E5C71FE8;
  v31[3] = &unk_1E5C71FD0;
  v31[4] = &unk_1E5C72000;
  objc_msgSend(v9, "tintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[5] = &unk_1E5C72018;
  v32[4] = v20;
  v32[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)

  v22 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  -[ICAuthentication setCurrentAuthenticationController:](self, "setCurrentAuthenticationController:", v22);
  v23 = objc_msgSend(MEMORY[0x1E0D63B90], "biometricsPolicy");
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __85__ICAuthentication_authenticateBiometricsWithPrompt_displayWindow_completionHandler___block_invoke;
  v27[3] = &unk_1E5C23418;
  v27[4] = self;
  v28 = v8;
  v29 = v9;
  v30 = v10;
  v24 = v10;
  v25 = v9;
  v26 = v8;
  objc_msgSend(v22, "evaluatePolicy:options:reply:", v23, v21, v27);

}

void __85__ICAuthentication_authenticateBiometricsWithPrompt_displayWindow_completionHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v5 = v4;
  performBlockOnMainThread();

}

uint64_t __85__ICAuthentication_authenticateBiometricsWithPrompt_displayWindow_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)didAuthenticateBiometricsWithPrompt:(id)a3 error:(id)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  ICAuthentication *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138413058;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    v35 = 2080;
    v36 = "-[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]";
    v37 = 1024;
    v38 = 304;
    _os_log_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_DEFAULT, "Authenticated biometrics with prompt {prompt: %@, error: %@}%s:%d", (uint8_t *)&v31, 0x26u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (!-[ICAuthentication isAuthenticating](self, "isAuthenticating"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isAuthenticating", "-[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:]", 1, 0, CFSTR("Authenticated biometrics while not currently authenticating"));
  -[ICAuthentication setCurrentAuthenticationController:](self, "setCurrentAuthenticationController:", 0);
  if (objc_msgSend(v11, "code") != -2 && objc_msgSend(v11, "code") != -4)
  {
    if (v11 && objc_msgSend(v11, "code") != -5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:", CFSTR("ICAuthenticationAuthenticateBiometricsAttemptDidFail"), self);

    }
    if (objc_msgSend(v11, "code") == -3 || objc_msgSend(v11, "code") == -8)
    {
      v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:].cold.1();

      objc_msgSend(v10, "setUsesBiometricAuthenticationIfAvailable:", 0);
      if (objc_msgSend(v10, "authenticationAction") == 2)
      {
LABEL_20:
        -[ICAuthentication authenticateWithPrompt:displayWindow:completionHandler:](self, "authenticateWithPrompt:displayWindow:completionHandler:", v10, v12, v13);
        goto LABEL_11;
      }
LABEL_39:
      v15 = self;
      v16 = v10;
      v17 = 1;
      goto LABEL_10;
    }
    if (v11 && objc_msgSend(v11, "code") != -5)
      goto LABEL_39;
    if ((objc_msgSend(v10, "unlocksNotes") & 1) != 0)
    {
      v20 = (void *)MEMORY[0x1E0D63AB8];
      objc_msgSend(v10, "authenticationObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend(v20, "shouldAuthenticateWithCustomPasswordForObject:", v21);

      if (!(_DWORD)v20)
      {
        v26 = (void *)MEMORY[0x1E0D63AB8];
        objc_msgSend(v10, "authenticationObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = objc_msgSend(v26, "shouldAuthenticateWithDevicePasswordForObject:", v27);

        if (!(_DWORD)v26)
        {
          v30 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:].cold.3();

          goto LABEL_39;
        }
        v25 = (void *)MEMORY[0x1E0D63A58];
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "authenticationObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "authenticateObjectWithKeychain:", v23);

      if ((v24 & 1) == 0)
      {
        v29 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[ICAuthentication didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:].cold.2();

        objc_msgSend(v10, "setUsesBiometricAuthenticationIfAvailable:", 0);
        goto LABEL_20;
      }
      if (objc_msgSend(v10, "needsSecondaryAuthentication")
        && objc_msgSend(v10, "secondaryAuthenticationMode") == 2)
      {
        objc_msgSend(v10, "setUsesSecondaryAuthenticationIfAvailable:", 1);
        v25 = (void *)MEMORY[0x1E0D63A58];
LABEL_31:
        objc_msgSend(v25, "sharedState");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "authenticateWithDevicePassword");

      }
    }
    v15 = self;
    v16 = v10;
    v17 = 2;
    goto LABEL_10;
  }
  v15 = self;
  v16 = v10;
  v17 = 0;
LABEL_10:
  -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:](v15, "didAuthenticateWithPrompt:result:displayWindow:completionHandler:", v16, v17, v12, v13);
LABEL_11:

}

- (void)setBiometricsEnabled:(BOOL)a3 account:(id)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBiometricsEnabled:forAccount:", v4, v8);

  objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "addMainKeyToKeychainForObject:", v8);
  else
    objc_msgSend(v6, "removeMainKeysFromKeychainForAccount:", v8);

}

- (void)authenticateCustomPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ICPasswordEntryAlertController *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 2080;
    v23 = "-[ICAuthentication authenticateCustomPasswordWithPrompt:displayWindow:completionHandler:]";
    v24 = 1024;
    v25 = 400;
    _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "Authenticating custom password with prompt {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication authenticateCustomPasswordWithPrompt:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  v12 = -[ICPasswordEntryAlertController initWithDisplayWindow:]([ICPasswordEntryAlertController alloc], "initWithDisplayWindow:", v9);
  -[ICAuthentication setCurrentAuthenticationController:](self, "setCurrentAuthenticationController:", v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__ICAuthentication_authenticateCustomPasswordWithPrompt_displayWindow_completionHandler___block_invoke;
  v16[3] = &unk_1E5C23440;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[ICPasswordEntryAlertController authenticateWithPrompt:completionHandler:](v12, "authenticateWithPrompt:completionHandler:", v15, v16);

}

uint64_t __89__ICAuthentication_authenticateCustomPasswordWithPrompt_displayWindow_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didAuthenticateCustomPasswordWithPrompt:result:displayWindow:completionHandler:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)didAuthenticateCustomPasswordWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  _BYTE v16[24];
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("Cancel");
    if (a4 == 1)
      v14 = CFSTR("Failure");
    *(_DWORD *)v16 = 138413058;
    *(_QWORD *)&v16[4] = v10;
    if (a4 == 2)
      v14 = CFSTR("Success");
    *(_WORD *)&v16[12] = 2112;
    *(_QWORD *)&v16[14] = v14;
    *(_WORD *)&v16[22] = 2080;
    v17 = "-[ICAuthentication didAuthenticateCustomPasswordWithPrompt:result:displayWindow:completionHandler:]";
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = 429;
    v15 = v14;
    _os_log_impl(&dword_1AC7A1000, v13, OS_LOG_TYPE_DEFAULT, "Authenticated custom password with prompt {prompt: %@, result: %@}%s:%d", v16, 0x26u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication didAuthenticateCustomPasswordWithPrompt:result:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (!-[ICAuthentication isAuthenticating](self, "isAuthenticating", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18, v19))objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isAuthenticating", "-[ICAuthentication didAuthenticateCustomPasswordWithPrompt:result:displayWindow:completionHandler:]", 1, 0, CFSTR("Authenticated custom password while not currently authenticating"));
  -[ICAuthentication setCurrentAuthenticationController:](self, "setCurrentAuthenticationController:", 0);
  -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:](self, "didAuthenticateWithPrompt:result:displayWindow:completionHandler:", v10, a4, v11, v12);

}

- (void)authenticateDevicePasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v8;
    v29 = 2080;
    v30 = "-[ICAuthentication authenticateDevicePasswordWithPrompt:displayWindow:completionHandler:]";
    v31 = 1024;
    v32 = 451;
    _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "Authenticating device password… {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication authenticateDevicePasswordWithPrompt:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  v25[0] = &unk_1E5C71F88;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes"), CFSTR("Notes"), 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = &unk_1E5C71FA0;
  v26[0] = v12;
  objc_msgSend(v8, "reason");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &stru_1E5C2F8C0;
  if (v13)
    v15 = (const __CFString *)v13;
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  -[ICAuthentication setCurrentAuthenticationController:](self, "setCurrentAuthenticationController:", v17);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__ICAuthentication_authenticateDevicePasswordWithPrompt_displayWindow_completionHandler___block_invoke;
  v21[3] = &unk_1E5C23418;
  v21[4] = self;
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v18 = v10;
  v19 = v9;
  v20 = v8;
  objc_msgSend(v17, "evaluatePolicy:options:reply:", 1007, v16, v21);

}

void __89__ICAuthentication_authenticateDevicePasswordWithPrompt_displayWindow_completionHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v5 = v4;
  performBlockOnMainThread();

}

uint64_t __89__ICAuthentication_authenticateDevicePasswordWithPrompt_displayWindow_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didAuthenticateDevicePasswordWithPrompt:error:displayWindow:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)didAuthenticateDevicePasswordWithPrompt:(id)a3 error:(id)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138413058;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2080;
    v23 = "-[ICAuthentication didAuthenticateDevicePasswordWithPrompt:error:displayWindow:completionHandler:]";
    v24 = 1024;
    v25 = 499;
    _os_log_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_DEFAULT, "Authenticated device password with prompt {prompt: %@, error: %@}%s:%d", (uint8_t *)&v18, 0x26u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication didAuthenticateDevicePasswordWithPrompt:error:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (!-[ICAuthentication isAuthenticating](self, "isAuthenticating"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isAuthenticating", "-[ICAuthentication didAuthenticateDevicePasswordWithPrompt:error:displayWindow:completionHandler:]", 1, 0, CFSTR("Authenticated device password while not currently authenticating"));
  -[ICAuthentication setCurrentAuthenticationController:](self, "setCurrentAuthenticationController:", 0);
  v15 = objc_msgSend(v11, "code");
  v16 = 0;
  if (v15 != -2)
  {
    if (objc_msgSend(v11, "code") == -4)
    {
      v16 = 0;
    }
    else if (v11 && objc_msgSend(v11, "code") != -5)
    {
      v16 = 1;
    }
    else
    {
      if (objc_msgSend(v10, "unlocksNotes"))
      {
        objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "authenticateWithDevicePassword");

      }
      v16 = 2;
    }
  }
  -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:](self, "didAuthenticateWithPrompt:result:displayWindow:completionHandler:", v10, v16, v12, v13);

}

- (void)authenticateCloudPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v40 = v7;
    v41 = 2080;
    v42 = "-[ICAuthentication authenticateCloudPasswordWithPrompt:displayWindow:completionHandler:]";
    v43 = 1024;
    v44 = 532;
    _os_log_impl(&dword_1AC7A1000, v10, OS_LOG_TYPE_DEFAULT, "Authenticating cloud password… {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication authenticateCloudPasswordWithPrompt:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  v11 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  objc_msgSend(v8, "rootViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPresentingViewController:", v12);

  objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountWithIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "username");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsername:", v18);

  objc_msgSend(v11, "setIsUsernameEditable:", 0);
  objc_msgSend(v11, "setServiceType:", 1);
  objc_msgSend(v7, "reason");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_1E5C2F8C0;
  objc_msgSend(v11, "setReason:", v21);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("OK"), CFSTR("OK"), 0, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDefaultButtonString:", v22);

  v23 = *MEMORY[0x1E0CFCF48];
  v38[0] = *MEMORY[0x1E0CFCF40];
  v38[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setServiceIdentifiers:", v24);

  objc_msgSend(v11, "setIsEphemeral:", 1);
  objc_msgSend(v7, "title");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (const __CFString *)v25;
  else
    v27 = &stru_1E5C2F8C0;
  objc_msgSend(v11, "setTitle:", v27);

  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCancelButtonString:", v28);

  objc_msgSend(v11, "setAuthenticationType:", 2);
  objc_msgSend(v11, "setShouldPromptForPasswordOnly:", 1);
  objc_msgSend(v11, "setShouldUpdatePersistentServiceTokens:", 1);
  v29 = objc_alloc_init(MEMORY[0x1E0D00130]);
  -[ICAuthentication setCurrentAuthenticationController:](self, "setCurrentAuthenticationController:", v29);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __88__ICAuthentication_authenticateCloudPasswordWithPrompt_displayWindow_completionHandler___block_invoke;
  v34[3] = &unk_1E5C23418;
  v34[4] = self;
  v35 = v7;
  v36 = v8;
  v37 = v9;
  v30 = v9;
  v31 = v8;
  v32 = v7;
  objc_msgSend(v29, "authenticateWithContext:completion:", v11, v34);

}

void __88__ICAuthentication_authenticateCloudPasswordWithPrompt_displayWindow_completionHandler___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v5 = v4;
  performBlockOnMainThread();

}

uint64_t __88__ICAuthentication_authenticateCloudPasswordWithPrompt_displayWindow_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = objc_msgSend(v2, "code");
    v4 = (void *)a1[5];
    v5 = a1[6];
    v6 = a1[7];
    v7 = a1[8];
    v8 = v3 != -7003;
  }
  else
  {
    v4 = (void *)a1[5];
    v5 = a1[6];
    v6 = a1[7];
    v7 = a1[8];
    v8 = 2;
  }
  return objc_msgSend(v4, "didAuthenticateCloudPasswordWithPrompt:result:displayWindow:completionHandler:", v5, v8, v6, v7);
}

- (void)didAuthenticateCloudPasswordWithPrompt:(id)a3 result:(unint64_t)a4 displayWindow:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  id v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("Cancel");
    if (a4 == 1)
      v14 = CFSTR("Failure");
    if (a4 == 2)
      v14 = CFSTR("Success");
    v15 = v14;
    v16 = 138413058;
    v17 = v10;
    v18 = 2112;
    v19 = v15;
    v20 = 2080;
    v21 = "-[ICAuthentication didAuthenticateCloudPasswordWithPrompt:result:displayWindow:completionHandler:]";
    v22 = 1024;
    v23 = 581;
    _os_log_impl(&dword_1AC7A1000, v13, OS_LOG_TYPE_DEFAULT, "Authenticated cloud password with prompt {prompt: %@, result: %@}%s:%d", (uint8_t *)&v16, 0x26u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication didAuthenticateCloudPasswordWithPrompt:result:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (!-[ICAuthentication isAuthenticating](self, "isAuthenticating"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isAuthenticating", "-[ICAuthentication didAuthenticateCloudPasswordWithPrompt:result:displayWindow:completionHandler:]", 1, 0, CFSTR("Authenticated cloud password while not currently authenticating"));
  -[ICAuthentication setCurrentAuthenticationController:](self, "setCurrentAuthenticationController:", 0);
  -[ICAuthentication didAuthenticateWithPrompt:result:displayWindow:completionHandler:](self, "didAuthenticateWithPrompt:result:displayWindow:completionHandler:", v10, a4, v12, v11);

}

- (void)setCustomPasswordWithPrompt:(id)a3 displayWindow:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v8;
    v23 = 2080;
    v24 = "-[ICAuthentication setCustomPasswordWithPrompt:displayWindow:completionHandler:]";
    v25 = 1024;
    v26 = 597;
    _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "Setting custom password with prompt {prompt: %@}%s:%d", buf, 0x1Cu);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication setCustomPasswordWithPrompt:displayWindow:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  +[ICPasswordUtilities sharedInstance](ICPasswordUtilities, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__ICAuthentication_setCustomPasswordWithPrompt_displayWindow_completionHandler___block_invoke;
  v17[3] = &unk_1E5C23440;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v12, "showPasswordSetUpSheetForAccount:displayWindow:completionHandler:", v13, v15, v17);

}

uint64_t __80__ICAuthentication_setCustomPasswordWithPrompt_displayWindow_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didAuthenticateWithPrompt:result:displayWindow:completionHandler:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)updateUserRecordForAccount:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = v8;
    v18 = 2080;
    v19 = "-[ICAuthentication updateUserRecordForAccount:completionHandler:]";
    v20 = 1024;
    v21 = 609;
    _os_log_impl(&dword_1AC7A1000, v7, OS_LOG_TYPE_DEFAULT, "Authenticating for iCloud account without passphrase — manually fetching user record… {accountID: %@}%s:%d", buf, 0x1Cu);

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthentication updateUserRecordForAccount:completionHandler:]", 1, 0, CFSTR("Unexpected call from background thread"));
  objc_msgSend(MEMORY[0x1E0D63A80], "sharedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__ICAuthentication_updateUserRecordForAccount_completionHandler___block_invoke;
  v13[3] = &unk_1E5C23468;
  v14 = v5;
  v15 = v6;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v9, "fetchUserRecordWithAccountID:completionHandler:", v10, v13);

}

void __65__ICAuthentication_updateUserRecordForAccount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v4 = v3;
  performBlockOnMainThread();

}

uint64_t __65__ICAuthentication_updateUserRecordForAccount_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t result;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1AC7A1000, v2, OS_LOG_TYPE_INFO, "Updated user record while authenticating {accountID: %@}", (uint8_t *)&v9, 0xCu);

    }
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectWasFetchedFromCloudWithRecord:accountID:", v5, v6);

    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_save");

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)currentAuthenticationController
{
  return self->_currentAuthenticationController;
}

- (void)setCurrentAuthenticationController:(id)a3
{
  objc_storeStrong(&self->_currentAuthenticationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentAuthenticationController, 0);
}

- (void)authenticateWithPrompt:displayWindow:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Cannot authenticate while other authentication is in progress — canceling", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)authenticateWithPrompt:displayWindow:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Unresolved authentication mechanism — failing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)authenticateWithPrompt:displayWindow:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Authentication not needed — succeeding", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)authenticateWithPrompt:displayWindow:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Authentication prevented — failing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didAuthenticateWithPrompt:result:displayWindow:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Prompting for secondary authentication…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didAuthenticateWithPrompt:result:displayWindow:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "Falling back to alternative authentication…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, v0, v1, "User canceled biometrics or was locked out — falling back to password if possible…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Cannot find valid keychain item while authenticating biometrics — falling back to password…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didAuthenticateBiometricsWithPrompt:error:displayWindow:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, v0, v1, "Unknown crypto strategy — failing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
