@implementation CDPTermsInfoBackupController

- (CDPTermsInfoBackupController)init
{
  CDPTermsInfoBackupController *v2;
  CDPDaemonConnection *v3;
  CDPDaemonConnection *daemonConn;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPTermsInfoBackupController;
  v2 = -[CDPTermsInfoBackupController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CDPDaemonConnection);
    daemonConn = v2->_daemonConn;
    v2->_daemonConn = v3;

  }
  return v2;
}

- (void)saveTermsAcceptance:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_20D7E6000, "cdp/saveTermsAcceptance", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke;
  v20[3] = &unk_24C7C10E8;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x212BA9A30](v20);
  -[CDPTermsInfoBackupController daemonConn](self, "daemonConn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  v16 = 3221225472;
  v17 = __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke_12;
  v18 = &unk_24C7C10E8;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "synchronousDaemonWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "saveTermsAcceptance:completion:", v6, v13, v15, v16, v17, v18);
  os_activity_scope_leave(&state);

}

void __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_20D7E6000, v4, OS_LOG_TYPE_DEFAULT, "\"Saving of terms acceptance completed with error %@\", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke_12_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTermsAcceptanceForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_20D7E6000, "cdp/fetchTermsAcceptance", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke;
  v20[3] = &unk_24C7C1188;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x212BA9A30](v20);
  -[CDPTermsInfoBackupController daemonConn](self, "daemonConn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9;
  v16 = 3221225472;
  v17 = __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_14;
  v18 = &unk_24C7C10E8;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "synchronousDaemonWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "fetchTermsAcceptanceForAccount:completion:", v6, v13, v15, v16, v17, v18);
  os_activity_scope_leave(&state);

}

void __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_20D7E6000, v7, OS_LOG_TYPE_DEFAULT, "\"Fetched terms acceptance completed with error %@ and result %@\", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_14_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CDPDaemonConnection)daemonConn
{
  return self->_daemonConn;
}

- (void)setDaemonConn:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConn, 0);
}

void __63__CDPTermsInfoBackupController_saveTermsAcceptance_completion___block_invoke_12_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"XPC Error while attempting to save terms info: %@\", a5, a6, a7, a8, 2u);
}

void __74__CDPTermsInfoBackupController_fetchTermsAcceptanceForAccount_completion___block_invoke_14_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"XPC Error while attempting to fetch terms info: %@\", a5, a6, a7, a8, 2u);
}

@end
