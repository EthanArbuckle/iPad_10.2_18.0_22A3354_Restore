@implementation BKMesaSecureIntentProvider

- (BKMesaSecureIntentProvider)initWithAlertWindow:(id)a3 inBuddy:(BOOL)a4
{
  id v6;
  BKMesaSecureIntentProvider *v7;
  uint64_t v8;
  LAContext *context;
  os_log_t v10;
  OS_os_log *authManagerLogs;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKMesaSecureIntentProvider;
  v7 = -[BKMesaSecureIntentProvider init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    context = v7->_context;
    v7->_context = (LAContext *)v8;

    -[LAContext setUiDelegate:](v7->_context, "setUiDelegate:", v7);
    v7->_inBuddy = a4;
    objc_storeWeak((id *)&v7->_alertWindow, v6);
    v10 = os_log_create("com.apple.biometrickitui", "BKMesaSecureIntentProvider");
    authManagerLogs = v7->authManagerLogs;
    v7->authManagerLogs = (OS_os_log *)v10;

  }
  return v7;
}

- (void)getSecureIntentForAccessory:(id)a3 enrollmentOperation:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  NSObject *authManagerLogs;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[BKMesaSecureIntentProvider _isMonitoringPowerButton](self, "_isMonitoringPowerButton");
  authManagerLogs = self->authManagerLogs;
  v13 = os_log_type_enabled(authManagerLogs, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1DB281000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "Refused to start getSecureIntentForAccessory as we are already monitoring the Power Button for Secure Intent", (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    if (v13)
    {
      v14 = authManagerLogs;
      objc_msgSend(v8, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1DB281000, v14, OS_LOG_TYPE_DEFAULT, "Start getSecureIntentForAccessory with accessory:%@, operation:%@", (uint8_t *)&v17, 0x16u);

    }
    -[BKMesaSecureIntentProvider _startMonitoringPowerButton](self, "_startMonitoringPowerButton");
    -[BKMesaSecureIntentProvider _getSecureIntentForAccessory:enrollmentOperation:showErrorToRetry:withCompletionHandler:](self, "_getSecureIntentForAccessory:enrollmentOperation:showErrorToRetry:withCompletionHandler:", v8, v9, 0, v10);
  }

}

- (void)_getSecureIntentForAccessory:(id)a3 enrollmentOperation:(id)a4 showErrorToRetry:(BOOL)a5 withCompletionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *authManagerLogs;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  _QWORD aBlock[5];
  BOOL v30;
  _QWORD v31[5];
  id v32;
  id v33;
  void (**v34)(_QWORD);
  void *v35;
  uint64_t v36;
  uint8_t buf[4];
  _BOOL4 v38;
  uint64_t v39;

  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  authManagerLogs = self->authManagerLogs;
  if (os_log_type_enabled(authManagerLogs, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v38 = v7;
    _os_log_impl(&dword_1DB281000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "_getSecureIntentForAccessory ... showRetry:%i", buf, 8u);
  }
  -[BKMesaSecureIntentProvider context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[BKMesaSecureIntentProvider context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUiDelegate:", 0);

    -[BKMesaSecureIntentProvider setContext:](self, "setContext:", 0);
  }
  -[BKMesaSecureIntentProvider context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = (void *)objc_opt_new();
    -[BKMesaSecureIntentProvider setContext:](self, "setContext:", v17);

    -[BKMesaSecureIntentProvider context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUiDelegate:", self);

  }
  if (!-[BKMesaSecureIntentProvider hasFingergprintsEnrolled](self, "hasFingergprintsEnrolled")
    || v11
    || self->_hasAttemptedCrossMatch)
  {
    v35 = &unk_1EA298C40;
    v36 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_21;
    aBlock[3] = &unk_1EA280410;
    v30 = v7;
    aBlock[4] = self;
    v22 = (void (**)(_QWORD))_Block_copy(aBlock);
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    {
      v22[2](v22);
    }
    else
    {
      block[0] = v21;
      block[1] = 3221225472;
      block[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_2_23;
      block[3] = &unk_1EA280080;
      v22 = v22;
      v28 = v22;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->authManagerLogs;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v20, OS_LOG_TYPE_DEFAULT, "SI has finger print enrolled ... trying crossmatch", buf, 2u);
    }
    if (self->_inBuddy)
    {

      v19 = 0;
      self->_touchIDMatch = 0;
      self->_touchIDMatchAttemptCount = 0;
    }
    else
    {
      -[BKMesaSecureIntentProvider context](self, "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setUiDelegate:", 0);

      objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AAA0], &unk_1EA298C10);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SI_SETTINGS_CROSS_MATCH_REQUEST_PROMPT"), &stru_1EA281248, CFSTR("BiometricKitUI-A222"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setObject:forKey:", v25, &unk_1EA298C28);
    }
    -[BKMesaSecureIntentProvider context](self, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke;
    v31[3] = &unk_1EA280DD8;
    v31[4] = self;
    v34 = (void (**)(_QWORD))v12;
    v32 = v10;
    v33 = 0;
    objc_msgSend(v26, "evaluatePolicy:options:reply:", 1, v19, v31);

    v22 = v34;
  }

}

void __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v8, OS_LOG_TYPE_DEFAULT, "SI local auth succeeded, keyboard SI aquired.", buf, 2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_12;
    block[3] = &unk_1EA280D88;
    block[4] = *(_QWORD *)(a1 + 32);
    v26 = *(id *)(a1 + 56);
    v25 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v9 = v26;
    goto LABEL_5;
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (!v6)
  {
    *(_BYTE *)(v10 + 18) = 0;
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SI_CROSS_MATCH_WRONG_SENSOR_TITLE"), &stru_1EA281248, CFSTR("BiometricKitUI-A222"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SI_CROSS_MATCH_WRONG_SENSOR_BODY"), &stru_1EA281248, CFSTR("BiometricKitUI-A222"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_2;
    v20[3] = &unk_1EA280DB0;
    v19 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v19;
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    objc_msgSend(v14, "showAlert:detailedText:withCompletionHandler:", v16, v18, v20);

    v9 = v21;
LABEL_5:

    goto LABEL_10;
  }
  v11 = *(NSObject **)(v10 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v7, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    _os_log_impl(&dword_1DB281000, v12, OS_LOG_TYPE_DEFAULT, "SI local auth failed ... trying power button press SI. %@", buf, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_getSecureIntentForAccessory:enrollmentOperation:showErrorToRetry:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
LABEL_10:

}

uint64_t __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 1;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "externalizedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v2 + 16))(v2, v4, 1, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "displayHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSecureIntentView:didSucceed:wasCancelled:", 0, 1, 0);

  return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoringPowerButton");
}

uint64_t __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSecureIntentForAccessory:enrollmentOperation:showErrorToRetry:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

void __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_21(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(a1 + 40)
    && (objc_msgSend(*(id *)(a1 + 32), "presentingView"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "superview"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showRetryOnErrorUI");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "configureIntentView");
    objc_msgSend(*(id *)(a1 + 32), "presentingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplay");

    objc_msgSend(*(id *)(a1 + 32), "presentingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showInitialUI");

    objc_msgSend(*(id *)(a1 + 32), "displayHost");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displaySecureIntentView:", v6);

  }
}

uint64_t __118__BKMesaSecureIntentProvider__getSecureIntentForAccessory_enrollmentOperation_showErrorToRetry_withCompletionHandler___block_invoke_2_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *authManagerLogs;
  void *v11;
  void *v12;
  _BOOL4 authParamActive;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  authManagerLogs = self->authManagerLogs;
  if (os_log_type_enabled(authManagerLogs, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = a3;
    _os_log_impl(&dword_1DB281000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "TrustedAccessory local auth event %ld", buf, 0xCu);
  }
  if (a3 == 1)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49__BKMesaSecureIntentProvider_event_params_reply___block_invoke;
    v21[3] = &unk_1EA27FC78;
    v21[4] = self;
    v22 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v21);

  }
  else if (a3 == 9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1EA298C58);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1EA298C58);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_authParamActive = objc_msgSend(v12, "BOOLValue");

    }
    authParamActive = self->_authParamActive;
    v14 = self->authManagerLogs;
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (authParamActive)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB281000, v14, OS_LOG_TYPE_DEFAULT, "TrustedAccessory Power Button LAEventParamActive: YES", buf, 2u);
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1EA298C70);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1EA298C70);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        self->_pushCredentialPresent = objc_msgSend(v17, "BOOLValue");

      }
      if (self->_pushCredentialPresent)
      {
        v18 = self->authManagerLogs;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v19 = "TrustedAccessory Power Button LAEventParamPushButtonCredentialPresent: YES";
          v20 = v18;
LABEL_18:
          _os_log_impl(&dword_1DB281000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
        }
      }
    }
    else if (v15)
    {
      *(_WORD *)buf = 0;
      v19 = "TrustedAccessory Power Button LAEventParamActive: NO";
      v20 = v14;
      goto LABEL_18;
    }
  }

}

uint64_t __49__BKMesaSecureIntentProvider_event_params_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTouchIDEventWithParameters:", *(_QWORD *)(a1 + 40));
}

- (void)_handleTouchIDEventWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 authParamActive;
  NSObject *authManagerLogs;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint8_t v23[16];
  __int16 v24;
  uint8_t v25[2];
  __int16 v26;
  uint8_t buf[16];
  uint8_t v28[16];

  v4 = a3;
  v5 = v4;
  if (!self->_touchIDMatch)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1EA298C58);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA298C58);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_authParamActive = objc_msgSend(v7, "BOOLValue");

    }
    authParamActive = self->_authParamActive;
    authManagerLogs = self->authManagerLogs;
    v10 = os_log_type_enabled(authManagerLogs, OS_LOG_TYPE_DEFAULT);
    if (authParamActive)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB281000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "TrustedAccessory Touch ID LAEventParamActive: YES", buf, 2u);
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1EA298C88);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        switch(objc_msgSend(v11, "integerValue"))
        {
          case 0:
            v13 = self->authManagerLogs;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v26 = 0;
              v14 = "TrustedAccessory Touch ID LATouchIDSimpleStatusFingerOn";
              v15 = (uint8_t *)&v26;
              goto LABEL_19;
            }
            break;
          case 1:
            v13 = self->authManagerLogs;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v25 = 0;
              v14 = "TrustedAccessory Touch ID LATouchIDSimpleStatusFingerOff";
              v15 = v25;
              goto LABEL_19;
            }
            break;
          case 2:
            self->_touchIDMatch = 1;
            v13 = self->authManagerLogs;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v24 = 0;
              v14 = "TrustedAccessory Touch ID LATouchIDSimpleStatusMatch";
              v15 = (uint8_t *)&v24;
LABEL_19:
              _os_log_impl(&dword_1DB281000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
            }
            break;
          case 3:
            v16 = self->_touchIDMatchAttemptCount + 1;
            self->_touchIDMatchAttemptCount = v16;
            if (v16 > 2)
            {
              v21 = self->authManagerLogs;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v23 = 0;
                _os_log_impl(&dword_1DB281000, v21, OS_LOG_TYPE_DEFAULT, "TrustedAccessory Touch ID Max match exceeded triggering auth fail.", v23, 2u);
              }
              -[BKMesaSecureIntentProvider context](self, "context");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "invalidate");

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SI_CROSS_MATCH_AUTH_FAIL_TITLE"), &stru_1EA281248, CFSTR("BiometricKitUI-A222"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SI_CROSS_MATCH_AUTH_FAIL_BODY"), &stru_1EA281248, CFSTR("BiometricKitUI-A222"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[BKMesaSecureIntentProvider showAlert:detailedText:withCompletionHandler:](self, "showAlert:detailedText:withCompletionHandler:", v18, v20, 0);

            }
            break;
          default:
            break;
        }
      }

    }
    else if (v10)
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1DB281000, authManagerLogs, OS_LOG_TYPE_DEFAULT, "TrustedAccessory Touch ID LAEventParamActive: NO", v28, 2u);
    }
  }

}

- (void)configureIntentView
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[BKMesaSecureIntentProvider presentingView](self, "presentingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[BKMesaSecureIntentProvider displayHost](self, "displayHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "inBuddy");

    if (v5)
    {
      +[BuddySecureIntentClientView instance](BuddySecureIntentClientView, "instance");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[BKMesaSecureIntentProvider setPresentingView:](self, "setPresentingView:", v8);
    }
    else
    {
      if (-[BKMesaSecureIntentProvider inDemo](self, "inDemo") && (objc_opt_respondsToSelector() & 1) != 0)
      {
        +[BKUISettingsSecureIntentClientView instanceForDemo:](BKUISettingsSecureIntentClientView, "instanceForDemo:", 1);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[BKUISettingsSecureIntentClientView instance](BKUISettingsSecureIntentClientView, "instance");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v7 = (void *)v6;
      -[BKMesaSecureIntentProvider setPresentingView:](self, "setPresentingView:", v6);

      -[BKMesaSecureIntentProvider presentingView](self, "presentingView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSecureIntentProvider:", self);
    }

  }
}

- (void)dismissSecureIntentViewForUserInteraction
{
  void *v3;
  id v4;

  -[BKMesaSecureIntentProvider invalidateAuthContext](self, "invalidateAuthContext");
  -[BKMesaSecureIntentProvider displayHost](self, "displayHost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BKMesaSecureIntentProvider presentingView](self, "presentingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeSecureIntentView:didSucceed:wasCancelled:", v3, 0, 0);

}

- (void)invalidateAuthContext
{
  void *v3;

  -[BKMesaSecureIntentProvider context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[BKMesaSecureIntentProvider setContext:](self, "setContext:", 0);
}

- (void)reset
{
  self->_hasAttemptedCrossMatch = 0;
  -[BKMesaSecureIntentProvider dismissSecureIntentViewForUserInteraction](self, "dismissSecureIntentViewForUserInteraction");
}

- (void)_startMonitoringPowerButton
{
  OUTLINED_FUNCTION_2_0(&dword_1DB281000, a2, a3, "%@ is already monitoring Power button", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)_isMonitoringPowerButton
{
  return self->_hidClient != 0;
}

- (void)_stopMonitoringPowerButton
{
  OUTLINED_FUNCTION_2_0(&dword_1DB281000, a2, a3, "%@ is not monitoring Power button", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)hasFingergprintsEnrolled
{
  void *v2;
  BOOL v3;

  -[BKMesaSecureIntentProvider displayHost](self, "displayHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_bkIdentityCount") != 0;

  return v3;
}

- (void)showAlert:(id)a3 detailedText:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__BKMesaSecureIntentProvider_showAlert_detailedText_withCompletionHandler___block_invoke;
  v14[3] = &unk_1EA280DB0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __75__BKMesaSecureIntentProvider_showAlert_detailedText_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "displayHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA281248, CFSTR("BiometricKitUI-A222"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__BKMesaSecureIntentProvider_showAlert_detailedText_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1EA280E00;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 2, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v7);

  objc_msgSend(v2, "presentViewController:animated:completion:", v3, 1, 0);
}

uint64_t __75__BKMesaSecureIntentProvider_showAlert_detailedText_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)needsToDisplayUI
{
  void *v3;
  void *v4;
  BOOL v5;

  -[BKMesaSecureIntentProvider presentingView](self, "presentingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else if (-[BKMesaSecureIntentProvider hasFingergprintsEnrolled](self, "hasFingergprintsEnrolled"))
  {
    v5 = !self->_hasAttemptedCrossMatch;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SecureIntentClientView)presentingView
{
  return self->_presentingView;
}

- (void)setPresentingView:(id)a3
{
  objc_storeStrong((id *)&self->_presentingView, a3);
}

- (UIWindow)alertWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_alertWindow);
}

- (void)setAlertWindow:(id)a3
{
  objc_storeWeak((id *)&self->_alertWindow, a3);
}

- (BOOL)inDemo
{
  return self->_inDemo;
}

- (void)setInDemo:(BOOL)a3
{
  self->_inDemo = a3;
}

- (BKSecureIntentDisplayHost)displayHost
{
  return (BKSecureIntentDisplayHost *)objc_loadWeakRetained((id *)&self->_displayHost);
}

- (void)setDisplayHost:(id)a3
{
  objc_storeWeak((id *)&self->_displayHost, a3);
}

- (NSString)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BKUIAlertView)alertView
{
  return (BKUIAlertView *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAlertView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BKUIAlertView)wrongButtonAlertView
{
  return (BKUIAlertView *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWrongButtonAlertView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrongButtonAlertView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_destroyWeak((id *)&self->_displayHost);
  objc_destroyWeak((id *)&self->_alertWindow);
  objc_storeStrong((id *)&self->_presentingView, 0);
  objc_storeStrong((id *)&self->authManagerLogs, 0);
}

@end
