@implementation CDPUIBaseController

- (CDPUIBaseController)initWithPresentingViewController:(id)a3
{
  id v4;
  CDPUIBaseController *v5;
  CDPUIBaseController *v6;

  v4 = a3;
  v5 = -[CDPUIBaseController init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_presentingViewController, v4);

  return v6;
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
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
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "appleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BE0AE28]);
    objc_msgSend(v6, "appleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUsername:", v10);

    objc_msgSend(v6, "altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAltDSID:", v11);

    objc_msgSend(v6, "dsid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDSID:", v13);

    objc_msgSend(v9, "setAuthenticationType:", 2);
    objc_msgSend(v9, "setAnticipateEscrowAttempt:", 1);
    objc_msgSend(v9, "setIsUsernameEditable:", 0);
    objc_msgSend(v9, "setSupportsPiggybacking:", 1);
    objc_msgSend(v9, "setShouldOfferSecurityUpgrade:", 1);
    -[CDPUIBaseController presentingViewController](self, "presentingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v9, "setPresentingViewController:", v15);
    }
    else
    {
      -[CDPUIBaseController presentingViewController](self, "presentingViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPresentingViewController:", v16);

    }
    if (objc_msgSend(v6, "type") == 6)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("LOCAL_SECRET_PASSWORD_PROMPT"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@"), 0, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setReason:", v21);

    }
    _CDPLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "appleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentingViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_20DC8F000, v22, OS_LOG_TYPE_DEFAULT, "\"Attempting to perform an interactive authentication for %@... using %@\", buf, 0x16u);

    }
    v25 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __83__CDPUIBaseController_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke;
    v26[3] = &unk_24C854D78;
    v27 = v7;
    objc_msgSend(v25, "authenticateWithContext:completion:", v9, v26);

    goto LABEL_12;
  }
  if (v7)
  {
    _CDPStateError();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
LABEL_12:

  }
}

uint64_t __83__CDPUIBaseController_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cdpContext:(id)a3 showError:(id)a4 withCompletion:(id)a5
{
  -[CDPUIBaseController cdpContext:showError:withDefaultIndex:withCompletion:](self, "cdpContext:showError:withDefaultIndex:withCompletion:", a3, a4, -1, a5);
}

- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  int64_t v36;

  v9 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v9, "localizedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedFailureReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedRecoveryOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke;
  v32[3] = &unk_24C855000;
  v17 = v10;
  v35 = v17;
  v18 = v14;
  v33 = v18;
  v36 = a5;
  v19 = v9;
  v34 = v19;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v32);

  objc_msgSend(v18, "actions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (!v21)
  {
    v22 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("GENERIC_ERROR_DEFAULT_BUTTON"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_3;
    v30[3] = &unk_24C8545C0;
    v31 = v17;
    objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addAction:", v25);
  }
  -[CDPUIBaseController presentingViewController](self, "presentingViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "presentedViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "presentViewController:animated:completion:", v18, 1, 0);
  }
  else
  {
    -[CDPUIBaseController presentingViewController](self, "presentingViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "presentViewController:animated:completion:", v18, 1, 0);

  }
}

void __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t v15;

  v6 = (void *)MEMORY[0x24BEBD3A8];
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_2;
  v13 = &unk_24C854FD8;
  v14 = *(id *)(a1 + 48);
  v15 = a3;
  objc_msgSend(v6, "actionWithTitle:style:handler:", a2, 0, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addAction:", v7, v10, v11, v12, v13);
  if (*(_QWORD *)(a1 + 56) == a3)
  {
    if (!objc_msgSend(MEMORY[0x24BE1A4A0], "isICSCHarmonizationEnabled")
      || (objc_msgSend(*(id *)(a1 + 40), "localizedRecoveryOptions"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v9 <= 2))
    {
      objc_msgSend(*(id *)(a1 + 32), "setPreferredAction:", v7);
    }
  }

}

uint64_t __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __76__CDPUIBaseController_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  NSObject *v4;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:].cold.1();

}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  NSObject *v6;

  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:].cold.1();

}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  NSObject *v5;

  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[CDPUIBaseController cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:].cold.1();

}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  NSObject *v7;

  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:].cold.1();

}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  NSObject *v4;

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:].cold.1();

}

- (void)createLocalSecretWithCompletion:(id)a3
{
  NSObject *v3;

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CDPUIBaseController cdpContext:promptForLocalSecretWithCompletion:].cold.1();

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
}

- (void)cdpContext:promptForLocalSecretWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Not implemented\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_20DC8F000, v0, OS_LOG_TYPE_FAULT, "\"Not implemented\", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
