@implementation AKAppleIDAuthenticationInAppContext

- (AKInAppAuthenticationUIProvider)inAppAuthUIProvider
{
  AKInAppAuthenticationUIProvider *inAppAuthUIProvider;
  NSObject *v4;
  AKInAppAuthenticationRemoteUIProvider *v5;
  AKInAppAuthenticationUIProvider *v6;
  uint8_t v8[16];

  inAppAuthUIProvider = self->_inAppAuthUIProvider;
  if (!inAppAuthUIProvider)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "InApp Remote UI Provider initialized", v8, 2u);
    }

    v5 = -[AKInAppAuthenticationRemoteUIProvider initWithContext:]([AKInAppAuthenticationRemoteUIProvider alloc], "initWithContext:", self);
    v6 = self->_inAppAuthUIProvider;
    self->_inAppAuthUIProvider = (AKInAppAuthenticationUIProvider *)v5;

    inAppAuthUIProvider = self->_inAppAuthUIProvider;
  }
  return inAppAuthUIProvider;
}

- (CDPStateUIProvider)cdpUiProvider
{
  CDPStateUIProvider *cdpUiProvider;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  CDPStateUIProvider *v11;

  cdpUiProvider = self->_cdpUiProvider;
  if (!cdpUiProvider)
  {
    -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteUIControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modalRemoteUINavController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "remoteUIControllerDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modalRemoteUINavController");
    }
    else
    {
      objc_msgSend(v4, "remoteUIController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationController");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDAuthenticationInAppContext cdpUiProvider].cold.1((uint64_t)v8, v9);

    objc_msgSend(MEMORY[0x1E0D001B8], "accountRecoveryControllerWithPresentingViewController:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setForceInlinePresentation:", 1);
    v11 = self->_cdpUiProvider;
    self->_cdpUiProvider = (CDPStateUIProvider *)v10;

    cdpUiProvider = self->_cdpUiProvider;
  }
  return cdpUiProvider;
}

- (void)_assertValidPresentingViewController
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "Presenting view controller is missing!!! Dragons ahead!", v1, 2u);
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__AKAppleIDAuthenticationInAppContext_presentBasicLoginUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __73__AKAppleIDAuthenticationInAppContext_presentBasicLoginUIWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_passwordDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    v5 = v2 == 0;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_assertValidPresentingViewController");
    objc_msgSend(*(id *)(a1 + 32), "inAppAuthUIProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentBasicLoginUIWithCompletion:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v7, OS_LOG_TYPE_DEFAULT, "Username is present but password is missing and required. Client should provide us with password.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__AKAppleIDAuthenticationInAppContext_presentBasicLoginUIWithCompletion___block_invoke_12;
    v13[3] = &unk_1E7679478;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v14 = v9;
    v15 = v11;
    v12 = v9;
    objc_msgSend(v2, "context:needsPasswordWithCompletion:", v10, v13);

  }
}

uint64_t __73__AKAppleIDAuthenticationInAppContext_presentBasicLoginUIWithCompletion___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, 0, a3);
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentLoginAlertWithError:title:message:completion:", v13, v12, v11, v10);

}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissBasicLoginUIWithCompletion:", v4);

}

- (void)presentKeepUsingUIForAppleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentKeepUsingUIForAppleID:completion:", v7, v6);

}

- (void)dismissKeepUsingUIWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissKeepUsingUIWithCompletion:", v4);

}

- (void)presentSecondFactorUIWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentSecondFactorUIWithCompletion:", v4);

}

- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentSecondFactorAlertWithError:title:message:completion:", v13, v12, v11, v10);

}

- (void)dismissSecondFactorUIWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissSecondFactorUIWithCompletion:", v4);

}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentBiometricOrPasscodeValidationForAppleID:completion:", v7, v6);

}

- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AKAppleIDAuthenticationInAppContext _assertValidPresentingViewController](self, "_assertValidPresentingViewController");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke;
    block[3] = &unk_1E7678F60;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7029);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v9);

  }
}

void __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke_2;
  v5[3] = &unk_1E7678F60;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_contextWillBeginPresentingSecondaryUIWithCompletion:", v5);

}

void __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke_3;
  block[3] = &unk_1E7678F60;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "requestType");
  if (v2 == 1)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1BD795000, v7, OS_LOG_TYPE_DEFAULT, "Presenting IDP flow at url: %@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "inAppAuthUIProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentIDPProvidedUIWithConfiguration:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v2)
      return;
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Presenting RUI flow at url: %@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "inAppAuthUIProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentServerProvidedUIWithConfiguration:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (void)_dismissServerProvidedUIWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissServerProvidedUIWithCompletion:", v4);

}

- (void)presentProximityBroadcastUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__AKAppleIDAuthenticationInAppContext_presentProximityBroadcastUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __81__AKAppleIDAuthenticationInAppContext_presentProximityBroadcastUIWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inAppAuthUIProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentProximityBroadcastUIWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)presentProximityPairingUIWithVerificationCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__AKAppleIDAuthenticationInAppContext_presentProximityPairingUIWithVerificationCode_completion___block_invoke;
  block[3] = &unk_1E7678F60;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__AKAppleIDAuthenticationInAppContext_presentProximityPairingUIWithVerificationCode_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_assertValidPresentingViewController");
  objc_msgSend(*(id *)(a1 + 32), "inAppAuthUIProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentProximityPairingUIWithVerificationCode:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)presentProximityPinCodeUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__AKAppleIDAuthenticationInAppContext_presentProximityPinCodeUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __79__AKAppleIDAuthenticationInAppContext_presentProximityPinCodeUIWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inAppAuthUIProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentProximityPinCodeUIWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)activateProximitySession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AKAppleIDAuthenticationInAppContext_activateProximitySession_completion___block_invoke;
  block[3] = &unk_1E7678F60;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __75__AKAppleIDAuthenticationInAppContext_activateProximitySession_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inAppAuthUIProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateProximitySession:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)dismissProximityPairingUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__AKAppleIDAuthenticationInAppContext_dismissProximityPairingUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __79__AKAppleIDAuthenticationInAppContext_dismissProximityPairingUIWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inAppAuthUIProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissProximityPairingUIWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)showProximityErrorWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__AKAppleIDAuthenticationInAppContext_showProximityErrorWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __72__AKAppleIDAuthenticationInAppContext_showProximityErrorWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "inAppAuthUIProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showProximityErrorWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)presentNativeRecoveryUIWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  AKAppleIDAuthenticationInAppContext *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__AKAppleIDAuthenticationInAppContext_presentNativeRecoveryUIWithContext_completion___block_invoke;
  block[3] = &unk_1E7678F60;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__AKAppleIDAuthenticationInAppContext_presentNativeRecoveryUIWithContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Starting native recovery flow with context: %@", (uint8_t *)&v12, 0xCu);
  }

  v4 = objc_alloc(MEMORY[0x1E0D00238]);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cdpUiProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "telemetryFlowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "initWithContext:uiProvider:flowID:", v5, v6, v7);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 648);
  *(_QWORD *)(v9 + 648) = v8;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 648), "presentNativeRecoveryUIWithCompletion:", *(_QWORD *)(a1 + 48));
}

- (void)dismissNativeRecoveryUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__AKAppleIDAuthenticationInAppContext_dismissNativeRecoveryUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __77__AKAppleIDAuthenticationInAppContext_dismissNativeRecoveryUIWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Dismissing native recovery flow", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 648);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__AKAppleIDAuthenticationInAppContext_dismissNativeRecoveryUIWithCompletion___block_invoke_17;
  v6[3] = &unk_1E7679980;
  v6[4] = v3;
  v7 = v4;
  objc_msgSend(v5, "dismissNativeRecoveryUIWithCompletion:", v6);

}

void __77__AKAppleIDAuthenticationInAppContext_dismissNativeRecoveryUIWithCompletion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 648);
  *(_QWORD *)(v5 + 648) = 0;

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

- (void)dismissServerProvidedUIWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__AKAppleIDAuthenticationInAppContext_dismissServerProvidedUIWithCompletion___block_invoke;
  v6[3] = &unk_1E7678CF0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __77__AKAppleIDAuthenticationInAppContext_dismissServerProvidedUIWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[16];

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v2, OS_LOG_TYPE_DEFAULT, "Context was asked to dismiss server provided UI", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__AKAppleIDAuthenticationInAppContext_dismissServerProvidedUIWithCompletion___block_invoke_19;
  v4[3] = &unk_1E7679980;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_dismissServerProvidedUIWithCompletion:", v4);

}

void __77__AKAppleIDAuthenticationInAppContext_dismissServerProvidedUIWithCompletion___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_contextDidEndPresentingSecondaryUI");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  _AKLogFido();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDAuthenticationInAppContext presentFidoAuthForContext:fidoContext:completion:].cold.1(v11);

  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentFidoAuthForContext:fidoContext:completion:", v10, v9, v8);

}

- (void)_contextWillBeginPresentingSecondaryUIWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[AKAppleIDAuthenticationInAppContext delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "contextWillBeginPresentingSecondaryUI:completion:", self, v5);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "contextWillBeginPresentingSecondaryUI:", self);
    if (v5)
      v5[2]();
  }

}

- (void)_contextDidEndPresentingSecondaryUI
{
  id v3;

  -[AKAppleIDAuthenticationInAppContext delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "contextDidEndPresentingSecondaryUI:", self);

}

- (void)_cleanUpBasicLoginWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cleanUpBasicLoginWithCompletion:", v4);

}

- (void)_presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentLoginAlertWithError:title:message:waitForInteraction:completion:", v15, v14, v13, v7, v12);

}

- (void)completeWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteUIControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverUIContextController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeWithError:", v4);

}

- (id)serverDataHarvester
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteUIControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverUIContextController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverDataHarvester");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handleBackButtonTap:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BD795000, v4, OS_LOG_TYPE_DEFAULT, "Handling back button tap, coercing into cancel", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7003);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationInAppContext completeWithError:](self, "completeWithError:", v5);

}

- (id)remoteUIStyle
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  -[AKAppleIDAuthenticationInAppContext delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Context delegate handling RUI style", v6, 2u);
    }

    objc_msgSend(v2, "remoteUIStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[AKAppleIDAuthenticationInAppContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BD795000, v6, OS_LOG_TYPE_DEFAULT, "Context delegate handling willPresentModalNavigationController:", v7, 2u);
    }

    objc_msgSend(v5, "willPresentModalNavigationController:", v4);
  }

}

- (id)_remoteUIControllerDelegate
{
  void *v2;
  void *v3;

  -[AKAppleIDAuthenticationInAppContext inAppAuthUIProvider](self, "inAppAuthUIProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteUIControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[AKAppleIDAuthenticationInAppContext _remoteUIControllerDelegate](self, "_remoteUIControllerDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteUIController:shouldLoadRequest:redirectResponse:withCompletionHandler:", v13, v12, v11, v10);

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AKAppleIDAuthenticationInAppContext _remoteUIControllerDelegate](self, "_remoteUIControllerDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteUIController:didReceiveHTTPResponse:forRequest:", v10, v9, v8);

}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AKAppleIDAuthenticationInAppContext _remoteUIControllerDelegate](self, "_remoteUIControllerDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteUIController:didFinishLoadWithError:forRequest:", v10, v9, v8);

}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AKAppleIDAuthenticationInAppContext _remoteUIControllerDelegate](self, "_remoteUIControllerDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteUIController:willPresentModalNavigationController:", v7, v6);

}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AKAppleIDAuthenticationInAppContext _remoteUIControllerDelegate](self, "_remoteUIControllerDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteUIController:didDismissModalNavigationWithObjectModels:", v7, v6);

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[AKAppleIDAuthenticationInAppContext _remoteUIControllerDelegate](self, "_remoteUIControllerDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteUIController:didReceiveObjectModel:actionSignal:", v9, v8, a5);

}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[AKAppleIDAuthenticationInAppContext _remoteUIControllerDelegate](self, "_remoteUIControllerDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteUIController:willPresentObjectModel:modally:", v9, v8, v5);

}

- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AKAppleIDAuthenticationInAppContext _remoteUIControllerDelegate](self, "_remoteUIControllerDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteUIController:didReceiveChallenge:completionHandler:", v10, v9, v8);

}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  self->_forceInlinePresentation = a3;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (AKAppleIDAuthenticationInAppContextDelegate)delegate
{
  return (AKAppleIDAuthenticationInAppContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPresentingServerUI
{
  return self->_presentingServerUI;
}

- (void)setPresentingServerUI:(BOOL)a3
{
  self->_presentingServerUI = a3;
}

- (AKAppleIDAuthenticationInAppContextAlertDelegate)alertDelegate
{
  return (AKAppleIDAuthenticationInAppContextAlertDelegate *)objc_loadWeakRetained((id *)&self->_alertDelegate);
}

- (void)setAlertDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_alertDelegate, a3);
}

- (void)setInAppAuthUIProvider:(id)a3
{
  objc_storeStrong((id *)&self->_inAppAuthUIProvider, a3);
}

- (void)_setCdpUiProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cdpUiProvider, a3);
}

- (AKAppleIDAuthenticationInAppContextPasswordDelegate)_passwordDelegate
{
  return (AKAppleIDAuthenticationInAppContextPasswordDelegate *)objc_loadWeakRetained((id *)&self->__passwordDelegate);
}

- (void)_setPasswordDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__passwordDelegate, a3);
}

- (id)prepareRUIController
{
  return self->_prepareRUIController;
}

- (void)setPrepareRUIController:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prepareRUIController, 0);
  objc_destroyWeak((id *)&self->__passwordDelegate);
  objc_storeStrong((id *)&self->_cdpUiProvider, 0);
  objc_storeStrong((id *)&self->_inAppAuthUIProvider, 0);
  objc_destroyWeak((id *)&self->_alertDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_nativeRecoveryController, 0);
}

- (void)cdpUiProvider
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Forcing inline presentation with presenter: %@", (uint8_t *)&v2, 0xCu);
}

- (void)presentFidoAuthForContext:(os_log_t)log fidoContext:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "Presenting Fido authentication flow in the app UI provider.", v1, 2u);
}

@end
