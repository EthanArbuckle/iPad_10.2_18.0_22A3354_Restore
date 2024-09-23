@implementation GKLocalPlayerAuthenticator

+ (id)authenticatorForExistingPlayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setInputLocalPlayer:", v4);

  return v5;
}

+ (id)authenticatorForPlayerWithUsername:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setUsername:", v7);

  objc_msgSend(v8, "setPassword:", v6);
  return v8;
}

+ (id)authenticatorForExistingPlayer:(id)a3 withPresentingViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "authenticatorForExistingPlayer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPresentingViewController:", v5);
  return v7;
}

+ (id)authenticatorForPlayerWithUsername:(id)a3 password:(id)a4 withPresentingViewController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "authenticatorForPlayerWithUsername:password:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPresentingViewController:", v7);
  return v10;
}

- (GKLocalPlayerAuthenticator)init
{
  GKLocalPlayerAuthenticator *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLocalPlayerAuthenticator;
  v2 = -[GKLocalPlayerAuthenticator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3A160], "didEnterBackground");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_applicationDidEnterBackground_, v4, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKLocalPlayerAuthenticator;
  -[GKLocalPlayerAuthenticator dealloc](&v4, sel_dealloc);
}

- (void)authenticateUsingAuthUIWithAuthUIDismissHandler:(id)a3 completionHandler:(id)a4
{
  -[GKLocalPlayerAuthenticator _authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:](self, "_authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:", 1, 0, 1, a3, a4);
}

- (void)authenticateUsingAuthUIWithCompletionHandler:(id)a3
{
  -[GKLocalPlayerAuthenticator _authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:](self, "_authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:", 1, 0, 1, 0, a3);
}

- (BOOL)shouldAuthenticateForGameCenter
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isGameCenterDisabled") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3A180], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isGameKitAvailable");

  }
  return v3;
}

- (void)authenticateWithAuthKitResults:(id)a3 completionHandler:(id)a4
{
  -[GKLocalPlayerAuthenticator _authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:](self, "_authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:", 0, a3, 1, 0, a4);
}

- (void)authenticateExistingUserAuthUIWithCompletionHandler:(id)a3
{
  -[GKLocalPlayerAuthenticator _authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:](self, "_authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:", 1, 0, 0, 0, a3);
}

- (void)authenticateWithCompletionHandler:(id)a3
{
  -[GKLocalPlayerAuthenticator _authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:](self, "_authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:", 0, 0, 1, 0, a3);
}

- (void)cancelAuthDueToAuthKitErrorWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1540], "userErrorForCode:underlyingError:", 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__GKLocalPlayerAuthenticator_cancelAuthDueToAuthKitErrorWithHandler___block_invoke;
  block[3] = &unk_24DC27120;
  block[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __69__GKLocalPlayerAuthenticator_cancelAuthDueToAuthKitErrorWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthResponse:error:handler:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)authenticateUsingAuthUIAllowingAppleIDCreation:(BOOL)a3 usernameEditable:(BOOL)a4 dismissHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  os_log_t *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  void *v20;
  os_log_t *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[8];
  uint64_t v32;
  Class (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (_QWORD *)MEMORY[0x24BE3A308];
  if (!*MEMORY[0x24BE3A308])
    v13 = (id)GKOSLoggers();
  v14 = (os_log_t *)MEMORY[0x24BE3A320];
  v15 = *MEMORY[0x24BE3A320];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219F71000, v15, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: using auth UI", buf, 2u);
  }
  CFAbsoluteTimeGetCurrent();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v16 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
  v39 = getAKAppleIDAuthenticationInAppContextClass_softClass;
  v17 = MEMORY[0x24BDAC760];
  if (!getAKAppleIDAuthenticationInAppContextClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v32 = 3221225472;
    v33 = __getAKAppleIDAuthenticationInAppContextClass_block_invoke;
    v34 = &unk_24DC27390;
    v35 = &v36;
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke((uint64_t)buf);
    v16 = (void *)v37[3];
  }
  v18 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v36, 8);
  v19 = objc_alloc_init(v18);
  if (!self->_username)
  {
    GKGameCenterUIFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v21 = v14;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setReason:", v22);

    v14 = v21;
    v17 = MEMORY[0x24BDAC760];
    v12 = (_QWORD *)MEMORY[0x24BE3A308];
  }
  objc_msgSend(v19, "setServiceType:", 6);
  objc_msgSend(v19, "setUsername:", self->_username);
  objc_msgSend(v19, "setShouldAllowAppleIDCreation:", v8);
  objc_msgSend(v19, "setIsUsernameEditable:", v7);
  objc_msgSend(v19, "setPresentingViewController:", self->_presentingViewController);
  v23 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  if (!*v12)
    v24 = (id)GKOSLoggers();
  v25 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219F71000, v25, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: presenting auth UI with AKAppleIDAuthenticationController", buf, 2u);
  }
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __127__GKLocalPlayerAuthenticator_authenticateUsingAuthUIAllowingAppleIDCreation_usernameEditable_dismissHandler_completionHandler___block_invoke;
  v28[3] = &unk_24DC27148;
  v28[4] = self;
  v29 = v10;
  v30 = v11;
  v26 = v11;
  v27 = v10;
  objc_msgSend(v23, "authenticateWithContext:completion:", v19, v28);

}

void __127__GKLocalPlayerAuthenticator_authenticateUsingAuthUIAllowingAppleIDCreation_usernameEditable_dismissHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  os_log_t *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  v8 = (_QWORD *)MEMORY[0x24BE3A308];
  v9 = *MEMORY[0x24BE3A308];
  v10 = (os_log_t *)MEMORY[0x24BE3A320];
  if (v6)
  {
    if (!v9)
      v11 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E0], OS_LOG_TYPE_ERROR))
      __127__GKLocalPlayerAuthenticator_authenticateUsingAuthUIAllowingAppleIDCreation_usernameEditable_dismissHandler_completionHandler___block_invoke_cold_1();
  }
  else
  {
    if (!v9)
      v12 = (id)GKOSLoggers();
    v13 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219F71000, v13, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: appleIDController returned successfully", buf, 2u);
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABF0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUsername:", v14);

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPassword:", v15);

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE0ABC8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(*(id *)(a1 + 32), "handleAuthKitResultsForUnder13WithContinuationData:altDSID:password:", v17, v16, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  if (!*v8)
    v18 = (id)GKOSLoggers();
  v19 = *v10;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_219F71000, v19, OS_LOG_TYPE_INFO, "GKLocalPlayerAuthenticator: Finished under 13 account processing, calling handler.", v23, 2u);
  }
  v20 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "username");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "password");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *, _QWORD, _QWORD, id))(v20 + 16))(v20, v21, v22, v16, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), v6);

}

- (void)_authenticateUsingAuthUI:(BOOL)a3 authenticationResults:(id)a4 usernameEditable:(BOOL)a5 authUIDismissHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v9;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  id v29;
  NSObject *v30;
  void *v31;
  int v32;
  id v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  CFAbsoluteTime Current;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  CFAbsoluteTime v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  id v63;
  CFAbsoluteTime v64;
  _QWORD v65[5];
  id v66;
  CFAbsoluteTime v67;
  _QWORD v68[5];
  id v69;
  uint8_t buf[16];

  LODWORD(v9) = a5;
  v10 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (!v14)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Assertion failed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKLocalPlayerAuthenticator.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ (handler != ((void *)0))\n[%s (%s:%d)]"), v16, "-[GKLocalPlayerAuthenticator _authenticateUsingAuthUI:authenticationResults:usernameEditable:authUIDismissHandler:completionHandler:]", objc_msgSend(v18, "UTF8String"), 287);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v19);
  }
  if (-[GKLocalPlayerAuthenticator forceAuthentication](self, "forceAuthentication"))
  {
    -[GKLocalPlayerAuthenticator setForceAuthentication:](self, "setForceAuthentication:", 0);
    -[GKLocalPlayerAuthenticator setAuthenticating:](self, "setAuthenticating:", 0);
  }
  else
  {
    if (-[GKLocalPlayerAuthenticator isAuthenticated](self, "isAuthenticated"))
    {
      -[GKLocalPlayerAuthenticator setAuthenticating:](self, "setAuthenticating:", 0);
      if (!*MEMORY[0x24BE3A308])
        v20 = (id)GKOSLoggers();
      v21 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219F71000, v21, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler:Player is already authenticated. GKLocalPlayerAuthResultSuccess", buf, 2u);
      }
      -[GKLocalPlayerAuthenticator resultantLocalPlayer](self, "resultantLocalPlayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *, _QWORD, _QWORD))v14 + 2))(v14, 0, v22, 0, 0);
      goto LABEL_42;
    }
    if (-[GKLocalPlayerAuthenticator isAuthenticating](self, "isAuthenticating"))
    {
      if (!*MEMORY[0x24BE3A308])
        v23 = (id)GKOSLoggers();
      v24 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219F71000, v24, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler:Player is already authenticating. GKErrorAuthenticationInProgress", buf, 2u);
      }
      -[GKLocalPlayerAuthenticator resultantLocalPlayer](self, "resultantLocalPlayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = 7;
      goto LABEL_41;
    }
  }
  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isGameCenterRestricted");

  if (v28)
  {
    -[GKLocalPlayerAuthenticator setAuthenticating:](self, "setAuthenticating:", 0);
    if (!*MEMORY[0x24BE3A308])
      v29 = (id)GKOSLoggers();
    v30 = *MEMORY[0x24BE3A320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219F71000, v30, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: GameCenter is Restricted. GKErrorParentalControlsBlocked", buf, 2u);
    }
    -[GKLocalPlayerAuthenticator resultantLocalPlayer](self, "resultantLocalPlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = 10;
LABEL_41:
    objc_msgSend(v25, "userErrorForCode:underlyingError:", v26, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *, void *, _QWORD))v14 + 2))(v14, 1, v22, v42, 0);

LABEL_42:
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "lockedDown");

  if (v32)
  {
    -[GKLocalPlayerAuthenticator setAuthenticating:](self, "setAuthenticating:", 0);
    if (!*MEMORY[0x24BE3A308])
      v33 = (id)GKOSLoggers();
    v34 = *MEMORY[0x24BE3A320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219F71000, v34, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: GameCenter is disabled in Lockdown Mode. GKErrorLockdownMode", buf, 2u);
    }
    -[GKLocalPlayerAuthenticator resultantLocalPlayer](self, "resultantLocalPlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = 36;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x24BE3A180], "currentDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isGameKitAvailable");

  if ((v36 & 1) == 0)
  {
    -[GKLocalPlayerAuthenticator setAuthenticating:](self, "setAuthenticating:", 0);
    if (!*MEMORY[0x24BE3A308])
      v40 = (id)GKOSLoggers();
    v41 = *MEMORY[0x24BE3A320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219F71000, v41, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler: GameCenter is not supported on this device. GKErrorNotSupported", buf, 2u);
    }
    -[GKLocalPlayerAuthenticator resultantLocalPlayer](self, "resultantLocalPlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = 16;
    goto LABEL_41;
  }
  -[GKLocalPlayerAuthenticator setAuthenticating:](self, "setAuthenticating:", 1);
  if (v10)
  {
    -[GKLocalPlayerAuthenticator username](self, "username");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLocalPlayerAuthenticator username](self, "username");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      v9 = v9;
    else
      v9 = 1;
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3221225472;
    v68[2] = __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke;
    v68[3] = &unk_24DC27198;
    v68[4] = self;
    v69 = v14;
    -[GKLocalPlayerAuthenticator authenticateUsingAuthUIAllowingAppleIDCreation:usernameEditable:dismissHandler:completionHandler:](self, "authenticateUsingAuthUIAllowingAppleIDCreation:usernameEditable:dismissHandler:completionHandler:", v37 == 0, v9, v13, v68);

    v39 = v69;
  }
  else
  {
    if (v12)
    {
      -[GKLocalPlayerAuthenticator authenticateFromExternalServiceWithAuthenticationResults:withHandler:](self, "authenticateFromExternalServiceWithAuthenticationResults:withHandler:", v12, v14);
      goto LABEL_43;
    }
    -[GKLocalPlayerAuthenticator username](self, "username");
    v43 = objc_claimAutoreleasedReturnValue();
    if (v43
      && (v44 = (void *)v43,
          -[GKLocalPlayerAuthenticator password](self, "password"),
          v45 = (void *)objc_claimAutoreleasedReturnValue(),
          v45,
          v44,
          v45))
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (!*MEMORY[0x24BE3A308])
        v47 = (id)GKOSLoggers();
      v48 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219F71000, v48, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler:Username and password passed in.GKDaemonProxy to authenticate player", buf, 2u);
      }
      v49 = (void *)MEMORY[0x24BE3A178];
      -[GKLocalPlayerAuthenticator inputLocalPlayer](self, "inputLocalPlayer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "proxyForPlayer:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "accountServicePrivate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLocalPlayerAuthenticator username](self, "username");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLocalPlayerAuthenticator password](self, "password");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_93;
      v62[3] = &unk_24DC271C0;
      v64 = Current;
      v62[4] = self;
      v63 = v14;
      objc_msgSend(v52, "authenticatePlayerWithUsername:password:handler:", v53, v54, v62);

      v39 = v63;
    }
    else
    {
      if (!*MEMORY[0x24BE3A308])
        v55 = (id)GKOSLoggers();
      v56 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219F71000, v56, OS_LOG_TYPE_INFO, "authenticateWithCompletionHandler:Username and/or Password missing. GKDaemonProxy to authenticate player", buf, 2u);
      }
      v57 = CFAbsoluteTimeGetCurrent();
      v58 = (void *)MEMORY[0x24BE3A178];
      -[GKLocalPlayerAuthenticator inputLocalPlayer](self, "inputLocalPlayer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "proxyForPlayer:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "accountService");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90;
      v65[3] = &unk_24DC271C0;
      v67 = v57;
      v65[4] = self;
      v66 = v14;
      objc_msgSend(v61, "authenticatePlayerWithExistingCredentialsWithHandler:", v65);

      v39 = v66;
    }
  }

LABEL_43:
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  id v27;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (v13 && v14 && !a7)
  {
    objc_msgSend(MEMORY[0x24BE3A178], "proxyForLocalPlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accountServicePrivate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_2;
    v23[3] = &unk_24DC27170;
    v24 = v16;
    v20 = v17;
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(a1 + 40);
    v25 = v20;
    v26 = v21;
    v27 = v22;
    objc_msgSend(v19, "authenticatePlayerWithUsername:password:altDSID:usingFastPath:handler:", v13, v14, v15, 1, v23);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelAuthDueToAuthKitErrorWithHandler:", *(_QWORD *)(a1 + 40));
  }

}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "setAlertTitle:", v5);
  objc_msgSend(v7, "setAlertMessage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_handleAuthResponse:error:handler:", v7, v6, *(_QWORD *)(a1 + 56));

}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  os_log_t *v15;
  void *v16;
  id v17;
  os_log_t v18;

  v5 = a2;
  v6 = a3;
  v7 = (_QWORD *)MEMORY[0x24BE3A308];
  if (v6)
  {
    if (!*MEMORY[0x24BE3A308])
      v8 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
      __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_4();
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE3A128]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11 == 5019)
    {
      if (!*v7)
        v12 = (id)GKOSLoggers();
      v13 = *MEMORY[0x24BE3A2F8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2F8], OS_LOG_TYPE_ERROR))
        __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_3(v13);
    }
  }
  if (!*v7)
    v14 = (id)GKOSLoggers();
  v15 = (os_log_t *)MEMORY[0x24BE3A318];
  v16 = (void *)*MEMORY[0x24BE3A318];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A318], OS_LOG_TYPE_DEBUG))
    __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_2(v16);
  CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "_handleAuthResponse:error:handler:", v5, v6, *(_QWORD *)(a1 + 40));
  if (!*v7)
    v17 = (id)GKOSLoggers();
  v18 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
    __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_1(v18);

}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  id v9;
  os_log_t *v10;
  void *v11;
  id v12;
  os_log_t v13;

  v5 = a2;
  v6 = a3;
  v7 = (_QWORD *)MEMORY[0x24BE3A308];
  if (v6)
  {
    if (!*MEMORY[0x24BE3A308])
      v8 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E0], OS_LOG_TYPE_ERROR))
      __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_93_cold_3();
  }
  if (!*v7)
    v9 = (id)GKOSLoggers();
  v10 = (os_log_t *)MEMORY[0x24BE3A318];
  v11 = (void *)*MEMORY[0x24BE3A318];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A318], OS_LOG_TYPE_DEBUG))
    __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_2(v11);
  CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "_handleAuthResponse:error:handler:", v5, v6, *(_QWORD *)(a1 + 40));
  if (!*v7)
    v12 = (id)GKOSLoggers();
  v13 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEBUG))
    __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_1(v13);

}

- (void)reset
{
  -[GKLocalPlayerAuthenticator setForceAuthentication:](self, "setForceAuthentication:", 1);
}

- (void)authenticationDidComplete
{
  -[GKLocalPlayerAuthenticator setAuthenticating:](self, "setAuthenticating:", 0);
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerAuthenticator setLastAuthDate:](self, "setLastAuthDate:", v4);

}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKLocalPlayerAuthenticator;
  -[GKLocalPlayerAuthenticator description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" username:%@ player:%@"), self->_username, self->_resultantLocalPlayer);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)_shouldDisableWithGlobalDisabled:(BOOL)a3 appLevelDisabled:(BOOL)a4 processLevelDisabled:(BOOL)a5
{
  return a3 && a4 || a5;
}

- (void)_handleAuthResponse:(id)a3 error:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  GKLocalPlayerAuthenticator *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BE3A188];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKLocalPlayerAuthenticator.m", 473, "-[GKLocalPlayerAuthenticator _handleAuthResponse:error:handler:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchGroupWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE3A0B0]);

  if (v15)
  {
    objc_msgSend(v9, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDD1398]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "code") == 5000)
    {
      if (!*MEMORY[0x24BE3A308])
        v18 = (id)GKOSLoggers();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
        -[GKLocalPlayerAuthenticator _handleAuthResponse:error:handler:].cold.1();
      objc_msgSend(v13, "perform:", &__block_literal_global);
    }

  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_105;
  v22[3] = &unk_24DC272A0;
  v23 = v8;
  v24 = self;
  v25 = v9;
  v26 = v10;
  v19 = v10;
  v20 = v9;
  v21 = v8;
  objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v22);

}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  objc_msgSend(MEMORY[0x24BE3A238], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2;
  v5[3] = &unk_24DC27228;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "signOutWithCompletionHandler:", v5);

}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x24BE3A308])
      v4 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
      __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_105(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2_107;
  v5[3] = &unk_24DC27278;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 56);
  +[GKAppLevelSignInVisibility fetchAppLevelVisibilityConstraintsWithHandler:](GKAppLevelSignInVisibility, "fetchAppLevelVisibilityConstraintsWithHandler:", v5);

}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2_107(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE3A178], "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utilityServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BE3A130];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_3;
  v11[3] = &unk_24DC27250;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v12 = v7;
  v13 = v8;
  v14 = v3;
  v15 = v9;
  v16 = *(id *)(a1 + 56);
  v10 = v3;
  objc_msgSend(v5, "getStoreBagValuesForKeys:handler:", v6, v11);

}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a2;
  v5 = a3;
  v6 = v7;
  if (!v7)
    v6 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v8 = v6;
  if (objc_msgSend(v6, "integerValueFromKey:defaultValue:", *MEMORY[0x24BE3A130], 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLoginDisabled:", objc_msgSend(*(id *)(a1 + 40), "_shouldDisableWithGlobalDisabled:appLevelDisabled:processLevelDisabled:", objc_msgSend(*(id *)(a1 + 32), "loginDisabled"), objc_msgSend(*(id *)(a1 + 48), "appLevelFullscreenDisabled"), objc_msgSend(*(id *)(a1 + 48), "processLevelPromptDisabled")));
    objc_msgSend(*(id *)(a1 + 32), "setLoginBannerDisabled:", objc_msgSend(*(id *)(a1 + 40), "_shouldDisableWithGlobalDisabled:appLevelDisabled:processLevelDisabled:", objc_msgSend(*(id *)(a1 + 32), "loginBannerDisabled"), objc_msgSend(*(id *)(a1 + 48), "appLevelBannerDisabled"), objc_msgSend(*(id *)(a1 + 48), "processLevelPromptDisabled")));
  }
  objc_msgSend(*(id *)(a1 + 40), "_handleEditedAuthResponse:error:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_handleEditedAuthResponse:(id)a3 error:(id)a4 handler:(id)a5
{
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject **v16;
  id v17;
  NSObject **v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  GKLocalPlayerAuthenticator *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  GKLocalPlayerAuthenticator *v30;
  uint64_t v31;
  void *i;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  int v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  GKLocalPlayerAuthenticator *v49;
  __CFString *v50;
  id v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  __CFString *v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  void *v63;
  int v64;
  id v65;
  void *v66;
  void *v67;
  NSObject *v68;
  GKLocalPlayerAuthenticator *v69;
  uint64_t v70;
  id v71;
  NSObject *v72;
  uint64_t v73;
  id v74;
  __CFString *v75;
  void (**v76)(id, uint64_t, id, id, id);
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  GKLocalPlayerAuthenticator *v83;
  __int16 v84;
  __CFString *v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v9 = (__CFString *)a3;
  v10 = a4;
  v76 = (void (**)(id, uint64_t, id, id, id))a5;
  if (!v76)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Assertion failed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKLocalPlayerAuthenticator.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (handler != ((void *)0))\n[%s (%s:%d)]"), v12, "-[GKLocalPlayerAuthenticator _handleEditedAuthResponse:error:handler:]", objc_msgSend(v14, "UTF8String"), 516);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }
  v16 = (NSObject **)MEMORY[0x24BE3A308];
  if (!*MEMORY[0x24BE3A308])
    v17 = (id)GKOSLoggers();
  v18 = (NSObject **)MEMORY[0x24BE3A320];
  v19 = *MEMORY[0x24BE3A320];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219F71000, v19, OS_LOG_TYPE_INFO, "_handleAuthResponse:Auth Response and error ready for handling", buf, 2u);
  }
  v20 = *v16;
  if (!*v16)
  {
    v21 = (id)GKOSLoggers();
    v20 = *v16;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v22 = v20;
    NSStringFromSelector(a2);
    v23 = (GKLocalPlayerAuthenticator *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v83 = v23;
    v84 = 2112;
    v85 = v9;
    v86 = 2112;
    v87 = v10;
    _os_log_impl(&dword_219F71000, v22, OS_LOG_TYPE_INFO, "%@ auth response:%@ error:%@", buf, 0x20u);

  }
  -[__CFString playerID](v9, "playerID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3A238], "authenticatedLocalPlayersWithStatus:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*v16)
    v26 = (id)GKOSLoggers();
  v27 = *v18;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219F71000, v27, OS_LOG_TYPE_INFO, "_handleAuthResponse:Authenticated Local Player with Status", buf, 2u);
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v28 = v25;
  v29 = (id)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (v29)
  {
    v74 = v10;
    v75 = v9;
    v30 = self;
    v31 = *(_QWORD *)v78;
    while (2)
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v33, "internal");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "playerID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "isEqualToString:", v24);

        if (v36)
        {
          self = v30;
          -[GKLocalPlayerAuthenticator setAuthenticated:](v30, "setAuthenticated:", 1);
          v29 = v33;
          v9 = v75;
          goto LABEL_25;
        }
      }
      v29 = (id)objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
      if (v29)
        continue;
      break;
    }
    v9 = v75;
    self = v30;
LABEL_25:
    v10 = v74;
    v16 = (NSObject **)MEMORY[0x24BE3A308];
  }

  -[GKLocalPlayerAuthenticator setResultantLocalPlayer:](self, "setResultantLocalPlayer:", v29);
  if (!v10 && !-[__CFString loginDisabled](v9, "loginDisabled"))
  {
    v40 = 0;
    v10 = 0;
    goto LABEL_61;
  }
  if (+[GKLocalPlayerAuthenticator shouldDisableLoginConsideringSharePlayAvailabilityWithAuthenticateResponse:](GKLocalPlayerAuthenticator, "shouldDisableLoginConsideringSharePlayAvailabilityWithAuthenticateResponse:", v9))
  {
    if (!*v16)
      v37 = (id)GKOSLoggers();
    v38 = *MEMORY[0x24BE3A320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219F71000, v38, OS_LOG_TYPE_INFO, "_handleAuthResponse:Login has been disabled", buf, 2u);
    }
    if ((objc_msgSend(v29, "isAuthenticated") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "userErrorForCode:underlyingError:", 2, 0);
      v39 = objc_claimAutoreleasedReturnValue();

      if (-[__CFString loginBannerDisabled](v9, "loginBannerDisabled"))
        v40 = 1;
      else
        v40 = 5;
LABEL_57:
      v10 = (id)v39;
      goto LABEL_61;
    }
    goto LABEL_60;
  }
  objc_msgSend(v10, "domain");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x24BE3A0B0]);

  if (!v42)
  {
LABEL_60:
    v40 = 1;
    goto LABEL_61;
  }
  v43 = objc_msgSend(v10, "code");
  if ((unint64_t)(v43 - 5) >= 2)
  {
    if (v43 == 15)
    {
      if (!*v16)
        v53 = (id)GKOSLoggers();
      v54 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219F71000, v54, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKErrorGameUnrecognized", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "userErrorForCode:underlyingError:", 15, 0);
      v39 = objc_claimAutoreleasedReturnValue();

      v40 = 1;
      goto LABEL_57;
    }
    if (!v29)
    {
      objc_msgSend(MEMORY[0x24BE3A238], "localPlayer");
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_60;
  }
  if (!*v16)
    v44 = (id)GKOSLoggers();
  v45 = *MEMORY[0x24BE3A320];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219F71000, v45, OS_LOG_TYPE_INFO, "_handleAuthResponse:Auth Error: GKErrorNotAuthenticated, GKErrorInvalidCredentials", buf, 2u);
  }
  objc_msgSend(v10, "userInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKey:", *MEMORY[0x24BDD1398]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = objc_msgSend(v47, "code");
  switch(v48)
  {
    case 5170:
      if (!*v16)
        v59 = (id)GKOSLoggers();
      v60 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219F71000, v60, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKServerNeedsType15Repair", buf, 2u);
      }
      v40 = 6;
      goto LABEL_92;
    case 5047:
      if (!*v16)
        v61 = (id)GKOSLoggers();
      v62 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219F71000, v62, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKServerForcePasswordChangeError", buf, 2u);
      }
      v40 = 3;
      goto LABEL_92;
    case 5029:
      v49 = self;
      v50 = v9;
      if (!*MEMORY[0x24BE3A308])
        v51 = (id)GKOSLoggers();
      v52 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v40 = 2;
        _os_log_impl(&dword_219F71000, v52, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: GKServerNotAuthorizedError", buf, 2u);
      }
      else
      {
        v40 = 2;
      }
LABEL_91:
      v9 = v50;
      self = v49;
      v16 = (NSObject **)MEMORY[0x24BE3A308];
      goto LABEL_92;
  }
  objc_msgSend(MEMORY[0x24BE3A270], "_gkReachabilityForInternetConnection");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "_gkCurrentReachabilityStatus");

  if (v64)
  {
    v49 = self;
    if (!*MEMORY[0x24BE3A308])
      v65 = (id)GKOSLoggers();
    v50 = v9;
    v66 = (void *)*MEMORY[0x24BE3A320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
    {
      v67 = (void *)MEMORY[0x24BDD16E0];
      v68 = v66;
      objc_msgSend(v67, "numberWithInteger:", objc_msgSend(v47, "code"));
      v69 = (GKLocalPlayerAuthenticator *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v83 = v69;
      _os_log_impl(&dword_219F71000, v68, OS_LOG_TYPE_INFO, "_handleAuthResponse:Underlying Error: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "userErrorForCode:underlyingError:", 3, 0);
    v70 = objc_claimAutoreleasedReturnValue();

    if (-[__CFString suppressLoginSheet](v50, "suppressLoginSheet"))
    {
      if (!*MEMORY[0x24BE3A308])
        v71 = (id)GKOSLoggers();
      v72 = *MEMORY[0x24BE3A320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219F71000, v72, OS_LOG_TYPE_INFO, "_handleAuthResponse: Suppress login sheet", buf, 2u);
      }
      v40 = 5;
    }
    else
    {
      v40 = 4;
    }
    v10 = (id)v70;
    goto LABEL_91;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "gkNotConnectedToInternetError");
  v73 = objc_claimAutoreleasedReturnValue();

  v40 = 1;
  v10 = (id)v73;
LABEL_92:

LABEL_61:
  v55 = *v16;
  if (!*v16)
  {
    v56 = (id)GKOSLoggers();
    v55 = *v16;
  }
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    v57 = off_24DC273C8[v40];
    *(_DWORD *)buf = 138412546;
    v83 = self;
    v84 = 2112;
    v85 = v57;
    v58 = v55;
    _os_log_impl(&dword_219F71000, v58, OS_LOG_TYPE_INFO, "%@ result:%@", buf, 0x16u);

  }
  v76[2](v76, v40, v29, v10, v9);

}

+ (BOOL)shouldDisableLoginConsideringSharePlayAvailabilityWithAuthenticateResponse:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!*MEMORY[0x24BE3A308])
    v4 = (id)GKOSLoggers();
  v5 = (void *)*MEMORY[0x24BE3A320];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A320], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x24BE3A248];
    v7 = v5;
    objc_msgSend(v6, "sharedMatchmaker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "+[GKLocalPlayerAuthenticator shouldDisableLoginConsideringSharePlayAvailabilityWithAuthenticateResponse:]";
    v15 = 1024;
    v16 = objc_msgSend(v8, "isEligibleForGroupSession");
    v17 = 1024;
    v18 = objc_msgSend(v3, "loginDisabled");
    _os_log_impl(&dword_219F71000, v7, OS_LOG_TYPE_INFO, "%s isEligibleForGroupSession=%d loginDisabled=%d", (uint8_t *)&v13, 0x18u);

  }
  objc_msgSend(MEMORY[0x24BE3A248], "sharedMatchmaker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEligibleForGroupSession");

  if ((v10 & 1) != 0)
    v11 = 0;
  else
    v11 = objc_msgSend(v3, "loginDisabled");

  return v11;
}

+ (void)postURL:(id)a3 postBody:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a5;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a4, 100, 0, 0);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BE3A178], "proxyForLocalPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "utilityServicePrivate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__GKLocalPlayerAuthenticator_postURL_postBody_completion___block_invoke;
  v12[3] = &unk_24DC272C8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "loadDataForURL:postBody:completionHandler:", v7, a4, v12);

}

uint64_t __58__GKLocalPlayerAuthenticator_postURL_postBody_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)authenticateFromExternalServiceWithAuthenticationResults:(id)a3 withHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *username;
  NSString *password;
  _QWORD v17[5];
  id v18;

  v6 = a4;
  v7 = *MEMORY[0x24BE0ABF0];
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerAuthenticator setUsername:](self, "setUsername:", v9);

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerAuthenticator setPassword:](self, "setPassword:", v10);

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE0AB48]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE0ABC8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[GKLocalPlayerAuthenticator handleAuthKitResultsForUnder13WithContinuationData:altDSID:password:](self, "handleAuthKitResultsForUnder13WithContinuationData:altDSID:password:", v12, v11, self->_password);
  if (self->_username && self->_password)
  {
    objc_msgSend(MEMORY[0x24BE3A178], "proxyForLocalPlayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountServicePrivate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    username = self->_username;
    password = self->_password;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __99__GKLocalPlayerAuthenticator_authenticateFromExternalServiceWithAuthenticationResults_withHandler___block_invoke;
    v17[3] = &unk_24DC272F0;
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v14, "authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:", username, password, v11, 0, 1, v17);

  }
  else
  {
    -[GKLocalPlayerAuthenticator cancelAuthDueToAuthKitErrorWithHandler:](self, "cancelAuthDueToAuthKitErrorWithHandler:", v6);
  }

}

uint64_t __99__GKLocalPlayerAuthenticator_authenticateFromExternalServiceWithAuthenticationResults_withHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthResponse:error:handler:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)handleAuthKitResultsForUnder13WithContinuationData:(id)a3 altDSID:(id)a4 password:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  GKDispatchGroup *u13Group;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BE3A188];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKLocalPlayerAuthenticator.m", 675, "-[GKLocalPlayerAuthenticator handleAuthKitResultsForUnder13WithContinuationData:altDSID:password:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dispatchGroupWithName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLocalPlayerAuthenticator setU13Group:](self, "setU13Group:", v11);

  u13Group = self->_u13Group;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __98__GKLocalPlayerAuthenticator_handleAuthKitResultsForUnder13WithContinuationData_altDSID_password___block_invoke;
  v15[3] = &unk_24DC27340;
  v15[4] = self;
  v16 = v7;
  v17 = v8;
  v13 = v8;
  v14 = v7;
  -[GKDispatchGroup perform:](u13Group, "perform:", v15);
  -[GKDispatchGroup enter](self->_u13Group, "enter");
  -[GKDispatchGroup wait](self->_u13Group, "wait");

}

void __98__GKLocalPlayerAuthenticator_handleAuthKitResultsForUnder13WithContinuationData_altDSID_password___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  v4 = objc_alloc_init(MEMORY[0x24BE04958]);
  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BE04A78], "urlConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "repairCloudAccountUIURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:cachePolicy:timeoutInterval:", v8, 1, 30.0);
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", *(_QWORD *)(a1 + 40), CFSTR("X-Apple-AK-Continuation-Data"));
  v34 = v4;
  objc_msgSend(v4, "clientInfoHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, CFSTR("X-MMe-Client-Info"));

  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Basic %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addValue:forHTTPHeaderField:", v17, CFSTR("Authorization"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ACD8]), "initWithIdentifier:", CFSTR("com.apple.GameCenter.u13"));
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "set_appleIDContext:", v18);
  v20 = objc_alloc_init(MEMORY[0x24BE7EE20]);
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 96);
  *(_QWORD *)(v21 + 96) = v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setSessionConfiguration:", v19);
  v23 = objc_alloc_init(MEMORY[0x24BDF6BF8]);
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 104);
  *(_QWORD *)(v24 + 104) = v23;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "userInterfaceIdiom");

  if (v27 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setModalPresentationStyle:", 16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMasksToBounds:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), 1, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setNavigationController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v31 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __98__GKLocalPlayerAuthenticator_handleAuthKitResultsForUnder13WithContinuationData_altDSID_password___block_invoke_2;
  v35[3] = &unk_24DC27318;
  v36 = v3;
  v32 = v3;
  objc_msgSend(v31, "loadRequest:completion:", v9, v35);

}

uint64_t __98__GKLocalPlayerAuthenticator_handleAuthKitResultsForUnder13WithContinuationData_altDSID_password___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x24BE04958];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "clientInfoHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v8, CFSTR("X-MMe-Client-Info"));

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v11, CFSTR("X-MMe-Country"));

  return 1;
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a4, "URL", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", CFSTR("skipCreateAppleID"));

  if (v7)
    self->_userShouldSkipCreateAppleID = 1;
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *u13ObjectModels;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  NSObject **v18;
  NSObject *v19;
  id v20;
  uint8_t v21[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5
    && *a5 == 2
    && (objc_msgSend(v9, "defaultPages"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        !v12))
  {
    v18 = (NSObject **)MEMORY[0x24BE3A308];
    v19 = *MEMORY[0x24BE3A308];
    if (!*MEMORY[0x24BE3A308])
    {
      v20 = (id)GKOSLoggers();
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_219F71000, v19, OS_LOG_TYPE_INFO, "Warning: AppleIDController received an object model with actionSignal=Push but no pages.", v21, 2u);
    }
  }
  else
  {
    u13ObjectModels = self->_u13ObjectModels;
    if (!u13ObjectModels)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v15 = self->_u13ObjectModels;
      self->_u13ObjectModels = v14;

      u13ObjectModels = self->_u13ObjectModels;
    }
    -[NSMutableArray addObject:](u13ObjectModels, "addObject:", v10);
    objc_msgSend(v10, "clientInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("continue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && (objc_msgSend(v17, "BOOLValue") & 1) == 0)
      self->_userShouldSkipCreateAppleID = 1;

  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[GKLocalPlayerAuthenticator u13NavigationController](self, "u13NavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  if (self->_userShouldSkipCreateAppleID)
  {
    -[GKDispatchGroup leave](self->_u13Group, "leave");
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = self->_u13ObjectModels;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "populatePostbackDictionary:", v6);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v13, "length"))
      -[GKLocalPlayerAuthenticator remoteUIControllerDidDismiss:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1488], "_gkPreferredSystemLanguage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
      -[GKLocalPlayerAuthenticator remoteUIControllerDidDismiss:].cold.2();
    if (objc_msgSend(v14, "rangeOfString:", CFSTR("-")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v13, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-%@"), v14, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "length"))
      objc_msgSend(v6, "setObject:forKey:", v19, *MEMORY[0x24BE048A8]);
    objc_msgSend(v6, "setObject:forKey:", v14, *MEMORY[0x24BE048A0]);
    objc_msgSend(v13, "uppercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v20, *MEMORY[0x24BE04898]);

    v21 = objc_alloc(MEMORY[0x24BE04A38]);
    -[GKLocalPlayerAuthenticator username](self, "username");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLocalPlayerAuthenticator password](self, "password");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithAppleID:password:", v22, v23);

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __59__GKLocalPlayerAuthenticator_remoteUIControllerDidDismiss___block_invoke;
    v25[3] = &unk_24DC27368;
    v25[4] = self;
    objc_msgSend(v24, "createAppleIDWithParameters:handlerWithResponse:", v6, v25);

  }
}

uint64_t __59__GKLocalPlayerAuthenticator_remoteUIControllerDidDismiss___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a5;
  objc_msgSend(v6, "responseDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAlertTitle:", v8);

  objc_msgSend(v6, "responseDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status-message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAlertMessage:", v10);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "leave");
}

- (GKLocalPlayer)resultantLocalPlayer
{
  return (GKLocalPlayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResultantLocalPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (GKLocalPlayer)inputLocalPlayer
{
  return (GKLocalPlayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInputLocalPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUsername:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)isAuthenticating
{
  return self->_authenticating;
}

- (void)setAuthenticating:(BOOL)a3
{
  self->_authenticating = a3;
}

- (BOOL)forceAuthentication
{
  return self->_forceAuthentication;
}

- (void)setForceAuthentication:(BOOL)a3
{
  self->_forceAuthentication = a3;
}

- (NSDate)lastAuthDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastAuthDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)lastAuthPlayerID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastAuthPlayerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)alertTitle
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAlertTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)alertMessage
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAlertMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  self->_presentingViewController = (UIViewController *)a3;
}

- (RemoteUIController)remoteU13Controller
{
  return self->_remoteU13Controller;
}

- (void)setRemoteU13Controller:(id)a3
{
  objc_storeStrong((id *)&self->_remoteU13Controller, a3);
}

- (UINavigationController)u13NavigationController
{
  return self->_u13NavigationController;
}

- (void)setU13NavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_u13NavigationController, a3);
}

- (NSMutableArray)u13ObjectModels
{
  return self->_u13ObjectModels;
}

- (void)setU13ObjectModels:(id)a3
{
  objc_storeStrong((id *)&self->_u13ObjectModels, a3);
}

- (GKDispatchGroup)u13Group
{
  return self->_u13Group;
}

- (void)setU13Group:(id)a3
{
  objc_storeStrong((id *)&self->_u13Group, a3);
}

- (BOOL)userShouldSkipCreateAppleID
{
  return self->_userShouldSkipCreateAppleID;
}

- (void)setUserShouldSkipCreateAppleID:(BOOL)a3
{
  self->_userShouldSkipCreateAppleID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_u13Group, 0);
  objc_storeStrong((id *)&self->_u13ObjectModels, 0);
  objc_storeStrong((id *)&self->_u13NavigationController, 0);
  objc_storeStrong((id *)&self->_remoteU13Controller, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_lastAuthPlayerID, 0);
  objc_storeStrong((id *)&self->_lastAuthDate, 0);
  objc_storeStrong((id *)&self->_inputLocalPlayer, 0);
  objc_storeStrong((id *)&self->_resultantLocalPlayer, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

void __127__GKLocalPlayerAuthenticator_authenticateUsingAuthUIAllowingAppleIDCreation_usernameEditable_dismissHandler_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "authenticateWithCompletionHandler: appleIDController returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  v1 = OUTLINED_FUNCTION_4(a1);
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_219F71000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_6();
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  v1 = OUTLINED_FUNCTION_4(a1);
  CFAbsoluteTimeGetCurrent();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_219F71000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_7();
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219F71000, log, OS_LOG_TYPE_ERROR, "Game Center has not been enabled for this app. Please make sure to enable Game Center on App Store Connect and to include the Game Center entitlement in the entitlements plist. For more information visit https://developer.apple.com/help/app-store-connect/configure-game-center/enable-an-app-version-for-game-center", v1, 2u);
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_90_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "_authenticateUsingAlert:Failed to authenticate player with existing credentials.Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __133__GKLocalPlayerAuthenticator__authenticateUsingAuthUI_authenticationResults_usernameEditable_authUIDismissHandler_completionHandler___block_invoke_93_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "_authenticateUsingAlert:Failed to authenticate player with username/password.Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleAuthResponse:error:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "Signing out local player due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__GKLocalPlayerAuthenticator__handleAuthResponse_error_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_219F71000, v0, v1, "Failed to sign out due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)remoteUIControllerDidDismiss:.cold.1()
{
  __assert_rtn("-[GKLocalPlayerAuthenticator remoteUIControllerDidDismiss:]", "GKLocalPlayerAuthenticator.m", 768, "0");
}

- (void)remoteUIControllerDidDismiss:.cold.2()
{
  __assert_rtn("-[GKLocalPlayerAuthenticator remoteUIControllerDidDismiss:]", "GKLocalPlayerAuthenticator.m", 773, "0");
}

@end
