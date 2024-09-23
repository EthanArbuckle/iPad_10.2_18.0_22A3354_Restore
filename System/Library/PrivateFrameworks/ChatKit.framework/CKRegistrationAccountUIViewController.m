@implementation CKRegistrationAccountUIViewController

- (void)viewDidLoad
{
  AAUISignInViewController *v3;
  AAUISignInViewController *authViewController;
  void *v5;
  void *v6;
  AAUISignInViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKRegistrationAccountUIViewController;
  -[CKRegistrationAccountUIViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = (AAUISignInViewController *)objc_alloc_init(MEMORY[0x1E0CFAEE0]);
  authViewController = self->_authViewController;
  self->_authViewController = v3;

  -[CKRegistrationAccountUIViewController _account](self, "_account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController setUsername:](self->_authViewController, "setUsername:", v6);

  -[AAUISignInViewController setShowServiceIcons:](self->_authViewController, "setShowServiceIcons:", 0);
  -[AAUISignInViewController setTableViewStyle:](self->_authViewController, "setTableViewStyle:", 2);
  v7 = self->_authViewController;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signInAppIconImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController setHeaderImage:](v7, "setHeaderImage:", v9);

  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("IMESSAGE_REGISTRATION_BLURB_NO_NEWLINE"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController setMessageLabel:](self->_authViewController, "setMessageLabel:", v11);

  -[AAUISignInViewController setPrivacyLinkIdentifiers:](self->_authViewController, "setPrivacyLinkIdentifiers:", &unk_1E286F220);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "signInTintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController setTintColor:](self->_authViewController, "setTintColor:", v13);

  -[AAUISignInViewController setDelegate:](self->_authViewController, "setDelegate:", self);
  -[CKRegistrationAccountUIViewController addChildViewController:](self, "addChildViewController:", self->_authViewController);
  -[CKRegistrationAccountUIViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignInViewController view](self->_authViewController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[AAUISignInViewController didMoveToParentViewController:](self->_authViewController, "didMoveToParentViewController:", self);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKRegistrationAccountUIViewController;
  -[CKRegistrationAccountUIViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[AAUISignInViewController view](self->_authViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRegistrationAccountUIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AAUISignInViewController preferredContentSize](self->_authViewController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)authenticationContext
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("AKAppleIDAuthenticationInAppContext"), CFSTR("AuthKitUI")));
  objc_msgSend(v3, "setServiceType:", 4);
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MADRID"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "setShouldOfferSecurityUpgrade:", 0);
  objc_msgSend(v3, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v3, "setAuthenticationType:", 2);
  return v3;
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "didCompleteWithAuthenticationResults", v8, 2u);
    }

  }
}

- (void)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7
{
  -[CKRegistrationAccountUIViewController _processAuthenticationResults:authCompletion:](self, "_processAuthenticationResults:authCompletion:", a4, a7, a5, a6);
}

- (id)_account
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("ACAccountStore"), CFSTR("Accounts")));
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accountRegistrar
{
  return (id)objc_msgSend(objc_alloc((Class)MEMORY[0x193FF3C18](CFSTR("CNFAccountRegistrar"), CFSTR("CommunicationsSetupUI"))), "initWithServiceType:presentationViewController:", 1, self);
}

- (void)_registerAccountWithUsername:(id)a3 password:(id)a4 authCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Registering", buf, 2u);
    }

  }
  -[CKRegistrationAccountUIViewController _accountRegistrar](self, "_accountRegistrar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__CKRegistrationAccountUIViewController__registerAccountWithUsername_password_authCompletion___block_invoke;
  v15[3] = &unk_1E274A2C8;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v12, "registerAccountWithUsername:password:service:completionBlock:", v8, v9, v13, v15);

}

void __94__CKRegistrationAccountUIViewController__registerAccountWithUsername_password_authCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CKRegistrationAccountUIViewController__registerAccountWithUsername_password_authCompletion___block_invoke_2;
  v8[3] = &unk_1E274A2A0;
  v11 = a2;
  v6 = *(id *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __94__CKRegistrationAccountUIViewController__registerAccountWithUsername_password_authCompletion___block_invoke_2(uint64_t a1)
{
  void (*v2)(void);

  v2 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  if (*(_BYTE *)(a1 + 56))
  {
    v2();
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 968) + 16))();
  }
  else
  {
    v2();
    return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
  }
}

- (void)_processAuthenticationResults:(id)a3 authCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void **v8;
  void *v9;
  void **v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!_processAuthenticationResults_authCompletion___AKAuthenticationUsernameKey)
  {
    v8 = (void **)MEMORY[0x193FF3C24]("AKAuthenticationUsernameKey", CFSTR("AuthKit"));
    if (v8)
      v9 = *v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&_processAuthenticationResults_authCompletion___AKAuthenticationUsernameKey, v9);
  }
  if (!_processAuthenticationResults_authCompletion___AKAuthenticationPasswordKey)
  {
    v10 = (void **)MEMORY[0x193FF3C24]("AKAuthenticationPasswordKey", CFSTR("AuthKit"));
    if (v10)
      v11 = *v10;
    else
      v11 = 0;
    objc_storeStrong((id *)&_processAuthenticationResults_authCompletion___AKAuthenticationPasswordKey, v11);
  }
  objc_msgSend(v6, "objectForKey:", _processAuthenticationResults_authCompletion___AKAuthenticationUsernameKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", _processAuthenticationResults_authCompletion___AKAuthenticationPasswordKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = IMOSLoggingEnabled();
  if (v12 && v13)
  {
    if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "AAUISignInViewController results had username+password", buf, 2u);
      }

    }
    -[CKRegistrationAccountUIViewController _registerAccountWithUsername:password:authCompletion:](self, "_registerAccountWithUsername:password:authCompletion:", v12, v13, v7);
  }
  else
  {
    if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "AAUISignInViewController handler: Missing either username or password", v17, 2u);
      }

    }
    v7[2](v7, 0);
  }

}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (AAUISignInViewController)authViewController
{
  return self->_authViewController;
}

- (void)setAuthViewController:(id)a3
{
  objc_storeStrong((id *)&self->_authViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authViewController, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
