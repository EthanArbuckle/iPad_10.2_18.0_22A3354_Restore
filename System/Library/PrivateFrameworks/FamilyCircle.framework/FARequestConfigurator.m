@implementation FARequestConfigurator

- (FARequestConfigurator)initWithAccount:(id)a3
{
  id v5;
  FARequestConfigurator *v6;
  FARequestConfigurator *v7;

  v5 = a3;
  v6 = -[FARequestConfigurator init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_attachSetupHeader = 1;
  }

  return v7;
}

- (void)updateWithEphemeralAuthResults:(id)a3
{
  id v4;
  NSObject *v5;
  FARequestEphemeralSigner *v6;
  ACAccount *v7;
  ACAccount *account;

  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FARequestConfigurator updateWithEphemeralAuthResults:].cold.1(v5);

  -[FARequestConfigurator setEphemeralAuthResults:](self, "setEphemeralAuthResults:", v4);
  v6 = -[FARequestEphemeralSigner initWithEphemeralAuthResults:]([FARequestEphemeralSigner alloc], "initWithEphemeralAuthResults:", v4);

  -[FARequestConfigurator setSigner:](self, "setSigner:", v6);
  -[FARequestEphemeralSigner account](v6, "account");
  v7 = (ACAccount *)objc_claimAutoreleasedReturnValue();
  account = self->_account;
  self->_account = v7;

}

- (void)addFresnoHeadersToRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD aBlock[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke;
  aBlock[3] = &unk_1E8561BC0;
  aBlock[4] = self;
  v9 = v6;
  v17 = v9;
  v18 = v7;
  v10 = v7;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_53;
  v13[3] = &unk_1E8561C38;
  v13[4] = self;
  v14 = v9;
  v15 = _Block_copy(aBlock);
  v11 = v15;
  v12 = v9;
  -[FARequestConfigurator _resourceLoadDelegate:](self, "_resourceLoadDelegate:", v13);

}

void __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "ephemeralAuthResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v10, v8);

  v11 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aa_addLoggedInAppleIDHeaderWithAccount:", v12);

  objc_msgSend(*(id *)(a1 + 40), "aa_addLocationSharingAllowedHeader");
  objc_msgSend(*(id *)(a1 + 40), "ak_addClientTimeHeader");
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "minimizedLanguagesFromLanguages:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v16, CFSTR("X-MMe-Language"));

  v17 = *(void **)(a1 + 40);
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forHTTPHeaderField:", v18, CFSTR("Accept-Language"));

  if (_os_feature_enabled_impl())
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-iCloud-Experiment-Mode"));
  objc_msgSend(v5, "aa_hexString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", v19, CFSTR("X-APNS-Push-Token"));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-MMe-Family-Setup"));
  v20 = objc_alloc(MEMORY[0x1E0C99EA0]);
  +[FamilyDefaultSuites familyUserDefaultsSuite](_TtC12FamilyCircle19FamilyDefaultSuites, "familyUserDefaultsSuite");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithSuiteName:", v21);

  v23 = objc_msgSend(v22, "integerForKey:", CFSTR("MockInviteCode"));
  _FALogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 134217984;
    v30 = v23;
    _os_log_impl(&dword_1CAEBA000, v24, OS_LOG_TYPE_DEFAULT, "MockInviteCode %ld", (uint8_t *)&v29, 0xCu);
  }

  if (v23 == 1)
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", CFSTR("sender"), CFSTR("X-Apple-Family-Mock-Invite"));
  objc_msgSend(*(id *)(a1 + 32), "signURLRequest:", *(_QWORD *)(a1 + 40));
  _FALogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "allHTTPHeaderFields");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138477827;
    v30 = (uint64_t)v27;
    _os_log_impl(&dword_1CAEBA000, v25, OS_LOG_TYPE_DEFAULT, "Headers added to request %{private}@", (uint8_t *)&v29, 0xCu);

  }
  v28 = *(_QWORD *)(a1 + 48);
  if (v28)
    (*(void (**)(uint64_t, uint64_t, id))(v28 + 16))(v28, 1, v6);

}

void __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ephemeralAuthResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "ephemeralAuthResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateWithAuthResults:", v5);

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_2;
  v7[3] = &unk_1E8561C10;
  v6 = *(_QWORD *)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "signRequest:withCompletionHandler:", v6, v7);

}

void __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, "LoadDelegate signed request %@ - %@", buf, 0x16u);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_55;
  v11[3] = &unk_1E8561BE8;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v9;
  v10 = v5;
  objc_msgSend(v8, "pushTokenWithCompletion:", v11);

}

void __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "Push token fetched", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)signURLRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FARequestConfigurator signer](self, "signer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FARequestConfigurator signer](self, "signer");
  }
  else
  {
    -[FARequestConfigurator _grandSlamSigner](self, "_grandSlamSigner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signURLRequest:", v4);

    -[FARequestConfigurator _familyGrandSlamSigner](self, "_familyGrandSlamSigner");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signURLRequest:", v4);

}

- (void)addFresnoHeadersToRequest:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  uint8_t buf[16];

  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "DEPRECATED - Please use completion based signer", buf, 2u);
  }

  v6 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__FARequestConfigurator_addFresnoHeadersToRequest___block_invoke;
  v8[3] = &unk_1E8561C60;
  v9 = v6;
  v7 = v6;
  -[FARequestConfigurator addFresnoHeadersToRequest:withCompletion:](self, "addFresnoHeadersToRequest:withCompletion:", v4, v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __51__FARequestConfigurator_addFresnoHeadersToRequest___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_canConnectToAPS
{
  kern_return_t v2;
  int v3;
  NSObject *v4;
  __SecTask *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  audit_token_t v10;
  mach_msg_type_number_t task_info_outCnt;
  audit_token_t task_info_out;

  memset(&task_info_out, 0, sizeof(task_info_out));
  task_info_outCnt = 8;
  v2 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)&task_info_out, &task_info_outCnt);
  if (v2)
  {
    v3 = v2;
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[FARequestConfigurator _canConnectToAPS].cold.3(v3, v4);

    return 0;
  }
  v10 = task_info_out;
  v5 = SecTaskCreateWithAuditToken(0, &v10);
  if (!v5)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FARequestConfigurator _canConnectToAPS].cold.1(v7);
    goto LABEL_12;
  }
  *(_QWORD *)v10.val = 0;
  v6 = (void *)SecTaskCopyValueForEntitlement(v5, CFSTR("aps-connection-initiate"), (CFErrorRef *)&v10);

  v7 = *(NSObject **)v10.val;
  if (*(_QWORD *)v10.val)
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FARequestConfigurator _canConnectToAPS].cold.2((uint64_t)v7, v8);

LABEL_12:
    return 0;
  }
  return v6 != 0;
}

- (void)pushTokenWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  uint8_t buf[16];
  _QWORD aBlock[5];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke;
  aBlock[3] = &unk_1E8561C88;
  v6 = v4;
  aBlock[4] = self;
  v14 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!-[FARequestConfigurator _canConnectToAPS](self, "_canConnectToAPS"))
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAEBA000, v9, OS_LOG_TYPE_DEFAULT, "Process can't connect to APS. Skipping token retrieval step", buf, 2u);
    }

    goto LABEL_7;
  }
  if (self->_pushToken)
  {
LABEL_7:
    v7[2](v7);
    goto LABEL_8;
  }
  v8 = (void *)objc_opt_new();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke_61;
  v10[3] = &unk_1E8561908;
  v10[4] = self;
  v11 = v7;
  objc_msgSend(v8, "fetchAAURLConfigurationWithCompletion:", v10);

LABEL_8:
}

uint64_t __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
}

void __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke_61_cold_1((uint64_t)v5, (uint64_t)v7, v8);

  }
  objc_msgSend(v5, "apsEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CFE148]);
  v11 = (void *)objc_msgSend(v10, "initWithEnvironmentName:queue:", v9, MEMORY[0x1E0C80D38]);
  objc_msgSend(v11, "publicToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    _FALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_1CAEBA000, v13, OS_LOG_TYPE_DEFAULT, "APSConnection did not give us a publicToken for environment %@", (uint8_t *)&v17, 0xCu);
    }

  }
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 72);
  *(_QWORD *)(v14 + 72) = v12;
  v16 = v12;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)addFresnoPayloadToRequest:(id)a3 additionalPayload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  NSObject *v15;

  v6 = a3;
  -[FARequestConfigurator _fresnoPayloadWithAdditionalPayload:](self, "_fresnoPayloadWithAdditionalPayload:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "HTTPBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v6, "HTTPBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyListWithData:options:format:error:", v10, 1, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v11, "addEntriesFromDictionary:", v7);
      v14 = objc_msgSend(v11, "copy");

      v7 = (void *)v14;
    }

  }
  _FALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[FARequestConfigurator addFresnoPayloadToRequest:additionalPayload:].cold.1((uint64_t)v7, v15);

  objc_msgSend(v6, "aa_setBodyWithParameters:", v7);
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));

}

- (void)addPayload:(id)a3 toRequest:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "aa_setBodyWithParameters:", a3);
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));

}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C8F330];
  v17[0] = MEMORY[0x1E0C9AAB0];
  v6 = *MEMORY[0x1E0C8F318];
  v16[0] = v5;
  v16[1] = v6;
  v15 = *MEMORY[0x1E0CFAB48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FARequestConfigurator _account](self, "_account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[FARequestConfigurator _accountStore](self, "_accountStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__FARequestConfigurator_renewCredentialsWithCompletion___block_invoke;
    v13[3] = &unk_1E8561CB0;
    v14 = v4;
    objc_msgSend(v10, "renewCredentialsForAccount:options:completion:", v9, v8, v13);

  }
  else
  {
    _FALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1CAEBA000, v11, OS_LOG_TYPE_DEFAULT, "No primary Apple account found. Not attempting credential renwal.", v12, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __56__FARequestConfigurator_renewCredentialsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = a2;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family request configurator: %ld. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  if (a2)
  {
    v7 = 0;
    v8 = v5;
  }
  else
  {
    v7 = 1;
    v8 = 0;
  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, v8);

}

- (id)_account
{
  ACAccount *account;
  void *v4;
  ACAccount *v5;
  ACAccount *v6;

  account = self->_account;
  if (!account)
  {
    -[FARequestConfigurator _accountStore](self, "_accountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v6 = self->_account;
    self->_account = v5;

    account = self->_account;
  }
  return account;
}

- (id)_accountStore
{
  ACAccountStore *accountStore;
  ACAccountStore *v4;
  ACAccountStore *v5;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (id)_grandSlamAccount
{
  ACAccount *grandSlamAccount;
  void *v4;
  void *v5;
  ACAccount *v6;
  ACAccount *v7;

  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    -[FARequestConfigurator _accountStore](self, "_accountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FARequestConfigurator _account](self, "_account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_grandSlamAccountForiCloudAccount:", v5);
    v6 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v7 = self->_grandSlamAccount;
    self->_grandSlamAccount = v6;

    grandSlamAccount = self->_grandSlamAccount;
  }
  return grandSlamAccount;
}

- (id)_grandSlamSigner
{
  AAGrandSlamSigner *grandSlamSigner;
  id v4;
  void *v5;
  void *v6;
  AAGrandSlamSigner *v7;
  AAGrandSlamSigner *v8;

  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    v4 = objc_alloc(MEMORY[0x1E0CFAC78]);
    -[FARequestConfigurator _accountStore](self, "_accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FARequestConfigurator _grandSlamAccount](self, "_grandSlamAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (AAGrandSlamSigner *)objc_msgSend(v4, "initWithAccountStore:grandSlamAccount:appTokenID:", v5, v6, *MEMORY[0x1E0CFAB50]);
    v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }
  return grandSlamSigner;
}

- (id)_familyGrandSlamSigner
{
  AAGrandSlamSigner *familyGrandSlamSigner;
  id v4;
  void *v5;
  void *v6;
  AAGrandSlamSigner *v7;
  AAGrandSlamSigner *v8;

  familyGrandSlamSigner = self->_familyGrandSlamSigner;
  if (!familyGrandSlamSigner)
  {
    v4 = objc_alloc(MEMORY[0x1E0CFAC78]);
    -[FARequestConfigurator _accountStore](self, "_accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FARequestConfigurator _grandSlamAccount](self, "_grandSlamAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (AAGrandSlamSigner *)objc_msgSend(v4, "initWithAccountStore:grandSlamAccount:appTokenID:", v5, v6, *MEMORY[0x1E0CFAB48]);
    v8 = self->_familyGrandSlamSigner;
    self->_familyGrandSlamSigner = v7;

    -[AAGrandSlamSigner setHeaderFieldKey:](self->_familyGrandSlamSigner, "setHeaderFieldKey:", *MEMORY[0x1E0CFAB10]);
    familyGrandSlamSigner = self->_familyGrandSlamSigner;
  }
  return familyGrandSlamSigner;
}

- (id)_akSigningController
{
  AKAppleIDSigningController *akSigningController;
  AKAppleIDSigningController *v4;
  AKAppleIDSigningController *v5;

  akSigningController = self->_akSigningController;
  if (!akSigningController)
  {
    v4 = (AKAppleIDSigningController *)objc_alloc_init(MEMORY[0x1E0D00148]);
    v5 = self->_akSigningController;
    self->_akSigningController = v4;

    akSigningController = self->_akSigningController;
  }
  return akSigningController;
}

- (void)_resourceLoadDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__FARequestConfigurator__resourceLoadDelegate___block_invoke;
  aBlock[3] = &unk_1E8561C88;
  v6 = v4;
  aBlock[4] = self;
  v14 = v6;
  v7 = _Block_copy(aBlock);
  v8 = v7;
  if (self->_resourceLoadDelegate)
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D00130]);
    -[FARequestConfigurator _authContext](self, "_authContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __47__FARequestConfigurator__resourceLoadDelegate___block_invoke_2;
    v11[3] = &unk_1E8561CD8;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v9, "getServerUILoadDelegateWithContext:completion:", v10, v11);

  }
}

uint64_t __47__FARequestConfigurator__resourceLoadDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

void __47__FARequestConfigurator__resourceLoadDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1CAEBA000, v7, OS_LOG_TYPE_DEFAULT, "Received resource load delegate %@ - %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(v5, "setShouldSendSigningHeaders:", 1);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 64);
  *(_QWORD *)(v8 + 64) = v5;
  v10 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_authContext
{
  AKAppleIDAuthenticationContext *authContext;
  AKAppleIDAuthenticationContext *v4;
  AKAppleIDAuthenticationContext *v5;
  AKAppleIDAuthenticationContext *v6;
  void *v7;
  void *v8;

  authContext = self->_authContext;
  if (!authContext)
  {
    v4 = (AKAppleIDAuthenticationContext *)objc_alloc_init(MEMORY[0x1E0D00128]);
    v5 = self->_authContext;
    self->_authContext = v4;

    v6 = self->_authContext;
    -[FARequestConfigurator _account](self, "_account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aa_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAppleIDAuthenticationContext setAltDSID:](v6, "setAltDSID:", v8);

    authContext = self->_authContext;
  }
  return authContext;
}

- (id)_fresnoPayloadWithAdditionalPayload:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  -[FARequestConfigurator _addAccountForServiceType:toPayload:forKey:](self, "_addAccountForServiceType:toPayload:forKey:", *MEMORY[0x1E0CFCF18], v6, CFSTR("iCloudAccountDetails"));
  -[FARequestConfigurator _addAccountForServiceType:toPayload:forKey:](self, "_addAccountForServiceType:toPayload:forKey:", *MEMORY[0x1E0CFCF38], v6, CFSTR("iTunesAccountDetails"));

  return v6;
}

- (void)_addAccountForServiceType:(id)a3 toPayload:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[FARequestConfigurator signer](self, "signer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if ((id)*MEMORY[0x1E0CFCF18] == v8)
    {
      -[FARequestConfigurator signer](self, "signer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accountInfoPayload");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "mutableCopy");

      v11 = (id)v15;
    }
LABEL_16:
    v18 = objc_msgSend(v11, "copy");
    objc_msgSend(v9, "setObject:forKey:", v18, v10);
    goto LABEL_17;
  }
  -[FARequestConfigurator _serviceOwnersManager](self, "_serviceOwnersManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountForService:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  _FALogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v30 = v17;
      _os_log_impl(&dword_1CAEBA000, v18, OS_LOG_TYPE_DEFAULT, "Account for service - %@", buf, 0xCu);
    }

    objc_msgSend(v17, "username");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CFAE18]);
    -[FARequestConfigurator _serviceOwnersManager](self, "_serviceOwnersManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "DSIDForAccount:service:", v17, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CFAE20]);
    v28 = (void *)v20;
    -[FARequestConfigurator _serviceOwnersManager](self, "_serviceOwnersManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "altDSIDForAccount:service:", v17, v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CFAE10]);
    -[FARequestConfigurator _accountStore](self, "_accountStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "aa_grandSlamAccountForAltDSID:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[FARequestConfigurator _familyTokenForGrandSlamAccount:andTokenID:](self, "_familyTokenForGrandSlamAccount:andTokenID:", v26, *MEMORY[0x1E0CFAB48]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, CFSTR("dsFamilyToken"));

    goto LABEL_16;
  }
  if (v19)
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl(&dword_1CAEBA000, v18, OS_LOG_TYPE_DEFAULT, "No Account found for serviceType - %@", buf, 0xCu);
  }
LABEL_17:

}

- (id)_familyTokenForGrandSlamAccount:(id)a3 andTokenID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[FARequestConfigurator _accountStore](self, "_accountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "credentialForAccount:serviceID:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject token](v9, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      _FALogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1CAEBA000, v11, OS_LOG_TYPE_DEFAULT, "Error: No GS Family token.", v13, 2u);
      }

    }
  }
  else
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAEBA000, v9, OS_LOG_TYPE_DEFAULT, "No grandslam account, unable to fetch token", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_serviceOwnersManager
{
  AIDAServiceOwnersManager *serviceOwnersManager;
  id v4;
  void *v5;
  AIDAServiceOwnersManager *v6;
  AIDAServiceOwnersManager *v7;

  serviceOwnersManager = self->_serviceOwnersManager;
  if (!serviceOwnersManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0CFCF68]);
    -[FARequestConfigurator _accountStore](self, "_accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (AIDAServiceOwnersManager *)objc_msgSend(v4, "initWithAccountStore:", v5);
    v7 = self->_serviceOwnersManager;
    self->_serviceOwnersManager = v6;

    serviceOwnersManager = self->_serviceOwnersManager;
  }
  return serviceOwnersManager;
}

- (BOOL)attachSetupHeader
{
  return self->_attachSetupHeader;
}

- (void)setAttachSetupHeader:(BOOL)a3
{
  self->_attachSetupHeader = a3;
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (_TtP12FamilyCircle15FARequestSigner_)signer
{
  return self->_signer;
}

- (void)setSigner:(id)a3
{
  objc_storeStrong((id *)&self->_signer, a3);
}

- (NSDictionary)ephemeralAuthResults
{
  return self->_ephemeralAuthResults;
}

- (void)setEphemeralAuthResults:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, 0);
  objc_storeStrong((id *)&self->_signer, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_resourceLoadDelegate, 0);
  objc_storeStrong((id *)&self->_akSigningController, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_familyGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)updateWithEphemeralAuthResults:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_DEBUG, "FARequestConfigurator updating with ephemeralAuthResults", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_canConnectToAPS
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_ERROR, "Unable to get a self audit token: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

void __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke_61_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_ERROR, "Unable to fetch configuration %@ with error %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

- (void)addFresnoPayloadToRequest:(uint64_t)a1 additionalPayload:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "Body: %{private}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

@end
