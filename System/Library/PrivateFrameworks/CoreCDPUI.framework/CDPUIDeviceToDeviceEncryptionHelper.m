@implementation CDPUIDeviceToDeviceEncryptionHelper

- (CDPUIDeviceToDeviceEncryptionHelper)initWithContext:(id)a3
{
  id v5;
  CDPUIDeviceToDeviceEncryptionHelper *v6;
  AKAppleIDAuthenticationController *v7;
  AKAppleIDAuthenticationController *authenticationController;
  id v9;
  void *v10;
  uint64_t v11;
  CDPLocalSecretFollowUpProvider *followUpProvider;
  CDPLocalSecretFollowUpProvider *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDPUIDeviceToDeviceEncryptionHelper;
  v6 = -[CDPUIDeviceToDeviceEncryptionHelper init](&v15, sel_init);
  if (v6)
  {
    v7 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x24BE0ACC0]);
    authenticationController = v6->_authenticationController;
    v6->_authenticationController = v7;

    objc_storeStrong((id *)&v6->_context, a3);
    if (objc_msgSend(MEMORY[0x24BE1A4A0], "canEnableMultiUserManatee"))
    {
      v9 = objc_alloc(MEMORY[0x24BE1A9D8]);
      objc_msgSend(v5, "altDSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithAltDSID:", v10);
      followUpProvider = v6->_followUpProvider;
      v6->_followUpProvider = (CDPLocalSecretFollowUpProvider *)v11;

    }
    else
    {
      v13 = (CDPLocalSecretFollowUpProvider *)objc_alloc_init(MEMORY[0x24BE1A9D8]);
      v10 = v6->_followUpProvider;
      v6->_followUpProvider = v13;
    }

  }
  return v6;
}

- (CDPUIDeviceToDeviceEncryptionHelper)initWithPresentingViewController:(id)a3
{
  id v4;
  id v5;
  CDPUIDeviceToDeviceEncryptionHelper *v6;

  v4 = a3;
  v5 = +[CDPUIDeviceToDeviceEncryptionHelper _newLegacyFlowContext](CDPUIDeviceToDeviceEncryptionHelper, "_newLegacyFlowContext");
  v6 = -[CDPUIDeviceToDeviceEncryptionHelper initWithContext:](self, "initWithContext:", v5);

  if (v6)
    objc_storeWeak((id *)&v6->_presentingViewController, v4);

  return v6;
}

- (void)dealloc
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_20DC8F000, v0, OS_LOG_TYPE_DEBUG, "\"CDPUIDeviceToDeviceEncryptionHelper (%p) deallocated\", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)performDeviceToDeviceEncryptionStateRepairWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  os_activity_scope_state_s state;
  _QWORD aBlock[5];
  id v15;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke;
  aBlock[3] = &unk_24C854D00;
  v6 = v4;
  aBlock[4] = self;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  v8 = _os_activity_create(&dword_20DC8F000, "cdp/perform-device-to-device-encryption-state-repair", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_3;
  v11[3] = &unk_24C8544F8;
  v11[4] = self;
  v10 = v7;
  v12 = v10;
  -[CDPUIDeviceToDeviceEncryptionHelper _determineUpgradeEligibilityForContext:completion:](self, "_determineUpgradeEligibilityForContext:completion:", v9, v11);

  os_activity_scope_leave(&state);
}

void __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_cdpErrorWithUnderlyingError:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v7);

    }
    else
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_2;
      v10[3] = &unk_24C854CD8;
      v8 = *(id *)(a1 + 40);
      v13 = a2;
      v9 = *(_QWORD *)(a1 + 32);
      v12 = v8;
      v10[4] = v9;
      v11 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v10);

    }
  }

}

void __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_cdpErrorWithUnderlyingError:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

}

void __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void (*v11)(void);
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v5 = a3;
  if (a2)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v6, OS_LOG_TYPE_DEFAULT, "\"Determined to be eligible for upgrade, proceeding with repair\", buf, 2u);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_beginUpgradeFlowWithContext:completion:", v8, *(_QWORD *)(a1 + 40));

    goto LABEL_20;
  }
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_3_cold_1();

    if (*(_QWORD *)(a1 + 40))
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_16:
        v11();
        goto LABEL_20;
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_27;
      block[3] = &unk_24C854408;
      v17 = *(id *)(a1 + 40);
      v16 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v12 = v17;
      goto LABEL_19;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v10, OS_LOG_TYPE_DEFAULT, "\"No error and no repair needed. Signaling successful completion.\", buf, 2u);
    }

    if (*(_QWORD *)(a1 + 40))
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_16;
      }
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_28;
      v13[3] = &unk_24C854368;
      v14 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], v13);
      v12 = v14;
LABEL_19:

    }
  }
LABEL_20:

}

uint64_t __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performDeviceToDeviceEncryptionStateRepairForContext:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  CDPUIDeviceToDeviceEncryptionFlowContext *v8;
  CDPUIDeviceToDeviceEncryptionFlowContext *context;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!self->_context)
  {
    objc_msgSend(v12, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[CDPUIDeviceToDeviceEncryptionHelper _newLegacyFlowContextForAltDSID:](CDPUIDeviceToDeviceEncryptionHelper, "_newLegacyFlowContextForAltDSID:", v7);
    context = self->_context;
    self->_context = v8;

  }
  objc_msgSend(v12, "securityUpgradeContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIDeviceToDeviceEncryptionFlowContext setSecurityUpgradeContext:](self->_context, "setSecurityUpgradeContext:", v10);

  -[CDPUIDeviceToDeviceEncryptionHelper _presentingViewController](self, "_presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIDeviceToDeviceEncryptionFlowContext setPresentingViewController:](self->_context, "setPresentingViewController:", v11);

  -[CDPUIDeviceToDeviceEncryptionHelper performDeviceToDeviceEncryptionStateRepairWithCompletion:](self, "performDeviceToDeviceEncryptionStateRepairWithCompletion:", v6);
}

- (void)_configurePresentingViewControllerForModalPresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  -[CDPUIDeviceToDeviceEncryptionHelper _presentingViewController](self, "_presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalInPresentation:", 1);

  -[CDPUIDeviceToDeviceEncryptionHelper _presentingViewController](self, "_presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  objc_msgSend(v4, "setModalPresentationStyle:", 2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  -[CDPUIDeviceToDeviceEncryptionHelper _presentingNavigationController](self, "_presentingNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDPUIDeviceToDeviceEncryptionHelper _presentingNavigationController](self, "_presentingNavigationController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslucent:", 1);

    objc_msgSend(v13, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BEBD640]);
    objc_msgSend(v9, "setBackgroundImage:forBarMetrics:", v10, 0);

    objc_msgSend(v13, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BEBD640]);
    objc_msgSend(v11, "setShadowImage:", v12);

  }
}

- (void)_beginUpgradeFlowWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(void *, uint64_t, _QWORD);
  void *v12;
  uint64_t v13;
  id v14;
  CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  void (**v19)(void *, uint64_t, _QWORD);
  _QWORD block[4];
  void (**v21)(void *, uint64_t, _QWORD);
  _QWORD aBlock[5];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C854168;
  aBlock[4] = self;
  v9 = v6;
  v23 = v9;
  v10 = v7;
  v24 = v10;
  v11 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  objc_msgSend(v9, "cdpContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isiCDPEligible");

  if (objc_msgSend(v9, "deviceToDeviceEncryptionUpgradeUIStyle") == 3)
  {
    if ((_DWORD)v13)
    {
      if (v11)
      {
        if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        {
          v11[2](v11, 1, 0);
        }
        else
        {
          block[0] = v8;
          block[1] = 3221225472;
          block[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_6;
          block[3] = &unk_24C854368;
          v21 = v11;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

        }
      }
    }
    else
    {
      -[CDPUIDeviceToDeviceEncryptionHelper _legacyRequestPermissionToContinueFlowWithCompletion:](self, "_legacyRequestPermissionToContinueFlowWithCompletion:", v11);
    }
  }
  else
  {
    v14 = -[CDPUIDeviceToDeviceEncryptionHelper _newUpgradeUIProvider](self, "_newUpgradeUIProvider");
    v15 = -[CDPUIDeviceToDeviceEncryptionMessagingViewModel initWithContext:is2FA:hasLocalSecret:]([CDPUIDeviceToDeviceEncryptionUpgradeMessageViewModel alloc], "initWithContext:is2FA:hasLocalSecret:", v9, v13, -[CDPUIDeviceToDeviceEncryptionHelper _hasLocalSecret](self, "_hasLocalSecret"));
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_7;
    v17[3] = &unk_24C8544F8;
    v18 = v14;
    v19 = v11;
    v16 = v14;
    objc_msgSend(v16, "promptForUpgradeWithContext:vm:completion:", v9, v15, v17);

  }
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_configureNavigationController");
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_2;
    v12[3] = &unk_24C8544F8;
    v12[4] = v6;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v6, "_continueUpgradeFlowWithContext:completion:", v7, v12);
    v8 = v13;
LABEL_7:

    goto LABEL_8;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    if (!objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_5;
      v9[3] = &unk_24C854408;
      v11 = *(id *)(a1 + 48);
      v10 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v9);

      v8 = v11;
      goto LABEL_7;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_8:

}

void __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_3;
  v9[3] = &unk_24C8544A8;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "_dismissNavigationControllerWithCompletion:", v9);

}

void __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  char v5;

  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_4;
      block[3] = &unk_24C8544A8;
      v4 = *(id *)(a1 + 40);
      v5 = *(_BYTE *)(a1 + 48);
      v3 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_8;
      block[3] = &unk_24C8544A8;
      v8 = *(id *)(a1 + 40);
      v9 = a2;
      v7 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__beginUpgradeFlowWithContext_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_continueUpgradeFlowWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke;
  aBlock[3] = &unk_24C854D28;
  v18 = v6;
  v19 = v7;
  aBlock[4] = self;
  v9 = v6;
  v10 = v7;
  v11 = _Block_copy(aBlock);
  -[CDPUIDeviceToDeviceEncryptionHelper _inAppAuthenticationContextForFlowContext:](self, "_inAppAuthenticationContextForFlowContext:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIDeviceToDeviceEncryptionHelper _authenticationController](self, "_authenticationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_3;
  v15[3] = &unk_24C854D78;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "authenticateWithContext:completion:", v12, v15);

}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];
  _QWORD aBlock[5];
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_cold_1();

    if (*(_QWORD *)(a1 + 48))
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_31;
        block[3] = &unk_24C854408;
        v27 = *(id *)(a1 + 48);
        v26 = v7;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A3F8]), "initWithAuthenticationResults:", v5);
    if (objc_msgSend(v8, "isiCDPEligible"))
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_2;
      aBlock[3] = &unk_24C854278;
      v9 = *(void **)(a1 + 40);
      aBlock[4] = *(_QWORD *)(a1 + 32);
      v22 = v9;
      v10 = v5;
      v23 = v10;
      v24 = *(id *)(a1 + 48);
      v11 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB78]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "BOOLValue"))
        objc_msgSend(*(id *)(a1 + 32), "_presentSpinnerViewControllerWithCompletion:", v11);
      else
        v11[2](v11);

      v17 = v22;
    }
    else
    {
      _CDPLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DC8F000, v14, OS_LOG_TYPE_DEFAULT, "\"Account is still not iCDP eligible, upgrade failed without an error\", buf, 2u);
      }

      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_33;
      v18[3] = &unk_24C854368;
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v15, "_presentIneligibilityAlertForFlowContext:completion:", v16, v18);
      v17 = v19;
    }

  }
}

uint64_t __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continueAuthenticatedUpgradeFlowWithContext:authenticationResults:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD block[4];
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v2 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 5095);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_2_35;
      block[3] = &unk_24C854368;
      v5 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_2_35(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 5095);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_4;
      block[3] = &unk_24C854D50;
      v10 = *(id *)(a1 + 32);
      v8 = v5;
      v9 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

uint64_t __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_continueAuthenticatedUpgradeFlowWithContext:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(void *, void *, _QWORD);
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(id *, void *, void *);
  void *v22;
  id v23;
  id v24;
  CDPUIDeviceToDeviceEncryptionHelper *v25;
  id v26;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v11, OS_LOG_TYPE_DEFAULT, "\"Authentication for upgrade succeeded, checking CDP state\", buf, 2u);
  }

  -[CDPUIDeviceToDeviceEncryptionHelper _stateControllerForFlowContext:withAuthenticationResults:](self, "_stateControllerForFlowContext:withAuthenticationResults:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke;
  v22 = &unk_24C854DA0;
  v13 = v8;
  v23 = v13;
  v26 = v9;
  v14 = v12;
  v24 = v14;
  v25 = self;
  v15 = v9;
  v16 = (void (**)(void *, void *, _QWORD))_Block_copy(&v19);
  if (-[CDPUIDeviceToDeviceEncryptionHelper _hasLocalSecret](self, "_hasLocalSecret", v19, v20, v21, v22))
  {
    objc_msgSend(v13, "cachedLocalSecret");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v13, "cachedLocalSecret");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, v18, 0);

    }
    else if (objc_msgSend(v13, "deviceToDeviceEncryptionUpgradeType") == 2)
    {
      -[CDPUIDeviceToDeviceEncryptionHelper _validateLocalSecretForContext:withStateController:completion:](self, "_validateLocalSecretForContext:withStateController:completion:", v13, v14, v16);
    }
    else
    {
      v16[2](v16, 0, 0);
    }
  }
  else
  {
    -[CDPUIDeviceToDeviceEncryptionHelper _createLocalSecretForContext:completion:](self, "_createLocalSecretForContext:completion:", v13, v16);
  }

}

void __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "cdp_isCDPErrorWithCode:", -5307)
    && objc_msgSend(a1[4], "deviceToDeviceEncryptionUpgradeType") == 1)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v7, OS_LOG_TYPE_DEFAULT, "\"Passcode creation cancelled but not required for 2FA-only upgrade, returning success\", buf, 2u);
    }

    if (a1[7])
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v8 = (void (*)(void))*((_QWORD *)a1[7] + 2);
LABEL_16:
        v8();
        goto LABEL_20;
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_37;
      block[3] = &unk_24C854368;
      v18 = a1[7];
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v13 = v18;
      goto LABEL_19;
    }
  }
  else if (v6 && (objc_msgSend(v6, "cdp_isCDPErrorWithCode:", 5094) & 1) == 0)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_cold_1();

    if (a1[7])
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v8 = (void (*)(void))*((_QWORD *)a1[7] + 2);
        goto LABEL_16;
      }
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_38;
      v14[3] = &unk_24C854408;
      v16 = a1[7];
      v15 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], v14);

      v13 = v16;
LABEL_19:

    }
  }
  else
  {
    objc_msgSend(a1[5], "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "validatedSecret");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCachedLocalSecret:", v10);

    objc_msgSend(a1[5], "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCachedLocalSecretType:", objc_msgSend(v5, "secretType"));

    objc_msgSend(a1[6], "_performAuthenticatedRepairFlowWithContext:stateController:completion:", a1[4], a1[5], a1[7]);
  }
LABEL_20:

}

uint64_t __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_performAuthenticatedRepairFlowWithContext:(id)a3 stateController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke;
  v13[3] = &unk_24C854168;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v11, "repairCloudDataProtectionStateWithCompletion:", v13);

}

void __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRepairContext:", v7);

  }
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v15 = a2;
    _os_log_impl(&dword_20DC8F000, v9, OS_LOG_TYPE_DEFAULT, "\"Finished repairing CDP state: %{BOOL}d\", buf, 8u);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke_40;
      block[3] = &unk_24C8544A8;
      v12 = *(id *)(a1 + 48);
      v13 = a2;
      v11 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

uint64_t __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_determineUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v6, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPUIDeviceToDeviceEncryptionHelper _determineUpgradeEligibilityForContext:completion:].cold.1();

    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = -5003;
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "isDemoDevice"))
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CDPUIDeviceToDeviceEncryptionHelper _determineUpgradeEligibilityForContext:completion:].cold.2();

    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = -5314;
LABEL_9:
    objc_msgSend(v10, "cdp_errorWithCode:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);

    goto LABEL_10;
  }
  v14 = objc_msgSend(v6, "deviceToDeviceEncryptionUpgradeType");
  if (v14)
  {
    if (v14 == 2)
    {
      -[CDPUIDeviceToDeviceEncryptionHelper _determineEscrowRepairUpgradeEligibilityForContext:completion:](self, "_determineEscrowRepairUpgradeEligibilityForContext:completion:", v6, v7);
    }
    else if (v14 == 1)
    {
      -[CDPUIDeviceToDeviceEncryptionHelper _determineSecurityUpgradeEligibilityForContext:completion:](self, "_determineSecurityUpgradeEligibilityForContext:completion:", v6, v7);
    }
  }
  else
  {
    -[CDPUIDeviceToDeviceEncryptionHelper _determineManateeUpgradeEligibilityForContext:completion:](self, "_determineManateeUpgradeEligibilityForContext:completion:", v6, v7);
  }
LABEL_10:

}

- (void)_determineSecurityUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cdpContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isiCDPEligible");

  if (v9)
  {
    if (v7)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      }
      else
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke;
        block[3] = &unk_24C854408;
        v15 = 0;
        v16 = v7;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }
  }
  else
  {
    -[CDPUIDeviceToDeviceEncryptionHelper _authenticationContextForFlowContext:](self, "_authenticationContextForFlowContext:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIDeviceToDeviceEncryptionHelper _authenticationController](self, "_authenticationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_2;
    v12[3] = &unk_24C854140;
    v13 = v7;
    objc_msgSend(v11, "checkSecurityUpgradeEligibilityForContext:completion:", v10, v12);

  }
}

uint64_t __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v5 = a3;
  if (a2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_3;
        block[3] = &unk_24C854368;
        v12 = *(id *)(a1 + 32);
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", 5900, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_2_cold_1();

    if (*(_QWORD *)(a1 + 32))
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_41;
        v8[3] = &unk_24C854408;
        v10 = *(id *)(a1 + 32);
        v9 = v6;
        dispatch_async(MEMORY[0x24BDAC9B8], v8);

      }
    }

  }
}

uint64_t __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_determineManateeUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  uint64_t v6;
  _QWORD v7[4];
  void (**v8)(id, uint64_t, _QWORD);
  char v9;

  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[CDPUIDeviceToDeviceEncryptionHelper _hasManatee](self, "_hasManatee"))
  {
    v6 = -[CDPUIDeviceToDeviceEncryptionHelper _inCircle](self, "_inCircle") ^ 1;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v6 = 1;
    if (!v5)
      goto LABEL_8;
  }
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v5[2](v5, v6, 0);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __96__CDPUIDeviceToDeviceEncryptionHelper__determineManateeUpgradeEligibilityForContext_completion___block_invoke;
    v7[3] = &unk_24C854DC8;
    v8 = v5;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
LABEL_8:

}

uint64_t __96__CDPUIDeviceToDeviceEncryptionHelper__determineManateeUpgradeEligibilityForContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)_determineEscrowRepairUpgradeEligibilityForContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  _QWORD block[4];
  void (**v10)(id, uint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[CDPUIDeviceToDeviceEncryptionHelper _hasLocalSecret](self, "_hasLocalSecret")
    && -[CDPUIDeviceToDeviceEncryptionHelper _hasManatee](self, "_hasManatee")
    && -[CDPUIDeviceToDeviceEncryptionHelper _inCircle](self, "_inCircle"))
  {
    -[CDPUIDeviceToDeviceEncryptionHelper _stateControllerForFlowContext:withAuthenticationResults:](self, "_stateControllerForFlowContext:withAuthenticationResults:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shouldPerformRepairWithOptionForceFetch:completion:", 1, v7);

  }
  else if (v7)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      v7[2](v7, 1, 0);
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __101__CDPUIDeviceToDeviceEncryptionHelper__determineEscrowRepairUpgradeEligibilityForContext_completion___block_invoke;
      block[3] = &unk_24C854368;
      v10 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

uint64_t __101__CDPUIDeviceToDeviceEncryptionHelper__determineEscrowRepairUpgradeEligibilityForContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_validateLocalSecretForContext:(id)a3 withStateController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  CDPUIDeviceToDeviceEncryptionHelper *v20;
  id v21;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v11, OS_LOG_TYPE_DEFAULT, "\"Device has a local secret, prompting via CDP UI provider\", buf, 2u);
  }

  v12 = objc_alloc(MEMORY[0x24BDFC2A0]);
  v13 = (void *)objc_msgSend(v12, "initWithEventName:eventCategory:initData:", *MEMORY[0x24BE1A6C8], *MEMORY[0x24BE1A860], 0);
  objc_msgSend(v9, "uiProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "repairContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke;
  v18[3] = &unk_24C854190;
  v19 = v13;
  v20 = self;
  v21 = v8;
  v16 = v8;
  v17 = v13;
  objc_msgSend(v14, "cdpContext:promptForLocalSecretWithCompletion:", v15, v18);

}

void __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v8, OS_LOG_TYPE_DEFAULT, "\"Validated local secret successfully\", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1A640]);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE1A640]);
    objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v6);
  }
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEvent:", *(_QWORD *)(a1 + 32));

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_44;
  v14[3] = &unk_24C854D50;
  v10 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v16 = v6;
  v17 = v11;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v10, "_presentSpinnerViewControllerWithCompletion:", v14);

}

void __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_44(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  if (a1[6])
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_2;
      block[3] = &unk_24C854D50;
      v5 = a1[6];
      v3 = a1[4];
      v4 = a1[5];
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
}

uint64_t __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_createLocalSecretForContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  CDPUIDeviceToDeviceEncryptionCreatePasscodeViewModel *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CDPUIDeviceToDeviceEncryptionHelper *v20;
  void (**v21)(id, _QWORD, void *);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[CDPUIDeviceToDeviceEncryptionHelper _hasLocalSecret](self, "_hasLocalSecret"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", 5094);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);

  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v9, OS_LOG_TYPE_DEFAULT, "\"Device does not have a local secret, showing secret creation flow\", buf, 2u);
    }

    v10 = objc_alloc(MEMORY[0x24BDFC2A0]);
    v11 = (void *)objc_msgSend(v10, "initWithEventName:eventCategory:initData:", *MEMORY[0x24BE1A6C8], *MEMORY[0x24BE1A860], 0);
    v12 = -[CDPUIDeviceToDeviceEncryptionMessagingViewModel initWithContext:is2FA:hasLocalSecret:]([CDPUIDeviceToDeviceEncryptionCreatePasscodeViewModel alloc], "initWithContext:is2FA:hasLocalSecret:", v6, 1, 0);
    -[CDPUIDeviceToDeviceEncryptionHelper _navigationController](self, "_navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDPUIDeviceToDeviceEncryptionPasscodeController passcodeControllerWithPresenter:vm:](CDPUIDeviceToDeviceEncryptionPasscodeController, "passcodeControllerWithPresenter:vm:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setDelegate:", self);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke;
    v17[3] = &unk_24C854DF0;
    v18 = v14;
    v19 = v11;
    v20 = self;
    v21 = v7;
    v15 = v11;
    v16 = v14;
    objc_msgSend(v16, "createPasscodeStateWithCompletion:", v17);

  }
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v8, OS_LOG_TYPE_DEFAULT, "\"Created local secret successfully\", buf, 2u);
    }

    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1A640]);
    objc_msgSend(a1[6], "_postBiometricFollowUp");
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_cold_2();

    objc_msgSend(a1[6], "followUpProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteCreatePasscodeFollowUp");

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__CDPUIController__handleResetActionWithCompletion___block_invoke_cold_1();

    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE1A640]);
    objc_msgSend(a1[5], "populateUnderlyingErrorsStartingWithRootError:", v6);
  }
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:", a1[5]);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_47;
  v16[3] = &unk_24C854D50;
  v12 = a1[6];
  v13 = a1[7];
  v18 = v6;
  v19 = v13;
  v17 = v5;
  v14 = v6;
  v15 = v5;
  objc_msgSend(v12, "_presentSpinnerViewControllerWithCompletion:", v16);

}

void __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_47(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  if (a1[6])
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_2;
      block[3] = &unk_24C854D50;
      v5 = a1[6];
      v3 = a1[4];
      v4 = a1[5];
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
}

uint64_t __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_presentIneligibilityAlertForFlowContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  CDPUIDeviceToDeviceEncryptionIneligibilityAlertViewModel *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = -[CDPUIDeviceToDeviceEncryptionHelper _newUpgradeUIProvider](self, "_newUpgradeUIProvider");
  v9 = -[CDPUIDeviceToDeviceEncryptionMessagingViewModel initWithContext:is2FA:hasLocalSecret:]([CDPUIDeviceToDeviceEncryptionIneligibilityAlertViewModel alloc], "initWithContext:is2FA:hasLocalSecret:", v7, 0, 0);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__CDPUIDeviceToDeviceEncryptionHelper__presentIneligibilityAlertForFlowContext_completion___block_invoke;
  v12[3] = &unk_24C8544F8;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v11, "promptIneligibilityWithContext:vm:completion:", v7, v9, v12);

}

uint64_t __91__CDPUIDeviceToDeviceEncryptionHelper__presentIneligibilityAlertForFlowContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_requestPermissionToCreatePasscodeForFlowContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  CDPUIDeviceToDeviceEncryptionCancelCreateViewModel *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, uint64_t);
  _QWORD block[4];
  void (**v15)(id, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (objc_msgSend(v6, "deviceToDeviceEncryptionUpgradeType") == 1
    || -[CDPUIDeviceToDeviceEncryptionHelper _hasLocalSecret](self, "_hasLocalSecret")
    || objc_msgSend(v6, "shouldSuppressPasscodeCreationCancelPrompt"))
  {
    if (v7)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v7[2](v7, 1);
      }
      else
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke;
        block[3] = &unk_24C854368;
        v15 = v7;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }
  }
  else
  {
    v8 = -[CDPUIDeviceToDeviceEncryptionHelper _newUpgradeUIProvider](self, "_newUpgradeUIProvider");
    v9 = -[CDPUIDeviceToDeviceEncryptionMessagingViewModel initWithContext:is2FA:hasLocalSecret:]([CDPUIDeviceToDeviceEncryptionCancelCreateViewModel alloc], "initWithContext:is2FA:hasLocalSecret:", v6, 0, 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke_2;
    v11[3] = &unk_24C8544F8;
    v12 = v8;
    v13 = v7;
    v10 = v8;
    objc_msgSend(v10, "promptForCancelWithContext:vm:completion:", v6, v9, v11);

  }
}

uint64_t __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke_3;
      v6[3] = &unk_24C854DC8;
      v7 = *(id *)(a1 + 40);
      v8 = a2;
      dispatch_async(MEMORY[0x24BDAC9B8], v6);

    }
  }

}

uint64_t __99__CDPUIDeviceToDeviceEncryptionHelper__requestPermissionToCreatePasscodeForFlowContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_legacyRequestPermissionToContinueFlowWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  -[CDPUIDeviceToDeviceEncryptionHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_2;
    v8[3] = &unk_24C854E18;
    v9 = v4;
    objc_msgSend(v5, "deviceToDeviceEncryptionHelper:shouldContinueUpgradingUserToHSA2WithCompletion:", self, v8);
    v6 = v9;
LABEL_9:

    goto LABEL_10;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v7, OS_LOG_TYPE_DEFAULT, "\"No delegate for requesting permission, continuing encryption upgrade\", buf, 2u);
  }

  if (v4)
  {
    if (!objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke;
      block[3] = &unk_24C854368;
      v11 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v6 = v11;
      goto LABEL_9;
    }
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }
LABEL_10:

}

uint64_t __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[16];

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v4, OS_LOG_TYPE_DEFAULT, "\"Permission to continue upgrading received, continuing encryption upgrade\", buf, 2u);
    }

    if (*(_QWORD *)(a1 + 32))
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        return;
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_52;
      block[3] = &unk_24C854368;
      v12 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v8 = v12;
LABEL_14:

    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DC8F000, v4, OS_LOG_TYPE_DEFAULT, "\"D2D encryption helper requested the flow to not proceed, cancelling the upgrade\", buf, 2u);
    }

    if (*(_QWORD *)(a1 + 32))
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        v6 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5307);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

        return;
      }
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_53;
      v9[3] = &unk_24C854368;
      v10 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], v9);
      v8 = v10;
      goto LABEL_14;
    }
  }
}

uint64_t __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__CDPUIDeviceToDeviceEncryptionHelper__legacyRequestPermissionToContinueFlowWithCompletion___block_invoke_53(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5307);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_presentSpinnerViewControllerWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  v6 = -[CDPUIDeviceToDeviceEncryptionHelper _newSpinnerViewController](self, "_newSpinnerViewController");
  -[CDPUIDeviceToDeviceEncryptionHelper _navigationController](self, "_navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  v4[2](v4);
}

- (id)_authenticationContextForFlowContext:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BE0ACB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAltDSID:", v6);
  return v5;
}

- (id)_inAppAuthenticationContextForFlowContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authKitAccountWithAltDSID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend(v7, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsername:", v9);

  v10 = (void *)MEMORY[0x24BE1A458];
  v11 = CFSTR("D2DENCRYPTION_AUTH_TITLE");
  if ((objc_msgSend(CFSTR("D2DENCRYPTION_AUTH_TITLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("D2DENCRYPTION_AUTH_TITLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
  }
  objc_msgSend(v10, "builderForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v14);

  if (v12)
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("D2DENCRYPTION_AUTH_MESSAGE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "username");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@"), 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReason:", v19);

  objc_msgSend(v4, "altDSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAltDSID:", v20);

  objc_msgSend(v8, "setAuthenticationType:", 0);
  objc_msgSend(v8, "setAnticipateEscrowAttempt:", 1);
  objc_msgSend(v8, "setIsUsernameEditable:", 0);
  objc_msgSend(v8, "setSupportsPiggybacking:", 1);
  objc_msgSend(v8, "setShouldOfferSecurityUpgrade:", 1);
  objc_msgSend(v4, "telemetryFlowID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "telemetryFlowID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTelemetryFlowID:", v22);

  }
  objc_msgSend(v4, "securityUpgradeContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BE0AC50]);

  if (v24)
  {
    objc_msgSend(v8, "setSecurityUpgradeContext:", *MEMORY[0x24BE0AC58]);
  }
  else
  {
    objc_msgSend(v4, "securityUpgradeContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSecurityUpgradeContext:", v25);

  }
  objc_msgSend(v8, "setForceInlinePresentation:", 1);
  -[CDPUIDeviceToDeviceEncryptionHelper _navigationController](self, "_navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentingViewController:", v26);

  return v8;
}

- (id)_authenticationController
{
  return self->_authenticationController;
}

- (id)_newUpgradeUIProvider
{
  return objc_alloc_init(CDPUIDeviceToDeviceEncryptionUIProviderImp);
}

- (id)_presentingViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[CDPUIDeviceToDeviceEncryptionHelper presentingViewController](self, "presentingViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_presentingNavigationController
{
  void *v2;
  void *v3;
  id v4;

  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_navigationController
{
  return self->_navigationController;
}

- (void)_configureNavigationController
{
  void *v3;
  void *v4;
  UINavigationController *v5;
  UINavigationController *navigationController;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  UINavigationController *v13;
  UINavigationController *v14;
  void *v15;
  void *v16;
  id obj;

  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "forceInlinePresentation") & 1) != 0)
  {
    -[CDPUIDeviceToDeviceEncryptionHelper _presentingNavigationController](self, "_presentingNavigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CDPUIDeviceToDeviceEncryptionHelper _presentingNavigationController](self, "_presentingNavigationController");
      v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
      navigationController = self->_navigationController;
      self->_navigationController = v5;

      -[UINavigationController topViewController](self->_navigationController, "topViewController");
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_initialTopViewController, obj);
      goto LABEL_11;
    }
  }
  else
  {

  }
  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "deviceToDeviceEncryptionUpgradeUIStyle"))
  {

    goto LABEL_10;
  }
  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceToDeviceEncryptionUpgradeUIStyle");

  if (v9 == 3)
  {
LABEL_10:
    v11 = objc_alloc(MEMORY[0x24BEBD7A0]);
    v12 = -[CDPUIDeviceToDeviceEncryptionHelper _newSpinnerViewController](self, "_newSpinnerViewController");
    v13 = (UINavigationController *)objc_msgSend(v11, "initWithRootViewController:", v12);
    v14 = self->_navigationController;
    self->_navigationController = v13;

    -[UINavigationController navigationItem](self->_navigationController, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidesBackButton:", 1);

    -[UINavigationController transitionCoordinator](self->_navigationController, "transitionCoordinator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "animateAlongsideTransition:completion:", &__block_literal_global_0, &__block_literal_global_76);
    -[CDPUIDeviceToDeviceEncryptionHelper _presentingViewController](self, "_presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", self->_navigationController, 1, 0);

    goto LABEL_11;
  }
  -[CDPUIDeviceToDeviceEncryptionHelper _presentingViewController](self, "_presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_navigationController, obj);
LABEL_11:

}

void __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke()
{
  NSObject *v0;

  _CDPLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_cold_1();

}

void __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_75()
{
  NSObject *v0;

  _CDPLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_75_cold_1();

}

- (void)_dismissNavigationControllerWithCompletion:(id)a3
{
  void *v4;
  int v5;
  UIViewController **p_initialTopViewController;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a3;
  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "forceInlinePresentation");

  if (v5)
  {
    p_initialTopViewController = &self->_initialTopViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_initialTopViewController);

    if (WeakRetained)
    {
      -[CDPUIDeviceToDeviceEncryptionHelper _navigationController](self, "_navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)p_initialTopViewController);
      v10 = (id)objc_msgSend(v8, "popToViewController:animated:", v9, 0);

    }
    goto LABEL_6;
  }
  -[CDPUIDeviceToDeviceEncryptionHelper _presentingViewController](self, "_presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_6:
    v13[2]();
    goto LABEL_7;
  }
  -[CDPUIDeviceToDeviceEncryptionHelper _presentingViewController](self, "_presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v13);

LABEL_7:
}

- (id)_stateControllerForFlowContext:(id)a3 withAuthenticationResults:(id)a4
{
  void *v5;
  void *v6;

  -[CDPUIDeviceToDeviceEncryptionHelper _repairContextForFlowContext:withAuthenticationResults:](self, "_repairContextForFlowContext:withAuthenticationResults:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIDeviceToDeviceEncryptionHelper _stateControllerWithRepairContext:](self, "_stateControllerWithRepairContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_repairContextForFlowContext:(id)a3 withAuthenticationResults:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BE1A3F8];
  v7 = a3;
  if (v5)
  {
    v8 = objc_msgSend([v6 alloc], "initWithAuthenticationResults:", v5);
  }
  else
  {
    -[objc_class contextForPrimaryAccount](v6, "contextForPrimaryAccount");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  v10 = objc_msgSend(v7, "requiresSynchronousRepair");

  objc_msgSend(v9, "set_disableAsyncSecureBackupEnrollment:", v10);
  return v9;
}

- (id)_stateControllerWithRepairContext:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  CDPUIController *v7;
  void *v8;
  CDPUIController *v9;

  v4 = (objc_class *)MEMORY[0x24BE1A490];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContext:", v5);

  v7 = [CDPUIController alloc];
  -[CDPUIDeviceToDeviceEncryptionHelper _navigationController](self, "_navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CDPUIBaseController initWithPresentingViewController:](v7, "initWithPresentingViewController:", v8);

  -[CDPUIController setForceInlinePresentation:](v9, "setForceInlinePresentation:", 1);
  objc_msgSend(v6, "setUiProvider:", v9);

  return v6;
}

- (id)_cdpErrorWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1A368]),
        v5,
        !v6))
  {
    if ((objc_msgSend(v4, "ak_isUserCancelError") & 1) != 0
      || (objc_msgSend(v4, "ak_isAuthenticationErrorWithCode:", -7064) & 1) != 0)
    {
      v8 = -5307;
    }
    else if (objc_msgSend(v4, "ak_isUserSkippedError"))
    {
      v8 = -5308;
    }
    else
    {
      v8 = 5901;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", v8, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v9 = v7;

  return v9;
}

- (BOOL)_hasLocalSecret
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLocalSecret");

  return v3;
}

- (BOOL)_hasManatee
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BE1A460]);
  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdpContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithContext:", v5);

  LOBYTE(v4) = objc_msgSend(v6, "isManateeAvailable:", 0);
  return (char)v4;
}

- (BOOL)_inCircle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BE1A3E8]);
  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cdpContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithContext:", v5);

  LOBYTE(v4) = objc_msgSend(v6, "combinedCachedCircleStatus:", 0) == 1;
  return (char)v4;
}

+ (id)_newLegacyFlowContext
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(a1, "_newLegacyFlowContextWithContext:", v3);

  return v4;
}

+ (id)_newLegacyFlowContextForAltDSID:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForAccountWithAltDSID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(a1, "_newLegacyFlowContextWithContext:", v4);

  return v5;
}

+ (id)_newLegacyFlowContextWithContext:(id)a3
{
  id v3;
  CDPUIDeviceToDeviceEncryptionFlowContext *v4;

  v3 = a3;
  v4 = -[CDPUIDeviceToDeviceEncryptionFlowContext initWithCDPContext:]([CDPUIDeviceToDeviceEncryptionFlowContext alloc], "initWithCDPContext:", v3);

  -[CDPUIDeviceToDeviceEncryptionFlowContext setDeviceToDeviceEncryptionUpgradeUIStyle:](v4, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 3);
  -[CDPUIDeviceToDeviceEncryptionFlowContext setDeviceToDeviceEncryptionUpgradeType:](v4, "setDeviceToDeviceEncryptionUpgradeType:", 0);
  return v4;
}

- (void)_postBiometricFollowUp
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[16];

  _CDPLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20DC8F000, v2, OS_LOG_TYPE_DEFAULT, "\"Posting biometric follow up.\", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BE1A428], "contextForSettingUpBiometrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BE1A430]);
  objc_msgSend(v4, "postFollowUpWithContext:error:", v3, 0);

}

- (id)_newSpinnerViewController
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  __CFString *v6;
  int v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v2 = (void *)getAAUISpinnerViewControllerClass_softClass;
  v14 = getAAUISpinnerViewControllerClass_softClass;
  if (!getAAUISpinnerViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getAAUISpinnerViewControllerClass_block_invoke;
    v10[3] = &unk_24C854C48;
    v10[4] = &v11;
    __getAAUISpinnerViewControllerClass_block_invoke((uint64_t)v10);
    v2 = (void *)v12[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v11, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("UPDATING_APPLE_ID_LABEL");
  if ((objc_msgSend(CFSTR("UPDATING_APPLE_ID_LABEL"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("UPDATING_APPLE_ID_LABEL"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v8);

  if (v7)
  objc_msgSend(v4, "setSpinning:", 1);
  return v4;
}

- (void)localSecretValidationCanCancelWithViewController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CDPUIDeviceToDeviceEncryptionHelper context](self, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CDPUIDeviceToDeviceEncryptionHelper _requestPermissionToCreatePasscodeForFlowContext:completion:](self, "_requestPermissionToCreatePasscodeForFlowContext:completion:", v6, v5);

}

- (CDPUIDeviceToDeviceEncryptionFlowContext)context
{
  return self->_context;
}

- (CDPLocalSecretFollowUpProvider)followUpProvider
{
  return self->_followUpProvider;
}

- (void)setFollowUpProvider:(id)a3
{
  objc_storeStrong((id *)&self->_followUpProvider, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (CDPUIDeviceToDeviceEncryptionHelperDelegate)delegate
{
  return (CDPUIDeviceToDeviceEncryptionHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_followUpProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_initialTopViewController);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
}

void __96__CDPUIDeviceToDeviceEncryptionHelper_performDeviceToDeviceEncryptionStateRepairWithCompletion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Failed to determine upgrade eligibility with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __82__CDPUIDeviceToDeviceEncryptionHelper__continueUpgradeFlowWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Authentication for upgrade failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __117__CDPUIDeviceToDeviceEncryptionHelper__continueAuthenticatedUpgradeFlowWithContext_authenticationResults_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Passcode creation failed with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __109__CDPUIDeviceToDeviceEncryptionHelper__performAuthenticatedRepairFlowWithContext_stateController_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Failed to repair CDP state with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_determineUpgradeEligibilityForContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Context does not have altDSID\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_determineUpgradeEligibilityForContext:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_20DC8F000, v0, v1, "\"Account upgrade is not allowed on a demo device\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __97__CDPUIDeviceToDeviceEncryptionHelper__determineSecurityUpgradeEligibilityForContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Account is not eligible for HSA2 upgrade: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __101__CDPUIDeviceToDeviceEncryptionHelper__validateLocalSecretForContext_withStateController_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_20DC8F000, v0, v1, "\"Failed to validate local secret with error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __79__CDPUIDeviceToDeviceEncryptionHelper__createLocalSecretForContext_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Trying to delete walrus create passcode followup, if present\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Animating push event\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__CDPUIDeviceToDeviceEncryptionHelper__configureNavigationController__block_invoke_75_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20DC8F000, v0, v1, "\"Finished pushing spinner view controller\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
