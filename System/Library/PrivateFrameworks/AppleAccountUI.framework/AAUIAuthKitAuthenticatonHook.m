@implementation AAUIAuthKitAuthenticatonHook

- (AAUIAuthKitAuthenticatonHook)initWithUsername:(id)a3 altDSID:(id)a4
{
  id v7;
  id v8;
  AAUIAuthKitAuthenticatonHook *v9;
  AAUIAuthKitAuthenticatonHook *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[AAUIAuthKitAuthenticatonHook init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleId, a3);
    objc_storeStrong((id *)&v10->_altDSID, a4);
  }

  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ak:auth"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ak:auth"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUIAuthKitAuthenticatonHook _reauthenticateWithServerAttributes:completion:](self, "_reauthenticateWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIAuthKitAuthenticatonHook _reauthenticateWithServerAttributes:completion:](self, "_reauthenticateWithServerAttributes:completion:", v7, v6);

}

- (void)_reauthenticateWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  -[AAUIAuthKitAuthenticatonHook _authContextFromAttributes:](self, "_authContextFromAttributes:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v9 = (void *)v15[5];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__AAUIAuthKitAuthenticatonHook__reauthenticateWithServerAttributes_completion___block_invoke;
  v11[3] = &unk_1EA2DD800;
  v13 = &v14;
  v10 = v7;
  v11[4] = self;
  v12 = v10;
  objc_msgSend(v9, "authenticateWithContext:completion:", v8, v11);

  _Block_object_dispose(&v14, 8);
}

void __79__AAUIAuthKitAuthenticatonHook__reauthenticateWithServerAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  if (v6)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __79__AAUIAuthKitAuthenticatonHook__reauthenticateWithServerAttributes_completion___block_invoke_cold_1((uint64_t)v6, v9);

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_8:
      v11();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateResponseWithAuthResults:", v5);
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_8;
    }
  }

}

- (id)_authContextFromAttributes:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSString *appleId;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", v7);

  objc_msgSend(v5, "setAuthenticationType:", 2);
  objc_msgSend(v5, "setIsUsernameEditable:", 0);
  objc_msgSend(v5, "setAltDSID:", self->_altDSID);
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("username"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v10 = objc_msgSend(v9, "length");
  appleId = (NSString *)v9;
  if (!v10)
  {
    if (!-[NSString length](self->_appleId, "length", v9))
      goto LABEL_8;
    appleId = self->_appleId;
  }
  objc_msgSend(v5, "setUsername:", appleId);
LABEL_8:
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authTitle"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  if (objc_msgSend(v13, "length"))
    objc_msgSend(v5, "setTitle:", v13);
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authBody"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  if (objc_msgSend(v15, "length"))
    objc_msgSend(v5, "setReason:", v15);
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authOK"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  if (objc_msgSend(v17, "length"))
    objc_msgSend(v5, "setDefaultButtonString:", v17);
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authIsEphemeral"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;

  if (v19)
    objc_msgSend(v5, "setIsEphemeral:", objc_msgSend(v19, "BOOLValue"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87318]);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;

  if (objc_msgSend(v21, "length"))
    objc_msgSend(v5, "setForceInlinePresentation:", objc_msgSend(v21, "BOOLValue"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("biometric"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;

  if (objc_msgSend(v23, "BOOLValue"))
    objc_msgSend(v5, "setVerifyCredentialReason:", 3);

  return v5;
}

- (void)_updateResponseWithAuthResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D872E0]);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF58]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = CFSTR("biometric");
    if (!v7)
      v8 = CFSTR("password");
    v10[0] = CFSTR("password");
    v10[1] = CFSTR("authType");
    v11[0] = v5;
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAdditionalPayload:", v9);

    -[AAUIAuthKitAuthenticatonHook setServerHookResponse:](self, "setServerHookResponse:", v6);
  }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleId, 0);
}

void __79__AAUIAuthKitAuthenticatonHook__reauthenticateWithServerAttributes_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Error during authentication - %@", (uint8_t *)&v2, 0xCu);
}

@end
