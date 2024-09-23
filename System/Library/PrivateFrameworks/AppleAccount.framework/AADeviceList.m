@implementation AADeviceList

- (AADeviceList)initWithAccountManager:(id)a3
{
  id v5;
  AADeviceList *v6;
  AADeviceList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AADeviceList;
  v6 = -[AADeviceList init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    -[AADeviceList refreshDeviceList](v7, "refreshDeviceList");
  }

  return v7;
}

- (void)refreshDeviceList
{
  OUTLINED_FUNCTION_0(&dword_19EACA000, a1, a3, "Failed to load device list - no primary Apple Account", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (id)_accountStore
{
  return (id)-[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
}

- (id)_appleAccount
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_aidaAccount
{
  void *v3;
  void *v4;
  void *v5;

  -[AADeviceList _accountStore](self, "_accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AADeviceList _appleAccount](self, "_appleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aida_accountForiCloudAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_authController
{
  AKAppleIDAuthenticationController *authController;
  AKAppleIDAuthenticationController *v4;
  AKAppleIDAuthenticationController *v5;

  authController = self->_authController;
  if (!authController)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x1E0D00130]);
    v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }
  return authController;
}

- (void)_loadDeviceList
{
  void *v3;
  _QWORD v4[5];

  -[AADeviceList _appleAccount](self, "_appleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__AADeviceList__loadDeviceList__block_invoke;
  v4[3] = &unk_1E416F2C0;
  v4[4] = self;
  -[AADeviceList _createRequestForAccount:requestHandler:](self, "_createRequestForAccount:requestHandler:", v3, v4);

}

uint64_t __31__AADeviceList__loadDeviceList__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v5[5];

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "_setDeviceList:loadError:", 0, a3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__AADeviceList__loadDeviceList__block_invoke_2;
  v5[3] = &unk_1E416F298;
  v5[4] = v3;
  return objc_msgSend(v3, "_loadRequest:responseHandler:", a2, v5);
}

void __31__AADeviceList__loadDeviceList__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setDeviceList:loadError:", 0, v5);
  }
  else if (v8)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "devices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setDeviceList:loadError:", v7, 0);

  }
}

- (void)_setDeviceList:(id)a3 loadError:(id)a4
{
  id v7;
  NSArray *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = self->_devices;
  objc_storeStrong((id *)&self->_devices, a3);
  objc_storeStrong((id *)&self->_loadError, a4);
  if (v10 || !v8)
  {
    -[AADeviceList delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceListModified:", v10);

  }
}

- (void)_createRequestForAccount:(id)a3 requestHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  AADeviceList *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _AADeviceListLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Fetching the URL bag", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke;
  v12[3] = &unk_1E416F338;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "requestNewURLBagIfNecessaryWithCompletion:", v12);

}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[16];

  v5 = a3;
  _AADeviceListLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Successfully fetched the URL bag", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_cold_1();
  }

  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trustedDevicesSummaryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(a1[4], "aida_alternateDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAltDSID:", v12);

  _AADeviceListLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "Fetching the server resource load delegate", buf, 2u);
  }

  objc_msgSend(a1[5], "_authController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_23;
  v17[3] = &unk_1E416F310;
  v15 = a1[6];
  v18 = v10;
  v19 = v15;
  v16 = v10;
  objc_msgSend(v14, "getServerUILoadDelegateWithContext:completion:", v11, v17);

}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _AADeviceListLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched the server resource load delegate", buf, 2u);
    }

    _AADeviceListLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Signing the device list request", buf, 2u);
    }

    v10 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_24;
    v12[3] = &unk_1E416F2E8;
    v13 = v10;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v5, "signRequest:withCompletionHandler:", v13, v12);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_23_cold_1();

    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v6);
  }

}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_24(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[16];

  v5 = a3;
  _AADeviceListLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Successfully signed the device list request", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_24_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "allHTTPHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", CFSTR("application/json"), CFSTR("Accept"));
  objc_msgSend(*(id *)(a1 + 32), "setAllHTTPHeaderFields:", v8);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 32), 0);

}

- (void)_loadRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t v13[16];
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__AADeviceList__loadRequest_responseHandler___block_invoke;
  v14[3] = &unk_1E416F360;
  v14[4] = self;
  v15 = v7;
  v8 = v7;
  v9 = (void *)MEMORY[0x1A1AED7A0](v14);
  _AADeviceListLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Fetching the device list from the server", v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D002A8], "sharedAnisetteFreeURLSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "beginDataTaskWithRequest:completionHandler:", v6, v9);

}

void __45__AADeviceList__loadRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  AATrustedDeviceListResponse *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[16];
  uint8_t buf[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _AADeviceListLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_3((uint64_t)v8, v10);
    goto LABEL_17;
  }
  v10 = v8;
  v11 = -[NSObject statusCode](v10, "statusCode");
  if (v11 == 401)
  {
    _AADeviceListLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Failed to fetch the device list from the server - need to renew credentials", v26, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_renewCredentials");
    goto LABEL_17;
  }
  if (v11 != 200)
  {
    _AADeviceListLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_1(v10, v16);

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4402);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  v12 = -[AATrustedDeviceListResponse initWithHTTPResponse:data:]([AATrustedDeviceListResponse alloc], "initWithHTTPResponse:data:", v10, v7);
  _AADeviceListLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "Successfully fetched the device list from the server", buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_2(v14, v18, v19, v20, v21, v22, v23, v24);

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4402);
    v25 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v9 = (id)v25;
  }
LABEL_18:

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, AATrustedDeviceListResponse *, id))(v17 + 16))(v17, v12, v9);

}

- (void)_renewCredentials
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19EACA000, log, OS_LOG_TYPE_FAULT, "Failed to renew credentials for AIDA account - no AIDA account", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __33__AADeviceList__renewCredentials__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = a3;
  _AADeviceListLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __33__AADeviceList__renewCredentials__block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", -3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setDeviceList:loadError:", 0, v8);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Successfully renewed credentials for AIDA account", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__AADeviceList__renewCredentials__block_invoke_35;
    block[3] = &unk_1E416E3A8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __33__AADeviceList__renewCredentials__block_invoke_35(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadDeviceList");
}

- (NSArray)devices
{
  return self->_devices;
}

- (NSError)loadError
{
  return self->_loadError;
}

- (AADeviceListDelegate)delegate
{
  return (AADeviceListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadError, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_authController, 0);
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, v0, v1, "Failed to fetch the URL bag with error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, v0, v1, "Failed to fetch the server resource load delegate with error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __56__AADeviceList__createRequestForAccount_requestHandler___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, v0, v1, "Failed to sign the device list request with error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "statusCode");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, a2, v3, "Failed to fetch the device list from the server - unexpected status code: %ld", v4);
  OUTLINED_FUNCTION_10();
}

void __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19EACA000, a1, a3, "Failed to fetch the device list from the server - invalid server response", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __45__AADeviceList__loadRequest_responseHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, a2, v5, "Failed to fetch the device list from the server - unexpected response class: %@", v6);

  OUTLINED_FUNCTION_10();
}

void __33__AADeviceList__renewCredentials__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, v0, v1, "Failed to renew credentials for AIDA account with error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
