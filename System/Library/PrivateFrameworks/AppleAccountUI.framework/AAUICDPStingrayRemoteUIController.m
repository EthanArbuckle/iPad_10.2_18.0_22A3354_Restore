@implementation AAUICDPStingrayRemoteUIController

- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3
{
  return -[AAUICDPStingrayRemoteUIController initWithRemoteUIController:appleAccount:](self, "initWithRemoteUIController:appleAccount:", a3, 0);
}

- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3 appleAccount:(id)a4
{
  id v6;
  id v7;
  AAUICDPStingrayRemoteUIController *v8;
  AAUICDPStingrayRemoteUIController *v9;
  uint64_t v10;
  RUIServerHookHandler *serverHookHandler;

  v6 = a3;
  v7 = a4;
  v8 = -[AAUICDPStingrayRemoteUIController init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D872D8]), "initWithRemoteUIController:", v6);
    serverHookHandler = v9->_serverHookHandler;
    v9->_serverHookHandler = (RUIServerHookHandler *)v10;

    +[RemoteUICustomComponentFactory registerRemoteUISwiftViews](RemoteUICustomComponentFactory, "registerRemoteUISwiftViews");
  }

  return v9;
}

- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3 appleAccount:(id)a4 hooks:(id)a5
{
  id v8;
  id v9;
  id v10;
  AAUICDPStingrayRemoteUIController *v11;
  AAUICDPStingrayRemoteUIController *v12;
  uint64_t v13;
  RUIServerHookHandler *serverHookHandler;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[AAUICDPStingrayRemoteUIController init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D872D8]), "initWithRemoteUIController:hooks:", v8, v10);
    serverHookHandler = v12->_serverHookHandler;
    v12->_serverHookHandler = (RUIServerHookHandler *)v13;

    +[RemoteUICustomComponentFactory registerRemoteUISwiftViews](RemoteUICustomComponentFactory, "registerRemoteUISwiftViews");
  }

  return v12;
}

- (void)attachAllHandlers
{
  AAUIAuthKitAuthenticatonHook *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AAUICDPStingrayRemoteUIController *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[16];

  v38[14] = *MEMORY[0x1E0C80C00];
  v25 = (void *)objc_opt_new();
  v38[0] = v25;
  v3 = [AAUIAuthKitAuthenticatonHook alloc];
  v32 = self;
  -[ACAccount username](self->_account, "username");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AAUIAuthKitAuthenticatonHook initWithUsername:altDSID:](v3, "initWithUsername:altDSID:", v31, v30);
  v38[1] = v4;
  v5 = objc_opt_new();
  v38[2] = v5;
  v28 = (void *)objc_opt_new();
  v38[3] = v28;
  v29 = (void *)objc_opt_new();
  v38[4] = v29;
  v6 = (void *)objc_opt_new();
  v38[5] = v6;
  v7 = (void *)objc_opt_new();
  v38[6] = v7;
  v8 = (void *)objc_opt_new();
  v38[7] = v8;
  v9 = (void *)objc_opt_new();
  v38[8] = v9;
  v10 = (void *)objc_opt_new();
  v38[9] = v10;
  v11 = (void *)objc_opt_new();
  v38[10] = v11;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2050000000;
  v12 = (void *)getFALaunchScreenTimeSetupHookClass_softClass;
  v37 = getFALaunchScreenTimeSetupHookClass_softClass;
  if (!getFALaunchScreenTimeSetupHookClass_softClass)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __getFALaunchScreenTimeSetupHookClass_block_invoke;
    v33[3] = &unk_1EA2DB6E8;
    v33[4] = &v34;
    __getFALaunchScreenTimeSetupHookClass_block_invoke((uint64_t)v33);
    v12 = (void *)v35[3];
  }
  v26 = (void *)v4;
  v27 = (void *)v5;
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v34, 8);
  v14 = (void *)objc_opt_new();
  v38[11] = v14;
  v15 = (void *)objc_opt_new();
  v38[12] = v15;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00338]), "initWithAccount:", v32->_account);
  v38[13] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0D002F0]);
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v17, "mutableCopy");
    v21 = objc_alloc(MEMORY[0x1E0D002F0]);
    -[ACAccount aa_altDSID](v32->_account, "aa_altDSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithAltDSID:", v22);
    objc_msgSend(v20, "addObject:", v23);

    v24 = objc_msgSend(v20, "copy");
    v17 = (void *)v24;
  }
  -[RUIServerHookHandler setServerHooks:](v32->_serverHookHandler, "setServerHooks:", v17);

}

- (void)attachRecoveryKeyHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[RUIServerHookHandler serverHooks](self->_serverHookHandler, "serverHooks", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v6, "addObject:", v5);

  -[RUIServerHookHandler setServerHooks:](self->_serverHookHandler, "setServerHooks:", v6);
}

- (void)attachPasscodeHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[RUIServerHookHandler serverHooks](self->_serverHookHandler, "serverHooks", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v6, "addObject:", v5);

  -[RUIServerHookHandler setServerHooks:](self->_serverHookHandler, "setServerHooks:", v6);
}

- (void)attachRepairHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[RUIServerHookHandler serverHooks](self->_serverHookHandler, "serverHooks", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v6, "addObject:", v5);

  -[RUIServerHookHandler setServerHooks:](self->_serverHookHandler, "setServerHooks:", v6);
}

- (void)attachBiometricRatchetHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[RUIServerHookHandler serverHooks](self->_serverHookHandler, "serverHooks", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v6, "addObject:", v5);

  -[RUIServerHookHandler setServerHooks:](self->_serverHookHandler, "setServerHooks:", v6);
}

- (void)attachDTOBiometryHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[RUIServerHookHandler serverHooks](self->_serverHookHandler, "serverHooks", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v6, "addObject:", v5);

  -[RUIServerHookHandler setServerHooks:](self->_serverHookHandler, "setServerHooks:", v6);
}

- (void)attachAuthHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[RUIServerHookHandler serverHooks](self->_serverHookHandler, "serverHooks", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v6, "addObject:", v5);

  -[RUIServerHookHandler setServerHooks:](self->_serverHookHandler, "setServerHooks:", v6);
}

- (void)processObjectModel:(id)a3 isModal:(BOOL)a4
{
  -[AAUICDPStingrayRemoteUIController processObjectModel:isModal:completion:](self, "processObjectModel:isModal:completion:", a3, a4, 0);
}

- (void)processObjectModel:(id)a3 isModal:(BOOL)a4 completion:(id)a5
{
  -[RUIServerHookHandler processObjectModel:isModal:completion:](self->_serverHookHandler, "processObjectModel:isModal:completion:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
}

@end
