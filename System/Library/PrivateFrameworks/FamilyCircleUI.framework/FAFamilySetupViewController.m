@implementation FAFamilySetupViewController

- (FAFamilySetupViewController)initWithAccount:(id)a3 grandSlamSigner:(id)a4 familyEligibilityResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  FAFamilySetupGetStartedViewController *v11;
  void *v12;
  FAFamilySetupGetStartedViewController *v13;
  FAFamilySetupViewController *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [FAFamilySetupGetStartedViewController alloc];
  objc_msgSend(v9, "accountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FAFamilySetupGetStartedViewController initWithAccount:store:familyEligibilityResponse:](v11, "initWithAccount:store:familyEligibilityResponse:", v10, v12, v8);

  v14 = -[FAFamilySetupViewController _initWithAccount:grandSlamSigner:rootViewController:](self, "_initWithAccount:grandSlamSigner:rootViewController:", v10, v9, v13);
  return v14;
}

- (id)initTrimmedFlowWithAccount:(id)a3 grandSlamSigner:(id)a4
{
  id v6;
  id v7;
  FAFamilySetupOrganizerViewController *v8;
  void *v9;
  FAFamilySetupOrganizerViewController *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = [FAFamilySetupOrganizerViewController alloc];
  objc_msgSend(v6, "accountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FAFamilySetupOrganizerViewController initWithAccount:store:](v8, "initWithAccount:store:", v7, v9);

  v11 = -[FAFamilySetupViewController _initWithAccount:grandSlamSigner:rootViewController:](self, "_initWithAccount:grandSlamSigner:rootViewController:", v7, v6, v10);
  return v11;
}

- (id)_initWithAccount:(id)a3 grandSlamSigner:(id)a4 rootViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  FAFamilySetupViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  ACAccountStore *accountStore;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FAFamilySetupViewController;
  v12 = -[FAFamilySetupViewController initWithRootViewController:](&v18, sel_initWithRootViewController_, v11);
  if (v12)
  {
    objc_msgSend(v11, "setDelegate:", v12);
    objc_msgSend(v11, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilySetupViewController _createCloseButton](v12, "_createCloseButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v14);

    objc_storeStrong((id *)&v12->_account, a3);
    objc_msgSend(v10, "accountStore");
    v15 = objc_claimAutoreleasedReturnValue();
    accountStore = v12->_accountStore;
    v12->_accountStore = (ACAccountStore *)v15;

    objc_storeStrong((id *)&v12->_grandSlamSigner, a4);
  }

  return v12;
}

- (void)dealloc
{
  AAUIRemoteUIController *remoteUIController;
  objc_super v4;

  remoteUIController = self->_remoteUIController;
  if (remoteUIController)
    -[AAUIRemoteUIController setDelegate:](remoteUIController, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)FAFamilySetupViewController;
  -[FAFamilySetupViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FAFamilySetupViewController;
  -[AAUIBleachedNavigationController viewDidLoad](&v5, sel_viewDidLoad);
  -[FAFamilySetupViewController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)familySetupPage:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  FAFamilySetupOrganizerViewController *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!a4)
  {
    -[FAFamilySetupViewController delegate](self, "delegate");
    v6 = (FAFamilySetupOrganizerViewController *)objc_claimAutoreleasedReturnValue();
    -[FAFamilySetupOrganizerViewController familySetupViewController:didCompleteWithSuccess:](v6, "familySetupViewController:didCompleteWithSuccess:", self, 0);
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[FAFamilySetupViewController _isRunningInSettings](self, "_isRunningInSettings"))
    {
      v6 = -[FAFamilySetupOrganizerViewController initWithAccount:store:]([FAFamilySetupOrganizerViewController alloc], "initWithAccount:store:", self->_account, self->_accountStore);
      -[FAFamilySetupOrganizerViewController setDelegate:](v6, "setDelegate:", self);
      -[FAFamilySetupViewController pushViewController:animated:](self, "pushViewController:animated:", v6, 1);
    }
    else
    {
      -[FAFamilySetupViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "familySetupViewController:didCompleteWithSuccess:", self, 1);

      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v6 = (FAFamilySetupOrganizerViewController *)objc_claimAutoreleasedReturnValue();
      -[FAFamilySetupViewController _urlForLaunchingSettings](self, "_urlForLaunchingSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilySetupOrganizerViewController openSensitiveURL:withOptions:](v6, "openSensitiveURL:withOptions:", v8, 0);

    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[FAFamilySetupViewController _loadRemoteUIPages](self, "_loadRemoteUIPages");
LABEL_10:

}

- (BOOL)_isRunningInSettings
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Preferences"));

  return v4;
}

- (id)_urlForLaunchingSettings
{
  uint64_t v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 5, &v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createCloseButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CLOSE_BUTTON_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__closeButtonWasTapped_);

  return v6;
}

- (void)_closeButtonWasTapped:(id)a3
{
  id v4;

  -[FAFamilySetupViewController topViewController](self, "topViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FAFamilySetupViewController familySetupPage:didCompleteWithSuccess:](self, "familySetupPage:didCompleteWithSuccess:", v4, 0);

}

- (void)_showActivitySpinnerInNavigationBar
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinnerView;
  UINavigationItem *v5;
  void *v6;
  UINavigationItem *v7;
  NSObject *v8;
  void *v9;
  UINavigationItem *v10;
  UINavigationItem *navigationItemShowingSpinner;
  NSArray *v12;
  NSArray *originalRightBarButtonItems;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_spinnerView)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinnerView = self->_spinnerView;
    self->_spinnerView = v3;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinnerView, "setHidesWhenStopped:", 1);
  }
  if (!self->_spinnerCount)
  {
    -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", self->_spinnerView);
    -[FAFamilySetupViewController topViewController](self, "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v10 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();
    navigationItemShowingSpinner = self->_navigationItemShowingSpinner;
    self->_navigationItemShowingSpinner = v10;

    -[UINavigationItem rightBarButtonItems](self->_navigationItemShowingSpinner, "rightBarButtonItems");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    originalRightBarButtonItems = self->_originalRightBarButtonItems;
    self->_originalRightBarButtonItems = v12;

    -[UINavigationItem setRightBarButtonItem:](self->_navigationItemShowingSpinner, "setRightBarButtonItem:", v8);
LABEL_8:

    goto LABEL_9;
  }
  v5 = self->_navigationItemShowingSpinner;
  -[FAFamilySetupViewController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v7 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = objc_opt_class();
      _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "%@ changed navigation item for spinner!", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_8;
  }
LABEL_9:
  ++self->_spinnerCount;
}

- (void)_hideActivitySpinnerInNavigationBar
{
  int64_t spinnerCount;
  int64_t v4;
  NSArray *originalRightBarButtonItems;
  NSObject *v7;
  UINavigationItem *navigationItemShowingSpinner;
  int v9;
  const char *Name;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  spinnerCount = self->_spinnerCount;
  if (spinnerCount)
  {
    v4 = spinnerCount - 1;
    self->_spinnerCount = v4;
    if (!v4)
    {
      -[UIActivityIndicatorView stopAnimating](self->_spinnerView, "stopAnimating");
      if (self->_originalRightBarButtonItems)
      {
        -[UINavigationItem setRightBarButtonItems:](self->_navigationItemShowingSpinner, "setRightBarButtonItems:");
        originalRightBarButtonItems = self->_originalRightBarButtonItems;
      }
      else
      {
        originalRightBarButtonItems = 0;
      }
      self->_originalRightBarButtonItems = 0;

      navigationItemShowingSpinner = self->_navigationItemShowingSpinner;
      self->_navigationItemShowingSpinner = 0;

    }
  }
  else
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "%s when there was no spinner", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)_loadRemoteUIPages
{
  void *v3;
  void *v4;
  FAFamilySetupBuddyMLRequest *v5;
  void *v6;
  NSMutableURLRequest *v7;
  NSMutableURLRequest *startRemoteUIRequest;
  NSObject *v9;
  AAUIRemoteUIController *v10;
  AAUIRemoteUIController *remoteUIController;
  int v12;
  FAFamilySetupBuddyMLRequest *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[FAFamilySetupViewController _showActivitySpinnerInNavigationBar](self, "_showActivitySpinnerInNavigationBar");
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[AAFamilyRequest initWithGrandSlamSigner:]([FAFamilySetupBuddyMLRequest alloc], "initWithGrandSlamSigner:", self->_grandSlamSigner);
  -[FAFamilySetupBuddyMLRequest setiTunesAccount:](v5, "setiTunesAccount:", v4);
  -[FAFamilySetupBuddyMLRequest urlRequest](v5, "urlRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableURLRequest *)objc_msgSend(v6, "mutableCopy");
  startRemoteUIRequest = self->_startRemoteUIRequest;
  self->_startRemoteUIRequest = v7;

  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "Will load Family Setup remote UI using request: %@", (uint8_t *)&v12, 0xCu);
  }

  v10 = (AAUIRemoteUIController *)objc_alloc_init(MEMORY[0x24BE04D70]);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v10;

  -[AAUIRemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", self);
  -[AAUIRemoteUIController setNavigationController:](self->_remoteUIController, "setNavigationController:", self);
  -[AAUIRemoteUIController loadRequest:completion:](self->_remoteUIController, "loadRequest:completion:", self->_startRemoteUIRequest, &__block_literal_global_4);

}

void __49__FAFamilySetupViewController__loadRemoteUIPages__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Failed to load Family Setup remote UI: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BE7EE08];
  v6 = a4;
  objc_msgSend(v5, "setupAssistantModalStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyToObjectModel:", v6);

}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  NSMutableURLRequest *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];

  v7 = (NSMutableURLRequest *)a4;
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, a4);
  if (self->_startRemoteUIRequest == v7)
    goto LABEL_8;
  -[NSMutableURLRequest URL](v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsString:", CFSTR("prefs:itunes"));

  if (!v10)
  {
    -[NSMutableURLRequest URL](v7, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsString:", CFSTR("prefs:icloud"));

    if (v13)
    {
      -[FAFamilySetupViewController _remoteUIDidCancel](self, "_remoteUIDidCancel");
      goto LABEL_6;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__FAFamilySetupViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke;
    block[3] = &unk_24C88B7F0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    -[NSMutableURLRequest aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:](v7, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
    -[NSMutableURLRequest aa_addLoggedInAppleIDHeaderWithAccount:](v7, "aa_addLoggedInAppleIDHeaderWithAccount:", self->_account);
    objc_msgSend(MEMORY[0x24BE04958], "clientInfoHeader");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v7, "setValue:forHTTPHeaderField:", v15, CFSTR("X-MMe-Client-Info"));

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uppercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v7, "setValue:forHTTPHeaderField:", v18, CFSTR("X-MMe-Country"));

    -[NSMutableURLRequest aa_addDeviceInternalDevHeaderIfEnabled](v7, "aa_addDeviceInternalDevHeaderIfEnabled");
    -[NSMutableURLRequest aa_addDeviceIDHeader](v7, "aa_addDeviceIDHeader");
    -[NSMutableURLRequest aa_addLocationSharingAllowedHeader](v7, "aa_addLocationSharingAllowedHeader");
    -[AAGrandSlamSigner signURLRequest:isUserInitiated:](self->_grandSlamSigner, "signURLRequest:isUserInitiated:", v7, 1);
LABEL_8:
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v7, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-MMe-Family-Setup"));
    v14 = 1;
    goto LABEL_9;
  }
  -[FAFamilySetupViewController _sendUserToiTunesSettings](self, "_sendUserToiTunesSettings");
LABEL_6:
  v14 = 0;
LABEL_9:

  return v14;
}

uint64_t __85__FAFamilySetupViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showActivitySpinnerInNavigationBar");
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD block[5];

  v5 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__FAFamilySetupViewController_remoteUIController_didReceiveHTTPResponse___block_invoke;
  block[3] = &unk_24C88B7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (objc_msgSend(v5, "statusCode") == 401)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "BML request returned 401. We need to re-auth...", v8, 2u);
    }

    -[ACAccountStore renewCredentialsForAccount:force:reason:completion:](self->_accountStore, "renewCredentialsForAccount:force:reason:completion:", self->_account, 1, 0, &__block_literal_global_46);
  }
  else if (-[NSMutableURLRequest aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:](self->_currentRemoteUIRequest, "aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:", v5))
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Device is provisioned... Reissuing request...", v8, 2u);
    }

    -[AAUIRemoteUIController loadRequest:completion:](self->_remoteUIController, "loadRequest:completion:", self->_currentRemoteUIRequest, &__block_literal_global_48);
  }

}

uint64_t __73__FAFamilySetupViewController_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideActivitySpinnerInNavigationBar");
}

void __73__FAFamilySetupViewController_remoteUIController_didReceiveHTTPResponse___block_invoke_44(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials to continue BML flow: %ld. Error: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __73__FAFamilySetupViewController_remoteUIController_didReceiveHTTPResponse___block_invoke_47(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Failed to load Family Setup remote UI: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id v4;

  -[FAFamilySetupViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familySetupViewController:didCompleteWithSuccess:", self, 1);

}

- (void)_remoteUIDidCancel
{
  id v3;

  -[FAFamilySetupViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familySetupViewController:didCompleteWithSuccess:", self, 0);

}

- (void)_sendUserToiTunesSettings
{
  void *v3;
  dispatch_time_t v4;

  -[FAFamilySetupViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familySetupViewController:didCompleteWithSuccess:", self, 0);

  v4 = dispatch_time(0, 500000000);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], &__block_literal_global_49_0);
}

void __56__FAFamilySetupViewController__sendUserToiTunesSettings__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 0, &v2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItemShowingSpinner, 0);
  objc_storeStrong((id *)&self->_originalRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_startRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
