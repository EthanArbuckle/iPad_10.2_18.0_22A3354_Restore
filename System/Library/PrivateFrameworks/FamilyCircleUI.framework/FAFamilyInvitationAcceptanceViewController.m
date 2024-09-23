@implementation FAFamilyInvitationAcceptanceViewController

- (FAFamilyInvitationAcceptanceViewController)initWithInvite:(id)a3 appleAccount:(id)a4 grandSlamSigner:(id)a5
{
  id v9;
  id v10;
  id v11;
  FAConfirmIdentityViewController *v12;
  FAFamilyInvitationAcceptanceViewController *v13;
  FAFamilyInvitationAcceptanceViewController *v14;
  uint64_t v15;
  ACAccountStore *accountStore;
  NSOperationQueue *v17;
  NSOperationQueue *inviteOperationQueue;
  void *v19;
  void *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[FAConfirmIdentityViewController initWithAppleAccount:grandSlamSigner:]([FAConfirmIdentityViewController alloc], "initWithAppleAccount:grandSlamSigner:", v10, v11);
  -[FAConfirmIdentityViewController setDelegate:](v12, "setDelegate:", self);
  v22.receiver = self;
  v22.super_class = (Class)FAFamilyInvitationAcceptanceViewController;
  v13 = -[FAFamilyInvitationAcceptanceViewController initWithRootViewController:](&v22, sel_initWithRootViewController_, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_grandSlamSigner, a5);
    objc_storeStrong((id *)&v14->_invite, a3);
    objc_storeStrong((id *)&v14->_account, a4);
    objc_msgSend(v11, "accountStore");
    v15 = objc_claimAutoreleasedReturnValue();
    accountStore = v14->_accountStore;
    v14->_accountStore = (ACAccountStore *)v15;

    v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    inviteOperationQueue = v14->_inviteOperationQueue;
    v14->_inviteOperationQueue = v17;

    -[FAConfirmIdentityViewController navigationItem](v12, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyInvitationAcceptanceViewController _createCancelButton](v14, "_createCancelButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLeftBarButtonItem:", v20);

  }
  return v14;
}

- (id)_createCancelButton
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
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__cancelButtonWasTapped_);

  return v6;
}

- (void)_cancelButtonWasTapped:(id)a3
{
  id v4;

  -[FAFamilyInvitationAcceptanceViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyInvitationAcceptanceViewController:didCompleteWithSuccess:", self, 0);

}

- (void)confirmIdentityViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id v5;

  if (a4)
  {
    -[FAFamilyInvitationAcceptanceViewController _loadiTunesLinkingRemoteUI](self, "_loadiTunesLinkingRemoteUI", a3);
  }
  else
  {
    -[FAFamilyInvitationAcceptanceViewController delegate](self, "delegate", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "familyInvitationAcceptanceViewController:didCompleteWithSuccess:", self, 0);

  }
}

- (void)_showErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COULD_NOT_CONNECT_TO_ICLOUD"), &stru_24C8A3000, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__FAFamilyInvitationAcceptanceViewController__showErrorAlert__block_invoke;
  v8[3] = &unk_24C88B7F0;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertWithTitle:message:buttonTitle:actionHandler:", v4, 0, v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyInvitationAcceptanceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

void __61__FAFamilyInvitationAcceptanceViewController__showErrorAlert__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyInvitationAcceptanceViewController:didCompleteWithSuccess:", *(_QWORD *)(a1 + 32), 0);

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

- (void)remoteUIController:(id)a3 willLoadRequest:(id)a4
{
  NSMutableURLRequest *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableURLRequest *v18;

  v18 = (NSMutableURLRequest *)a4;
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, a4);
  v6 = v18;
  if (self->_startRemoteUIRequest != v18)
  {
    -[NSMutableURLRequest URL](v18, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsString:", CFSTR("prefs:itunes"));

    if (v9)
    {
      -[FAFamilyInvitationAcceptanceViewController _sendUserToiTunesSettings](self, "_sendUserToiTunesSettings");
    }
    else
    {
      -[NSMutableURLRequest URL](v18, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsString:", CFSTR("prefs:icloud"));

      if (v12)
      {
        -[FAFamilyInvitationAcceptanceViewController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "familyInvitationAcceptanceViewController:didCompleteWithSuccess:", self, 0);

      }
      else
      {
        -[NSMutableURLRequest aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:](v18, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
        -[NSMutableURLRequest aa_addLoggedInAppleIDHeaderWithAccount:](v18, "aa_addLoggedInAppleIDHeaderWithAccount:", self->_account);
        -[NSMutableURLRequest aa_addDeviceInternalDevHeaderIfEnabled](v18, "aa_addDeviceInternalDevHeaderIfEnabled");
        -[NSMutableURLRequest aa_addDeviceIDHeader](v18, "aa_addDeviceIDHeader");
        -[NSMutableURLRequest aa_addLocationSharingAllowedHeader](v18, "aa_addLocationSharingAllowedHeader");
        objc_msgSend(MEMORY[0x24BE04958], "clientInfoHeader");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v18, "setValue:forHTTPHeaderField:", v14, CFSTR("X-MMe-Client-Info"));

        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDBCAE8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uppercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v18, "setValue:forHTTPHeaderField:", v17, CFSTR("X-MMe-Country"));

        -[AAGrandSlamSigner signURLRequest:isUserInitiated:](self->_grandSlamSigner, "signURLRequest:isUserInitiated:", v18, 1);
      }
    }
    v6 = v18;
  }

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  if (-[NSMutableURLRequest aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:](self->_currentRemoteUIRequest, "aa_addDeviceProvisioningInfoHeadersWithDSIDFromReponse:", a4))
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "Device is provisioned... Reissuing request...", v6, 2u);
    }

    -[AAUIRemoteUIController loadRequest:completion:](self->_remoteUIController, "loadRequest:completion:", self->_currentRemoteUIRequest, &__block_literal_global_14);
  }
}

void __88__FAFamilyInvitationAcceptanceViewController_remoteUIController_didReceiveHTTPResponse___block_invoke(uint64_t a1, char a2, void *a3)
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

  -[FAFamilyInvitationAcceptanceViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyInvitationAcceptanceViewController:didCompleteWithSuccess:", self, 1);

}

- (void)_loadiTunesLinkingRemoteUI
{
  void *v3;
  void *v4;
  FAFamilySetupBuddyMLRequest *v5;
  void *v6;
  void *v7;
  NSMutableURLRequest *v8;
  NSMutableURLRequest *startRemoteUIRequest;
  NSObject *v10;
  AAUIRemoteUIController *v11;
  AAUIRemoteUIController *remoteUIController;
  AAUIRemoteUIController *v13;
  NSMutableURLRequest *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  FAFamilySetupBuddyMLRequest *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[AAFamilyRequest initWithGrandSlamSigner:]([FAFamilySetupBuddyMLRequest alloc], "initWithGrandSlamSigner:", self->_grandSlamSigner);
  -[FAFamilySetupBuddyMLRequest setiTunesAccount:](v5, "setiTunesAccount:", v4);
  -[FAFamilyInvite code](self->_invite, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilySetupBuddyMLRequest setInviteCode:](v5, "setInviteCode:", v6);

  -[FAFamilySetupBuddyMLRequest urlRequest](v5, "urlRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSMutableURLRequest *)objc_msgSend(v7, "mutableCopy");
  startRemoteUIRequest = self->_startRemoteUIRequest;
  self->_startRemoteUIRequest = v8;

  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "Will load Family Setup remote UI using request: %@", buf, 0xCu);
  }

  v11 = (AAUIRemoteUIController *)objc_alloc_init(MEMORY[0x24BE04D70]);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v11;

  -[AAUIRemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", self);
  -[AAUIRemoteUIController setNavigationController:](self->_remoteUIController, "setNavigationController:", self);
  v13 = self->_remoteUIController;
  v14 = self->_startRemoteUIRequest;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__FAFamilyInvitationAcceptanceViewController__loadiTunesLinkingRemoteUI__block_invoke;
  v15[3] = &unk_24C88C530;
  v15[4] = self;
  -[AAUIRemoteUIController loadRequest:completion:](v13, "loadRequest:completion:", v14, v15);

}

void __72__FAFamilyInvitationAcceptanceViewController__loadiTunesLinkingRemoteUI__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Failed to load Family Setup remote UI: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_showErrorAlert");
  }

}

- (void)_sendUserToiTunesSettings
{
  void *v3;
  dispatch_time_t v4;

  -[FAFamilyInvitationAcceptanceViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyInvitationAcceptanceViewController:didCompleteWithSuccess:", self, 0);

  v4 = dispatch_time(0, 500000000);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], &__block_literal_global_43);
}

void __71__FAFamilyInvitationAcceptanceViewController__sendUserToiTunesSettings__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v2 = 0;
  objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 6, &v2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_startRemoteUIRequest, 0);
  objc_storeStrong((id *)&self->_inviteOperationQueue, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_invite, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
