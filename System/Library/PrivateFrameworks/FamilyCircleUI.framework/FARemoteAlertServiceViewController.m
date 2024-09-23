@implementation FARemoteAlertServiceViewController

- (void)viewDidLoad
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "characterDirectionForLanguage:", v4);

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x24BEBDB00], "appearance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSemanticContentAttribute:", 4);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FARemoteAlertServiceViewController;
  -[FARemoteAlertServiceViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[FARemoteAlertServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_rootSheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[FARemoteAlertServiceViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[FARemoteAlertServiceViewController _setupRemoteProxy](self, "_setupRemoteProxy");
  -[FARemoteAlertServiceViewController _showFamilyFlow](self, "_showFamilyFlow");
}

- (void)_setupRemoteProxy
{
  id v2;

  -[FARemoteAlertServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldDisableFadeInAnimation:", 1);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setAllowsSiri:", 0);
  objc_msgSend(v2, "setAllowsAlertStacking:", 1);
  objc_msgSend(v2, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v2, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v2, "setDismissalAnimationStyle:", 1);

}

- (id)_account
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handleSignedOutAcceptInvitation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD aBlock[6];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke;
  aBlock[3] = &unk_24C88C530;
  aBlock[4] = self;
  v21 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BDD1540], "fa_familyErrorWithCode:", -1004);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FAMILY_ACCEPT_INVITE_SIGNEDOUT_ALERT_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FAMILY_ACCEPT_INVITE_SIGNEDOUT_ALERT_MESSAGE"), &stru_24C8A3000, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FAMILY_ACCEPT_INVITE_SIGNEDOUT_ALERT_NOT_NOW"), &stru_24C8A3000, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke_2;
  v25[3] = &unk_24C88C558;
  v14 = v21;
  v26 = v3;
  v27 = v14;
  v22 = v3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v15);
  v16 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FAMILY_ACCEPT_INVITE_SIGNEDOUT_ALERT_SIGN_IN"), &stru_24C8A3000, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke_3;
  v23[3] = &unk_24C88C580;
  v24 = v14;
  v19 = v14;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v20);
  objc_msgSend(v9, "setPreferredAction:", v20);
  -[FARemoteAlertServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

void __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x24BE30A38];
  v6 = a3;
  v7 = (id)objc_msgSend([v5 alloc], "initWithLoadSuccess:error:userInfo:", a2, v6, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "operationFinishedWithResponse:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_dismissAndExit");

}

uint64_t __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v5 = 0;
  objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 0, &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5;
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v2, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_showFamilyFlow
{
  void *v3;
  void *v4;
  int v5;
  FACircleStateController *v6;
  FACircleContext *circleContext;
  FACircleStateController *v8;
  _QWORD v9[5];
  FACircleStateController *v10;

  -[FARemoteAlertServiceViewController _account](self, "_account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[FACircleContext eventType](self->_circleContext, "eventType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("FACircleEventTypeAcceptInvitation"));

    if (v5)
    {
      -[FARemoteAlertServiceViewController _handleSignedOutAcceptInvitation](self, "_handleSignedOutAcceptInvitation");
      return;
    }
  }
  v6 = -[FACircleStateController initWithPresenter:]([FACircleStateController alloc], "initWithPresenter:", self);
  circleContext = self->_circleContext;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__FARemoteAlertServiceViewController__showFamilyFlow__block_invoke;
  v9[3] = &unk_24C88C5A8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[FACircleStateController _performOperationWithContext:viewController:completion:](v8, "_performOperationWithContext:viewController:completion:", circleContext, self, v9);

}

uint64_t __53__FARemoteAlertServiceViewController__showFamilyFlow__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "operationFinishedWithResponse:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAndExit");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  FACircleContext *v11;
  FACircleContext *circleContext;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FAFamilyPresenterHostProtocol *v17;
  FAFamilyPresenterHostProtocol *hostProxy;
  _QWORD v19[4];
  id v20;
  id buf[2];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Configuring remote view service", (uint8_t *)buf, 2u);
  }

  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FARemoteAlertServiceUserInfoContextData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[FACircleContext contextWithData:](FACircleContext, "contextWithData:", v10);
    v11 = (FACircleContext *)objc_claimAutoreleasedReturnValue();
    circleContext = self->_circleContext;
    self->_circleContext = v11;
  }
  else
  {
    circleContext = self->_circleContext;
    self->_circleContext = 0;
  }

  v13 = (void *)objc_opt_new();
  objc_msgSend(v6, "xpcEndpoint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setEndpoint:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v13);
  objc_msgSend(MEMORY[0x24BE30A80], "XPCInterface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRemoteObjectInterface:", v16);

  objc_msgSend(v15, "resume");
  objc_storeStrong((id *)&self->_lookupConnection, v15);
  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __70__FARemoteAlertServiceViewController_configureWithContext_completion___block_invoke;
  v19[3] = &unk_24C88C5D0;
  objc_copyWeak(&v20, buf);
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v19);
  v17 = (FAFamilyPresenterHostProtocol *)objc_claimAutoreleasedReturnValue();
  hostProxy = self->_hostProxy;
  self->_hostProxy = v17;

  if (v7)
    v7[2](v7);
  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);

}

void __70__FARemoteAlertServiceViewController_configureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__FARemoteAlertServiceViewController_configureWithContext_completion___block_invoke_cold_1((uint64_t)v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAndExit");

}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  FARemoteAlertServiceViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }

  -[FARemoteAlertServiceViewController _invalidateLookupConnection](self, "_invalidateLookupConnection");
  v4.receiver = self;
  v4.super_class = (Class)FARemoteAlertServiceViewController;
  -[SBUIRemoteAlertServiceViewController dealloc](&v4, sel_dealloc);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (void)_dismissAndExit
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__FARemoteAlertServiceViewController__dismissAndExit__block_invoke;
  block[3] = &unk_24C88B7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __53__FARemoteAlertServiceViewController__dismissAndExit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_dismissAndExit");
}

- (void)_main_dismissAndExit
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[FARemoteAlertServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[FARemoteAlertServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)_invalidateLookupConnection
{
  NSXPCConnection *lookupConnection;

  -[NSXPCConnection invalidate](self->_lookupConnection, "invalidate");
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = 0;

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "events") & 0x10) != 0)
          -[FARemoteAlertServiceViewController _dismissAndExit](self, "_dismissAndExit");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (FAFamilyPresenterHostProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
  objc_storeStrong((id *)&self->_hostProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_lookupConnection, 0);
  objc_storeStrong((id *)&self->_circleContext, 0);
}

void __70__FARemoteAlertServiceViewController_configureWithContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "listener lookup connection error: %@", (uint8_t *)&v2, 0xCu);
}

@end
