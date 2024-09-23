@implementation CDPWalrusSecurityProxyImpl

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance_securityProxy;
}

void __44__CDPWalrusSecurityProxyImpl_sharedInstance__block_invoke()
{
  CDPWalrusSecurityProxyImpl *v0;
  void *v1;

  v0 = objc_alloc_init(CDPWalrusSecurityProxyImpl);
  v1 = (void *)sharedInstance_securityProxy;
  sharedInstance_securityProxy = (uint64_t)v0;

}

- (CDPWalrusSecurityProxyImpl)init
{
  void *v3;
  CDPWalrusSecurityProxyImpl *v4;

  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CDPWalrusSecurityProxyImpl initWithContext:](self, "initWithContext:", v3);

  return v4;
}

- (CDPWalrusSecurityProxyImpl)initWithContext:(id)a3
{
  id v5;
  CDPWalrusSecurityProxyImpl *v6;
  CDPWalrusSecurityProxyImpl *v7;
  CDPDSecureBackupController *v8;
  CDPDSecureBackupController *backupController;
  id v10;
  void *v11;
  uint64_t v12;
  OTClique *clique;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDPWalrusSecurityProxyImpl;
  v6 = -[CDPWalrusSecurityProxyImpl init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = -[CDPDSecureBackupController initWithContext:uiProvider:delegate:]([CDPDSecureBackupController alloc], "initWithContext:uiProvider:delegate:", v7->_context, 0, 0);
    backupController = v7->_backupController;
    v7->_backupController = v8;

    v10 = objc_alloc(MEMORY[0x24BDE84B0]);
    -[CDPContext cliqueConfiguration](v7->_context, "cliqueConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithContextData:", v11);
    clique = v7->_clique;
    v7->_clique = (OTClique *)v12;

    v7->_accountSettingsLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)webAccessStatusWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  os_unfair_lock_s *p_accountSettingsLock;
  OTClique *clique;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  p_accountSettingsLock = &self->_accountSettingsLock;
  os_unfair_lock_lock(&self->_accountSettingsLock);
  clique = self->_clique;
  v16 = 0;
  -[OTClique fetchAccountSettings:](clique, "fetchAccountSettings:", &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  os_unfair_lock_unlock(p_accountSettingsLock);
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CDPWalrusSecurityProxyImpl webAccessStatusWithCompletion:].cold.1(v8, v10);

    v4[2](v4, 0, v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "webAccess");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "enabled");
      *(_DWORD *)buf = 67109120;
      v18 = v12;
      _os_log_impl(&dword_20DB2C000, v10, OS_LOG_TYPE_DEFAULT, "\"Successfully fetched web access status (%{BOOL}d)\", buf, 8u);

    }
    objc_msgSend(v7, "webAccess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "enabled");

    if (v14)
      v15 = 1;
    else
      v15 = 2;
    v4[2](v4, v15, 0);
  }

}

- (void)setWebAccessStatusEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_accountSettingsLock;
  void (**v7)(id, id);
  OTClique *clique;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  OTClique *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  _BOOL4 v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  p_accountSettingsLock = &self->_accountSettingsLock;
  v7 = (void (**)(id, id))a4;
  os_unfair_lock_lock(p_accountSettingsLock);
  clique = self->_clique;
  v20 = 0;
  -[OTClique fetchAccountSettings:](clique, "fetchAccountSettings:", &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v10)
  {
    v11 = v10;
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CDPWalrusSecurityProxyImpl setWebAccessStatusEnabled:completion:].cold.2((uint64_t)v11, v12, v13);

    os_unfair_lock_unlock(p_accountSettingsLock);
    v7[2](v7, v11);
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x24BE6E120]);
    objc_msgSend(v14, "setEnabled:", v4);
    objc_msgSend(v9, "setWebAccess:", v14);
    v15 = self->_clique;
    v19 = 0;
    v16 = -[OTClique setAccountSetting:error:](v15, "setAccountSetting:error:", v9, &v19);
    v11 = v19;
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v22 = v4;
        _os_log_impl(&dword_20DB2C000, v18, OS_LOG_TYPE_DEFAULT, "\"Successfully updated web access status (%{BOOL}d).\", buf, 8u);
      }

      +[CDPBroadcaster broadcastWebAccessStateChangeNotification](CDPBroadcaster, "broadcastWebAccessStateChangeNotification");
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CDPWalrusSecurityProxyImpl setWebAccessStatusEnabled:completion:].cold.1(v4, v11, v18);

    }
    os_unfair_lock_unlock(p_accountSettingsLock);
    v7[2](v7, v11);

    v7 = (void (**)(id, id))v14;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clique, 0);
  objc_storeStrong((id *)&self->_backupController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)webAccessStatusWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, v4, "\"Failed to fetch web access status with error: %@\", (uint8_t *)&v5);

}

- (void)setWebAccessStatusEnabled:(NSObject *)a3 completion:.cold.1(char a1, void *a2, NSObject *a3)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a1 & 1;
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_20DB2C000, a3, OS_LOG_TYPE_ERROR, "\"Failed to update web access status (%{BOOL}d) with error: %@\", (uint8_t *)v6, 0x12u);

}

- (void)setWebAccessStatusEnabled:(uint64_t)a3 completion:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, a3, "\"Failed to fetch existing account settings with error: %@\", (uint8_t *)&v3);
}

@end
