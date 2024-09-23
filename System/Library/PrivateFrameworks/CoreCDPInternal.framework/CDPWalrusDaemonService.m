@implementation CDPWalrusDaemonService

- (CDPWalrusDaemonService)initWithEntitlements:(unint64_t)a3 walrusController:(id)a4
{
  id v6;
  CDPWalrusDaemonService *v7;
  CDPWalrusDaemonService *v8;
  CDPInternalWalrusStateController *v9;
  CDPInternalWalrusStateController *walrusStateController;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPWalrusDaemonService;
  v7 = -[CDPWalrusDaemonService init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_entitlements = a3;
    if (v6)
    {
      v9 = (CDPInternalWalrusStateController *)v6;
    }
    else
    {
      -[CDPWalrusDaemonService defaultWalrusStateController](v7, "defaultWalrusStateController");
      v9 = (CDPInternalWalrusStateController *)objc_claimAutoreleasedReturnValue();
    }
    walrusStateController = v8->_walrusStateController;
    v8->_walrusStateController = v9;

  }
  return v8;
}

- (CDPWalrusDaemonService)initWithEntitlements:(unint64_t)a3
{
  return -[CDPWalrusDaemonService initWithEntitlements:walrusController:](self, "initWithEntitlements:walrusController:", a3, 0);
}

- (id)defaultWalrusStateController
{
  CDPInternalWalrusStateController *walrusStateController;
  CDPInternalWalrusStateController *v4;
  void *v5;
  CDPDAccount *v6;
  void *v7;
  id v8;
  CDPInternalWalrusStateController *v9;
  CDPInternalWalrusStateController *v10;

  walrusStateController = self->_walrusStateController;
  if (!walrusStateController)
  {
    v4 = [CDPInternalWalrusStateController alloc];
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(CDPDAccount);
    +[CDPWalrusSecurityProxyImpl sharedInstance](CDPWalrusSecurityProxyImpl, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BE1A470]);
    v9 = -[CDPInternalWalrusStateController initWithAccount:cdpdAccount:securityProxy:pcsProxy:](v4, "initWithAccount:cdpdAccount:securityProxy:pcsProxy:", v5, v6, v7, v8);
    v10 = self->_walrusStateController;
    self->_walrusStateController = v9;

    walrusStateController = self->_walrusStateController;
  }
  return walrusStateController;
}

- (void)walrusStatusWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[CDPWalrusDaemonService _allowWalrusAccess](self, "_allowWalrusAccess"))
  {
    -[CDPWalrusDaemonService walrusStateController](self, "walrusStateController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "walrusStatusWithContext:completion:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[CDPWalrusDaemonService walrusStatusWithContext:completion:].cold.1();

  if (v7)
  {
    _CDPStateError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)walrusStatusWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying walrus access. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (CDPInternalWalrusStateController)walrusStateController
{
  return self->_walrusStateController;
}

- (BOOL)_allowWalrusAccess
{
  return (LOBYTE(self->_entitlements) >> 6) & 1;
}

- (void)combinedWalrusStatusWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  if (-[CDPWalrusDaemonService _allowWalrusAccess](self, "_allowWalrusAccess"))
  {
    -[CDPWalrusDaemonService walrusStateController](self, "walrusStateController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v8, "combinedWalrusStatusWithContext:error:", v6, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CDPWalrusDaemonService combinedWalrusStatusWithContext:completion:].cold.1(v10, v12);
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, "\"Walrus combined status %@ status fetched successfully.\", buf, 0xCu);
    }

    if (v7)
      v7[2](v7, v9, v10);

    goto LABEL_14;
  }
  _CDPLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[CDPWalrusDaemonService walrusStatusWithContext:completion:].cold.1();

  if (v7)
  {
    _CDPStateError();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
LABEL_14:

  }
}

- (void)repairWalrusWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;

  v4 = (void (**)(id, void *))a3;
  if (-[CDPWalrusDaemonService _allowWalrusAccess](self, "_allowWalrusAccess"))
  {
    -[CDPWalrusDaemonService walrusStateController](self, "walrusStateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repairWalrusStatusWithCompletion:", v4);
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CDPWalrusDaemonService walrusStatusWithContext:completion:].cold.1();

  if (v4)
  {
    _CDPStateError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)broadcastWalrusStateChange
{
  NSObject *v2;

  if (-[CDPWalrusDaemonService _allowWalrusAccess](self, "_allowWalrusAccess"))
  {
    +[CDPBroadcaster broadcastWalrusStateChangeNotification](CDPBroadcaster, "broadcastWalrusStateChangeNotification");
  }
  else
  {
    _CDPLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[CDPWalrusDaemonService walrusStatusWithContext:completion:].cold.1();

  }
}

- (void)updateWalrusStatus:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  if (-[CDPWalrusDaemonService _allowWalrusAccess](self, "_allowWalrusAccess"))
  {
    if (a3)
    {
      -[CDPWalrusDaemonService walrusStateController](self, "walrusStateController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __56__CDPWalrusDaemonService_updateWalrusStatus_completion___block_invoke;
      v12[3] = &unk_24C81C820;
      v13 = v6;
      objc_msgSend(v7, "setWalrusStatusEnabled:completion:", a3 == 1, v12);

      v8 = v13;
LABEL_13:

      goto LABEL_14;
    }
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CDPWalrusDaemonService updateWalrusStatus:completion:].cold.1();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -7002);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CDPWalrusDaemonService updateWalrusStatus:completion:].cold.2();

    if (v6)
    {
      _CDPStateError();
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v8 = (void *)v10;
      (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, v10);
      goto LABEL_13;
    }
  }
LABEL_14:

}

void __56__CDPWalrusDaemonService_updateWalrusStatus_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__CDPWalrusDaemonService_updateWalrusStatus_completion___block_invoke_cold_1();

    _CDPStateErrorWithUnderlying();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Walrus status updated successfully.\", v11, 2u);
    }
    v9 = 0;
    v6 = v8;
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, void *))(v10 + 16))(v10, v5, v9);

}

- (void)webAccessStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[CDPWalrusDaemonService _allowWalrusAccess](self, "_allowWalrusAccess"))
  {
    -[CDPWalrusDaemonService walrusStateController](self, "walrusStateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__CDPWalrusDaemonService_webAccessStatusWithCompletion___block_invoke;
    v8[3] = &unk_24C81C848;
    v9 = v4;
    objc_msgSend(v5, "webAccessStatusWithCompletion:", v8);

    v6 = v9;
LABEL_7:

    goto LABEL_8;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CDPWalrusDaemonService webAccessStatusWithCompletion:].cold.1();

  if (v4)
  {
    _CDPStateError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);
    goto LABEL_7;
  }
LABEL_8:

}

void __56__CDPWalrusDaemonService_webAccessStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__CDPWalrusDaemonService_webAccessStatusWithCompletion___block_invoke_cold_1(v5, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a2;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Web access status (%lu) fetched successfully.\", (uint8_t *)&v9, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  if (-[CDPWalrusDaemonService _allowWalrusAccess](self, "_allowWalrusAccess"))
  {
    if (a3)
    {
      -[CDPWalrusDaemonService walrusStateController](self, "walrusStateController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __59__CDPWalrusDaemonService_updateWebAccessStatus_completion___block_invoke;
      v12[3] = &unk_24C81C0D0;
      v13 = v6;
      objc_msgSend(v7, "setWebAccessStatusEnabled:completion:", a3 == 1, v12);

      v8 = v13;
LABEL_13:

      goto LABEL_14;
    }
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CDPWalrusDaemonService updateWebAccessStatus:completion:].cold.1();

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -7002);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CDPWalrusDaemonService updateWebAccessStatus:completion:].cold.2();

    if (v6)
    {
      _CDPStateError();
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v8 = (void *)v10;
      (*((void (**)(id, uint64_t))v6 + 2))(v6, v10);
      goto LABEL_13;
    }
  }
LABEL_14:

}

void __59__CDPWalrusDaemonService_updateWebAccessStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__CDPWalrusDaemonService_updateWebAccessStatus_completion___block_invoke_cold_1(v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Web access status updated successfully.\", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (void)pcsKeysForServices:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, void *);
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(id, id, void *);
  id v22;

  v6 = a3;
  v7 = (void (**)(id, id, void *))a4;
  if (-[CDPWalrusDaemonService _allowWalrusPCSKeysAccess](self, "_allowWalrusPCSKeysAccess"))
  {
    -[CDPWalrusDaemonService walrusStateController](self, "walrusStateController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v9 = objc_msgSend(v8, "walrusStatusWithContext:error:", 0, &v22);
    v10 = v22;

    if (v10)
    {
      _CDPLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CDPWalrusDaemonService pcsKeysForServices:completion:].cold.2(v10, v11);

      if (!v7)
        goto LABEL_19;
      v12 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = -7002;
      goto LABEL_17;
    }
    if (v9 != 1)
    {
      _CDPLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CDPWalrusDaemonService pcsKeysForServices:completion:].cold.1();

      if (!v7)
        goto LABEL_19;
      v12 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = -7003;
LABEL_17:
      objc_msgSend(v13, "cdp_errorWithCode:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v12, v18);

      goto LABEL_18;
    }
    -[CDPWalrusDaemonService walrusStateController](self, "walrusStateController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __56__CDPWalrusDaemonService_pcsKeysForServices_completion___block_invoke;
    v19[3] = &unk_24C81C870;
    v21 = v7;
    v20 = v6;
    objc_msgSend(v16, "webAccessStatusWithCompletion:", v19);

    v12 = v21;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  _CDPLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[CDPWalrusDaemonService updateWalrusStatus:completion:].cold.2();

  if (v7)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    _CDPStateError();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10, v12);
    goto LABEL_18;
  }
LABEL_20:

}

void __56__CDPWalrusDaemonService_pcsKeysForServices_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  CDPDPCSController *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    _CDPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __56__CDPWalrusDaemonService_pcsKeysForServices_completion___block_invoke_cold_2(v5, v6);

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = -7102;
LABEL_27:
      objc_msgSend(v9, "cdp_errorWithCode:", v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v8, v24);
LABEL_28:

    }
  }
  else
  {
    if (a2 == 1)
    {
      objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
      v28 = objc_claimAutoreleasedReturnValue();
      v26 = objc_alloc_init(MEMORY[0x24BE1A470]);
      v11 = -[CDPDPCSController initWithContext:pcsProxy:]([CDPDPCSController alloc], "initWithContext:pcsProxy:", v28, v26);
      v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v27 = a1;
      v13 = *(id *)(a1 + 32);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v32;
        v29 = v12;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            v30 = 0;
            -[CDPDPCSController pcsKeysForService:error:](v11, "pcsKeysForService:error:", v18, &v30);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v30;
            if (v20)
            {
              _CDPLogSystem();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v20, "description");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v36 = v18;
                v37 = 2112;
                v38 = v22;
                _os_log_error_impl(&dword_20DB2C000, v21, OS_LOG_TYPE_ERROR, "\"Error fetching key for service %@: %@\", buf, 0x16u);

                v12 = v29;
              }

            }
            else if (v19)
            {
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v15);
      }

      v23 = *(_QWORD *)(v27 + 40);
      if (v23)
        (*(void (**)(uint64_t, id, _QWORD))(v23 + 16))(v23, v12, 0);

      v8 = (id)v28;
      v5 = 0;
      v24 = v26;
      goto LABEL_28;
    }
    _CDPLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __56__CDPWalrusDaemonService_pcsKeysForServices_completion___block_invoke_cold_1();

    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCE70]);
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = -7103;
      goto LABEL_27;
    }
  }

}

- (BOOL)_allowWalrusPCSKeysAccess
{
  return -[CDPWalrusDaemonService _allowWalrusAccess](self, "_allowWalrusAccess") && (self->_entitlements & 0x80) != 0;
}

- (void)setWalrusStateController:(id)a3
{
  objc_storeStrong((id *)&self->_walrusStateController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walrusStateController, 0);
}

- (void)combinedWalrusStatusWithContext:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a1, "code");
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to fetch walrus combined status with error code: %zd, error: %@\", (uint8_t *)&v6, 0x16u);

}

- (void)updateWalrusStatus:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Unknown walrus status. Can't update.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateWalrusStatus:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying walrus operation. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __56__CDPWalrusDaemonService_updateWalrusStatus_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Failed to update walrus status with error: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)webAccessStatusWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying web access. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __56__CDPWalrusDaemonService_webAccessStatusWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, v4, "\"Failed to fetch web access status with error: %@\", v5);

  OUTLINED_FUNCTION_6();
}

- (void)updateWebAccessStatus:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Unknown web access status. Can't update.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateWebAccessStatus:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"Denying web access operation. Missing entitlement.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __59__CDPWalrusDaemonService_updateWebAccessStatus_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, v4, "\"Failed to update web access status with error: %@\", v5);

  OUTLINED_FUNCTION_6();
}

- (void)pcsKeysForServices:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Walrus status (%lu) is not enabled, abandoning pcs key fetch.\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)pcsKeysForServices:(void *)a1 completion:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, v4, "\"Unable to determine walrus status, abandoning pcs key fetch. error: %@\", v5);

  OUTLINED_FUNCTION_6();
}

void __56__CDPWalrusDaemonService_pcsKeysForServices_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, v0, v1, "\"Web access status (%lu) is not enabled, abandoning pcs key fetch.\", v2);
  OUTLINED_FUNCTION_4();
}

void __56__CDPWalrusDaemonService_pcsKeysForServices_completion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_20DB2C000, a2, v4, "\"Unable to determine web access status, abandoning pcs key fetch. error: %@\", v5);

  OUTLINED_FUNCTION_6();
}

@end
