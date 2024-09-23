@implementation AKAlertHandler

+ (AKAlertHandler)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_31);
  return (AKAlertHandler *)(id)sharedInstance_sharedInstance_2;
}

void __32__AKAlertHandler_sharedInstance__block_invoke()
{
  AKAlertHandler *v0;
  void *v1;

  v0 = objc_alloc_init(AKAlertHandler);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (void)showAlertForError:(id)a3 withCompletion:(id)a4
{
  -[AKAlertHandler showAlertForError:withAuthKitAccount:withCompletion:](self, "showAlertForError:withAuthKitAccount:withCompletion:", a3, 0, a4);
}

- (void)showAlertForError:(id)a3 withAuthKitAccount:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  void (*v12)(_QWORD *, uint64_t, _QWORD);
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v8;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "AlertHandler called with error: %@", (uint8_t *)&v16, 0xCu);
  }

  if (objc_msgSend(v8, "code") != -7003)
  {
    if (objc_msgSend(v8, "code") == -7006 || objc_msgSend(v8, "code") == -7075)
    {
      v12 = (void (*)(_QWORD *, uint64_t, _QWORD))v10[2];
    }
    else
    {
      if (objc_msgSend(v8, "code") == -7044)
      {
        -[AKAlertHandler _showAlertForInvalidContextWithCompletion:](self, "_showAlertForInvalidContextWithCompletion:", v10);
        goto LABEL_11;
      }
      if (objc_msgSend(v8, "code") == -7022)
      {
        -[AKAlertHandler _showAlertForMissingAppleAccountWithCompletion:](self, "_showAlertForMissingAppleAccountWithCompletion:", v10);
        goto LABEL_11;
      }
      if (-[AKAlertHandler _shouldShowAlertForManagedAccount:error:](self, "_shouldShowAlertForManagedAccount:error:", v9, v8))
      {
        -[AKAlertHandler _showAlertForManagedAccount:error:withCompletion:](self, "_showAlertForManagedAccount:error:withCompletion:", v9, v8, v10);
        goto LABEL_11;
      }
      if (objc_msgSend(v8, "code") == -7027)
      {
        -[AKAlertHandler _showAlertForAccountNotSupportedWithCompletion:](self, "_showAlertForAccountNotSupportedWithCompletion:", v10);
        goto LABEL_11;
      }
      if (objc_msgSend(v8, "code") == -7072)
      {
        -[AKAlertHandler _showAlertForUnverifiedEmailWithCompletion:](self, "_showAlertForUnverifiedEmailWithCompletion:", v10);
        goto LABEL_11;
      }
      if (objc_msgSend(v8, "code") == -7070)
      {
        -[AKAlertHandler _showAlertForInsufficientSecurityLevelWithError:completionHandler:](self, "_showAlertForInsufficientSecurityLevelWithError:completionHandler:", v8, v10);
        goto LABEL_11;
      }
      if (objc_msgSend(v8, "code") == -7005)
      {
        -[AKAlertHandler _showAlertForCannotFindServerWithCompletion:](self, "_showAlertForCannotFindServerWithCompletion:", v10);
        goto LABEL_11;
      }
      if (objc_msgSend(v8, "code") == -7076)
      {
        -[AKAlertHandler _showAlertForUnderageAccount:withCompletion:](self, "_showAlertForUnderageAccount:withCompletion:", v9, v10);
        goto LABEL_11;
      }
      if (objc_msgSend(v8, "code") == -7080)
      {
        -[AKAlertHandler _showAlertForPasscodeSetupWithCompletion:](self, "_showAlertForPasscodeSetupWithCompletion:", v10);
        goto LABEL_11;
      }
      v15 = objc_msgSend(v8, "code");
      v12 = (void (*)(_QWORD *, uint64_t, _QWORD))v10[2];
      if (v15 == -7034)
        goto LABEL_5;
    }
    v13 = v10;
    v14 = 0;
    goto LABEL_10;
  }
  v12 = (void (*)(_QWORD *, uint64_t, _QWORD))v10[2];
LABEL_5:
  v13 = v10;
  v14 = 1;
LABEL_10:
  v12(v13, v14, 0);
LABEL_11:

}

- (void)_showAlertForInvalidContextWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalBuild");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_INVALID_CONTEXT_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_INVALID_CONTEXT_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_OK"), &stru_1E2E647A8, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v8, v10, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke;
    v17[3] = &unk_1E2E60648;
    v18 = v4;
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_32;
    v15[3] = &unk_1E2E60648;
    v16 = v18;
    -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v13, v17, v15);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

uint64_t __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_32_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_showAlertForMissingAppleAccountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_TITLE"), "containsString:", CFSTR("REBRAND")))
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", v8, &stru_1E2E647A8, CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_MESSAGE"), "containsString:", CFSTR("REBRAND")))
  {
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", v12, &stru_1E2E647A8, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MISSING_APPLE_ACCOUNT_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_SETTINGS"), &stru_1E2E647A8, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_CLOSE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v6, v10, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke;
  v22[3] = &unk_1E2E5FF30;
  v22[4] = self;
  v23 = v4;
  v20[0] = v18;
  v20[1] = 3221225472;
  v20[2] = __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2;
  v20[3] = &unk_1E2E60648;
  v21 = v23;
  v19 = v23;
  -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v17, v22, v20);

}

uint64_t __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openSpyglass");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_showAlertForAccountNotSupportedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE"), "containsString:", CFSTR("REBRAND")))
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_1E2E647A8, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_OK"), &stru_1E2E647A8, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v6, v8, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__AKAlertHandler__showAlertForAccountNotSupportedWithCompletion___block_invoke;
  v18[3] = &unk_1E2E60648;
  v19 = v4;
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __65__AKAlertHandler__showAlertForAccountNotSupportedWithCompletion___block_invoke_2;
  v16[3] = &unk_1E2E60648;
  v17 = v19;
  v15 = v19;
  -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v13, v18, v16);

}

uint64_t __65__AKAlertHandler__showAlertForAccountNotSupportedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __65__AKAlertHandler__showAlertForAccountNotSupportedWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_showAlertForUnverifiedEmailWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_MESSAGE"), "containsString:", CFSTR("REBRAND")))
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_1E2E647A8, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_UNVERIFIED_EMAIL_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_SETTINGS"), &stru_1E2E647A8, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_CLOSE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v6, v8, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke;
  v20[3] = &unk_1E2E5FF30;
  v20[4] = self;
  v21 = v4;
  v18[0] = v16;
  v18[1] = 3221225472;
  v18[2] = __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke_2;
  v18[3] = &unk_1E2E60648;
  v19 = v21;
  v17 = v21;
  -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v15, v20, v18);

}

uint64_t __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openSpyglass");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_showAlertForInsufficientSecurityLevelWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;

  v34 = a4;
  v6 = a3;
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("AKClientBundleID"));
  v32 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_INSUFFICIENT_SECURITY_LEVEL_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"), v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_INSUFFICIENT_SECURITY_LEVEL_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *MEMORY[0x1E0CB2D68];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v16);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_CONTINUE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_CLOSE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *MEMORY[0x1E0CB2D78];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D78]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count") == 2)
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v26 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
      v27 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v26;
      v22 = (void *)v27;
    }

  }
  -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v9, v15, v20, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke;
  v37[3] = &unk_1E2E60190;
  v37[4] = self;
  v38 = v33;
  v39 = v34;
  v35[0] = v29;
  v35[1] = 3221225472;
  v35[2] = __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke_2;
  v35[3] = &unk_1E2E60648;
  v36 = v39;
  v30 = v39;
  v31 = v33;
  -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v28, v37, v35);

}

uint64_t __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openUpgradeAccountSecurityLevelWithBundleID:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_showAlertForCannotFindServerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_CANNOT_FIND_SERVER_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((_DWORD)v5)
    v9 = CFSTR("AUTH_ERROR_ALERT_CANNOT_FIND_SERVER_MESSAGE_WLAN");
  else
    v9 = CFSTR("AUTH_ERROR_ALERT_CANNOT_FIND_SERVER_MESSAGE_WIFI");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E2E647A8, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_OK"), &stru_1E2E647A8, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v6, v10, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke;
  v18[3] = &unk_1E2E60648;
  v19 = v4;
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke_2;
  v16[3] = &unk_1E2E60648;
  v17 = v19;
  v15 = v19;
  -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v13, v18, v16);

}

uint64_t __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_showAlertForUnderageAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  char v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  AKAlertHandler *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a3;
  objc_msgSend(v7, "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_UNDERAGE_ACCOUNT_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE"), "containsString:", CFSTR("REBRAND")))
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v14 = v6;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v15, &stru_1E2E647A8, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v14;
    }
    else
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_ACCOUNT_NOT_SUPPORTED_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ageOfMajorityForAccount:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v31 = v6;
    v32 = self;
    v33 = v10;
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("AUTH_ERROR_ALERT_UNDERAGE_ACCOUNT_MESSAGE");
    v21 = objc_msgSend(CFSTR("AUTH_ERROR_ALERT_UNDERAGE_ACCOUNT_MESSAGE"), "containsString:", CFSTR("REBRAND"));
    if ((v21 & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isAABrandingEnabled"))
      {
        objc_msgSend(CFSTR("AUTH_ERROR_ALERT_UNDERAGE_ACCOUNT_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v22 = 1;
      }
      else
      {
        v22 = 0;
      }
    }
    objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_1E2E647A8, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    if (v22)
    if ((v21 & 1) == 0)

    v12 = (void *)v25;
    self = v32;
    v10 = v33;
    v6 = v31;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_OK"), &stru_1E2E647A8, CFSTR("Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v10, v12, v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke;
  v36[3] = &unk_1E2E60648;
  v37 = v6;
  v34[0] = v29;
  v34[1] = 3221225472;
  v34[2] = __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke_2;
  v34[3] = &unk_1E2E60648;
  v35 = v37;
  v30 = v37;
  -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v28, v36, v34);

}

uint64_t __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_showAlertForPasscodeSetupWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_CREATE_PASSCODE_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("AUTH_ERROR_ALERT_CREATE_PASSCODE_MESSAGE_WATCH"), "containsString:", CFSTR("REBRAND")))
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_CREATE_PASSCODE_MESSAGE_WATCH"), &stru_1E2E647A8, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isAABrandingEnabled"))
    {
      objc_msgSend(CFSTR("AUTH_ERROR_ALERT_CREATE_PASSCODE_MESSAGE_WATCH"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", v10, &stru_1E2E647A8, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_CREATE_PASSCODE_MESSAGE_WATCH"), &stru_1E2E647A8, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_BUTTON_OPEN_PASSCODE_SETUP"), &stru_1E2E647A8, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v6, v8, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke;
  v18[3] = &unk_1E2E5FF30;
  v18[4] = self;
  v19 = v4;
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke_2;
  v16[3] = &unk_1E2E60648;
  v17 = v19;
  v15 = v19;
  -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v13, v18, v16);

}

uint64_t __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openPasscodeSetup");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (BOOL)_shouldShowAlertForManagedAccount:(id)a3 error:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;

  v4 = a4;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isManagedAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    v8 = objc_msgSend(v4, "code") == -7100 || objc_msgSend(v4, "code") == -7093 || objc_msgSend(v4, "code") == -7027;
  else
    v8 = 0;

  return v8;
}

- (void)_showAlertForManagedAccount:(id)a3 error:(id)a4 withCompletion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v7 = a4;
  v36 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MANAGED_ACCOUNT_CANNOT_SIGN_IN_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MANAGED_ACCOUNT_CANNOT_SIGN_IN_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_BUTTON_OK"), &stru_1E2E647A8, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "code") == -7100)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_TITLE"), &stru_1E2E647A8, CFSTR("Localizable"));
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("managedOrganizationName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("localizedAppName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v17, "length");
    v21 = objc_msgSend(v19, "length");
    if (v21 && v20)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_APPNAME_ORGNAME_FORMAT"), &stru_1E2E647A8, CFSTR("Localizable"));
      v24 = v15;
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", v25, v19, v17);
    }
    else
    {
      if (v21)
      {
        v27 = v15;
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_APPNAME_FORMAT"), &stru_1E2E647A8, CFSTR("Localizable"));
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v28;
        v15 = v27;
        objc_msgSend(v30, "stringWithFormat:", v29, v19);
        v26 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v29;
        goto LABEL_8;
      }
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE"), &stru_1E2E647A8, CFSTR("Localizable"));
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_MANAGED_ACCOUNT_APPLICATION_BLOCKED_MESSAGE_ORGNAME_FORMAT"), &stru_1E2E647A8, CFSTR("Localizable"));
      v24 = v15;
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", v25, v17, v35);
    }
    v26 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v25;
    v15 = v24;
LABEL_8:

    v11 = (void *)v26;
    v9 = (void *)v15;
  }
  -[AKAlertHandler notificationDictionaryWithTitle:message:defaultButton:alternateButton:](self, "notificationDictionaryWithTitle:message:defaultButton:alternateButton:", v9, v11, v13, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke;
  v39[3] = &unk_1E2E60648;
  v40 = v36;
  v37[0] = v32;
  v37[1] = 3221225472;
  v37[2] = __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke_2;
  v37[3] = &unk_1E2E60648;
  v38 = v40;
  v33 = v40;
  -[AKAlertHandler showAlert:primaryAction:altAction:](self, "showAlert:primaryAction:altAction:", v31, v39, v37);

}

uint64_t __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke_2_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (BOOL)showAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5
{
  AKAlertHandlerUIProvider **p_uiProvider;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  char v13;

  p_uiProvider = &self->_uiProvider;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_uiProvider);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = objc_msgSend(WeakRetained, "alertHandlerShowAlert:primaryAction:altAction:", v11, v10, v9);

    objc_storeWeak((id *)p_uiProvider, 0);
  }
  else
  {
    v13 = -[AKAlertHandler showAlert:primaryAction:altAction:cancelAction:](self, "showAlert:primaryAction:altAction:cancelAction:", v11, v10, v9, v9);

  }
  return v13;
}

- (BOOL)showAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5 cancelAction:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  CFUserNotificationRef v15;
  CFUserNotificationRef v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[4];
  NSObject *v21;
  id v22;
  id v23;
  CFUserNotificationRef v24;
  SInt32 error;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(MEMORY[0x1E0CF0E90], "deviceIsAudioAccessory"))
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AKAlertHandler showAlert:primaryAction:altAction:cancelAction:].cold.1(v9, v13);

    v14 = 0;
  }
  else
  {
    error = 0;
    v15 = AKUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, &error, (CFDictionaryRef)v9);
    v14 = v15 != 0;
    if (v15)
    {
      v16 = v15;
      dispatch_get_global_queue(2, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__AKAlertHandler_showAlert_primaryAction_altAction_cancelAction___block_invoke;
      block[3] = &unk_1E2E60C38;
      v24 = v16;
      v21 = v12;
      v22 = v10;
      v23 = v11;
      dispatch_async(v17, block);

      v18 = v21;
    }
    else
    {
      _AKLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AKAlertHandler showAlert:primaryAction:altAction:cancelAction:].cold.2(v9, &error, v18);
    }

  }
  return v14;
}

void __65__AKAlertHandler_showAlert_primaryAction_altAction_cancelAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  v2 = AKUserNotificationResponseAction(responseFlags);
  v3 = a1 + 40;
  v4 = a1 + 48;
  if (v2 == 3)
    v4 = a1 + 32;
  if (v2)
    v3 = v4;
  (*(void (**)(void))(*(_QWORD *)v3 + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

- (id)notificationDictionaryWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v13;
  if (v9)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9B800]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9B810]);
  if (v12)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C9B830]);
  if (v11)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9B838]);
  v15 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DABBB0]);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DABB00]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resourceURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9B860]);

  return v14;
}

- (void)_openSpyglass
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

- (void)_openUpgradeAccountSecurityLevelWithBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = CFSTR("AKClientBundleID");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAlertHandler _URLWithString:byAppendingParameters:](self, "_URLWithString:byAppendingParameters:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=upgradeSecurityLevel"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v8, 0);

}

- (id)_URLWithString:(id)a3 byAppendingParameters:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("&%@=%@"), v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (AKAlertHandlerUIProvider)uiProvider
{
  return (AKAlertHandlerUIProvider *)objc_loadWeakRetained((id *)&self->_uiProvider);
}

- (void)setUiProvider:(id)a3
{
  objc_storeWeak((id *)&self->_uiProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uiProvider);
}

void __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert - invalid context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __60__AKAlertHandler__showAlertForInvalidContextWithCompletion___block_invoke_32_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert dismissed - invalid context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __65__AKAlertHandler__showAlertForMissingAppleAccountWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert dismissed - missing apple account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __61__AKAlertHandler__showAlertForUnverifiedEmailWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert dismissed - unverified email", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __84__AKAlertHandler__showAlertForInsufficientSecurityLevelWithError_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert dismissed - insufficient security level", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __62__AKAlertHandler__showAlertForCannotFindServerWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert dismissed - cannot find server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __62__AKAlertHandler__showAlertForUnderageAccount_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert dismissed - underage account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __59__AKAlertHandler__showAlertForPasscodeSetupWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert dismissed - passcode setup required", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __67__AKAlertHandler__showAlertForManagedAccount_error_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Authorization alert dismissed - managed account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)showAlert:(void *)a1 primaryAction:(NSObject *)a2 altAction:cancelAction:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C9B800]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Attempted to show CFUserNotification (%@) on HomePod, AuthKit prompts aren't made for this!", (uint8_t *)&v4, 0xCu);

}

- (void)showAlert:(NSObject *)a3 primaryAction:altAction:cancelAction:.cold.2(void *a1, int *a2, NSObject *a3)
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C9B800]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138412546;
  v8 = v5;
  v9 = 1024;
  v10 = v6;
  _os_log_error_impl(&dword_19202F000, a3, OS_LOG_TYPE_ERROR, "Showing alert (%@) failed, user notification is nil!. Error: %d", (uint8_t *)&v7, 0x12u);

}

@end
