@implementation AKAppleIDAuthenticationWatchBuddyContext

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Asked to present basic login UI; Forwarding password to akd.",
      v10,
      2u);
  }

  -[AKAppleIDAuthenticationWatchBuddyContext username](self, "username");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    -[AKAppleIDAuthenticationWatchBuddyContext presentBasicLoginUIWithCompletion:].cold.1();
  v7 = (void *)v6;
  -[AKAppleIDAuthenticationWatchBuddyContext password](self, "password");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    -[AKAppleIDAuthenticationWatchBuddyContext presentBasicLoginUIWithCompletion:].cold.2();
  v9 = (void *)v8;
  (*((void (**)(id, void *, uint64_t, _QWORD, _QWORD))v4 + 2))(v4, v7, v8, 0, 0);

}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "Asked to dismiss basic login UI.", v5, 2u);
  }

  v3[2](v3, 1, 0);
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  AKAppleIDAuthenticationWatchBuddyContext *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1BD795000, v12, OS_LOG_TYPE_DEFAULT, "Asked to present login error alert; Title: (%@); Message: (%@).",
      buf,
      0x16u);
  }

  -[AKAppleIDAuthenticationInAppContext _assertValidPresentingViewController](self, "_assertValidPresentingViewController");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__AKAppleIDAuthenticationWatchBuddyContext_presentLoginAlertWithError_title_message_completion___block_invoke;
  block[3] = &unk_1E7678CC8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v13 = v10;
  v14 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, 0, v15);

}

void __96__AKAppleIDAuthenticationWatchBuddyContext_presentLoginAlertWithError_title_message_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E7679C68, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionWithTitle:style:handler:", v4, 1, &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v5);

  objc_msgSend(*(id *)(a1 + 48), "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, &__block_literal_global_35);

}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "ak_errorWithCode:", -7027);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (RUIStyle)remoteUIStyle
{
  void *v3;
  NSObject *v4;
  RUIStyle *v5;
  RUIStyle *remoteUIStyle;
  RUIStyle *v7;
  RUIStyle *v8;
  RUIStyle *v9;
  __int16 v11[8];

  -[AKAppleIDAuthenticationInAppContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 0;
      _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "Watch buddy context delegate providing style", (uint8_t *)v11, 2u);
    }

    objc_msgSend(v3, "remoteUIStyle");
    v5 = (RUIStyle *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    remoteUIStyle = self->_remoteUIStyle;
    if (!remoteUIStyle)
    {
      if (BridgePreferencesLibraryCore())
        getBPSRemoteUISetupStyleClass();
      v7 = (RUIStyle *)objc_opt_new();
      v8 = self->_remoteUIStyle;
      self->_remoteUIStyle = v7;

      remoteUIStyle = self->_remoteUIStyle;
    }
    v5 = remoteUIStyle;
  }
  v9 = v5;

  return v9;
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Watch buddy context delegate handling willPresentModalNavigationController:", v8, 2u);
    }

    objc_msgSend(v5, "willPresentModalNavigationController:", v4);
  }
  else
  {
    objc_msgSend(v4, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBPSApplyStyleToNavBar(v7);

  }
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (void)setRemoteUIStyle:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIStyle, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

- (void)presentBasicLoginUIWithCompletion:.cold.1()
{
  __assert_rtn("-[AKAppleIDAuthenticationWatchBuddyContext presentBasicLoginUIWithCompletion:]", "AKAppleIDAuthenticationWatchBuddyContext.m", 49, "username");
}

- (void)presentBasicLoginUIWithCompletion:.cold.2()
{
  __assert_rtn("-[AKAppleIDAuthenticationWatchBuddyContext presentBasicLoginUIWithCompletion:]", "AKAppleIDAuthenticationWatchBuddyContext.m", 52, "password");
}

@end
