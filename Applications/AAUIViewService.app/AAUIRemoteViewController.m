@implementation AAUIRemoteViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AAUIRemoteViewController;
  -[AAUIRemoteViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIRemoteViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[AAUIRemoteViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  v7 = _AAUILogSystem(-[AAUIRemoteViewController _setupRemoteProxy](self, "_setupRemoteProxy"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Showing invited as flow", v9, 2u);
  }

  -[AAUIRemoteViewController _showInvitedAsFlow](self, "_showInvitedAsFlow");
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)1)
    return 30;
  else
    return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)_showInvitedAsFlow
{
  uint64_t v2;
  NSObject *v3;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  if (self->_welcomeController)
  {
    v2 = _AAUILogSystem(self);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10000710C();
    goto LABEL_4;
  }
  -[AAUIRemoteViewController _prepareMessagesInvitation](self, "_prepareMessagesInvitation");
  if (!self->_isCustodianFlow)
  {
    v3 = objc_msgSend(objc_alloc((Class)AAUID2DEncryptionFlowContext), "initWithType:", 1);
    v5 = objc_msgSend(objc_alloc((Class)AAUIManateeStateValidator), "initWithFlowContext:withPresentingViewController:", v3, self);
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004688;
    v7[3] = &unk_10000C398;
    v6 = v5;
    v8 = v6;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v6, "verifyAndRepairManateeWithCompletion:", v7);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
LABEL_4:

    return;
  }
  -[AAUIRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_welcomeController, 1, 0);
}

- (void)_buildViewModelWithContextInfo:(id)a3
{
  AAUIOBWelcomeControllerViewModelProtocol *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  unsigned int v12;
  id v13;
  AAUIOBWelcomeControllerViewModelProtocol *v14;
  id v15;
  AAUIOBWelcomeControllerViewModelProtocol *v16;
  AAUIOBWelcomeControllerViewModelProtocol *viewModel;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  AAUIOBWelcomeControllerViewModelProtocol *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  unsigned int v27;
  id v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  unsigned int v34;
  id v35;
  void *v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  unsigned int v40;
  id v41;
  AAUIOBWelcomeControllerViewModelProtocol *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  AAUIOBWelcomeControllerViewModelProtocol *v52;

  v4 = (AAUIOBWelcomeControllerViewModelProtocol *)a3;
  v5 = _AAUILogSystem(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Building with context info: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("modelData")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("modelType")));
  v9 = (objc_class *)objc_opt_class(AAOBCustodianInvitationModel);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if (v12)
  {
    v50 = 0;
    v13 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AAOBCustodianInvitationModel), v7, &v50);
    v14 = (AAUIOBWelcomeControllerViewModelProtocol *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v50;
    v16 = (AAUIOBWelcomeControllerViewModelProtocol *)objc_msgSend(objc_alloc((Class)AAUIOBCustodianInvitationModel), "initWithModel:", v14);
    viewModel = self->_viewModel;
    self->_viewModel = v16;

    v19 = _AAUILogSystem(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_viewModel;
      *(_DWORD *)buf = 138412290;
      v52 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_viewModel %@", buf, 0xCu);
    }

    v22 = 0;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("modelType")));
    v24 = (objc_class *)objc_opt_class(AAOBInvitationSentModel);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = objc_msgSend(v23, "isEqualToString:", v26);

    if (v27)
    {
      v49 = 0;
      v28 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AAOBInvitationSentModel), v7, &v49);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v15 = v49;
      v29 = (objc_class *)AAUIOBInvitationSentViewModel;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("modelType")));
      v31 = (objc_class *)objc_opt_class(AAOBTrustedContactInviteMessageModel);
      v32 = NSStringFromClass(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = objc_msgSend(v30, "isEqualToString:", v33);

      if (v34)
      {
        v48 = 0;
        v35 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AAOBTrustedContactInviteMessageModel), v7, &v48);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v15 = v48;
        v29 = (objc_class *)AAUIOBTrustedContactInviteMessageModel;
      }
      else
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("modelType")));
        v37 = (objc_class *)objc_opt_class(AAOBInheritanceInvitationModel);
        v38 = NSStringFromClass(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v40 = objc_msgSend(v36, "isEqualToString:", v39);

        if (!v40)
        {
          v43 = objc_msgSend(v7, "length");
          v15 = 0;
          v22 = 0;
          if (v43)
            goto LABEL_22;
LABEL_19:
          v46 = _AAUILogSystem(v43);
          v45 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            sub_100007198();
          goto LABEL_21;
        }
        v47 = 0;
        v41 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AAOBInheritanceInvitationModel), v7, &v47);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v41);
        v15 = v47;
        v29 = (objc_class *)AAUIOBInheritanceInvitationViewModel;
      }
    }
    v42 = (AAUIOBWelcomeControllerViewModelProtocol *)objc_msgSend([v29 alloc], "initWithModel:", v22);
    v14 = self->_viewModel;
    self->_viewModel = v42;
  }

  v43 = objc_msgSend(v7, "length");
  if (!v43)
    goto LABEL_19;
  if (v15)
  {
    v44 = _AAUILogSystem(v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_1000071C4();
LABEL_21:

  }
LABEL_22:

}

- (void)_prepareMessagesInvitation
{
  AAUIOBWelcomeController *v3;
  AAUIOBWelcomeController *welcomeController;
  AAUIOBWelcomeControllerViewModelProtocol *viewModel;
  uint64_t v6;
  uint64_t isKindOfClass;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;

  v3 = (AAUIOBWelcomeController *)objc_msgSend(objc_alloc((Class)AAUIOBWelcomeController), "initWithViewModel:", self->_viewModel);
  welcomeController = self->_welcomeController;
  self->_welcomeController = v3;

  viewModel = self->_viewModel;
  v6 = objc_opt_class(AAUIOBInheritanceInvitationViewModel);
  isKindOfClass = objc_opt_isKindOfClass(viewModel, v6);
  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol custodianshipInfo](self->_viewModel, "custodianshipInfo"));
    v9 = objc_msgSend(v8, "status");

    v11 = _AAUILogSystem(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v9 == (id)1)
    {
      if (v13)
        sub_100007224();

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController primaryButton](self->_welcomeController, "primaryButton"));
      objc_msgSend(v14, "addTarget:action:forEvents:", self, "_acceptInheritanceInvite", 64);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController secondaryButton](self->_welcomeController, "secondaryButton"));
      v16 = v15;
      v17 = "_declineInheritanceInvite";
    }
    else
    {
      if (v13)
        sub_100007250();

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController primaryButton](self->_welcomeController, "primaryButton"));
      objc_msgSend(v27, "addTarget:action:forEvents:", self, "_legacyContactExitWithoutSettings", 64);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController secondaryButton](self->_welcomeController, "secondaryButton"));
      v16 = v15;
      v17 = "_goToAccountBeneficiarySettings";
    }
  }
  else
  {
    v18 = _AAUILogSystem(isKindOfClass);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_100007300();

    self->_isCustodianFlow = 1;
    if ((objc_opt_respondsToSelector(self->_viewModel, "custodianshipInfo") & 1) == 0
      || (v20 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol custodianshipInfo](self->_viewModel, "custodianshipInfo")), v20, !v20))
    {
      -[AAUIOBWelcomeController setDelegate:](self->_welcomeController, "setDelegate:", self);
      return;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol custodianshipInfo](self->_viewModel, "custodianshipInfo"));
    v22 = objc_msgSend(v21, "status");

    if (v22 == (id)1)
    {
      v24 = _AAUILogSystem(v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        sub_10000727C();

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController primaryButton](self->_welcomeController, "primaryButton"));
      objc_msgSend(v26, "addTarget:action:forEvents:", self, "_acceptCustodianshipInvite", 64);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController secondaryButton](self->_welcomeController, "secondaryButton"));
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol custodianshipInfo](self->_viewModel, "custodianshipInfo"));
      v29 = objc_msgSend(v28, "status");

      v31 = _AAUILogSystem(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      if (v29 != (id)5)
      {
        if (v33)
          sub_1000072D4();

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController primaryButton](self->_welcomeController, "primaryButton"));
        objc_msgSend(v34, "addTarget:action:forEvents:", self, "_dismissAndExit", 64);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController secondaryButton](self->_welcomeController, "secondaryButton"));
        v16 = v15;
        v17 = "_goToAccountRecoverySettings";
        goto LABEL_26;
      }
      if (v33)
        sub_1000072A8();

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeController primaryButton](self->_welcomeController, "primaryButton"));
    }
    v16 = v15;
    v17 = "_declineCustodianshipInvite";
  }
LABEL_26:
  objc_msgSend(v15, "addTarget:action:forEvents:", self, v17, 64);

}

- (void)prepareViewServiceForPresentation
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004F48;
  block[3] = &unk_10000C348;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)remoteObjectInterface
{
  return +[AAFlowPresenterHostInterface XPCInterface](AAFlowPresenterHostInterface, "XPCInterface");
}

- (void)setUpLookupConnection:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSXPCListenerEndpoint *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *lookupConnection;

  v4 = a3;
  v5 = _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000732C();

  v7 = objc_opt_new(NSXPCListenerEndpoint);
  -[NSXPCListenerEndpoint _setEndpoint:](v7, "_setEndpoint:", v4);
  v8 = (NSXPCConnection *)objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIRemoteViewController remoteObjectInterface](self, "remoteObjectInterface"));
  -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

  -[NSXPCConnection resume](v8, "resume");
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = v8;

  -[AAUIRemoteViewController setUpHostProxy](self, "setUpHostProxy");
}

- (void)setUpHostProxy
{
  uint64_t v3;
  NSObject *v4;
  NSXPCConnection *lookupConnection;
  AAFlowPresenterHostProtocol *v6;
  AAFlowPresenterHostProtocol *hostProxy;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = _AALogSystem(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10000738C();

  objc_initWeak(&location, self);
  lookupConnection = self->_lookupConnection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005238;
  v8[3] = &unk_10000C3C0;
  objc_copyWeak(&v9, &location);
  v6 = (AAFlowPresenterHostProtocol *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](lookupConnection, "remoteObjectProxyWithErrorHandler:", v8));
  hostProxy = self->_hostProxy;
  self->_hostProxy = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleCancellation
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSError aa_errorWithCode:](NSError, "aa_errorWithCode:", -1));
  -[AAUIRemoteViewController _callCompletionWithError:](self, "_callCompletionWithError:", v3);

}

- (void)_setupRemoteProxy
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v3 = _AAUILogSystem(v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up remote proxy", v5, 2u);
  }

  objc_msgSend(v2, "setShouldDisableFadeInAnimation:", 1);
  objc_msgSend(v2, "setAllowsMenuButtonDismissal:", 1);
  objc_msgSend(v2, "setAllowsSiri:", 0);
  objc_msgSend(v2, "setAllowsAlertStacking:", 1);
  objc_msgSend(v2, "setDesiredHardwareButtonEvents:", 17);
  objc_msgSend(v2, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v2, "setDismissalAnimationStyle:", 1);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = _AAUILogSystem(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuring remote view service with context %@", (uint8_t *)&v12, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
  -[AAUIRemoteViewController setUpLookupConnection:](self, "setUpLookupConnection:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  -[AAUIRemoteViewController _buildViewModelWithContextInfo:](self, "_buildViewModelWithContextInfo:", v11);

  v7[2](v7);
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (unint64_t)objc_msgSend(v9, "events") & 0x10;
        if (v10 & 0xFFFFFFFFFFFFFFFELL | (unint64_t)objc_msgSend(v9, "events") & 1)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError aa_errorWithCode:](NSError, "aa_errorWithCode:", -1));
          -[AAUIRemoteViewController _callCompletionWithError:](self, "_callCompletionWithError:", v11);

        }
        objc_msgSend(v9, "sendResponseWithUnHandledEvents:", (unint64_t)objc_msgSend(v9, "events") ^ v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_legacyContactExitWithoutSettings
{
  -[AAUIRemoteViewController _callCompletionWithError:](self, "_callCompletionWithError:", 0);
}

- (void)_callCompletionWithError:(id)a3
{
  AAFlowPresenterHostProtocol *hostProxy;
  _QWORD v4[5];

  hostProxy = self->_hostProxy;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005684;
  v4[3] = &unk_10000C3E8;
  v4[4] = self;
  -[AAFlowPresenterHostProtocol flowFinishedWithError:completion:](hostProxy, "flowFinishedWithError:completion:", a3, v4);
}

- (void)endUIService
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AAUIRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "invalidate");

}

- (void)notifyFlowCompletionToExitScene
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10000C428);
}

- (void)_dismissAndExit
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005864;
  block[3] = &unk_10000C348;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_main_dismissAndExit
{
  _QWORD *v3;
  _QWORD v4[4];
  _QWORD *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005920;
  v6[3] = &unk_10000C348;
  v6[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000594C;
  v4[3] = &unk_10000C450;
  v5 = objc_retainBlock(v6);
  v3 = v5;
  -[AAUIRemoteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (void)_invalidateLookupConnection
{
  NSXPCConnection *lookupConnection;

  -[NSXPCConnection invalidate](self->_lookupConnection, "invalidate");
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = 0;

}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;

  v3 = _AAUILogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100007418();

  -[AAUIRemoteViewController _invalidateLookupConnection](self, "_invalidateLookupConnection");
  v5.receiver = self;
  v5.super_class = (Class)AAUIRemoteViewController;
  -[AAUIRemoteViewController dealloc](&v5, "dealloc");
}

- (void)_checkManateeAvailabilityForFlowType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)AAUID2DEncryptionFlowContext), "initWithType:", a3);
  v8 = objc_msgSend(objc_alloc((Class)AAUIManateeStateValidator), "initWithFlowContext:withPresentingViewController:", v7, self->_welcomeController);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005AF4;
  v10[3] = &unk_10000C478;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "verifyAndRepairManateeWithCompletion:", v10);

  objc_destroyWeak(&location);
}

- (void)_acceptInheritanceInvite
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  v3 = _AAUILogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LCInvite: Checking manatee availability before accepting", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005CAC;
  v5[3] = &unk_10000C4A0;
  objc_copyWeak(&v6, buf);
  -[AAUIRemoteViewController _checkManateeAvailabilityForFlowType:completion:](self, "_checkManateeAvailabilityForFlowType:completion:", 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_declineInheritanceInvite
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _AAUILogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LCInvite: Declining", v5, 2u);
  }

  -[AAUIRemoteViewController _respondToInheritanceInvitationWithResponse:](self, "_respondToInheritanceInvitationWithResponse:", 0);
}

- (void)_respondToInheritanceInvitationWithResponse:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[4];
  const __CFString *v14;

  v3 = a3;
  v5 = _AAUILogSystem(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Declining");
    if (v3)
      v7 = CFSTR("Accepting");
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LCInvite: %{public}@ the Inheritance invitation...", buf, 0xCu);
  }

  v8 = objc_alloc_init((Class)AAInheritanceController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol custodianshipInfo](self->_viewModel, "custodianshipInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "custodianID"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005ED0;
  v11[3] = &unk_10000C4C8;
  v11[4] = self;
  v12 = v3;
  objc_msgSend(v8, "respondToInvitation:accepted:completion:", v10, v3, v11);

}

- (void)_acceptCustodianshipInvite
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v3 = objc_msgSend(objc_alloc((Class)AAUID2DEncryptionFlowContext), "initWithType:", 0);
  v4 = objc_msgSend(objc_alloc((Class)AAUIManateeStateValidator), "initWithFlowContext:withPresentingViewController:", v3, self->_welcomeController);
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006068;
  v6[3] = &unk_10000C398;
  v5 = v4;
  v7 = v5;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "verifyAndRepairManateeWithCompletion:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (void)_declineCustodianshipInvite
{
  -[AAUIRemoteViewController _respondToCustodianInvitationWithResponse:](self, "_respondToCustodianInvitationWithResponse:", 0);
}

- (void)_respondToCustodianInvitationWithResponse:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;
  uint8_t buf[4];
  const __CFString *v16;

  v3 = a3;
  v5 = _AAUILogSystem(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Declining");
    if (v3)
      v7 = CFSTR("Accepting");
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ the custodian invitation...", buf, 0xCu);
  }

  v8 = objc_alloc((Class)AACustodianInvitationResponseContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol custodianshipInfo](self->_viewModel, "custodianshipInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "custodianID"));
  v11 = objc_msgSend(v8, "initWithCustodianID:didAccept:", v10, v3);

  v12 = (void *)objc_opt_new(AACustodianController);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000062B8;
  v13[3] = &unk_10000C4C8;
  v13[4] = self;
  v14 = v3;
  objc_msgSend(v12, "respondToCustodianRequestWithResponse:completion:", v11, v13);

}

- (void)_showCustodianInvitationAcceptedView
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id buf[2];

  v3 = _AAUILogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Displaying custodian acceptance UI.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000641C;
  block[3] = &unk_10000C4F0;
  objc_copyWeak(&v6, buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_showInheritanceInvitationAcceptedView
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id buf[2];

  v3 = _AAUILogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LCInvite: Displaying Inheritance accepted UI.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006670;
  block[3] = &unk_10000C4F0;
  objc_copyWeak(&v6, buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_dismissCustodianInvitationReminderFollowUp
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v3 = objc_alloc_init((Class)AAFollowUpController);
  v4 = AAFollowUpIdentifierCustodianInvitationReminder;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol custodianshipInfo](self->_viewModel, "custodianshipInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "custodianID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v4, v6));

  v9 = _AAUILogSystem(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1000075F0();

  objc_msgSend(v3, "dismissFollowUpWithIdentifier:completion:", v7, &stru_10000C530);
}

- (void)_dismissBeneficiaryInvitationReminderFollowUp
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[16];

  v3 = _AAUILogSystem(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "LCInvite: Dismissing Inheritance Invitation Reminder CFU.", buf, 2u);
  }

  v5 = objc_alloc_init((Class)AAFollowUpController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIOBWelcomeControllerViewModelProtocol custodianshipInfo](self->_viewModel, "custodianshipInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "custodianID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("com.apple.AAFollowUpIdentifier.beneficiaryInvitationReminder"), v7));

  v10 = _AAUILogSystem(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1000075F0();

  objc_msgSend(v5, "dismissFollowUpWithIdentifier:completion:", v8, &stru_10000C550);
}

- (void)_goToAccountRecoverySettings
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = _AALogSystem(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Taking user to account recovery settings", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=accountRecovery")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, 0);

}

- (void)_goToAccountBeneficiarySettings
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = _AALogSystem(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Taking user to account beneficiary settings", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=accountBeneficiary")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, 0);

}

- (void)welcomeViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  -[AAUIRemoteViewController _callCompletionWithError:](self, "_callCompletionWithError:", a5, a4);
}

- (NSDictionary)remoteContextInfo
{
  return self->_remoteContextInfo;
}

- (void)setRemoteContextInfo:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContextInfo, a3);
}

- (OS_xpc_object)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEndpoint, a3);
}

- (AAUIOBWelcomeControllerViewModelProtocol)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (AAUIOBWelcomeController)welcomeController
{
  return self->_welcomeController;
}

- (void)setWelcomeController:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeController, a3);
}

- (AAFlowPresenterHostProtocol)hostProxy
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
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteContextInfo, 0);
  objc_storeStrong((id *)&self->_lookupConnection, 0);
}

@end
