@implementation FACreateChildController

- (FACreateChildController)initWithAppleAccount:(id)a3
{
  id v5;
  FACreateChildController *v6;
  FACreateChildController *v7;

  v5 = a3;
  v6 = -[FACreateChildController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appleAccount, a3);

  return v7;
}

- (void)createChildAccountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[FACreateChildController _setupPresentedViewController](self, "_setupPresentedViewController");
  -[FACreateChildController _createChildAuthContext](self, "_createChildAuthContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__FACreateChildController_createChildAccountWithCompletion___block_invoke;
  v8[3] = &unk_24C88BF18;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "authenticateWithContext:completion:", v5, v8);

}

void __60__FACreateChildController_createChildAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "repairChildAccountWithAuthenticationResults:completion:", v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_23;
    v10[3] = &unk_24C88BEF0;
    v9 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v11 = v6;
    objc_msgSend(v9, "_dismissPresentedViewControllerWithCompletion:", v10);

  }
}

void __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_23(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fa_familyErrorWithCode:underlyingError:", -1006, *(_QWORD *)(a1 + 32));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

- (void)repairChildAccountWithAuthenticationResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  FACircleStateController *v23;
  _QWORD aBlock[4];
  id v25;

  v6 = a3;
  v7 = a4;
  -[FACreateChildController _setupPresentedViewController](self, "_setupPresentedViewController");
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FACreateChildController repairChildAccountWithAuthenticationResults:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke;
  aBlock[3] = &unk_24C88BF40;
  v10 = v7;
  v25 = v10;
  v11 = _Block_copy(aBlock);
  -[FACreateChildController _repairFAContextWithAuthResults:](self, "_repairFAContextWithAuthResults:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = -[FACircleStateController initWithPresenter:]([FACircleStateController alloc], "initWithPresenter:", self->_navController);
  v13 = (void *)v19[5];
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_29;
  v15[3] = &unk_24C88BFE0;
  v17 = &v18;
  v15[4] = self;
  v14 = v11;
  v16 = v14;
  objc_msgSend(v13, "performOperationWithContext:completion:", v12, v15);

  _Block_object_dispose(&v18, 8);
}

uint64_t __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_29(_QWORD *a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_29_cold_1(a2, (uint64_t)v5, v8);

  v9 = (void *)MEMORY[0x24BE30A58];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_35;
  v11[3] = &unk_24C88BFB8;
  v10 = (void *)a1[5];
  v11[4] = a1[4];
  v12 = v10;
  v13 = a2;
  objc_msgSend(v9, "handleDidSetupFamilyWithCompletion:", v11);

}

void __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_2;
  v8[3] = &unk_24C88BF90;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = v5;
  v11 = *(_BYTE *)(a1 + 48);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_3;
  v3[3] = &unk_24C88BF68;
  v5 = *(id *)(a1 + 48);
  v6 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_dismissPresentedViewControllerWithCompletion:", v3);

}

uint64_t __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (id)_createChildAuthContext
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  -[ACAccount aa_altDSID](self->_appleAccount, "aa_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAltDSID:", v4);

  -[ACAccount username](self->_appleAccount, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsername:", v5);

  objc_msgSend(v3, "setIsUsernameEditable:", 0);
  objc_msgSend(v3, "setNeedsNewChildAccount:", 1);
  objc_msgSend(v3, "setAppProvidedContext:", CFSTR("parent"));
  objc_msgSend(v3, "setServiceType:", 1);
  objc_msgSend(v3, "setPresentingViewController:", self->_navController);
  objc_msgSend(v3, "setForceInlinePresentation:", 1);
  return v3;
}

- (void)_setupPresentedViewController
{
  FANavigationController *v3;
  FANavigationController *navController;
  FANavigationController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (!self->_navController)
  {
    v3 = objc_alloc_init(FANavigationController);
    navController = self->_navController;
    self->_navController = v3;

    -[FANavigationController setFamilyDelegate:](self->_navController, "setFamilyDelegate:", self);
    v5 = self->_navController;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v8 = 2;
    else
      v8 = -2;
    -[FANavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", v8);
  }
}

- (void)_dismissPresentedViewControllerWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[FANavigationController presentingViewController](self->_navController, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__FACreateChildController__dismissPresentedViewControllerWithCompletion___block_invoke;
    v6[3] = &unk_24C88C008;
    v6[4] = self;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
  else
  {
    v4[2](v4);
  }

}

void __73__FACreateChildController__dismissPresentedViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __73__FACreateChildController__dismissPresentedViewControllerWithCompletion___block_invoke_2;
  v3[3] = &unk_24C88BDB8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t __73__FACreateChildController__dismissPresentedViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_repairFAContextWithAuthResults:(id)a3
{
  id v4;
  FACircleContext *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeFamilyRepair"));
  -[FACreateChildController _repairParametersFromAuthResults:](self, "_repairParametersFromAuthResults:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACircleContext setAdditionalParameters:](v5, "setAdditionalParameters:", v6);

  -[FACreateChildController _repairAuthContextWithAuthResults:](self, "_repairAuthContextWithAuthResults:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FACircleContext setAuthContext:](v5, "setAuthContext:", v7);
  return v5;
}

- (id)_repairParametersFromAuthResults:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = *MEMORY[0x24BE0AB70];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("memberId"));
  }
  else
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FACreateChildController _repairParametersFromAuthResults:].cold.3();
  }

  v8 = *MEMORY[0x24BE0AB48];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("altDSID"));
  }
  else
  {
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FACreateChildController _repairParametersFromAuthResults:].cold.2();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB98]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE060B8];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE060B8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v12);
  }
  else
  {
    _FALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FACreateChildController _repairParametersFromAuthResults:].cold.1();
  }

  return v4;
}

- (id)_repairAuthContextWithAuthResults:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BE0ACB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setNeedsNewAppleID:", 1);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUsername:", v6);
  return v5;
}

- (void)navigationController:(id)a3 didPresentInitialViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  objc_msgSend(v5, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[FACreateChildController presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __80__FACreateChildController_navigationController_didPresentInitialViewController___block_invoke;
    v8[3] = &unk_24C88B7F0;
    v8[4] = self;
    objc_msgSend(v7, "presentViewController:animated:completion:", v5, 1, v8);

  }
}

void __80__FACreateChildController_navigationController_didPresentInitialViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createChildControllerDidPresentInitialViewController:", *(_QWORD *)(a1 + 32));

}

- (void)navigationController:(id)a3 presentViewController:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];

  v5 = a4;
  -[FACreateChildController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__FACreateChildController_navigationController_presentViewController___block_invoke;
  v7[3] = &unk_24C88B7F0;
  v7[4] = self;
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, v7);

}

void __70__FACreateChildController_navigationController_presentViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createChildControllerDidPresentInitialViewController:", *(_QWORD *)(a1 + 32));

}

- (FACreateChildControllerDelegate)delegate
{
  return (FACreateChildControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccount, a3);
}

- (FANavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
  objc_storeStrong((id *)&self->_navController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

void __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "Failed to creating new child account %@", (uint8_t *)&v2, 0xCu);
}

void __60__FACreateChildController_createChildAccountWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_20DE41000, v0, v1, "Successfully created the child account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)repairChildAccountWithAuthenticationResults:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_20DE41000, v0, v1, "Starting child account repair flow.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __82__FACreateChildController_repairChildAccountWithAuthenticationResults_completion___block_invoke_29_cold_1(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("YES");
  if ((a1 & 1) == 0)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_20DE41000, log, OS_LOG_TYPE_DEBUG, "Child account repair flow %@ error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)_repairParametersFromAuthResults:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, v0, v1, "child account repair Family GS token was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_repairParametersFromAuthResults:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, v0, v1, "child account repair altDSID was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_repairParametersFromAuthResults:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, v0, v1, "child account repair memberId/AKAuthenticationDSIDKey was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
