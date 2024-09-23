@implementation MDMManagedAssetManager

+ (void)promptUserToLoginToiTunesIfNeededTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];
  _QWORD block[4];
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v13)
    {
      dispatch_get_global_queue(0, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke;
      block[3] = &unk_24EB67F18;
      v27 = v13;
      v26 = v12;
      dispatch_async(v16, block);

      v17 = v27;
LABEL_10:

    }
  }
  else
  {
    if (!+[MDMMCInterface isLimitedAppsMode](MDMMCInterface, "isLimitedAppsMode"))
    {
      v19 = (void *)MEMORY[0x24BE2A7B0];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke_3;
      v20[3] = &unk_24EB684F0;
      v22 = v13;
      v23 = a1;
      v21 = v12;
      objc_msgSend(v19, "promptUserToLogIntoiTunesWithTitle:message:assertion:completion:", v10, v11, v21, v20);

      v17 = v22;
      goto LABEL_10;
    }
    v18 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v18, OS_LOG_TYPE_ERROR, "Cannot prompt login to iTunes because device is in a limited apps mode", buf, 2u);
    }
    if (v13)
      (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

uint64_t __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      v12 = a2;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_ERROR, "User rejected app installation with response: %{public}u", buf, 8u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke_4;
    v8[3] = &unk_24EB684C8;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "_promptUserForiTunesAccount:accountNameEditable:canCreateNewAccount:assertion:completionBlock:", 0, 1, 1, v6, v8);

  }
}

void __99__MDMManagedAssetManager_promptUserToLoginToiTunesIfNeededTitle_message_assertion_completionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_ERROR, "Login failed. Error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v9 = *(void (**)(void))(v8 + 16);
LABEL_10:
      v9();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEFAULT, "Login successful.", (uint8_t *)&v11, 2u);
    }
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_10;
    }
  }

}

+ (void)_promptUserForiTunesAccount:(id)a3 accountNameEditable:(BOOL)a4 canCreateNewAccount:(BOOL)a5 assertion:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v8 = a5;
  v9 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a7;
  v12 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    DMCStringForBool();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_222CB9000, v13, OS_LOG_TYPE_DEFAULT, "Prompting user to log in to iTunes store using account: %{public}@. Can create new account: %{public}@.", buf, 0x16u);

  }
  if (v10)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccount:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1F28], "contextForSignIn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  objc_msgSend(v15, "setPromptStyle:", 0);
  objc_msgSend(v16, "setAccountNameEditable:", v9);
  objc_msgSend(v16, "setCanCreateNewAccount:", v8);
  +[MDMSSAuthenticationRequestDelegate instanceWithAuthenticationContext:](MDMSSAuthenticationRequestDelegate, "instanceWithAuthenticationContext:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __120__MDMManagedAssetManager__promptUserForiTunesAccount_accountNameEditable_canCreateNewAccount_assertion_completionBlock___block_invoke;
  v19[3] = &unk_24EB68518;
  v20 = v11;
  v18 = v11;
  objc_msgSend(v17, "startWithCompletionBlock:", v19);

}

void __120__MDMManagedAssetManager__promptUserForiTunesAccount_accountNameEditable_canCreateNewAccount_assertion_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void (*v10)(void);
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v5, "DMCVerboseDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_ERROR, "Log in request failed. Error: %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEFAULT, "Log in successful. Account: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();

}

@end
