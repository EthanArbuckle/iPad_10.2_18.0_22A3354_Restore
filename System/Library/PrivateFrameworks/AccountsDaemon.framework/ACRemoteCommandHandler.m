@implementation ACRemoteCommandHandler

- (ACRemoteCommandHandler)init
{
  ACRemoteCommandHandler *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACRemoteCommandHandler;
  v2 = -[ACRemoteCommandHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x24BDB4398]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

  }
  return v2;
}

- (void)handleCommand:(id)a3 forAccount:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _ACLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACRemoteCommandHandler handleCommand:forAccount:options:completion:].cold.1();

  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4300]))
  {
    -[ACRemoteCommandHandler _addAccount:withOptions:completion:](self, "_addAccount:withOptions:completion:", v11, v12, v13);
  }
  else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4330]))
  {
    -[ACRemoteCommandHandler _updateAccount:withCompletion:](self, "_updateAccount:withCompletion:", v11, v13);
  }
  else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4328]))
  {
    -[ACRemoteCommandHandler _promptUserForAccountCredential:withOptions:completion:](self, "_promptUserForAccountCredential:withOptions:completion:", v11, v12, v13);
  }
  else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4308]))
  {
    -[ACRemoteCommandHandler _deleteAccount:withCompletion:](self, "_deleteAccount:withCompletion:", v11, v13);
  }
  else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4338]))
  {
    -[ACRemoteCommandHandler _authenticateAccount:withOptions:completion:](self, "_authenticateAccount:withOptions:completion:", v11, v12, v13);
  }
  else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4310]))
  {
    -[ACRemoteCommandHandler _removeAllAccountsWithCompletion:](self, "_removeAllAccountsWithCompletion:", v13);
  }
  else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4318]))
  {
    -[ACRemoteCommandHandler _fetchAccountsWithCompletion:options:](self, "_fetchAccountsWithCompletion:options:", v13, v12);
  }
  else if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4320]))
  {
    -[ACRemoteCommandHandler _invalidateFetchedAccountsCacheWithCompletion:](self, "_invalidateFetchedAccountsCacheWithCompletion:", v13);
  }

}

- (void)_removeAllAccountsWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))a3 + 2))(a3, 0, 0, 0);
}

- (void)_addAccount:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))a5 + 2))(a5, 0, 0, 0);
}

- (void)_saveAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ACAccountStore *accountStore;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accountStore = self->_accountStore;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke;
  v11[3] = &unk_24C7E1E10;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[ACAccountStore saveVerifiedAccount:withCompletionHandler:](accountStore, "saveVerifiedAccount:withCompletionHandler:", v10, v11);

}

void __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke_cold_1(a1, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke_cold_2((uint64_t)v5, v7);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v8 + 16))(v8, a2, 0, v5);

}

- (void)_updateAccount:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))a4 + 2))(a4, 0, 0, 0);
}

- (void)_authenticateAccount:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))a5 + 2))(a5, 0, 0, 0);
}

- (void)_promptUserForAccountCredential:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  ACAccountStore *accountStore;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _ACLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACRemoteCommandHandler _promptUserForAccountCredential:withOptions:completion:].cold.2();

  +[ACRemoteUtilities localAccountMatchingRemoteAccount:inAccountStore:](ACRemoteUtilities, "localAccountMatchingRemoteAccount:inAccountStore:", v8, self->_accountStore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (id)objc_msgSend(v9, "mutableCopy");
    if (!v13)
      v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB4538]);
    accountStore = self->_accountStore;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __81__ACRemoteCommandHandler__promptUserForAccountCredential_withOptions_completion___block_invoke;
    v16[3] = &unk_24C7E1E38;
    v18 = v10;
    v17 = v12;
    -[ACAccountStore renewCredentialsForAccount:options:completion:](accountStore, "renewCredentialsForAccount:options:completion:", v17, v13, v16);

    goto LABEL_11;
  }
  _ACLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[ACRemoteCommandHandler _promptUserForAccountCredential:withOptions:completion:].cold.1(v15);

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 6, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v13);
LABEL_11:

  }
}

void __81__ACRemoteCommandHandler__promptUserForAccountCredential_withOptions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_20D8CB000, v6, OS_LOG_TYPE_DEFAULT, "\"Renewal completed with result: %@. Error: %@\", (uint8_t *)&v12, 0x16u);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "credential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "credentialItemForKey:", *MEMORY[0x24BDB42F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "credential");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "credentialItemForKey:", *MEMORY[0x24BDB4280]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(_QWORD, BOOL, void *, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2 == 0, v9, v5);

  }
  _ACLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __81__ACRemoteCommandHandler__promptUserForAccountCredential_withOptions_completion___block_invoke_cold_1();

}

- (void)_deleteAccount:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))a4 + 2))(a4, 0, 0, 0);
}

- (void)_fetchAccountsWithCompletion:(id)a3 options:(id)a4
{
  void (**v6)(id, uint64_t, void *, _QWORD);
  id v7;
  NSObject *v8;
  ACAccountStore *accountStore;
  void *v10;
  void *v11;

  v6 = (void (**)(id, uint64_t, void *, _QWORD))a3;
  v7 = a4;
  _ACLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACRemoteCommandHandler _fetchAccountsWithCompletion:options:].cold.1();

  accountStore = self->_accountStore;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDB4350]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACAccountStore accountsWithAccountTypeIdentifiers:preloadedProperties:error:](accountStore, "accountsWithAccountTypeIdentifiers:preloadedProperties:error:", 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v6[2](v6, 1, v11, 0);

}

- (void)_invalidateFetchedAccountsCacheWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  v3 = a3;
  _ACLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ACRemoteCommandHandler _invalidateFetchedAccountsCacheWithCompletion:].cold.2();

  +[ACDPairedDeviceAccountCache sharedInstance](ACDPairedDeviceAccountCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  if (v3)
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v3 + 2))(v3, 1, 0, 0);
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ACRemoteCommandHandler _invalidateFetchedAccountsCacheWithCompletion:].cold.1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)handleCommand:forAccount:options:completion:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[7];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@, %@)", (uint8_t *)v3, 0x26u);
}

void __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_DEBUG, "\"Saved verified account %@\", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __50__ACRemoteCommandHandler__saveAccount_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_ERROR, "\"Save verified account failed: %@\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_promptUserForAccountCredential:(os_log_t)log withOptions:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D8CB000, log, OS_LOG_TYPE_ERROR, "\"Couldn't find matching account\", v1, 2u);
}

- (void)_promptUserForAccountCredential:withOptions:completion:.cold.2()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136381187;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_DEBUG, "%{private}s:%{public}d called (%@)", (uint8_t *)v1, 0x1Cu);
}

void __81__ACRemoteCommandHandler__promptUserForAccountCredential_withOptions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_fetchAccountsWithCompletion:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_invalidateFetchedAccountsCacheWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_invalidateFetchedAccountsCacheWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

@end
