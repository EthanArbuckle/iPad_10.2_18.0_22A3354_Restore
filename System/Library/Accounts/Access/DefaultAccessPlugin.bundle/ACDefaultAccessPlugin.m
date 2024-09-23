@implementation ACDefaultAccessPlugin

+ (id)_supportedAccountTypeIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[15];

  v12[14] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB4038];
  v12[0] = *MEMORY[0x24BDB3FF0];
  v12[1] = v2;
  v3 = *MEMORY[0x24BDB4060];
  v12[2] = *MEMORY[0x24BDB40E0];
  v12[3] = v3;
  v4 = *MEMORY[0x24BDB3FD8];
  v12[4] = *MEMORY[0x24BDB4180];
  v12[5] = v4;
  v5 = *MEMORY[0x24BDB4150];
  v12[6] = *MEMORY[0x24BDB3FE8];
  v12[7] = v5;
  v6 = *MEMORY[0x24BDB4058];
  v12[8] = *MEMORY[0x24BDB4120];
  v12[9] = v6;
  v7 = *MEMORY[0x24BDB4140];
  v12[10] = *MEMORY[0x24BDB4158];
  v12[11] = v7;
  v8 = *MEMORY[0x24BDB4080];
  v12[12] = *MEMORY[0x24BDB4178];
  v12[13] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsAccountTypeWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_supportedAccountTypeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if (v3 && (v5 & 1) == 0)
    v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("com.apple.account.kerberos.sso."), 8) != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)handleAccessRequestToAccountsOfType:(id)a3 forClient:(id)a4 withOptions:(id)a5 store:(id)a6 allowUserInteraction:(BOOL)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, uint64_t, _QWORD);
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  dispatch_semaphore_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, uint64_t, _QWORD))a8;
  objc_msgSend(v13, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "authorizationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "hasEntitlement:", *MEMORY[0x24BDB4450]))
  {
    v17[2](v17, 1, 0);
  }
  else if (-[ACDefaultAccessPlugin _shouldGrantClient:unrestrictedAccessToAccountType:](self, "_shouldGrantClient:unrestrictedAccessToAccountType:", v14, v13))
  {
    _ACDLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_230E5B990();

    v17[2](v17, 1, 0);
  }
  else
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ACDefaultAccessPlugin _shouldGrantClient:defaultAccessToAccountType:](self, "_shouldGrantClient:defaultAccessToAccountType:", v14, v13);
    v21 = objc_msgSend((id)objc_opt_class(), "_accessAlertSupportedByAccountType:", v13);
    if ((v20 | v21) == 1
      && (objc_msgSend(v18, "authorizationForClient:accountType:", v14, v13),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          (v23 = v22) != 0))
    {
      v24 = objc_msgSend(v22, "isGranted");
      _ACDLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
        objc_claimAutoreleasedReturnValue();
        sub_230E5BB50();
      }

      v17[2](v17, v24, 0);
    }
    else
    {
      if (v20)
      {
        _ACDLogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          sub_230E5B9F8();

        v23 = 0;
        v27 = 1;
        *((_BYTE *)v43 + 24) = 1;
      }
      else if (v21)
      {
        _ACDLogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          sub_230E5BA60((uint64_t)v14, v28, v29);

        v30 = dispatch_semaphore_create(0);
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = sub_230E5B104;
        v39[3] = &unk_24FF92B58;
        v41 = &v42;
        v31 = v30;
        v40 = v31;
        -[ACDefaultAccessPlugin _presentAccessAlertforClient:onAccountType:withHandler:](self, "_presentAccessAlertforClient:onAccountType:withHandler:", v14, v13, v39);
        dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);

        v23 = 0;
        v27 = 1;
      }
      else
      {
        if (objc_msgSend((id)objc_opt_class(), "_accessAlertFormerlySupportedByAccountType:", v13))
        {
          _ACDLogSystem();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v13, "identifier");
            objc_claimAutoreleasedReturnValue();
            sub_230E5BAC8();
          }
        }
        else
        {
          _ACDLogSystem();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "identifier");
            objc_claimAutoreleasedReturnValue();
            sub_230E5BB08();
          }
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
      }
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00E80]), "initForClient:", v14);
      objc_msgSend(v33, "setIsGranted:", *((unsigned __int8 *)v43 + 24));
      if (v27)
      {
        objc_msgSend(v18, "setAuthorization:forClient:onAccountType:", v33, v14, v13);
        v34 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v34;
      }
      objc_msgSend(v13, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSinceNow");
      ACDLogAccessRequest();

      ((void (**)(id, uint64_t, void *))v17)[2](v17, *((unsigned __int8 *)v43 + 24), v23);
    }

    _Block_object_dispose(&v42, 8);
  }

}

- (void)authorizeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  objc_class *v9;
  void (**v10)(id, BOOL, void *);
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v9 = (objc_class *)MEMORY[0x24BE00E80];
  v10 = (void (**)(id, BOOL, void *))a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v18 = (id)objc_msgSend([v9 alloc], "initForClient:", v12);
  objc_msgSend(v18, "setIsGranted:", 1);
  objc_msgSend(v11, "authorizationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAuthorization:forClient:onAccountType:", v18, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "bundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "isGranted");
  ACDLogAccessRequest();

  v10[2](v10, v15 == 0, v15);
}

- (void)revokeAccessToAccountsOfType:(id)a3 forClient:(id)a4 store:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, BOOL, void *);
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, BOOL, void *))a6;
  v12 = a5;
  _ACDLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_230E5BB90((uint64_t)v10, v9, v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00E80]), "initForClient:", v10);
  objc_msgSend(v14, "setIsGranted:", 0);
  objc_msgSend(v12, "authorizationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAuthorization:forClient:onAccountType:", v14, v10, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "isGranted");
  ACDLogAccessRequest();

  v11[2](v11, v16 == 0, v16);
}

- (void)revokeAllAccessToAccountsOfType:(id)a3 store:(id)a4 withCompletion:(id)a5
{
  id v7;
  void (**v8)(id, BOOL, void *);
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = (void (**)(id, BOOL, void *))a5;
  v9 = a4;
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_230E5BC38(v7, v10);

  objc_msgSend(v9, "authorizationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeAllClientAuthorizationsForAccountType:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v12 == 0, v12);
}

- (BOOL)_shouldGrantClient:(id)a3 unrestrictedAccessToAccountType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_fullAccessEntitlementForAccountType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v5, "hasEntitlement:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)_shouldGrantClient:(id)a3 defaultAccessToAccountType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_defaultAccessEntitlementForAccountType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v5, "hasEntitlement:", v7);
  else
    v8 = 0;

  return v8;
}

+ (id)_defaultAccessEntitlementForAccountType:(id)a3
{
  return 0;
}

+ (BOOL)_accessAlertSupportedByAccountType:(id)a3
{
  return 0;
}

+ (BOOL)_accessAlertFormerlySupportedByAccountType:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4150]);

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDB4120]);

  }
  return v6;
}

+ (id)_fullAccessEntitlementForAccountType:(id)a3
{
  void *v3;
  id *v4;
  id v5;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB3FF0]) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB4038]) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB40E0]) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB4060]) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB4180]) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB3FD8]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDB4458];
  }
  else if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB3FE8]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BDB4460];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqual:", *MEMORY[0x24BDB4080]))
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = (id *)MEMORY[0x24BDB4490];
  }
  v5 = *v4;
LABEL_9:

  return v5;
}

- (void)_presentAccessAlertforClient:(id)a3 onAccountType:(id)a4 withHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "localizedAppName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_ACCESS_MESSAGE"), &stru_24FF92BE0, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "accountTypeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", v10, v21, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_230E5B914;
  v22[3] = &unk_24FF92B80;
  v23 = v7;
  v20 = v7;
  v14 = (void *)MEMORY[0x2348C50C4](v22);
  v15 = (void *)MEMORY[0x24BE00E98];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DONT_ALLOW"), &stru_24FF92BE0, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24FF92BE0, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:", v13, &stru_24FF92BE0, v17, v19, v14);

}

@end
