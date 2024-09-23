@implementation FAShowFamilyScreenTimeHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:showFamilyScreenTime"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:showFamilyScreenTime"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[FAShowFamilyScreenTimeHook _showFamilyScreenTimeWithCompletion:](self, "_showFamilyScreenTimeWithCompletion:", a6, a4, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  -[FAShowFamilyScreenTimeHook _showFamilyScreenTimeWithCompletion:](self, "_showFamilyScreenTimeWithCompletion:", a4);
}

- (void)_showFamilyScreenTimeWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v8 = (void *)getSTFamilyCircleViewControllerProviderClass_softClass;
  v18 = getSTFamilyCircleViewControllerProviderClass_softClass;
  if (!getSTFamilyCircleViewControllerProviderClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getSTFamilyCircleViewControllerProviderClass_block_invoke;
    v14[3] = &unk_24C88B7B0;
    v14[4] = &v15;
    __getSTFamilyCircleViewControllerProviderClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v9, "familyRootViewControllerPresentedAsModal:", isKindOfClass & 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "We have a screen time family view controller, presenting", (uint8_t *)v14, 2u);
    }

    objc_msgSend(v6, "showViewController:sender:", v10, self);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FAShowFamilyScreenTimeHook _showFamilyScreenTimeWithCompletion:].cold.1(v12);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE30900], -1000, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v13);

  }
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_showFamilyScreenTimeWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DE41000, log, OS_LOG_TYPE_ERROR, "No screen time family view controller found", v1, 2u);
}

@end
