@implementation AKFidoHook

- (AKFidoHook)initWithAccount:(id)a3
{
  id v5;
  AKFidoHook *v6;
  AKFidoHook *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKFidoHook;
  v6 = -[AKFidoHook init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (BOOL)shouldMatchElement:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fido:register")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", CFSTR("fido:verify"));

  }
  return v5;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fido:register")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("fido:verify"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v15, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("fido:register"));

  if (v12)
  {
    -[AKFidoHook _startFidoRegistrationWithAttributes:completion:](self, "_startFidoRegistrationWithAttributes:completion:", v9, v10);
  }
  else
  {
    objc_msgSend(v15, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("fido:verify"));

    if (v14)
      -[AKFidoHook _startFidoVerificationWithAttributes:completion:](self, "_startFidoVerificationWithAttributes:completion:", v9, v10);
  }

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fido:register")))
  {
    objc_msgSend(v10, "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoHook _startFidoRegistrationWithAttributes:completion:](self, "_startFidoRegistrationWithAttributes:completion:", v9, v6);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("fido:verify")))
  {
    objc_msgSend(v10, "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKFidoHook _startFidoVerificationWithAttributes:completion:](self, "_startFidoVerificationWithAttributes:completion:", v9, v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_startFidoRegistrationWithAttributes:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  AKFidoUIController *v21;
  id v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;

  v5 = a3;
  v25 = a4;
  _AKLogFido();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AKFidoHook _startFidoRegistrationWithAttributes:completion:].cold.3();

  _AKLogFido();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AKFidoHook _startFidoRegistrationWithAttributes:completion:].cold.2();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("challenge"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userHandle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rpId"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("credentialName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("excludedCredentials"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FIDO_DISPLAY_NAME"), &stru_1E7679C68, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)v8;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D001F8]), "initWithChallengeString:relyingPartyIdentifier:userIdentifierString:displayName:credentialName:credentials:", v8, v27, v28, v13, v26, v11);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("promptTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPromptTitle:", v15);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("promptHeader"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPromptHeader:", v16);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("promptBody"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPromptBody:", v17);

  objc_msgSend(v14, "setUseAlternativeKeysIcon:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("FIDO_INCORRECT_KEY_PRESENTED_MESSAGE"), &stru_1E7679C68, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIncorrectKeyPresentedMessage:", v19);

  _AKLogFido();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[AKFidoHook _startFidoRegistrationWithAttributes:completion:].cold.1(v14, v20);

  v21 = objc_alloc_init(AKFidoUIController);
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke;
  v29[3] = &unk_1E7678B98;
  objc_copyWeak(&v31, &location);
  v22 = v25;
  v30 = v22;
  -[AKFidoUIController registerFidoKeyWithContext:completion:](v21, "registerFidoKeyWithContext:completion:", v14, v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[7];
  _QWORD v37[9];

  v37[7] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D872E0]);
    objc_msgSend(WeakRetained, "setServerHookResponse:", v8);

    _AKLogFido();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_3();
      v28 = a1;
      v30 = v6;

      _AKLogFido();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_2(v5, v11);

      v36[0] = CFSTR("credentialID");
      objc_msgSend(v5, "credentialID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v12;
      v36[1] = CFSTR("clientData");
      objc_msgSend(v5, "clientData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v13;
      v36[2] = CFSTR("challenge");
      objc_msgSend(v5, "challenge");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v14;
      v36[3] = CFSTR("rpId");
      objc_msgSend(v5, "relyingPartyIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v15;
      v36[4] = CFSTR("userHandle");
      objc_msgSend(v5, "userIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = v16;
      v36[5] = CFSTR("credentialName");
      objc_msgSend(v5, "credentialName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36[6] = CFSTR("success");
      v37[5] = v17;
      v37[6] = &unk_1E769A908;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      objc_msgSend(v5, "attestationsData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
      {
        objc_msgSend(v5, "attestationsData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("attestation"));

      }
      v23 = (void *)objc_msgSend(v19, "copy", v28, v30);
      objc_msgSend(WeakRetained, "serverHookResponse");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAdditionalPayload:", v23);

      a1 = v29;
      v6 = v31;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_1();

      if (objc_msgSend(WeakRetained, "_isUserCancelError:", v6))
      {
        v25 = *MEMORY[0x1E0D87300];
        v34[0] = *MEMORY[0x1E0D87308];
        v34[1] = CFSTR("success");
        v35[0] = v25;
        v35[1] = &unk_1E769A920;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "serverHookResponse");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAdditionalPayload:", v19);
      }
      else
      {
        v32[0] = CFSTR("errorDomain");
        objc_msgSend(v6, "domain");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v19;
        v32[1] = CFSTR("errorCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = CFSTR("success");
        v33[1] = v23;
        v33[2] = &unk_1E769A920;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "serverHookResponse");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAdditionalPayload:", v26);

      }
    }

  }
  (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5 != 0, v6);

}

- (void)_startFidoVerificationWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  AKFidoUIController *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v6 = a3;
  v7 = a4;
  _AKLogFido();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AKFidoHook _startFidoVerificationWithAttributes:completion:].cold.3();

  _AKLogFido();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AKFidoHook _startFidoVerificationWithAttributes:completion:].cold.2();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("challenge"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rpId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowedCredentials"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D001F8]), "initWithChallengeString:relyingPartyIdentifier:userIdentifierString:displayName:credentialName:credentials:", v10, v11, 0, 0, 0, v14);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("promptTitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPromptTitle:", v16);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("promptHeader"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPromptHeader:", v17);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("promptBody"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPromptBody:", v18);

  objc_msgSend(v15, "setUseAlternativeKeysIcon:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("FIDO_INCORRECT_KEY_PRESENTED_MESSAGE"), &stru_1E7679C68, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIncorrectKeyPresentedMessage:", v20);

  _AKLogFido();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[AKFidoHook _startFidoVerificationWithAttributes:completion:].cold.1(v15, v21);

  v22 = objc_alloc_init(AKFidoUIController);
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke;
  v24[3] = &unk_1E7678BC0;
  objc_copyWeak(&v26, &location);
  v23 = v7;
  v25 = v23;
  -[AKFidoUIController verifyFidoKeyWithFidoContext:completion:](v22, "verifyFidoKeyWithFidoContext:completion:", v15, v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[8];
  _QWORD v31[10];

  v31[8] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D872E0]);
    objc_msgSend(WeakRetained, "setServerHookResponse:", v8);

    _AKLogFido();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5)
    {
      v24 = a1;
      v25 = v6;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke_cold_2();

      v30[0] = CFSTR("authenticatorData");
      objc_msgSend(v5, "authenticatorData");
      v11 = objc_claimAutoreleasedReturnValue();
      v31[0] = v11;
      v30[1] = CFSTR("signatureData");
      objc_msgSend(v5, "signature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v12;
      v30[2] = CFSTR("credentialID");
      objc_msgSend(v5, "credentialID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v23;
      v30[3] = CFSTR("clientData");
      objc_msgSend(v5, "clientData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31[3] = v13;
      v30[4] = CFSTR("userHandle");
      objc_msgSend(v5, "userIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31[4] = v14;
      v30[5] = CFSTR("rpId");
      objc_msgSend(v5, "relyingPartyIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31[5] = v15;
      v30[6] = CFSTR("challenge");
      objc_msgSend(v5, "challenge");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[7] = CFSTR("success");
      v31[6] = v16;
      v31[7] = &unk_1E769A908;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "serverHookResponse");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAdditionalPayload:", v17);

      v19 = (void *)v11;
      a1 = v24;
      v6 = v25;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke_cold_1();

      if (objc_msgSend(WeakRetained, "_isUserCancelError:", v6))
      {
        v20 = *MEMORY[0x1E0D87300];
        v28[0] = *MEMORY[0x1E0D87308];
        v28[1] = CFSTR("success");
        v29[0] = v20;
        v29[1] = &unk_1E769A920;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "serverHookResponse");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAdditionalPayload:", v19);
      }
      else
      {
        v26[0] = CFSTR("errorDomain");
        objc_msgSend(v6, "domain");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v19;
        v26[1] = CFSTR("errorCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = CFSTR("success");
        v27[1] = v12;
        v27[2] = &unk_1E769A920;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "serverHookResponse");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setAdditionalPayload:", v21);

      }
    }

  }
  (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5 != 0, v6);

}

- (BOOL)_isUserCancelError:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "ak_isUserCancelError") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(MEMORY[0x1E0D001F0], "isFidoUserCancelError:", v3);

  return v4;
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

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_startFidoRegistrationWithAttributes:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "incorrectKeyPresentedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, a2, v4, "Setting fidoContext.incorrectKeyPresentedMessage = %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_startFidoRegistrationWithAttributes:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, v0, v1, "Fido registration attributes:\n%@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_startFidoRegistrationWithAttributes:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Fido hook requested to register the key.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "Fido registration failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "credentialID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attestationsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clientData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Fido registration succeeded with CredentialID: %@\nAttestationsData: %@\nClientData: %@", (uint8_t *)&v7, 0x20u);

}

void __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Fido registration was a success.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startFidoVerificationWithAttributes:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "incorrectKeyPresentedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, a2, v4, "Setting fidoContext.incorrectKeyPresentedMessage = %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)_startFidoVerificationWithAttributes:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1BD795000, v0, v1, "Fido verification attributes:\n%@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_startFidoVerificationWithAttributes:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Fido hook requested to verify the key.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1BD795000, v0, v1, "Fido verification failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Fido verification was a success.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
