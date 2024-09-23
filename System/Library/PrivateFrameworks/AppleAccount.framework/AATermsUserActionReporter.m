@implementation AATermsUserActionReporter

- (AATermsUserActionReporter)initWithAccount:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AATermsUserActionReporter *v9;

  v6 = a4;
  v7 = a3;
  +[AARemoteServer sharedServer](AARemoteServer, "sharedServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AATermsUserActionReporter initWithAccount:parameters:remoteServer:](self, "initWithAccount:parameters:remoteServer:", v7, v6, v8);

  return v9;
}

- (AATermsUserActionReporter)initWithAccount:(id)a3 parameters:(id)a4 remoteServer:(id)a5
{
  id v9;
  id v10;
  id v11;
  AATermsUserActionReporter *v12;
  AATermsUserActionReporter *v13;
  uint64_t v14;
  NSDictionary *requestDictionary;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AATermsUserActionReporter;
  v12 = -[AATermsUserActionReporter init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    v14 = objc_msgSend(v10, "copy");
    requestDictionary = v13->_requestDictionary;
    v13->_requestDictionary = (NSDictionary *)v14;

    v13->_requestCount = 0;
    objc_storeStrong((id *)&v13->_remoteServer, a5);
  }

  return v13;
}

- (void)reportEvent
{
  ACAccount *account;
  _QWORD v3[5];

  account = self->_account;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__AATermsUserActionReporter_reportEvent__block_invoke;
  v3[3] = &unk_1E416F2C0;
  v3[4] = self;
  -[AATermsUserActionReporter _createRequestForAccount:requestHandler:](self, "_createRequestForAccount:requestHandler:", account, v3);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AATermsReportUserActionRequest *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];

  v3 = a2;
  if (v3)
  {
    v4 = [AATermsReportUserActionRequest alloc];
    v6 = *(_QWORD *)(a1 + 32);
    v5 = a1 + 32;
    v7 = -[AATermsReportUserActionRequest initWithAccount:urlRequest:parameters:](v4, "initWithAccount:urlRequest:parameters:", *(_QWORD *)(v6 + 8), v3, *(_QWORD *)(v6 + 16));
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __40__AATermsUserActionReporter_reportEvent__block_invoke_cold_2(v5, v8, v9);

    ++*(_QWORD *)(*(_QWORD *)v5 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__AATermsUserActionReporter_reportEvent__block_invoke_18;
    v17[3] = &unk_1E4170620;
    v17[4] = *(_QWORD *)v5;
    -[NSObject performRequestWithHandler:](v7, "performRequestWithHandler:", v17);
  }
  else
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __40__AATermsUserActionReporter_reportEvent__block_invoke_cold_1(v7, v10, v11, v12, v13, v14, v15, v16);
  }

}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[5];

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __40__AATermsUserActionReporter_reportEvent__block_invoke_18_cold_2(v4, v5);

  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __40__AATermsUserActionReporter_reportEvent__block_invoke_18_cold_1(v4, v6);

  objc_msgSend(v4, "httpResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "statusCode");

  if (v8 != 200)
  {
    objc_msgSend(v4, "httpResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "statusCode");

    if (v10 != 400)
    {
      objc_msgSend(v4, "httpResponse");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "statusCode");

      if (v12 == 401)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0D00128]);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "aa_altDSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAltDSID:", v14);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "username");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setUsername:", v15);

        objc_msgSend(v13, "setAuthenticationType:", 1);
        objc_msgSend(v13, "setIsUsernameEditable:", 0);
        objc_msgSend(*(id *)(a1 + 32), "_authController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __40__AATermsUserActionReporter_reportEvent__block_invoke_20;
        v19[3] = &unk_1E41705F8;
        v19[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v16, "authenticateWithContext:completion:", v13, v19);

LABEL_11:
        goto LABEL_12;
      }
      objc_msgSend(v4, "httpResponse");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "statusCode");

      if (v18 != 500)
      {
        objc_msgSend(v4, "httpResponse");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "statusCode");
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __40__AATermsUserActionReporter_reportEvent__block_invoke_20_cold_2();

  if (v6 || (v8 = *(_QWORD **)(a1 + 32), v8[4] > 2uLL))
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __40__AATermsUserActionReporter_reportEvent__block_invoke_20_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  else
  {
    objc_msgSend(v8, "reportEvent");
  }

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

- (void)_createRequestForAccount:(id)a3 requestHandler:(id)a4
{
  id v6;
  id v7;
  AARemoteServerProtocol *remoteServer;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  AATermsUserActionReporter *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  remoteServer = self->_remoteServer;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke;
  v11[3] = &unk_1E4170648;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  -[AARemoteServerProtocol configurationWithCompletion:](remoteServer, "configurationWithCompletion:", v11);

}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  objc_msgSend(a2, "termsReportUserActionURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_cold_1(v4, v5);

    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D00128]);
    objc_msgSend(a1[4], "aida_alternateDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAltDSID:", v8);

    objc_msgSend(a1[5], "_authController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_30;
    v14[3] = &unk_1E416F310;
    v10 = a1[6];
    v15 = v6;
    v16 = v10;
    v11 = v6;
    objc_msgSend(v9, "getServerUILoadDelegateWithContext:completion:", v7, v14);

  }
  else
  {
    v12 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v13);

  }
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_31;
    v9[3] = &unk_1E416F2E8;
    v10 = v6;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(a2, "signRequest:withCompletionHandler:", v10, v9);

  }
  else
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_30_cold_1();

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v5);
  }

}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_31(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "allHTTPHeaderFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setValue:forKey:", CFSTR("application/json"), CFSTR("Accept"));
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_31_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "setAllHTTPHeaderFields:", v3);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteServer, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_requestDictionary, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "TermsQFA: AATermsUserActionReporter URL is not available in URL Configuration", a5, a6, a7, a8, 0);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = 138477827;
  v5 = v3;
  OUTLINED_FUNCTION_6(&dword_19EACA000, a2, a3, "TermsQFA: Starting AATermsUserActionReporter sending event with parameters %{private}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_18_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "httpResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusCode");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, a2, v4, "TermsQFA: Response status code = %ld", v5);

  OUTLINED_FUNCTION_10();
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_18_cold_2(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "statusCode");
  objc_msgSend(a1, "responseParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218243;
  v8 = v4;
  v9 = 2113;
  v10 = v5;
  OUTLINED_FUNCTION_2_0(&dword_19EACA000, a2, v6, "TermsQFA: AATermsUserActionReporter response %ld %{private}@", (uint8_t *)&v7);

}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_20_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_19EACA000, a1, a3, "TermsQFA: AATermsUserActionReporter NOT reporting event. Retry count exceeded.", a5, a6, a7, a8, 0);
}

void __40__AATermsUserActionReporter_reportEvent__block_invoke_20_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_2_0(&dword_19EACA000, v1, (uint64_t)v1, "TermsQFA: AATermsUserActionReporter reporting event after reauth with authResults %{private}@ and error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, a2, v4, "TermsQFA: termsReportUserActionURL = %{private}@", v5);

  OUTLINED_FUNCTION_10();
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, v0, v1, "TermsQFA: Error obtaining AKAppleIDServerResourceLoadDelegate: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __69__AATermsUserActionReporter__createRequestForAccount_requestHandler___block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19EACA000, v0, v1, "TermsQFA: requestHeaders after loadDelegate signed the request: %{private}@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
