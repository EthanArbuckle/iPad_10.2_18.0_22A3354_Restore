@implementation AAUIServerHookFactory

- (id)hooksFor:(unint64_t)a3 accountManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    -[AAUIServerHookFactory _iCloudDataRecoveryServiceHooksFor:accountManager:cdpContext:](self, "_iCloudDataRecoveryServiceHooksFor:accountManager:cdpContext:", v8, v6, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1)
      -[AAUIServerHookFactory _passwordAndSecurityHooksForAccount:accountManager:](self, "_passwordAndSecurityHooksForAccount:accountManager:", v8, v6);
    else
      -[AAUIServerHookFactory _defaultHooks:](self, "_defaultHooks:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)hooksFor:(unint64_t)a3 accountManager:(id)a4 cdpContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "accounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 2)
  {
    -[AAUIServerHookFactory _iCloudDataRecoveryServiceHooksFor:accountManager:cdpContext:](self, "_iCloudDataRecoveryServiceHooksFor:accountManager:cdpContext:", v11, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 1)
      -[AAUIServerHookFactory _passwordAndSecurityHooksForAccount:accountManager:](self, "_passwordAndSecurityHooksForAccount:accountManager:", v11, v8);
    else
      -[AAUIServerHookFactory _defaultHooks:](self, "_defaultHooks:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_defaultHooks:(id)a3
{
  id v3;
  AAUIAuthKitAuthenticatonHook *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  AAUIAuthKitAuthenticatonHook *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[16];

  v25[14] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = (void *)objc_opt_new();
  v25[0] = v24;
  v4 = [AAUIAuthKitAuthenticatonHook alloc];
  objc_msgSend(v3, "username");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_altDSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[AAUIAuthKitAuthenticatonHook initWithUsername:altDSID:](v4, "initWithUsername:altDSID:", v23, v22);
  v25[1] = v21;
  v20 = (void *)objc_opt_new();
  v25[2] = v20;
  v19 = (void *)objc_opt_new();
  v25[3] = v19;
  v18 = (void *)objc_opt_new();
  v25[4] = v18;
  v17 = (void *)objc_opt_new();
  v25[5] = v17;
  v5 = (void *)objc_opt_new();
  v25[6] = v5;
  v6 = (void *)objc_opt_new();
  v25[7] = v6;
  v7 = (void *)objc_opt_new();
  v25[8] = v7;
  v8 = (void *)objc_opt_new();
  v25[9] = v8;
  v9 = (void *)objc_opt_new();
  v25[10] = v9;
  v10 = (void *)objc_opt_new();
  v25[11] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D002F0]);
  objc_msgSend(v3, "aa_altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithAltDSID:", v12);
  v25[12] = v13;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00338]), "initWithAccount:", v3);

  v25[13] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_passwordAndSecurityHooksForAccount:(id)a3 accountManager:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AAUIAccountBeneficiaryManagementHook *v14;
  AAUIAccountRecoveryManagementHook *v15;
  void *v16;
  void *v17;
  AAUIAuthKitPasswordChangeHook *v18;
  void *v19;
  AAUIAuthKitPasswordChangeHook *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  -[AAUIServerHookFactory _defaultHooks:](self, "_defaultHooks:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

  +[AAUIRecoveryContactsViewFactory createViewModelWithAccountManager:](AAUIRecoveryContactsViewFactory, "createViewModelWithAccountManager:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[AAUILegacyContactsViewFactory createViewModelWithAccountManager:](AAUILegacyContactsViewFactory, "createViewModelWithAccountManager:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  v25[0] = v13;
  v14 = -[AAUIAccountBeneficiaryManagementHook initWithAccountManager:legacyContactsViewModel:]([AAUIAccountBeneficiaryManagementHook alloc], "initWithAccountManager:legacyContactsViewModel:", v7, v12);
  v25[1] = v14;
  v15 = -[AAUIAccountRecoveryManagementHook initWithAccountManager:recoveryContactsViewModel:]([AAUIAccountRecoveryManagementHook alloc], "initWithAccountManager:recoveryContactsViewModel:", v7, v24);

  v25[2] = v15;
  v16 = (void *)objc_opt_new();
  v25[3] = v16;
  v17 = (void *)objc_opt_new();
  v25[4] = v17;
  v18 = [AAUIAuthKitPasswordChangeHook alloc];
  objc_msgSend(v8, "aa_altDSID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[AAUIAuthKitPasswordChangeHook initWithAltDSID:](v18, "initWithAltDSID:", v19);
  v25[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v21);

  v22 = (void *)objc_msgSend(v11, "copy");
  return v22;
}

- (id)_iCloudDataRecoveryServiceHooksFor:(id)a3 accountManager:(id)a4 cdpContext:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  AAUICDPWalrusStatusUpdateHook *v16;
  AAUICustodianVerificationHook *v17;
  AAUICDPCustodianHook *v18;
  void *v19;
  AAUICDPCustodianHook *v20;
  AAUIAccountRecoveryManagementHook *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  -[AAUIServerHookFactory _defaultHooks:](self, "_defaultHooks:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  +[AAUIRecoveryContactsViewFactory createViewModelWithAccountManager:](AAUIRecoveryContactsViewFactory, "createViewModelWithAccountManager:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AAUICDPWalrusStatusUpdateHook initWithAppleAccount:]([AAUICDPWalrusStatusUpdateHook alloc], "initWithAppleAccount:", v11);

  v17 = -[AAUICustodianVerificationHook initWithAccountManager:]([AAUICustodianVerificationHook alloc], "initWithAccountManager:", v10, v16);
  v26[1] = v17;
  v18 = [AAUICDPCustodianHook alloc];
  v19 = (void *)objc_opt_new();
  v20 = -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:cdpContext:](v18, "initWithAccountManager:contactsProvider:cdpContext:", v10, v19, v9);

  v26[2] = v20;
  v21 = -[AAUIAccountRecoveryManagementHook initWithAccountManager:recoveryContactsViewModel:]([AAUIAccountRecoveryManagementHook alloc], "initWithAccountManager:recoveryContactsViewModel:", v10, v15);

  v26[3] = v21;
  v22 = (void *)objc_opt_new();
  v26[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v23);

  v24 = (void *)objc_msgSend(v14, "copy");
  return v24;
}

@end
