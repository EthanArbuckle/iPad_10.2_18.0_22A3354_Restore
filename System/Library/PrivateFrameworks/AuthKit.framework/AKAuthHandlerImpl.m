@implementation AKAuthHandlerImpl

- (id)buildReauthenticationContextFromContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t v19[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "_updateWithValuesFromContext:", v6);
  objc_msgSend(v7, "setIsUsernameEditable:", 0);
  objc_msgSend(v7, "setShouldSkipSettingsLaunchAlert:", 1);
  objc_msgSend(v7, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_8:
    if (-[AKAuthHandlerImpl forceSilentAuth](self, "forceSilentAuth"))
      objc_msgSend(v7, "setAuthenticationType:", 1);
    v17 = v7;
    goto LABEL_11;
  }
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19202F000, v9, OS_LOG_TYPE_DEFAULT, "Missing username, trying to fetch one via idMS account", buf, 2u);
  }

  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authKitAccountWithAltDSID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_19202F000, v15, OS_LOG_TYPE_DEFAULT, "Using idMS account username", v19, 2u);
    }

    objc_msgSend(v12, "username");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsername:", v16);

    goto LABEL_8;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[AKAuthHandlerImpl buildReauthenticationContextFromContext:error:].cold.1(v15);

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7022);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v17 = 0;
LABEL_11:

  return v17;
}

- (void)reauthenticateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__AKAuthHandlerImpl_reauthenticateWithContext_completion___block_invoke;
  v8[3] = &unk_1E2E5E248;
  v9 = v6;
  v7 = v6;
  -[AKAuthHandlerImpl reauthenticateWithContext:completionWithResults:](self, "reauthenticateWithContext:completionWithResults:", a3, v8);

}

uint64_t __58__AKAuthHandlerImpl_reauthenticateWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reauthenticateWithContext:(id)a3 completionWithResults:(id)a4
{
  id v5;
  id v6;
  AKAppleIDAuthenticationController *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(AKAppleIDAuthenticationController);
  -[AKAppleIDAuthenticationController authenticateWithContext:completion:](v7, "authenticateWithContext:completion:", v6, v5);

}

- (BOOL)forceSilentAuth
{
  return self->_forceSilentAuth;
}

- (void)setForceSilentAuth:(BOOL)a3
{
  self->_forceSilentAuth = a3;
}

- (void)buildReauthenticationContextFromContext:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19202F000, log, OS_LOG_TYPE_ERROR, "Matching account missing, there be dragons ahead!", v1, 2u);
}

@end
