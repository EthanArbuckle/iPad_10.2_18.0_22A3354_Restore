@implementation DKFindMyProvider

- (void)preheatFindMyState
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _DKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_229405000, v2, OS_LOG_TYPE_DEFAULT, "Preheating Find My state...", v4, 2u);
  }

  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshCurrentState:", &__block_literal_global_0);

}

void __38__DKFindMyProvider_preheatFindMyState__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _DKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("known");
    if (a2 == 4)
      v4 = CFSTR("unknown");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_229405000, v3, OS_LOG_TYPE_DEFAULT, "Find My state preheated; state is %@",
      (uint8_t *)&v5,
      0xCu);
  }

}

- (void)fetchFindMyState:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void (**v11)(id, uint64_t);
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, uint64_t);
  _QWORD v15[5];
  void (**v16)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStateKnown");

  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    v9 = objc_msgSend(v7, "isChangingState");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, objc_msgSend(v12, "isEnabled"));

      goto LABEL_8;
    }
    -[DKFindMyProvider stateChangeBlock](self, "stateChangeBlock");
    if (objc_claimAutoreleasedReturnValue())
      -[DKFindMyProvider fetchFindMyState:].cold.1();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __37__DKFindMyProvider_fetchFindMyState___block_invoke_2;
    v13[3] = &unk_24F20E1B8;
    v14 = v4;
    -[DKFindMyProvider setStateChangeBlock:](self, "setStateChangeBlock:", v13);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__locatorStateDidChange_, *MEMORY[0x24BE04C68], 0);

    v11 = v14;
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __37__DKFindMyProvider_fetchFindMyState___block_invoke;
    v15[3] = &unk_24F20E190;
    v15[4] = self;
    v16 = v4;
    objc_msgSend(v8, "refreshCurrentState:", v15);

    v11 = v16;
  }

LABEL_8:
}

uint64_t __37__DKFindMyProvider_fetchFindMyState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchFindMyState:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__DKFindMyProvider_fetchFindMyState___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChangingState");

  if ((v3 & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(v5, "isEnabled"));

  }
  return v3 ^ 1u;
}

- (void)disableFindMyWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  DKFindMySignOutController *v13;
  id v14;
  DKFindMySignOutController *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  DKFindMyProvider *v19;
  id v20;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[DKFindMyProvider stateChangeBlock](self, "stateChangeBlock");
  if (objc_claimAutoreleasedReturnValue())
    -[DKFindMyProvider disableFindMyWithPresentingViewController:completion:].cold.1();
  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");

  if ((v9 & 1) != 0)
  {
    _DKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229405000, v10, OS_LOG_TYPE_DEFAULT, "Prompting to disable Find My...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_primaryAppleAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [DKFindMySignOutController alloc];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke;
    v17[3] = &unk_24F20E220;
    v20 = v7;
    v14 = v6;
    v18 = v14;
    v19 = self;
    v15 = -[DKFindMySignOutController initWithAccount:withCompletion:](v13, "initWithAccount:withCompletion:", v12, v17);
    objc_msgSend(v14, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pushViewController:animated:", v15, 1);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }

}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  id v15;

  v5 = a3;
  if (a2)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_2;
    block[3] = &unk_24F20DE18;
    v15 = a1[4];
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_3;
    v12[3] = &unk_24F20E1B8;
    v13 = a1[6];
    objc_msgSend(a1[5], "setStateChangeBlock:", v12);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", a1[5], sel__locatorStateDidChange_, *MEMORY[0x24BE04C68], 0);

    _DKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_229405000, v8, OS_LOG_TYPE_DEFAULT, "Disabling Find My...", v11, 2u);
    }

    objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "disableInContext:withWipeToken:completion:", 4, v5, &__block_literal_global_15);

    _DKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_229405000, v10, OS_LOG_TYPE_DEFAULT, "Waiting for Find My to be disabled...", v11, 2u);
    }

  }
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v6);
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  objc_msgSend(v6, "startAnimating");
}

uint64_t __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void);
  uint8_t v19[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChangingState");

  if (v3)
  {
    _DKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Find My state did update, but is still changing", buf, 2u);
    }

    return 0;
  }
  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  _DKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_3_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

    return 0;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_229405000, v8, OS_LOG_TYPE_DEFAULT, "Find My state did update to disabled", v19, 2u);
  }

  v17 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  v16 = 1;
  v17();
  return v16;
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_13(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  _DKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_13_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Disable of Find My succeeded", v12, 2u);
  }

}

- (void)_locatorStateDidChange:(id)a3
{
  void *v4;
  uint64_t (**v5)(void);
  int v6;
  id v7;

  -[DKFindMyProvider stateChangeBlock](self, "stateChangeBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DKFindMyProvider stateChangeBlock](self, "stateChangeBlock");
    v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v6 = v5[2]();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BE04C68], 0);

    }
  }
}

- (id)stateChangeBlock
{
  return self->_stateChangeBlock;
}

- (void)setStateChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeBlock, 0);
}

- (void)fetchFindMyState:.cold.1()
{
  __assert_rtn("-[DKFindMyProvider fetchFindMyState:]", "DKFindMyProvider.m", 51, "!self.stateChangeBlock");
}

- (void)disableFindMyWithPresentingViewController:completion:.cold.1()
{
  __assert_rtn("-[DKFindMyProvider disableFindMyWithPresentingViewController:completion:]", "DKFindMyProvider.m", 67, "!self.stateChangeBlock");
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229405000, a1, a3, "Find My state did update, but is still enabled", a5, a6, a7, a8, 0);
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_13_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229405000, a1, a3, "Disable of Find My failed", a5, a6, a7, a8, 0);
}

@end
