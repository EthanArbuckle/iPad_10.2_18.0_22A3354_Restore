@implementation FTRegAccountServiceDelegate

- (FTRegAccountServiceDelegate)initWithRegController:(id)a3
{
  id v4;
  FTRegAccountServiceDelegate *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  FTRegAccountServiceDelegate *v10;
  FTRegAccountServiceDelegate *v11;
  _QWORD v13[4];
  FTRegAccountServiceDelegate *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FTRegAccountServiceDelegate;
  v5 = -[FTRegAccountServiceDelegate init](&v15, sel_init);
  if (!v5)
  {
LABEL_6:
    v11 = v5;
    goto LABEL_10;
  }
  csui_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      objc_msgSend(v4, "serviceType");
      FTCServiceNameForServiceType();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Creating SetupAssistant delegate with type: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__FTRegAccountServiceDelegate_initWithRegController___block_invoke;
    v13[3] = &unk_24D075180;
    v10 = v5;
    v14 = v10;
    objc_msgSend(v9, "__im_performBlock:waitUntilDone:", v13, 1);

    -[FTRegAccountServiceDelegate setRegController:](v10, "setRegController:", v4);
    goto LABEL_6;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Not creating SetupAssistant delegate due to missing registration controller", buf, 2u);
  }

  v11 = 0;
LABEL_10:

  return v11;
}

void __53__FTRegAccountServiceDelegate_initWithRegController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addListenerID:capabilities:", v2, *MEMORY[0x24BE509E8]);

}

- (FTRegAccountServiceDelegate)init
{
  void *v3;
  FTRegAccountServiceDelegate *v4;

  +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", -[FTRegAccountServiceDelegate serviceType](self, "serviceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FTRegAccountServiceDelegate initWithRegController:](self, "initWithRegController:", v3);

  return v4;
}

- (id)_logName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FTRegAccountServiceDelegate displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SetupAssistant:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (IDSAccountController)accountController
{
  IDSAccountController *accountController;
  int64_t v4;
  id *v5;
  objc_class *v6;
  id v7;
  IDSAccountController *v8;
  IDSAccountController *v9;

  accountController = self->_accountController;
  if (!accountController)
  {
    v4 = -[FTRegAccountServiceDelegate serviceType](self, "serviceType");
    v5 = (id *)MEMORY[0x24BE4FB70];
    if (v4 != 1)
      v5 = (id *)MEMORY[0x24BE4FB58];
    v6 = (objc_class *)MEMORY[0x24BE4FBE0];
    v7 = *v5;
    v8 = (IDSAccountController *)objc_msgSend([v6 alloc], "initWithService:", v7);

    v9 = self->_accountController;
    self->_accountController = v8;

    accountController = self->_accountController;
  }
  return accountController;
}

- (void)_cleanup
{
  -[FTRegAccountServiceDelegate setResponseDictionary:](self, "setResponseDictionary:", 0);
  -[FTRegAccountServiceDelegate setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (void)_handleSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  csui_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Finished successfully:%@, error:%@", (uint8_t *)&v11, 0x16u);
  }

  -[FTRegAccountServiceDelegate completionHandler](self, "completionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FTRegAccountServiceDelegate completionHandler](self, "completionHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, 1, 0);

  }
  -[FTRegAccountServiceDelegate _cleanup](self, "_cleanup");

}

- (void)_handleFailureWithErrorCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ftreg.buddyerror"), a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FTRegAccountServiceDelegate _handleSuccess:error:](self, "_handleSuccess:error:", 0, v4);

}

- (BOOL)_hasAccount
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__FTRegAccountServiceDelegate__hasAccount__block_invoke;
  v5[3] = &unk_24D0751A8;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "__im_performBlock:waitUntilDone:", v5, 1);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __42__FTRegAccountServiceDelegate__hasAccount__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "regController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connect:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsWithFilter:", 32772);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  csui_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = objc_msgSend(v6, "count");
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu existing accounts %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6)
    v8 = objc_msgSend(v6, "count") != 0;
  else
    v8 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;

}

- (BOOL)_hasOperationalAccount
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__FTRegAccountServiceDelegate__hasOperationalAccount__block_invoke;
  v5[3] = &unk_24D0751A8;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "__im_performBlock:waitUntilDone:", v5, 1);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __53__FTRegAccountServiceDelegate__hasOperationalAccount__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "regController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connect:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsWithFilter:", 65540);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  csui_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218242;
    v10 = objc_msgSend(v6, "count");
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu operational accounts %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6)
    v8 = objc_msgSend(v6, "count") != 0;
  else
    v8 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;

}

- (BOOL)_account:(id)a3 matchesSetupParameters:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  objc_msgSend(a4, "__ftreg_responseAppleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && objc_msgSend(v7, "length"))
  {
    -[FTRegAccountServiceDelegate regController](self, "regController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loginForAccount:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "isEqualToIgnoringCase:", v8);
    if (objc_msgSend(v10, "hasMobileMeSuffix") && objc_msgSend(v8, "hasMobileMeSuffix"))
    {
      objc_msgSend(v8, "stripMobileMSuffixIfPresent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stripMobileMSuffixIfPresent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToIgnoringCase:", v13);

      v11 |= v14;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_existingAccountForSetupParameters:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "__ftreg_responseAppleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  csui_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Looking for existing account for Apple ID: %@", buf, 0xCu);
  }

  if (objc_msgSend(v5, "length"))
  {
    -[FTRegAccountServiceDelegate regController](self, "regController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountsWithFilter:", 32772);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (-[FTRegAccountServiceDelegate _account:matchesSetupParameters:](self, "_account:matchesSetupParameters:", v14, v4, (_QWORD)v17))
          {
            v15 = v14;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_14:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_existingOperationalAccount
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[FTRegAccountServiceDelegate regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithFilter:", 65540);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  csui_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu existing operational accounts", (uint8_t *)&v7, 0xCu);
  }

  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldSkipAccountSetup:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  csui_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Checking if user has denied permission to use phoneNumber for FaceTime/Messages.", buf, 2u);
  }

  v6 = dispatch_semaphore_create(0);
  v16 = MEMORY[0x24BDAC760];
  v7 = v6;
  v17 = v7;
  dispatch_get_global_queue(33, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IDSRegistrationControlGetStateForRegistrationType();

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v19 + 24))
  {
    v9 = 1;
  }
  else
  {
    -[FTRegAccountServiceDelegate _existingOperationalAccount](self, "_existingOperationalAccount", v16, 3221225472, __55__FTRegAccountServiceDelegate__shouldSkipAccountSetup___block_invoke, &unk_24D0751D0, v7, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && !-[FTRegAccountServiceDelegate _account:matchesSetupParameters:](self, "_account:matchesSetupParameters:", v10, v4))
    {
      csui_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "login");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        -[FTRegAccountServiceDelegate responseDictionary](self, "responseDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "__ftreg_responseAppleID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v12;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "A registered AppleID account already exists (%@), but we are setting up for: %@. Bailing.", buf, 0x16u);

      }
      *((_BYTE *)v19 + 24) = 1;
    }

    v9 = *((_BYTE *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v9;
}

intptr_t __55__FTRegAccountServiceDelegate__shouldSkipAccountSetup___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if (a2 == 1)
  {
    csui_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "User has denied use of phoneNumber for FaceTime/Messages. Skipping account setup", v5, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)serviceIdentifier
{
  return 0;
}

- (id)parametersForLoginRequest
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__FTRegAccountServiceDelegate_parametersForLoginRequest__block_invoke;
  v6[3] = &unk_24D0751A8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__im_performBlock:waitUntilDone:", v6, 1);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__FTRegAccountServiceDelegate_parametersForLoginRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int16 v16;
  uint8_t v17[2];
  __int16 v18;
  uint8_t buf[16];

  csui_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Building setup request parameters", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "serviceIsAvailable"))
  {
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isMultiUser"))
    {
      objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentUser");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "inFirstLoginSession"))
      {

        goto LABEL_12;
      }
      v12 = objc_msgSend(*(id *)(a1 + 32), "_hasAccount");

      if (!v12)
      {
LABEL_12:
        csui_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 0;
          v10 = "No accounts, sending default request parameters";
          v11 = (uint8_t *)&v16;
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "_hasAccount");

      if ((v6 & 1) == 0)
        goto LABEL_12;
    }
    v7 = objc_msgSend(*(id *)(a1 + 32), "_hasOperationalAccount");
    csui_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v18 = 0;
        v10 = "Operational account found, sending default parameters to try and refresh the account";
        v11 = (uint8_t *)&v18;
LABEL_16:
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else if (v9)
    {
      *(_WORD *)v17 = 0;
      v10 = "Found a non-operational account, sending default request parameters";
      v11 = v17;
      goto LABEL_16;
    }
LABEL_17:

    objc_msgSend(*(id *)(a1 + 32), "_defaultSetupRequestParameters");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (id)_defaultSetupRequestParameters
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("protocol-version");
  v4[0] = CFSTR("4");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parametersForIdentityEstablishmentRequest
{
  return 0;
}

- (void)handleLoginResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke;
  v11[3] = &unk_24D0752B8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "__im_performBlock:", v11);

}

void __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  __CFString *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setResponseDictionary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", *(_QWORD *)(a1 + 48));
  csui_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Got setup parameters:", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global);
  v3 = *(void **)(a1 + 40);
  if (!v3 || !objc_msgSend(v3, "count"))
  {
    csui_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "displayName");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v11;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Received empty setup response. Skipping setup for %@.", buf, 0xCu);

    }
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "__ftreg_isValidSetupDictionary");

  if ((v5 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "responseDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "_shouldSkipAccountSetup:", v7);

    if ((_DWORD)v6)
    {
      csui_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "__ftreg_responseAppleID");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v10;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Skipping setup for %@ because _shouldSkipAccountSetup returned YES.", buf, 0xCu);

      }
LABEL_11:

      objc_msgSend(*(id *)(a1 + 32), "_handleSuccess:error:", 1, 0);
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "__ftreg_responseIsUpgrade");

    csui_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("NO");
      if (v15)
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v55 = v17;
      _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_DEFAULT, "Handling setup response [isUpgrade=%@], kicking off account setup", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "__ftreg_candidateAliases");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v19, "count") > 1)
    {
LABEL_32:
      csui_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v33;
        _os_log_impl(&dword_2138BA000, v32, OS_LOG_TYPE_DEFAULT, "We have user-selectable aliases [%@]. Deferring to the setup manager.", buf, 0xCu);

      }
      +[FTRegAppleIDSetupManager sharedInstance](FTRegAppleIDSetupManager, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addSetupDictionary:forService:", v35, objc_msgSend(*(id *)(a1 + 32), "serviceType"));

      objc_msgSend(*(id *)(a1 + 32), "_handleSuccess:error:", 1, 0);
      goto LABEL_35;
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v51 != v23)
            objc_enumerationMutation(v20);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "_appearsToBePhoneNumber", (_QWORD)v50) & 1) != 0)
          {

            goto LABEL_32;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        if (v22)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    IDSParseAuthDictionary();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "accountController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", *MEMORY[0x24BE4FD50]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "__imArrayByApplyingBlock:", &__block_literal_global_51);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "supportsSMS");

    if ((v31 & 1) != 0)
    {
      if (objc_msgSend(v29, "count"))
        objc_msgSend(v29, "arrayByAddingObject:", *MEMORY[0x24BE4FEE0]);
      else
        IMSingleObjectArray();
      v36 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v36;
    }
    v37 = objc_msgSend(*(id *)(a1 + 32), "serviceType", (_QWORD)v50);
    v38 = (id *)MEMORY[0x24BE4FB70];
    if (v37 != 1)
      v38 = (id *)MEMORY[0x24BE4FB58];
    v39 = (__CFString *)*v38;
    objc_msgSend(v26, "objectForKey:", *MEMORY[0x24BE4FD48]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", *MEMORY[0x24BE4FD58]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    csui_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v55 = v39;
      v56 = 2112;
      v57 = v40;
      v58 = 2112;
      v59 = v41;
      v60 = 2112;
      v61 = v29;
      _os_log_impl(&dword_2138BA000, v42, OS_LOG_TYPE_DEFAULT, " => Setting up service: %@   with apple id: %@  profile id: %@  aliases: %@", buf, 0x2Au);
    }

    objc_msgSend(v27, "serviceName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "accountWithLoginID:service:", v40, v43);
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString isActive](v44, "isActive")
      && -[__CFString registrationStatus](v44, "registrationStatus") == 5)
    {
      csui_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v44;
        v46 = " => Has existing registered account: %@";
        v47 = v45;
        v48 = 12;
LABEL_51:
        _os_log_impl(&dword_2138BA000, v47, OS_LOG_TYPE_DEFAULT, v46, buf, v48);
      }
    }
    else
    {
      csui_log();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v44;
        _os_log_impl(&dword_2138BA000, v49, OS_LOG_TYPE_DEFAULT, " => Existing account: %@", buf, 0xCu);
      }

      if (!-[__CFString isUserDisabled](v44, "isUserDisabled"))
      {
        objc_msgSend(v29, "__imSetFromArray");
        v45 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setupAccountWithSetupParameters:aliases:completionHandler:", v26, v45, &__block_literal_global_59);
        goto LABEL_53;
      }
      csui_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v46 = " => Account was disabled by the user, not setting up...";
        v47 = v45;
        v48 = 2;
        goto LABEL_51;
      }
    }
LABEL_53:

    objc_msgSend(*(id *)(a1 + 32), "_handleSuccess:error:", 1, 0);
LABEL_35:

    return;
  }
  csui_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v55 = v13;
    _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Received incomplete setup response. Failing setup for %@.", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_handleFailureWithErrorCode:", 4000);
}

void __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isEqual:", CFSTR("password"));
  csui_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      v9 = "  => password : REDACTED";
      v10 = v7;
      v11 = 2;
LABEL_6:
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v8)
  {
    v12 = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v9 = "  => %@ : %@";
    v10 = v7;
    v11 = 22;
    goto LABEL_6;
  }

}

id __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke_49(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("uri"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v4, "intValue");
  if ((_DWORD)v2 == 5051)
  {
    objc_msgSend(v3, "_stripFZIDPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke_57(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  csui_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a3)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Got response from setup operation. Success=%@, error=%@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)setupOperationFailed
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__FTRegAccountServiceDelegate_setupOperationFailed__block_invoke;
  v4[3] = &unk_24D075180;
  v4[4] = self;
  objc_msgSend(v3, "__im_performBlock:waitUntilDone:", v4, 0);

}

uint64_t __51__FTRegAccountServiceDelegate_setupOperationFailed__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  csui_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Setup operation failed. Cleaning up.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (int64_t)serviceType
{
  return 0;
}

- (id)name
{
  return 0;
}

- (id)displayName
{
  return 0;
}

- (BOOL)serviceIsAvailable
{
  return 0;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
  objc_storeStrong((id *)&self->_regController, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAccountController:(id)a3
{
  objc_storeStrong((id *)&self->_accountController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_regController, 0);
}

@end
