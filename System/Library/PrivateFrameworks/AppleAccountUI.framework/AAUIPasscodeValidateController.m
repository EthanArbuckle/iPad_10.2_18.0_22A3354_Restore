@implementation AAUIPasscodeValidateController

+ (id)stingrayControllerWithPresenter:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "stingrayControllerWithPresenter:forceInline:", v4, objc_opt_isKindOfClass() & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stingrayControllerWithPresenter:(id)a3 forceInline:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "creating controller with inline forced: %@", (uint8_t *)&v15, 0xCu);

  }
  v8 = objc_alloc_init((Class)objc_opt_class());
  +[AAUICDPHelper helperWithPresenter:](AAUICDPHelper, "helperWithPresenter:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v9;

  if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  objc_msgSend(*((id *)v8 + 1), "setForceInline:", isKindOfClass & 1);
  *((_DWORD *)v8 + 10) = 0;
  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v13);

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "AAUIPasscodeValidateController dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AAUIPasscodeValidateController;
  -[AAUIPasscodeValidateController dealloc](&v4, sel_dealloc);
}

- (id)passcodeValidationCompletion
{
  os_unfair_lock_s *p_completionLock;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  AAUIPasscodeValidateController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *(*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  p_completionLock = &self->_completionLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __62__AAUIPasscodeValidateController_passcodeValidationCompletion__block_invoke;
  v8 = &unk_1EA2DD498;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_completionLock);
  v7((uint64_t)v3);

  os_unfair_lock_unlock(p_completionLock);
  v4 = _Block_copy((const void *)v12[5]);
  _Block_object_dispose(&v11, 8);

  return v4;
}

void __62__AAUIPasscodeValidateController_passcodeValidationCompletion__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPasscodeValidationCompletion:(id)a3
{
  id v4;
  os_unfair_lock_s *p_completionLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_completionLock = &self->_completionLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__AAUIPasscodeValidateController_setPasscodeValidationCompletion___block_invoke;
  v7[3] = &unk_1EA2DB138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_completionLock);
  __66__AAUIPasscodeValidateController_setPasscodeValidationCompletion___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_completionLock);

}

void __66__AAUIPasscodeValidateController_setPasscodeValidationCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (void)validateStingrayPasscodeStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Passcode validation was requested", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__AAUIPasscodeValidateController_validateStingrayPasscodeStateWithCompletion___block_invoke;
  v7[3] = &unk_1EA2DD4C0;
  v8 = v4;
  v6 = v4;
  -[AAUIPasscodeValidateController validatePasscodeStateWithCompletion:](self, "validatePasscodeStateWithCompletion:", v7);

}

uint64_t __78__AAUIPasscodeValidateController_validateStingrayPasscodeStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)validatePasscodeStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Passcode validation was requested", buf, 2u);
  }

  -[AAUIPasscodeValidateController passcodeValidationCompletion](self, "passcodeValidationCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Passcode Creation/Validation in progress.", v10, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4405);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);

  }
  else
  {
    -[AAUIPasscodeValidateController setPasscodeValidationCompletion:](self, "setPasscodeValidationCompletion:", v4);
    if (objc_msgSend(MEMORY[0x1E0D15770], "hasLocalSecret"))
      v9 = 3;
    else
      v9 = 0;
    -[AAUIPasscodeValidateController _showPasscodePromptWithMode:](self, "_showPasscodePromptWithMode:", v9);
  }

}

- (void)createPasscodeStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD, void *))a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Create passcode was requested", buf, 2u);
  }

  -[AAUIPasscodeValidateController passcodeValidationCompletion](self, "passcodeValidationCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Passcode Creation/Validation in progress.", v9, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4405);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);

  }
  else
  {
    -[AAUIPasscodeValidateController setPasscodeValidationCompletion:](self, "setPasscodeValidationCompletion:", v4);
    -[AAUIPasscodeValidateController _showPasscodePromptWithMode:](self, "_showPasscodePromptWithMode:", 0);
  }

}

- (void)_showPasscodePromptWithMode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  AAUIDevicePINController *v6;
  AAUIDevicePINController *pinController;
  AAUIDevicePINController *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Showing passcode collection with mode: %d", (uint8_t *)v11, 8u);
  }

  -[AAUIPasscodeValidateController _setupNavController](self, "_setupNavController");
  v6 = objc_alloc_init(AAUIDevicePINController);
  pinController = self->_pinController;
  self->_pinController = v6;

  if (!(_DWORD)v3)
    -[DevicePINController setAllowOptionsButton:](self->_pinController, "setAllowOptionsButton:", 1);
  -[DevicePINController setShouldDismissWhenDone:](self->_pinController, "setShouldDismissWhenDone:", 0);
  v8 = self->_pinController;
  -[AAUIPasscodeValidateController _specifierForMode:](self, "_specifierForMode:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicePINController setSpecifier:](v8, "setSpecifier:", v9);

  -[PSSetupController showController:](self->_navController, "showController:", self->_pinController);
  -[AAUIPasscodeValidateController _presentingViewController](self, "_presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", self->_navController, 1, 0);

}

- (id)_presentingViewController
{
  return -[AAUICDPHelper presentingViewController](self->_helper, "presentingViewController");
}

- (void)_setupNavController
{
  PSSetupController *navController;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  PSSetupController *v9;
  id v10;

  navController = self->_navController;
  self->_navController = 0;

  v4 = objc_alloc_init(MEMORY[0x1E0D804E0]);
  -[AAUIPasscodeValidateController _presentingViewController](self, "_presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AAUIPasscodeValidateController _presentingViewController](self, "_presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootController:", v8);

  }
  v9 = self->_navController;
  self->_navController = (PSSetupController *)v4;
  v10 = v4;

  -[PSSetupController setModalInPresentation:](self->_navController, "setModalInPresentation:", 1);
}

- (id)_specifierForMode:(int)a3
{
  uint64_t v3;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("CDPSecretValidation"), 0, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v7, *MEMORY[0x1E0D808F0]);

  objc_msgSend(v5, "setEditPaneClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v8, CFSTR("mode"));

  objc_msgSend(v5, "setProperty:forKey:", self, *MEMORY[0x1E0D809C8]);
  return v5;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Passcode accepted, proceeding", v8, 2u);
  }

  if (-[DevicePINController simplePIN](self->_pinController, "simplePIN"))
    v6 = 2;
  else
    v6 = 3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15778]), "initWithValidatedSecret:secretType:", v4, v6);

  -[AAUIPasscodeValidateController dismissFlowWithLocalSecret:error:](self, "dismissFlowWithLocalSecret:error:", v7, 0);
}

- (void)dismissFlowWithLocalSecret:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AAUICDPHelper presentingViewController](self->_helper, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__AAUIPasscodeValidateController_dismissFlowWithLocalSecret_error___block_invoke;
  v11[3] = &unk_1EA2DB818;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v11);

}

void __67__AAUIPasscodeValidateController_dismissFlowWithLocalSecret_error___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "passcodeValidationCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "passcodeValidationCompletion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "setPasscodeValidationCompletion:", 0);
  }
}

- (void)didCancelEnteringPIN
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Passcode entry cancelled, stopping the flow", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIPasscodeValidateController dismissFlowWithLocalSecret:error:](self, "dismissFlowWithLocalSecret:error:", 0, v4);

}

- (void)devicePINController:(id)a3 didFailToSetPinWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Passcode accepted, proceeding", v7, 2u);
  }

  -[AAUIPasscodeValidateController dismissFlowWithLocalSecret:error:](self, "dismissFlowWithLocalSecret:error:", 0, v5);
}

- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v5 = a4;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Detected passcode set accepted", buf, 2u);
  }

  if (v5)
  {
    if (-[DevicePINController simplePIN](self->_pinController, "simplePIN"))
      v7 = 2;
    else
      v7 = 3;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15778]), "initWithValidatedSecret:secretType:", v5, v7);
    -[AAUIPasscodeValidateController dismissFlowWithLocalSecret:error:](self, "dismissFlowWithLocalSecret:error:", v8, 0);
  }
  else
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Passcode was accepted, but it was not set, initiate revalidation", v10, 2u);
    }

    -[AAUIPasscodeValidateController passcodeValidationCompletion](self, "passcodeValidationCompletion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIPasscodeValidateController validatePasscodeStateWithCompletion:](self, "validatePasscodeStateWithCompletion:", v8);
  }

}

- (void)devicePINController:(id)a3 canCancelWithCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v5 = (void (**)(id, uint64_t))a4;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Passcode entry cancel tapped. Check with delegate", v10, 2u);
  }

  -[AAUIPasscodeValidateController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[AAUIPasscodeValidateController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localSecretValidationCanCancelWithViewController:completion:", self->_navController, v5);

  }
  else
  {
    v5[2](v5, 1);
  }

}

- (AAUIPasscodeValidationDelegate)delegate
{
  return (AAUIPasscodeValidationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_passcodeValidationCompletion, 0);
  objc_storeStrong((id *)&self->_pinController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end
