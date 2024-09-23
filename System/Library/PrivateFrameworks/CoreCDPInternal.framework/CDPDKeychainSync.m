@implementation CDPDKeychainSync

+ (id)keyChainSync
{
  void *v2;
  CDPDKeychainSync *v3;

  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[CDPDKeychainSync initWithContext:]([CDPDKeychainSync alloc], "initWithContext:", v2);

  return v3;
}

+ (id)keyChainSyncWithProxy:(id)a3 sosCircleProxy:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  CDPDKeychainSync *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CDPDKeychainSync initWithCircleProxy:sosCircleProxy:context:]([CDPDKeychainSync alloc], "initWithCircleProxy:sosCircleProxy:context:", v9, v8, v7);

  return v10;
}

- (CDPDKeychainSync)initWithContext:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  CDPDDefaultKeychainSyncPolicyProvider *v8;
  CDPDKeychainSync *v9;

  v4 = (objc_class *)MEMORY[0x24BE1A3E8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContext:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A488]), "initWithContext:", v5);
  v8 = -[CDPDDefaultKeychainSyncPolicyProvider initWithContext:]([CDPDDefaultKeychainSyncPolicyProvider alloc], "initWithContext:", v5);

  v9 = -[CDPDKeychainSync initWithCircleProxy:sosCircleProxy:policyProvider:](self, "initWithCircleProxy:sosCircleProxy:policyProvider:", v6, v7, v8);
  return v9;
}

- (CDPDKeychainSync)initWithCircleProxy:(id)a3 sosCircleProxy:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  CDPDDefaultKeychainSyncPolicyProvider *v11;
  CDPDKeychainSync *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CDPDDefaultKeychainSyncPolicyProvider initWithContext:]([CDPDDefaultKeychainSyncPolicyProvider alloc], "initWithContext:", v8);

  v12 = -[CDPDKeychainSync initWithCircleProxy:sosCircleProxy:policyProvider:](self, "initWithCircleProxy:sosCircleProxy:policyProvider:", v10, v9, v11);
  return v12;
}

- (CDPDKeychainSync)initWithCircleProxy:(id)a3 sosCircleProxy:(id)a4 policyProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPDKeychainSync *v12;
  CDPDKeychainSync *v13;
  CDPDKeychainSync *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CDPDKeychainSync;
  v12 = -[CDPDKeychainSync init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_circleProxy, a3);
    objc_storeStrong((id *)&v13->_sosCircleProxy, a4);
    objc_storeStrong((id *)&v13->_syncPolicy, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)_keychainSyncAvailableViaSOS
{
  return -[CDPDCircleProxy hasNonViewAwarePeers](self->_sosCircleProxy, "hasNonViewAwarePeers");
}

- (BOOL)_keychainSyncAvailableViaOctacon
{
  return -[CDPDCircleProxy fetchUserControllableViewsSyncingEnabled:](self->_circleProxy, "fetchUserControllableViewsSyncingEnabled:", 0);
}

- (void)buddyFinished
{
  -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:](self, "updateKeychainSyncStateIfNeededWithCompletion:", 0);
}

- (BOOL)isUserVisibleKeychainSyncAvailable
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[CDPDKeychainSync syncPolicy](self, "syncPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keychainSyncAllowedByMDM");

  if ((v4 & 1) == 0)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CDPDKeychainSync isUserVisibleKeychainSyncAvailable].cold.2();

  }
  -[CDPDKeychainSync syncPolicy](self, "syncPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "keychainSyncAllowedByServer");

  if ((v7 & 1) == 0)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CDPDKeychainSync isUserVisibleKeychainSyncAvailable].cold.1();

    v4 = 0;
  }
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("DISALLOWED");
    if (v4)
      v10 = CFSTR("ALLOWED");
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"isUserVisibleKeychainSyncAllowed: sync is currently %{public}@\", (uint8_t *)&v12, 0xCu);
  }

  return v4;
}

- (BOOL)isUserVisibleKeychainSyncEnabled
{
  NSObject *v3;
  NSObject *v5;

  if (-[CDPDKeychainSync _isThisDeviceInCircle](self, "_isThisDeviceInCircle"))
  {
    if (-[CDPDKeychainSync _keychainSyncAvailableViaSOS](self, "_keychainSyncAvailableViaSOS"))
    {
      _CDPLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[CDPDKeychainSync isUserVisibleKeychainSyncEnabled].cold.1();

      return 1;
    }
    else
    {
      return -[CDPDCircleProxy fetchUserControllableViewsSyncingEnabled:](self->_circleProxy, "fetchUserControllableViewsSyncingEnabled:", 0);
    }
  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CDPDKeychainSync isUserVisibleKeychainSyncEnabled].cold.2();

    return 0;
  }
}

- (BOOL)_isThisDeviceInCircle
{
  return -[CDPDCircleProxy combinedCachedCircleStatus:](self->_circleProxy, "combinedCachedCircleStatus:", 0) == 1;
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint8_t *v15;
  CDPDKeychainSync *v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  __int16 v27;
  uint8_t buf[2];
  __int16 v29;

  v4 = (void (**)(id, _QWORD, void *))a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:].cold.5();

  -[CDPDKeychainSync syncPolicy](self, "syncPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userHasExplicitlyDisabledSync");

  if (v7)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 0;
      v9 = "\"updateKeychainSyncStateIfNeeded: User has previously explicitly disabled keychain sync. Ensuring that prefe"
           "rence is honored.\";
      v10 = (uint8_t *)&v29;
LABEL_12:
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (!-[CDPDKeychainSync isUserVisibleKeychainSyncAvailable](self, "isUserVisibleKeychainSyncAvailable"))
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "\"updateKeychainSyncStateIfNeeded: Keychain sync is not available due to IAM/MDM policy. Ensuring it is disabled\";
      v10 = buf;
      goto LABEL_12;
    }
LABEL_13:

    v16 = self;
    v17 = 0;
LABEL_14:
    -[CDPDKeychainSync _setUserVisibleKeychainSyncEnabled:withCompletion:](v16, "_setUserVisibleKeychainSyncEnabled:withCompletion:", v17, v4, v26);
    goto LABEL_15;
  }
  v11 = -[CDPDKeychainSync _keychainSyncAvailableViaSOS](self, "_keychainSyncAvailableViaSOS");
  _CDPLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (!v13)
      goto LABEL_19;
    v27 = 0;
    v14 = "\"updateKeychainSyncStateIfNeeded: Keychain sync currently implicitly ON via SOS. Enabling OT views as well.\";
    v15 = (uint8_t *)&v27;
  }
  else
  {
    if (!v13)
      goto LABEL_19;
    LOWORD(v26) = 0;
    v14 = "\"updateKeychainSyncStateIfNeeded: Ensuring keychain sync is enabled for user.\";
    v15 = (uint8_t *)&v26;
  }
  _os_log_impl(&dword_20DB2C000, v12, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
LABEL_19:

  -[CDPDKeychainSync syncPolicy](self, "syncPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isBuddyFinished");

  _CDPLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21)
      -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:].cold.3();

    -[CDPDKeychainSync syncPolicy](self, "syncPolicy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userHasExplicitlyDisabledSync");

    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (!v23)
    {
      if (v24)
        -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:].cold.2();

      v16 = self;
      v17 = 1;
      goto LABEL_14;
    }
    if (v24)
      -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:].cold.1();
    goto LABEL_13;
  }
  if (v21)
    -[CDPDKeychainSync updateKeychainSyncStateIfNeededWithCompletion:].cold.4();

  if (v4)
  {
    _CDPStateError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v25);

  }
LABEL_15:

}

- (void)setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  _QWORD aBlock[5];
  id v10;
  BOOL v11;

  v4 = a3;
  v6 = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CDPDKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke;
  aBlock[3] = &unk_24C81C5A8;
  v11 = v4;
  aBlock[4] = self;
  v10 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  -[CDPDKeychainSync _setUserVisibleKeychainSyncEnabled:withCompletion:](self, "_setUserVisibleKeychainSyncEnabled:withCompletion:", v4, v8);

}

void __69__CDPDKeychainSync_setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if ((_DWORD)a2)
  {
    v6 = *(_BYTE *)(a1 + 48) == 0;
    objc_msgSend(*(id *)(a1 + 32), "syncPolicy", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserHasExplicitlyDisabledSync:", v6);

    v5 = v9;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9);
    v5 = v9;
  }

}

- (void)_setUserVisibleKeychainSyncEnabled:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  id v13;
  id v14;
  void (**v15)(void *, _QWORD, void *);
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  void (**v20)(void *, _QWORD, void *);
  BOOL v21;
  _QWORD aBlock[4];
  __CFString *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  __CFString *v27;
  uint64_t v28;

  v4 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = CFSTR("disable");
  if (v4)
    v7 = CFSTR("enable");
  v8 = v7;
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"_setUserVisibleKeychainSyncEnabled: Attempting to %{public}@ user-visible keychain sync.\", buf, 0xCu);
  }

  v10 = (void *)os_transaction_create();
  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke;
  aBlock[3] = &unk_24C81CDE8;
  v12 = v8;
  v23 = v12;
  v13 = v10;
  v24 = v13;
  v14 = v6;
  v25 = v14;
  v15 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (v4 && !-[CDPDKeychainSync isUserVisibleKeychainSyncAvailable](self, "isUserVisibleKeychainSyncAvailable"))
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CDPDKeychainSync _setUserVisibleKeychainSyncEnabled:withCompletion:].cold.1();

    -[CDPDKeychainSync _setUserVisibleKeychainSyncEnabled:withCompletion:](self, "_setUserVisibleKeychainSyncEnabled:withCompletion:", 0, 0);
    if (v15)
    {
      _CDPStateError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v18);

    }
  }
  else if (-[CDPDKeychainSync isUserVisibleKeychainSyncEnabled](self, "isUserVisibleKeychainSyncEnabled") == v4)
  {
    _CDPLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"_setUserVisibleKeychainSyncEnabled: No need to %{public}@ user-visible keychain because we are alraedy in that state.\", buf, 0xCu);
    }

    if (v15)
      v15[2](v15, 1, 0);
  }
  else
  {
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_100;
    v19[3] = &unk_24C81DA10;
    v19[4] = self;
    v20 = v15;
    v21 = v4;
    +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:](CDPAuthenticationHelper, "silentAuthenticationForPrimaryAccountWithCompletion:", v19);

  }
}

void __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"_setUserVisibleKeychainSyncEnabled: Sucessfully managed to %{public}@ user-visible keychain\", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

void __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v4[5];
  id v5;
  char v6;

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_processAuthFailure:completion:", a3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_2;
    v4[3] = &unk_24C81C5A8;
    v6 = *(_BYTE *)(a1 + 48);
    v4[4] = v3;
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_preflightCircleStatusWithCompletion:", v4);

  }
}

void __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  id v22[2];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v6 = 1;
LABEL_10:
      v10 = *(void **)(a1 + 32);
      v23 = 0;
      v11 = objc_msgSend(v10, "_setKeychainSyncState:error:", v6, &v23);
      v9 = v23;
      v22[1] = 0;
      if (!objc_msgSend(MEMORY[0x24BE1A4A0], "deferSOSFromSignIn")
        || !SOSCCFetchCompatibilityMode())
      {
LABEL_19:
        v21 = *(_QWORD *)(a1 + 40);
        if (v21)
          (*(void (**)(uint64_t, uint64_t, id))(v21 + 16))(v21, v11, v9);
        goto LABEL_21;
      }
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v13 = *(unsigned __int8 *)(a1 + 48);
      v22[0] = 0;
      v14 = objc_msgSend(v12, "setUserControllableViewsSyncStatus:error:", v13, v22);
      v15 = v22[0];
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          v18 = "\"Successfully enabled SOS views\";
          v19 = v16;
          v20 = 2;
LABEL_17:
          _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
      }
      else if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        v18 = "\"Failed to enable SOS views: %@\";
        v19 = v16;
        v20 = 12;
        goto LABEL_17;
      }

      goto LABEL_19;
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "_keychainSyncAvailableViaSOS") & 1) == 0)
    {
      v6 = *(_BYTE *)(a1 + 48) != 0;
      goto LABEL_10;
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      _CDPStateError();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);
LABEL_21:

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v5);
  }

}

- (void)_processAuthFailure:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE0AB28]))
  {
    v8 = objc_msgSend(v5, "code");

    if (v8 == -7013)
    {
      _CDPLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CDPDKeychainSync _processAuthFailure:completion:].cold.1((uint64_t)v5, v9);

      if (v6)
      {
        _CDPStateError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, 0, v10);

      }
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (v6)
    v6[2](v6, 0, v5);
LABEL_10:

}

- (void)_preflightCircleStatusWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (-[CDPDKeychainSync _isThisDeviceInCircle](self, "_isThisDeviceInCircle"))
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CDPDKeychainSync _preflightCircleStatusWithCompletion:].cold.1();

    if (v4)
    {
      _CDPStateError();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v6);

    }
  }

}

- (BOOL)_setKeychainSyncState:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  CDPDCircleProxy *circleProxy;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v5 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  circleProxy = self->_circleProxy;
  v13 = 0;
  v7 = -[CDPDCircleProxy setUserControllableViewsSyncStatus:error:](circleProxy, "setUserControllableViewsSyncStatus:error:", a3, &v13);
  v8 = v13;
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v8;
    _os_log_debug_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEBUG, "\"Calling setUserControllableViewsSyncStatus with enable=%@ returned success=%@ error: %@\", buf, 0x20u);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (void)removeNonViewAwarePeersFromCircleWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  CDPDCircleProxy *circleProxy;
  uint64_t v6;
  id v7;
  id v8;

  v4 = (void (**)(id, uint64_t, id))a3;
  circleProxy = self->_circleProxy;
  v8 = 0;
  v6 = -[CDPDCircleProxy removeNonViewAwarePeers:](circleProxy, "removeNonViewAwarePeers:", &v8);
  v7 = v8;
  if (v4)
    v4[2](v4, v6, v7);

}

+ (id)_defaultUserVisibleViewSet
{
  if (_defaultUserVisibleViewSet_onceToken != -1)
    dispatch_once(&_defaultUserVisibleViewSet_onceToken, &__block_literal_global_11);
  return (id)_defaultUserVisibleViewSet_defaultViewSet;
}

void __46__CDPDKeychainSync__defaultUserVisibleViewSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDE8F20], *MEMORY[0x24BDE8F00], *MEMORY[0x24BDE8F18], *MEMORY[0x24BDE8F08], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_defaultUserVisibleViewSet_defaultViewSet;
  _defaultUserVisibleViewSet_defaultViewSet = v0;

}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (CDPDCircleProxy)sosCircleProxy
{
  return self->_sosCircleProxy;
}

- (CDPDKeychainSyncPolicyProvider)syncPolicy
{
  return self->_syncPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncPolicy, 0);
  objc_storeStrong((id *)&self->_sosCircleProxy, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
}

- (void)isUserVisibleKeychainSyncAvailable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"isUserVisibleKeychainSyncAllowed: sync is currently disallowed by MDM policy\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)isUserVisibleKeychainSyncEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"The device is NOT in circle and so isUserVisibleKeychainSyncEnabled will return NO\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"User has explicitly disabled the keychain...Respect it.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"User did not explicitly disabled keychain sync. Turning Keychain ON.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Buddy flow is finished...Let us set correct keychain state\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Can't enable keychain until buddy setup is finished\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)updateKeychainSyncStateIfNeededWithCompletion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Trying to update KeyChainSync State\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_setUserVisibleKeychainSyncEnabled:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, v0, v1, "\"_setUserVisibleKeychainSyncEnabled: Sync is not allowed but we are attempting to enable it. Ensuring keychain sync is off, per policy.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __70__CDPDKeychainSync__setUserVisibleKeychainSyncEnabled_withCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"_setUserVisibleKeychainSyncEnabled: Failed to %{public}@ user-visible keychain with error: %@\", (uint8_t *)&v4, 0x16u);
}

- (void)_processAuthFailure:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"CDP State repair is needed because the account is iCDP enabled but HSA2 silent auth failed with error %@\", (uint8_t *)&v2, 0xCu);
}

- (void)_preflightCircleStatusWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"CDP State repair is needed because the account is iCDP enabled but not in circle\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

@end
