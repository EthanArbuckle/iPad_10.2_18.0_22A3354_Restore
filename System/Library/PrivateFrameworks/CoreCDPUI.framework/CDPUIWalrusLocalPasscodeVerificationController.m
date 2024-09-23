@implementation CDPUIWalrusLocalPasscodeVerificationController

- (CDPUIWalrusLocalPasscodeVerificationController)initWithTitle:(id)a3 presentWithViewController:(id)a4 presentationType:(unint64_t)a5
{
  id v9;
  id v10;
  CDPUIWalrusLocalPasscodeVerificationController *v11;
  CDPUIWalrusLocalPasscodeVerificationController *v12;
  uint64_t v13;
  CDPContext *context;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CDPUIWalrusLocalPasscodeVerificationController;
  v11 = -[CDPUIWalrusLocalPasscodeVerificationController init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
    v13 = objc_claimAutoreleasedReturnValue();
    context = v12->_context;
    v12->_context = (CDPContext *)v13;

    objc_storeStrong((id *)&v12->_viewController, a4);
    v12->_presentationType = a5;
  }
  -[CDPUIWalrusLocalPasscodeVerificationController _setupControllers](v12, "_setupControllers");

  return v12;
}

- (void)_setupControllers
{
  CDPStateController *v3;
  CDPStateController *stateController;
  CDPUIController *v5;
  CDPUIController *uiController;

  v3 = (CDPStateController *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A490]), "initWithContext:", self->_context);
  stateController = self->_stateController;
  self->_stateController = v3;

  v5 = objc_alloc_init(CDPUIController);
  uiController = self->_uiController;
  self->_uiController = v5;

  -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", 1);
  if (self->_presentationType == 2)
    -[CDPUIController setForceInlinePresentation:](self->_uiController, "setForceInlinePresentation:", 0);
  -[CDPUIBaseController setPresentingViewController:](self->_uiController, "setPresentingViewController:", self->_viewController);
  -[CDPUIController setTitleText:](self->_uiController, "setTitleText:", self->_title);
  -[CDPUIController setDelegate:](self->_uiController, "setDelegate:", self);
  -[CDPStateController setUiProvider:](self->_stateController, "setUiProvider:", self->_uiController);
}

- (void)finishWalrusLocalPasscodeVerificationWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CDPUIController *uiController;
  CDPContext *context;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CDPUIWalrusLocalPasscodeVerificationController *v17;
  id v18;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDFC2A0]);
  v6 = (void *)objc_msgSend(v5, "initWithEventName:eventCategory:initData:", *MEMORY[0x24BE1A6C8], *MEMORY[0x24BE1A860], 0);
  -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDPContext telemetryFlowID](self->_context, "telemetryFlowID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDFC340]);

  }
  -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CDPContext telemetryDeviceSessionID](self->_context, "telemetryDeviceSessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDFC318]);

  }
  uiController = self->_uiController;
  context = self->_context;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke;
  v15[3] = &unk_24C854190;
  v16 = v6;
  v17 = self;
  v18 = v4;
  v13 = v4;
  v14 = v6;
  -[CDPUIController cdpContext:promptForLocalSecretWithCompletion:](uiController, "cdpContext:promptForLocalSecretWithCompletion:", context, v15);

}

void __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CDPUIWalrusLocalPasscodeVerificationController finishWalrusLocalPasscodeVerificationWithCompletion:]_block_invoke";
      _os_log_impl(&dword_20DC8F000, v8, OS_LOG_TYPE_DEFAULT, "\"%s Validated local secret successfully.\", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1A640]);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEvent:", *(_QWORD *)(a1 + 32));

    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 16);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_23;
    v14[3] = &unk_24C854168;
    v14[4] = v10;
    v15 = v5;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v11, "shouldPerformRepairWithOptionForceFetch:completion:", 1, v14);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE1A640]);
    objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v6);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendEvent:", *(_QWORD *)(a1 + 32));

    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v6);
  }

}

void __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_23(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "validatedSecret");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 40), "secretType");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_2;
    v10[3] = &unk_24C854140;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "localSecretChangedTo:secretType:completion:", v7, v8, v10);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, 1, 0);
  }

}

uint64_t __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)uiController:(id)a3 preparePresentationContext:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)uiController:(id)a3 prepareAlertContext:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __102__CDPUIWalrusLocalPasscodeVerificationController_finishWalrusLocalPasscodeVerificationWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[CDPUIWalrusLocalPasscodeVerificationController finishWalrusLocalPasscodeVerificationWithCompletion:]_block_invoke_3";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_ERROR, "\"%s: Failed to validate local secret with error %@\", (uint8_t *)&v2, 0x16u);
}

@end
