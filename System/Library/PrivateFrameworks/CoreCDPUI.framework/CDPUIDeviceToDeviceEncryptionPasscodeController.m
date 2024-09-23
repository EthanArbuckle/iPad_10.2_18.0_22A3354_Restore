@implementation CDPUIDeviceToDeviceEncryptionPasscodeController

+ (id)passcodeControllerWithPresenter:(id)a3 vm:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[1];
  v7[1] = v5;
  v9 = v5;

  v10 = (void *)v7[5];
  v7[5] = v6;

  return v7;
}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_DEBUG, "\"CDPUIDeviceToDeviceEncryptionPasscodeController %p deallocated\", (uint8_t *)&v2, 0xCu);
}

- (id)passcodeValidationCompletion
{
  os_unfair_lock_s *p_completionLock;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  CDPUIDeviceToDeviceEncryptionPasscodeController *v9;
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
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  p_completionLock = &self->_completionLock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = __79__CDPUIDeviceToDeviceEncryptionPasscodeController_passcodeValidationCompletion__block_invoke;
  v8 = &unk_24C8551B8;
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

void __79__CDPUIDeviceToDeviceEncryptionPasscodeController_passcodeValidationCompletion__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 24));
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__CDPUIDeviceToDeviceEncryptionPasscodeController_setPasscodeValidationCompletion___block_invoke;
  v7[3] = &unk_24C854480;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_completionLock);
  __83__CDPUIDeviceToDeviceEncryptionPasscodeController_setPasscodeValidationCompletion___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_completionLock);

}

void __83__CDPUIDeviceToDeviceEncryptionPasscodeController_setPasscodeValidationCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (void)createPasscodeStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  BFFPasscodeViewController *v7;
  BFFPasscodeViewController *passcodeViewController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  -[CDPUIDeviceToDeviceEncryptionPasscodeController setPasscodeValidationCompletion:](self, "setPasscodeValidationCompletion:", v4);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v5 = (void *)getBFFPasscodeViewControllerClass_softClass;
  v19 = getBFFPasscodeViewControllerClass_softClass;
  if (!getBFFPasscodeViewControllerClass_softClass)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __getBFFPasscodeViewControllerClass_block_invoke;
    v15[3] = &unk_24C854C48;
    v15[4] = &v16;
    __getBFFPasscodeViewControllerClass_block_invoke((uint64_t)v15);
    v5 = (void *)v17[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v16, 8);
  v7 = (BFFPasscodeViewController *)objc_alloc_init(v6);
  passcodeViewController = self->_passcodeViewController;
  self->_passcodeViewController = v7;

  -[BFFPasscodeViewController setPasscodeCreationDelegate:](self->_passcodeViewController, "setPasscodeCreationDelegate:", self);
  -[BFFPasscodeViewController view](self->_passcodeViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIDeviceToDeviceEncryptionMessagingViewModelProtocol title](self->_vm, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__userTappedCancel_);
  -[BFFPasscodeViewController navigationItem](self->_passcodeViewController, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:animated:", v11, 0);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIViewController pushViewController:animated:](self->_presentingViewController, "pushViewController:animated:", self->_passcodeViewController, 1);
  }
  else
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CDPUIDeviceToDeviceEncryptionPasscodeController createPasscodeStateWithCompletion:].cold.1(v13);

    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5004);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIDeviceToDeviceEncryptionPasscodeController dismissFlowWithLocalSecret:error:](self, "dismissFlowWithLocalSecret:error:", 0, v14);

  }
}

- (void)dismissFlowWithLocalSecret:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**v8)(id, id, id);

  v6 = a4;
  v7 = a3;
  -[CDPUIDeviceToDeviceEncryptionPasscodeController passcodeValidationCompletion](self, "passcodeValidationCompletion");
  v8 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v7, v6);

}

- (void)_userTappedCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DC8F000, v4, OS_LOG_TYPE_DEFAULT, "\"Cancel was tapped\", buf, 2u);
  }

  -[CDPUIDeviceToDeviceEncryptionPasscodeController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CDPUIDeviceToDeviceEncryptionPasscodeController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPasscodeViewController navigationController](self->_passcodeViewController, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__CDPUIDeviceToDeviceEncryptionPasscodeController__userTappedCancel___block_invoke;
    v9[3] = &unk_24C8551E0;
    v9[4] = self;
    objc_msgSend(v7, "localSecretValidationCanCancelWithViewController:completion:", v8, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5307);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIDeviceToDeviceEncryptionPasscodeController dismissFlowWithLocalSecret:error:](self, "dismissFlowWithLocalSecret:error:", 0, v7);
  }

}

void __69__CDPUIDeviceToDeviceEncryptionPasscodeController__userTappedCancel___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5307);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissFlowWithLocalSecret:error:", 0, v3);

  }
}

- (BOOL)passcodeViewControllerAllowSkip:(id)a3
{
  return 0;
}

- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3
{
  return (id)-[CDPUIDeviceToDeviceEncryptionMessagingViewModelProtocol message](self->_vm, "message", a3);
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  CDPUIDeviceToDeviceEncryptionPasscodeController *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "passcodeInputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v9 = (void *)getBFFSimplePasscodeInputViewClass_softClass;
    v20 = getBFFSimplePasscodeInputViewClass_softClass;
    if (!getBFFSimplePasscodeInputViewClass_softClass)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __getBFFSimplePasscodeInputViewClass_block_invoke;
      v16[3] = &unk_24C854C48;
      v16[4] = &v17;
      __getBFFSimplePasscodeInputViewClass_block_invoke((uint64_t)v16);
      v9 = (void *)v18[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v17, 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = 2;
    else
      v11 = 3;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A450]), "initWithValidatedSecret:secretType:", v7, v11);
    v13 = self;
    v14 = v12;
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5307);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self;
    v14 = 0;
    v15 = v12;
  }
  -[CDPUIDeviceToDeviceEncryptionPasscodeController dismissFlowWithLocalSecret:error:](v13, "dismissFlowWithLocalSecret:error:", v14, v15);

}

- (CDPUIDeviceToDeviceEncryptionPasscodeValidationDelegate)delegate
{
  return (CDPUIDeviceToDeviceEncryptionPasscodeValidationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vm, 0);
  objc_storeStrong(&self->_passcodeValidationCompletion, 0);
  objc_storeStrong((id *)&self->_passcodeViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

- (void)createPasscodeStateWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DC8F000, log, OS_LOG_TYPE_DEBUG, "\"CDPUIDeviceToDeviceEncryptionPasscodeController not supported in a non navigation stack\", v1, 2u);
}

@end
