@implementation DKNotableUserDataProvider

- (DKNotableUserDataProvider)initWithAccountProvider:(id)a3 findMyProvider:(id)a4 walletProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  DKNotableUserDataProvider *v12;
  DKNotableUserDataProvider *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[DKNotableUserDataProvider init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountProvider, a3);
    objc_storeStrong((id *)&v13->_findMyProvider, a4);
    objc_storeStrong((id *)&v13->_walletProvider, a5);
  }

  return v13;
}

- (DKNotableUserDataProvider)init
{
  DKNotableUserDataProvider *v2;
  DKRestrictionsProvider *v3;
  DKRestrictionsProvider *restrictionsProvider;
  DKStorageProvider *v5;
  DKStorageProvider *storageProvider;
  DKTelephonyProvider *v7;
  DKTelephonyProvider *telephonyProvider;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DKNotableUserDataProvider;
  v2 = -[DKNotableUserDataProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(DKRestrictionsProvider);
    restrictionsProvider = v2->_restrictionsProvider;
    v2->_restrictionsProvider = v3;

    v5 = objc_alloc_init(DKStorageProvider);
    storageProvider = v2->_storageProvider;
    v2->_storageProvider = v5;

    v7 = objc_alloc_init(DKTelephonyProvider);
    telephonyProvider = v2->_telephonyProvider;
    v2->_telephonyProvider = v7;

  }
  return v2;
}

- (void)fetchNotableUserData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DKNotableUserData *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  DKNotableUserData *v22;
  NSObject *v23;
  void *v24;
  DKNotableUserData *v25;
  NSObject *v26;
  void *v27;
  DKNotableUserData *v28;
  NSObject *v29;
  DKNotableUserData *v30;
  id v31;
  _QWORD v32[4];
  DKNotableUserData *v33;
  id v34;
  _QWORD v35[4];
  DKNotableUserData *v36;
  NSObject *v37;
  _QWORD v38[4];
  DKNotableUserData *v39;
  NSObject *v40;
  _QWORD v41[4];
  DKNotableUserData *v42;
  NSObject *v43;
  uint8_t buf[16];

  v4 = a3;
  -[DKNotableUserDataProvider accountProvider](self, "accountProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.1();

  -[DKNotableUserDataProvider findMyProvider](self, "findMyProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.2();

  -[DKNotableUserDataProvider restrictionsProvider](self, "restrictionsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.3();

  -[DKNotableUserDataProvider storageProvider](self, "storageProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.4();

  -[DKNotableUserDataProvider telephonyProvider](self, "telephonyProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.5();

  -[DKNotableUserDataProvider walletProvider](self, "walletProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.6();

  v11 = objc_alloc_init(DKNotableUserData);
  _DKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229405000, v12, OS_LOG_TYPE_DEFAULT, "Fetching synchronous notable user data...", buf, 2u);
  }

  -[DKNotableUserDataProvider restrictionsProvider](self, "restrictionsProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isPreserveESIMOnEraseEnforced");

  if (v14)
  {
    -[DKNotableUserData setCellularPlans:](v11, "setCellularPlans:", MEMORY[0x24BDBD1A8]);
  }
  else
  {
    -[DKNotableUserDataProvider telephonyProvider](self, "telephonyProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cellularPlans");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKNotableUserData setCellularPlans:](v11, "setCellularPlans:", v16);

  }
  -[DKNotableUserDataProvider storageProvider](self, "storageProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKNotableUserData setDataSize:](v11, "setDataSize:", objc_msgSend(v17, "dataSize"));

  _DKLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229405000, v18, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous notable user data...", buf, 2u);
  }

  v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  -[DKNotableUserDataProvider findMyProvider](self, "findMyProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke;
  v41[3] = &unk_24F20E4A0;
  v22 = v11;
  v42 = v22;
  v23 = v19;
  v43 = v23;
  objc_msgSend(v20, "fetchFindMyState:", v41);

  dispatch_group_enter(v23);
  -[DKNotableUserDataProvider accountProvider](self, "accountProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v21;
  v38[1] = 3221225472;
  v38[2] = __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_34;
  v38[3] = &unk_24F20E4C8;
  v25 = v22;
  v39 = v25;
  v26 = v23;
  v40 = v26;
  objc_msgSend(v24, "fetchAccounts:", v38);

  dispatch_group_enter(v26);
  -[DKNotableUserDataProvider walletProvider](self, "walletProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v21;
  v35[1] = 3221225472;
  v35[2] = __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_36;
  v35[3] = &unk_24F20E4F0;
  v28 = v25;
  v36 = v28;
  v37 = v26;
  v29 = v26;
  objc_msgSend(v27, "fetchAppleWalletCards:", v35);

  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_38;
  v32[3] = &unk_24F20DF20;
  v33 = v28;
  v34 = v4;
  v30 = v28;
  v31 = v4;
  dispatch_group_notify(v29, MEMORY[0x24BDAC9B8], v32);

}

void __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint8_t v5[16];

  _DKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Finished fetching Find My state", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFindMyEnabled:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  _DKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Finished fetching accounts", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAccounts:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  _DKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_229405000, v4, OS_LOG_TYPE_DEFAULT, "Finished fetching Wallet data", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setWalletData:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (DKAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountProvider, a3);
}

- (DKFindMyProvider)findMyProvider
{
  return self->_findMyProvider;
}

- (void)setFindMyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_findMyProvider, a3);
}

- (DKRestrictionsProvider)restrictionsProvider
{
  return self->_restrictionsProvider;
}

- (void)setRestrictionsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionsProvider, a3);
}

- (DKStorageProvider)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_storageProvider, a3);
}

- (DKTelephonyProvider)telephonyProvider
{
  return self->_telephonyProvider;
}

- (void)setTelephonyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyProvider, a3);
}

- (DKWalletProvider)walletProvider
{
  return self->_walletProvider;
}

- (void)setWalletProvider:(id)a3
{
  objc_storeStrong((id *)&self->_walletProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletProvider, 0);
  objc_storeStrong((id *)&self->_telephonyProvider, 0);
  objc_storeStrong((id *)&self->_storageProvider, 0);
  objc_storeStrong((id *)&self->_restrictionsProvider, 0);
  objc_storeStrong((id *)&self->_findMyProvider, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
}

- (void)fetchNotableUserData:.cold.1()
{
  __assert_rtn("-[DKNotableUserDataProvider fetchNotableUserData:]", "DKNotableUserDataProvider.m", 45, "self.accountProvider");
}

- (void)fetchNotableUserData:.cold.2()
{
  __assert_rtn("-[DKNotableUserDataProvider fetchNotableUserData:]", "DKNotableUserDataProvider.m", 46, "self.findMyProvider");
}

- (void)fetchNotableUserData:.cold.3()
{
  __assert_rtn("-[DKNotableUserDataProvider fetchNotableUserData:]", "DKNotableUserDataProvider.m", 47, "self.restrictionsProvider");
}

- (void)fetchNotableUserData:.cold.4()
{
  __assert_rtn("-[DKNotableUserDataProvider fetchNotableUserData:]", "DKNotableUserDataProvider.m", 48, "self.storageProvider");
}

- (void)fetchNotableUserData:.cold.5()
{
  __assert_rtn("-[DKNotableUserDataProvider fetchNotableUserData:]", "DKNotableUserDataProvider.m", 49, "self.telephonyProvider");
}

- (void)fetchNotableUserData:.cold.6()
{
  __assert_rtn("-[DKNotableUserDataProvider fetchNotableUserData:]", "DKNotableUserDataProvider.m", 50, "self.walletProvider");
}

@end
