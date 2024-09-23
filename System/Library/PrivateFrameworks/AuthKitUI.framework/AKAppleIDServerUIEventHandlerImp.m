@implementation AKAppleIDServerUIEventHandlerImp

- (void)reauthenticateWithContext:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  AKAppleIDAuthenticationInAppContext *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDServerUIEventHandlerImp reauthenticateWithContext:withCompletion:].cold.1();

  v8 = objc_alloc_init(AKAppleIDAuthenticationInAppContext);
  v9 = objc_alloc_init(MEMORY[0x1E0D00130]);
  objc_msgSend(v6, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationInAppContext setUsername:](v8, "setUsername:", v10);

  objc_msgSend(v6, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDAuthenticationInAppContext setAltDSID:](v8, "setAltDSID:", v11);

  -[AKAppleIDAuthenticationInAppContext setIsUsernameEditable:](v8, "setIsUsernameEditable:", 0);
  objc_msgSend(v6, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAppleIDAuthenticationInAppContext setPresentingViewController:](v8, "setPresentingViewController:", v12);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__AKAppleIDServerUIEventHandlerImp_reauthenticateWithContext_withCompletion___block_invoke;
  v14[3] = &unk_1E7678F10;
  v15 = v5;
  v13 = v5;
  objc_msgSend(v9, "authenticateWithContext:completion:", v8, v14);

}

uint64_t __77__AKAppleIDServerUIEventHandlerImp_reauthenticateWithContext_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDServerUIEventHandlerImp fetchUserInformationForAltDSID:completion:].cold.1();

  v8 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__AKAppleIDServerUIEventHandlerImp_fetchUserInformationForAltDSID_completion___block_invoke;
  v10[3] = &unk_1E7678F38;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "getUserInformationForAltDSID:completion:", v6, v10);

}

uint64_t __78__AKAppleIDServerUIEventHandlerImp_fetchUserInformationForAltDSID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateAccountUsernameForAltDSID:(id)a3 withHarvestedData:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a4;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDServerUIEventHandlerImp updateAccountUsernameForAltDSID:withHarvestedData:].cold.1((uint64_t)v5, v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateUsername:forAccountsWithAltDSID:](v9, "updateUsername:forAccountsWithAltDSID:", v8, v5);
  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1BD795000, v9, OS_LOG_TYPE_DEFAULT, "CFU flow completed without updated username", v10, 2u);
    }
  }

}

- (void)startCDPRepairWithContext:(id)a3 withAdditionalData:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__AKAppleIDServerUIEventHandlerImp_startCDPRepairWithContext_withAdditionalData_completion___block_invoke;
  block[3] = &unk_1E7678F60;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v10 = v9;
  v11 = v7;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __92__AKAppleIDServerUIEventHandlerImp_startCDPRepairWithContext_withAdditionalData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  _AKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __92__AKAppleIDServerUIEventHandlerImp_startCDPRepairWithContext_withAdditionalData_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D001B8];
  objc_msgSend(*(id *)(a1 + 40), "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextForAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setPassword:", v3);
    objc_msgSend(MEMORY[0x1E0D001B8], "stateControllerWithContext:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D001B8];
    objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cdpUIControllerWithPresentingViewController:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setUiProvider:", v10);
    objc_msgSend(v7, "repairCloudDataProtectionStateWithCompletion:", *(_QWORD *)(a1 + 48));

LABEL_7:
    goto LABEL_8;
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7114);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v7);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 withAuthController:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[AKAppleIDServerUIEventHandlerImp updateStateWithExternalAuthenticationResponse:forContext:withAuthController:completion:].cold.1();

  v14 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v14, "_updateWithValuesFromContext:", v11);

  objc_msgSend(v14, "setAnticipateEscrowAttempt:", 1);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __123__AKAppleIDServerUIEventHandlerImp_updateStateWithExternalAuthenticationResponse_forContext_withAuthController_completion___block_invoke;
  v16[3] = &unk_1E7678F88;
  v17 = v9;
  v15 = v9;
  objc_msgSend(v10, "updateStateWithExternalAuthenticationResponse:forContext:completion:", v12, v14, v16);

}

uint64_t __123__AKAppleIDServerUIEventHandlerImp_updateStateWithExternalAuthenticationResponse_forContext_withAuthController_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)postCDPFollowUpForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D001B8], "followUpRepairContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRepairType:", 2);
  objc_msgSend(MEMORY[0x1E0D001B8], "followUpController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postFollowUpWithContext:error:", v4, 0);

  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AKAppleIDServerUIEventHandlerImp postCDPFollowUpForError:].cold.1((uint64_t)v3, v6);

}

- (void)reauthenticateWithContext:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Server UI starting to reauthenticate...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchUserInformationForAltDSID:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Server UI to fetch user information", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateAccountUsernameForAltDSID:(uint64_t)a1 withHarvestedData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BD795000, a2, OS_LOG_TYPE_DEBUG, "Updating Account username with AltDSID: %@", (uint8_t *)&v2, 0xCu);
}

void __92__AKAppleIDServerUIEventHandlerImp_startCDPRepairWithContext_withAdditionalData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Server UI Starting iCDP repair...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateStateWithExternalAuthenticationResponse:forContext:withAuthController:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1BD795000, v0, v1, "Update state with external authentication response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)postCDPFollowUpForError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "Posted CDP repair follow up in response to error: %@", (uint8_t *)&v2, 0xCu);
}

@end
