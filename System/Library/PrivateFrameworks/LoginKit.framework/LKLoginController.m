@implementation LKLoginController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__LKLoginController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (id)sharedController_sharedController;
}

void __37__LKLoginController_sharedController__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v0 = objc_opt_new();
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = v0;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.logind.client.machService"), 4096);
  objc_msgSend((id)sharedController_sharedController, "setConnection:", v2);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E475D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedController_sharedController, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v3);

  objc_initWeak(&location, (id)sharedController_sharedController);
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__LKLoginController_sharedController__block_invoke_2;
  v11[3] = &unk_24D59ADE8;
  objc_copyWeak(&v12, &location);
  objc_msgSend((id)sharedController_sharedController, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterruptionHandler:", v11);

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __37__LKLoginController_sharedController__block_invoke_3;
  v9[3] = &unk_24D59ADE8;
  objc_copyWeak(&v10, &location);
  objc_msgSend((id)sharedController_sharedController, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvalidationHandler:", v9);

  objc_msgSend((id)sharedController_sharedController, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __37__LKLoginController_sharedController__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[LKError errorWithCode:](LKError, "errorWithCode:", 4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

void __37__LKLoginController_sharedController__block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[LKError errorWithCode:](LKError, "errorWithCode:", 5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "completionHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (LKLoginController)init
{
  LKLoginController *v2;
  LKLoginController *v3;
  id completionHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LKLoginController;
  v2 = -[LKLoginController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    completionHandler = v2->_completionHandler;
    v2->_completionHandler = 0;

    LKRegisterLoginKitLogging();
  }
  return v3;
}

- (id)proxy
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[LKLoginController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __26__LKLoginController_proxy__block_invoke;
  v6[3] = &unk_24D59AE30;
  v6[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __26__LKLoginController_proxy__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v4)[2](v4, v5);

      objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    }
  }

}

- (void)logoutWithLogoutType:(unint64_t)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "logoutToLoginSessionWithCompletionHandler:", v7);
  }
  else if (!a3)
  {
    objc_msgSend(v5, "logoutToLoginUserWithCompletionHandler:", v7);
  }

}

- (void)chooseUserWithIdentifier:(id)a3 inClassWithID:(id)a4 password:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  _QWORD v19[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if ((isMultiUser() & 1) != 0)
  {
    -[LKLoginController completionHandler](self, "completionHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[LKError errorWithCode:](LKError, "errorWithCode:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[LKLoginController completionHandler](self, "completionHandler");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v16)[2](v16, v15);

    }
    -[LKLoginController setCompletionHandler:](self, "setCompletionHandler:", v13);
    -[LKLoginController proxy](self, "proxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __91__LKLoginController_chooseUserWithIdentifier_inClassWithID_password_withCompletionHandler___block_invoke;
    v19[3] = &unk_24D59AE30;
    v19[4] = self;
    objc_msgSend(v17, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:", v10, v11, v12, v19);

  }
  else if (v13)
  {
    +[LKError errorWithCode:](LKError, "errorWithCode:", 28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v18);

  }
}

void __91__LKLoginController_chooseUserWithIdentifier_inClassWithID_password_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }

}

- (void)loginAppleID:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 isTemporarySession:(BOOL)a6 withCompletionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void (**v14)(id, void *);
  NSObject *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[16];

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, void *))a7;
  v15 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2167FC000, v15, OS_LOG_TYPE_DEFAULT, "LoginKit: Login is initiated.", buf, 2u);
  }
  if ((isMultiUser() & 1) != 0)
  {
    -[LKLoginController completionHandler](self, "completionHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      +[LKError errorWithCode:](LKError, "errorWithCode:", 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[LKLoginController completionHandler](self, "completionHandler");
      v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v18)[2](v18, v17);

    }
    -[LKLoginController setCompletionHandler:](self, "setCompletionHandler:", v14);
    -[LKLoginController proxy](self, "proxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __99__LKLoginController_loginAppleID_password_localLoginOnly_isTemporarySession_withCompletionHandler___block_invoke;
    v21[3] = &unk_24D59AE30;
    v21[4] = self;
    objc_msgSend(v19, "loginAppleID:password:localLoginOnly:isTemporarySession:withCompletionHandler:", v12, v13, v9, v8, v21);

  }
  else if (v14)
  {
    +[LKError errorWithCode:](LKError, "errorWithCode:", 28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v20);

  }
}

void __99__LKLoginController_loginAppleID_password_localLoginOnly_isTemporarySession_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }

}

- (void)saveClassConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ((isMultiUser() & 1) != 0)
  {
    -[LKLoginController setCompletionHandler:](self, "setCompletionHandler:", v7);
    -[LKLoginController proxy](self, "proxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__LKLoginController_saveClassConfiguration_withCompletionHandler___block_invoke;
    v10[3] = &unk_24D59AE30;
    v10[4] = self;
    objc_msgSend(v8, "saveClassConfiguration:withCompletionHandler:", v6, v10);

  }
  else if (v7)
  {
    +[LKError errorWithCode:](LKError, "errorWithCode:", 28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
}

void __66__LKLoginController_saveClassConfiguration_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }

}

- (void)isReadyToLoginWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void (**)(id, void *))a3;
  if ((isMultiUser() & 1) != 0)
  {
    -[LKLoginController setCompletionHandler:](self, "setCompletionHandler:", v4);
    -[LKLoginController proxy](self, "proxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__LKLoginController_isReadyToLoginWithCompletionHandler___block_invoke;
    v7[3] = &unk_24D59AE30;
    v7[4] = self;
    objc_msgSend(v5, "isReadyToLoginWithCompletionHandler:", v7);

  }
  else if (v4)
  {
    +[LKError errorWithCode:](LKError, "errorWithCode:", 28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

  }
}

void __57__LKLoginController_isReadyToLoginWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }

}

- (void)isReadyToLogoutWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void (**)(id, void *))a3;
  if ((isMultiUser() & 1) != 0)
  {
    -[LKLoginController setCompletionHandler:](self, "setCompletionHandler:", v4);
    -[LKLoginController proxy](self, "proxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__LKLoginController_isReadyToLogoutWithCompletionHandler___block_invoke;
    v7[3] = &unk_24D59AE30;
    v7[4] = self;
    objc_msgSend(v5, "isReadyToLogoutWithCompletionHandler:", v7);

  }
  else if (v4)
  {
    +[LKError errorWithCode:](LKError, "errorWithCode:", 28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

  }
}

void __58__LKLoginController_isReadyToLogoutWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }

}

- (void)checkInWithCurrentEnvironment:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = (void (**)(id, void *))a4;
  if ((isMultiUser() & 1) != 0)
  {
    -[LKLoginController setCompletionHandler:](self, "setCompletionHandler:", v6);
    -[LKLoginController proxy](self, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__LKLoginController_checkInWithCurrentEnvironment_completionHandler___block_invoke;
    v9[3] = &unk_24D59AE30;
    v9[4] = self;
    objc_msgSend(v7, "checkInWithCurrentEnvironment:completionHandler:", a3, v9);

  }
  else if (v6)
  {
    +[LKError errorWithCode:](LKError, "errorWithCode:", 28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

  }
}

void __69__LKLoginController_checkInWithCurrentEnvironment_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }

}

- (id)recentUsers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[LKUser userFromUMUser:](LKUser, "userFromUMUser:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)updateGlobalDefaultsValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[LKLoginController proxy](self, "proxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateGlobalDefaultsValue:forKey:completionHandler:", v10, v9, v8);

}

- (void)triggerLocalUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;

  v16 = a9;
  v17 = a6;
  v18 = a5;
  -[LKLoginController proxy](self, "proxy");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "triggerLocalUserSwitchTestForType:count:username:password:loginDelay:logoutDelay:completionHandler:", a3, a4, v18, v17, a7, a8, v16);

}

- (void)interruptLocalUserSwitchTest
{
  id v2;

  -[LKLoginController proxy](self, "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interruptLocalUserSwitchTest");

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
