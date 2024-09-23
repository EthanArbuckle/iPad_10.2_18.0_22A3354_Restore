@implementation AAUISignInController

- (AAUISignInController)initWithNibName:(id)a3 bundle:(id)a4
{
  AAUISignInController *v4;
  AAUISignInController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUISignInController;
  v4 = -[AAUISignInController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[AAUISignInController _commonInit](v4, "_commonInit");
  return v5;
}

- (AAUISignInController)initWithCoder:(id)a3
{
  AAUISignInController *v3;
  AAUISignInController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUISignInController;
  v3 = -[AAUISignInController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AAUISignInController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  AKURLBag *v3;
  AKURLBag *akURLBag;
  NSArray *privacyLinkIdentifiers;

  -[AAUISignInController setCanEditUsername:](self, "setCanEditUsername:", 1);
  self->_aidaOperationUIPermissions = 1;
  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v3 = (AKURLBag *)objc_claimAutoreleasedReturnValue();
  akURLBag = self->_akURLBag;
  self->_akURLBag = v3;

  privacyLinkIdentifiers = self->_privacyLinkIdentifiers;
  self->_privacyLinkIdentifiers = (NSArray *)&unk_1EA31E9A0;

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUISignInController;
  -[AAUISignInController viewDidLoad](&v4, sel_viewDidLoad);
  -[AAUISignInController presentationController](self, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[AAUISignInController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[AAUISignInController _configureSignInProperties](self, "_configureSignInProperties");
  -[AAUIServiceSignInController loadViewControllerForPresentation](self->_serviceController, "loadViewControllerForPresentation");
}

- (void)_configureSignInProperties
{
  AAUIServiceSignInConfiguration *v3;
  AAUIServiceSignInConfiguration *signInConfiguration;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AAUIServiceSignInController *serviceController;
  AAUIServiceSignInController *v18;
  AAUIServiceSignInController *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!self->_signInConfiguration)
  {
    v3 = objc_alloc_init(AAUIServiceSignInConfiguration);
    signInConfiguration = self->_signInConfiguration;
    self->_signInConfiguration = v3;

    -[AAUIServiceSignInConfiguration setAuthenticationResults:](self->_signInConfiguration, "setAuthenticationResults:", self->_authenticationResults);
    -[AAUIServiceSignInConfiguration setAidaOperationUIPermissions:](self->_signInConfiguration, "setAidaOperationUIPermissions:", self->_aidaOperationUIPermissions);
    -[AAUIServiceSignInConfiguration setNavigationController:](self->_signInConfiguration, "setNavigationController:", self);
    -[AAUISignInController username](self, "username");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIServiceSignInConfiguration setUsername:](self->_signInConfiguration, "setUsername:", v5);

    -[AAUIServiceSignInConfiguration setCanEditUsername:](self->_signInConfiguration, "setCanEditUsername:", -[AAUISignInController canEditUsername](self, "canEditUsername"));
    -[AAUIServiceSignInConfiguration setAllowSkip:](self->_signInConfiguration, "setAllowSkip:", -[AAUISignInController allowSkip](self, "allowSkip"));
    -[AAUIServiceSignInConfiguration setShouldShowSystemBackButton:](self->_signInConfiguration, "setShouldShowSystemBackButton:", -[AAUISignInController shouldShowSystemBackButton](self, "shouldShowSystemBackButton"));
    -[AAUIServiceSignInConfiguration setShouldForceOperation:](self->_signInConfiguration, "setShouldForceOperation:", -[AAUISignInController _shouldForceOperation](self, "_shouldForceOperation"));
    -[AAUIServiceSignInConfiguration setOfferiCloudAMSSplitSignIn:](self->_signInConfiguration, "setOfferiCloudAMSSplitSignIn:", -[AAUISignInController offerSplitAccountSignIn](self, "offerSplitAccountSignIn"));
    -[AAUISignInController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[AAUISignInController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serviceContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");
      -[AAUIServiceSignInConfiguration setServiceContext:](self->_signInConfiguration, "setServiceContext:", v10);

    }
    -[AAUIServiceSignInConfiguration setServiceDelegate:](self->_signInConfiguration, "setServiceDelegate:", self);
    -[AAUIServiceSignInConfiguration setShouldDisableAccountCreation:](self->_signInConfiguration, "setShouldDisableAccountCreation:", -[AAUISignInController shouldDisableAccountCreation](self, "shouldDisableAccountCreation"));
    -[AAUISignInController serviceType](self, "serviceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AAUISignInController serviceType](self, "serviceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIServiceSignInConfiguration setServiceTypes:](self->_signInConfiguration, "setServiceTypes:", v13);

    }
    else
    {
      -[AAUISignInController serviceTypes](self, "serviceTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIServiceSignInConfiguration setServiceTypes:](self->_signInConfiguration, "setServiceTypes:", v12);
    }

    -[AAUISignInController privacyLinkIdentifiers](self, "privacyLinkIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIServiceSignInConfiguration setPrivacyLinkIdentifiers:](self->_signInConfiguration, "setPrivacyLinkIdentifiers:", v14);

    -[AAUIServiceSignInConfiguration setShowsChildSignIn:](self->_signInConfiguration, "setShowsChildSignIn:", -[AAUISignInController showsChildSignIn](self, "showsChildSignIn"));
    -[AAUISignInController cdpDelegate](self, "cdpDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[AAUIServiceSignInConfiguration setIsAttemptingBackupRestore:](self->_signInConfiguration, "setIsAttemptingBackupRestore:", objc_msgSend(v15, "isAttemptingBackupRestore"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "cdpLocalSecret");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[AAUIServiceSignInConfiguration setLocalSecret:](self->_signInConfiguration, "setLocalSecret:", v16);

    }
  }
  serviceController = self->_serviceController;
  if (serviceController)
  {
    -[AAUIServiceSignInController setSignInConfig:](serviceController, "setSignInConfig:", self->_signInConfiguration);
  }
  else
  {
    v18 = -[AAUIServiceSignInController initWithSignInConfiguration:]([AAUIServiceSignInController alloc], "initWithSignInConfiguration:", self->_signInConfiguration);
    v19 = self->_serviceController;
    self->_serviceController = v18;

  }
  -[AAUIServiceSignInController setServiceOwnersManager:](self->_serviceController, "setServiceOwnersManager:", self->_serviceOwnersManager);
  -[AAUISignInController akURLBag](self, "akURLBag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIServiceSignInController setAkURLBag:](self->_serviceController, "setAkURLBag:", v20);

}

- (void)serviceSignInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a5;
  -[AAUISignInController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "signInController:didCompleteWithSuccess:error:", self, v5, v8);

}

- (void)serviceSignInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[AAUISignInController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "signInController:didCompleteWithOperationsResults:", self, v6);

}

- (void)serviceSignInControllerDidCancel:(id)a3
{
  id v4;

  -[AAUISignInController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "signInControllerDidCancel:", self);

}

- (void)serviceSignInController:(id)a3 didSkipWithReason:(int64_t)a4
{
  NSObject *v6;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (a4 == 1)
  {
    -[AAUISignInController _delegate_signInControllerDidSelectChildSignIn:](self, "_delegate_signInControllerDidSelectChildSignIn:", self);
  }
  else if (a4)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[AAUISignInController serviceSignInController:didSkipWithReason:].cold.1(a4, v6);

  }
  else
  {
    -[AAUISignInController _delegate_signInControllerDidSkip:](self, "_delegate_signInControllerDidSkip:", self);
  }
}

- (void)_delegate_signInControllerDidSkip:(id)a3
{
  id v4;

  -[AAUISignInController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "signInControllerDidSkip:", self);

}

- (void)_delegate_signInControllerDidSelectChildSignIn:(id)a3
{
  id v4;

  -[AAUISignInController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "signInControllerDidSelectChildSignIn:", self);

}

- (void)_setAuthenticationResults:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationResults, a3);
}

- (void)_setServiceOwnersManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, a3);
}

- (void)setAKURLBag:(id)a3
{
  objc_storeStrong((id *)&self->_akURLBag, a3);
}

- (void)prepareInViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AAUISignInController _configureSignInProperties](self, "_configureSignInProperties");
  -[AAUIServiceSignInController prepareInViewController:completion:](self->_serviceController, "prepareInViewController:completion:", v7, v6);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (NSDictionary)_authenticationResults
{
  return self->_authenticationResults;
}

- (AIDAServiceOwnerProtocol)_serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (BOOL)canEditUsername
{
  return self->_canEditUsername;
}

- (void)setCanEditUsername:(BOOL)a3
{
  self->_canEditUsername = a3;
}

- (BOOL)allowSkip
{
  return self->_allowSkip;
}

- (void)setAllowSkip:(BOOL)a3
{
  self->_allowSkip = a3;
}

- (BOOL)shouldShowSystemBackButton
{
  return self->_shouldShowSystemBackButton;
}

- (void)setShouldShowSystemBackButton:(BOOL)a3
{
  self->_shouldShowSystemBackButton = a3;
}

- (AAUICDPSignInDelegate)cdpDelegate
{
  return (AAUICDPSignInDelegate *)objc_loadWeakRetained((id *)&self->_cdpDelegate);
}

- (void)setCdpDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cdpDelegate, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_serviceTypes, a3);
}

- (NSArray)privacyLinkIdentifiers
{
  return self->_privacyLinkIdentifiers;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (BOOL)showsChildSignIn
{
  return self->_showsChildSignIn;
}

- (void)setShowsChildSignIn:(BOOL)a3
{
  self->_showsChildSignIn = a3;
}

- (BOOL)offerSplitAccountSignIn
{
  return self->_offerSplitAccountSignIn;
}

- (void)setOfferSplitAccountSignIn:(BOOL)a3
{
  self->_offerSplitAccountSignIn = a3;
}

- (AKURLBag)akURLBag
{
  return self->_akURLBag;
}

- (AAUIServiceSignInController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
  objc_storeStrong((id *)&self->_serviceController, a3);
}

- (BOOL)_shouldForceOperation
{
  return self->__shouldForceOperation;
}

- (void)_setShouldForceOperation:(BOOL)a3
{
  self->__shouldForceOperation = a3;
}

- (unint64_t)ampServiceType
{
  return self->_ampServiceType;
}

- (void)setAmpServiceType:(unint64_t)a3
{
  self->_ampServiceType = a3;
}

- (BOOL)shouldDisableAccountCreation
{
  return self->_shouldDisableAccountCreation;
}

- (void)setShouldDisableAccountCreation:(BOOL)a3
{
  self->_shouldDisableAccountCreation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_akURLBag, 0);
  objc_storeStrong((id *)&self->_privacyLinkIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_destroyWeak((id *)&self->_cdpDelegate);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_signInConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_authenticationResults, 0);
}

- (void)serviceSignInController:(uint64_t)a1 didSkipWithReason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_FAULT, "Unhandled skip reason %@", (uint8_t *)&v4, 0xCu);

}

@end
