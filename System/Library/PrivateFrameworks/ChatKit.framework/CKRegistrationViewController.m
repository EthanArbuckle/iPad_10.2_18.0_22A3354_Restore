@implementation CKRegistrationViewController

+ (BOOL)shouldShowRegistration
{
  _BOOL4 v2;
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = +[CKRegistrationViewController _shouldShowAuthKitSignIn](CKRegistrationViewController, "_shouldShowAuthKitSignIn");
  +[CKRegistrationViewController _inProgressRegisteringNonPhoneAccount](CKRegistrationViewController, "_inProgressRegisteringNonPhoneAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = +[CKRegistrationViewController _refreshAccountKeyCDPSyncingOrWaitingForUser](CKRegistrationViewController, "_refreshAccountKeyCDPSyncingOrWaitingForUser");
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v2;
  v7 = v6 & !v4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v7)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      if (v2)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v14 = 138413058;
      v15 = v10;
      if (v3)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      if (v5)
        v9 = CFSTR("YES");
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "shouldShowRegistration: %@, shouldShowAuthKitSignIn: %@, inProgressRegisteringNonPhoneAccount: %@, refreshAccountKeyCDPSyncingOrWaitingForUser: %@", (uint8_t *)&v14, 0x2Au);
    }

  }
  return v7;
}

+ (BOOL)_refreshAccountKeyCDPSyncingOrWaitingForUser
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestAccountForService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "registrationFailureReason");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v5 == 29)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      if (v5 == 28)
        v7 = CFSTR("YES");
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "refresh account key CDPSyncing: %@, CDPWaitingForUser: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  return (v5 & 0xFFFFFFFE) == 28;
}

+ (BOOL)_shouldShowAuthKitSignIn
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsForService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v7 |= objc_msgSend(v11, "accountType", (_QWORD)v16) == 2;
        v6 |= objc_msgSend(v11, "registrationStatus") == 5;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v8);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = CFSTR("NO");
      if ((v7 & 1) != 0)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      v22 = 2112;
      if ((v6 & 1) != 0)
        v13 = CFSTR("YES");
      v23 = v13;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "hasPhoneNumberAccount: %@, hasRegisteredAccount: %@, all accounts: %@", buf, 0x20u);
    }

  }
  return ((v7 | v6) ^ 1) & 1;
}

+ (id)_inProgressRegisteringNonPhoneAccount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountsForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "accountType");
        v12 = objc_msgSend(v10, "registrationStatus");
        if (v12 != 5 && v11 != 2 && (unint64_t)(v12 - 2) <= 2)
        {
          v7 = v10;
          goto LABEL_14;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
LABEL_14:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CKRegistrationViewController__inProgressRegisteringNonPhoneAccount__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_inProgressRegisteringNonPhoneAccount_onceToken != -1)
    dispatch_once(&_inProgressRegisteringNonPhoneAccount_onceToken, block);

  return v7;
}

void __69__CKRegistrationViewController__inProgressRegisteringNonPhoneAccount__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CKRegistrationViewController__inProgressRegisteringNonPhoneAccount__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

id __69__CKRegistrationViewController__inProgressRegisteringNonPhoneAccount__block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_inProgressRegisteringNonPhoneAccount");
}

- (CKRegistrationViewController)init
{
  CKRegistrationViewController *v2;
  CKRegistrationView *v3;
  CKRegistrationView *v4;
  void *v5;
  AKTapToSignInViewController *v6;
  AKTapToSignInViewController *akSignInVC;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  OBPrivacyLinkController *privacyLinkController;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKRegistrationViewController;
  v2 = -[CKRegistrationViewController init](&v20, sel_init);
  if (v2)
  {
    v3 = [CKRegistrationView alloc];
    v4 = -[CKRegistrationView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRegistrationView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[CKRegistrationView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("MadridRegistrationView"));
    -[CKRegistrationViewController setView:](v2, "setView:", v4);
    v6 = (AKTapToSignInViewController *)objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("AKTapToSignInViewController"), CFSTR("AuthKitUI")));
    akSignInVC = v2->_akSignInVC;
    v2->_akSignInVC = v6;

    -[AKTapToSignInViewController setUsesDarkMode:](v2->_akSignInVC, "setUsesDarkMode:", 0);
    -[AKTapToSignInViewController setDelegate:](v2->_akSignInVC, "setDelegate:", v2);
    v8 = objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("AKAppleIDAuthenticationInAppContext"), CFSTR("AuthKitUI")));
    objc_msgSend(v8, "setServiceType:", 4);
    objc_msgSend(v8, "setPresentingViewController:", v2);
    v9 = objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("ACAccountStore"), CFSTR("Accounts")));
    objc_msgSend(v9, "aa_primaryAppleAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v8, "setUsername:", v11);
    -[AKTapToSignInViewController setContext:](v2->_akSignInVC, "setContext:", v8);
    -[AKTapToSignInViewController view](v2->_akSignInVC, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRegistrationView setAuthKitSignInView:](v4, "setAuthKitSignInView:", v12);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);
    objc_msgSend(MEMORY[0x1E0D65190], "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.messages"));
    v14 = objc_claimAutoreleasedReturnValue();
    privacyLinkController = v2->_privacyLinkController;
    v2->_privacyLinkController = (OBPrivacyLinkController *)v14;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "signInTintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[OBPrivacyLinkController setCustomTintColor:](v2->_privacyLinkController, "setCustomTintColor:", v17);
    -[CKRegistrationViewController addChildViewController:](v2, "addChildViewController:", v2->_privacyLinkController);
    -[OBPrivacyLinkController view](v2->_privacyLinkController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRegistrationView setPrivacyLinkView:](v4, "setPrivacyLinkView:", v18);

    -[OBPrivacyLinkController didMoveToParentViewController:](v2->_privacyLinkController, "didMoveToParentViewController:", v2);
    -[CKRegistrationViewController setModalInPresentation:](v2, "setModalInPresentation:", 1);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKRegistrationViewController;
  -[CKRegistrationViewController dealloc](&v4, sel_dealloc);
}

- (id)accountRegistrar
{
  if (accountRegistrar_onceToken != -1)
    dispatch_once(&accountRegistrar_onceToken, &__block_literal_global_13);
  return (id)objc_msgSend(objc_alloc((Class)accountRegistrar_accountRegistrarClass), "initWithServiceType:presentationViewController:", 1, self);
}

uint64_t __48__CKRegistrationViewController_accountRegistrar__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("CNFAccountRegistrar"), CFSTR("CommunicationsSetupUI"));
  accountRegistrar_accountRegistrarClass = result;
  return result;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKRegistrationViewController;
  -[CKRegistrationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CKRegistrationViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD block[5];

  v3 = a3;
  +[CKRegistrationViewController _inProgressRegisteringNonPhoneAccount](CKRegistrationViewController, "_inProgressRegisteringNonPhoneAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__CKRegistrationViewController_viewWillAppear___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[CKRegistrationViewController accountRegistrar](self, "accountRegistrar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __47__CKRegistrationViewController_viewWillAppear___block_invoke_2;
    v9[3] = &unk_1E274BB80;
    v9[4] = self;
    objc_msgSend(v7, "continueRegistrationForAccount:completionBlock:", v5, v9);

  }
  v8.receiver = self;
  v8.super_class = (Class)CKRegistrationViewController;
  -[CKRegistrationViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);

}

void __47__CKRegistrationViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSigningIn:", 1);

}

uint64_t __47__CKRegistrationViewController_viewWillAppear___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRegistrarCompletion:errorAlertController:", a2, a3);
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CKRegistrationViewController updateInsetsForKeyboardFrame:](self, "updateInsetsForKeyboardFrame:", v7, v9, v11, v13);
}

- (void)keyboardDidShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CKRegistrationViewController updateInsetsForKeyboardFrame:](self, "updateInsetsForKeyboardFrame:", v7, v9, v11, v13);
}

- (void)updateInsetsForKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)MEMORY[0x1E0CEA950];
  -[CKRegistrationViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[CKRegistrationViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v28.origin.x = v19;
  v28.origin.y = v20;
  v28.size.width = v21;
  v28.size.height = v22;
  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  v27 = CGRectIntersection(v26, v28);
  v23 = v27.size.height;

  -[CKRegistrationViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentInset:", 0.0, 0.0, v23, 0.0);

  -[CKRegistrationViewController view](self, "view");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setScrollIndicatorInsets:", 0.0, 0.0, v23, 0.0);

}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  id v5;

  -[CKRegistrationViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentInset:", 0.0, 0.0, 0.0, 0.0);

  -[CKRegistrationViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, 0.0);

}

- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void **v14;
  void *v15;
  void **v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v10;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "AKTapToSignInViewController callback with error: %@", buf, 0xCu);
    }

  }
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v10;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Could not authenticate: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "AKTapToSignInViewController obtained results", buf, 2u);
      }

    }
    if (!tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationUsernameKey)
    {
      v14 = (void **)MEMORY[0x193FF3C24]("AKAuthenticationUsernameKey", CFSTR("AuthKit"));
      if (v14)
        v15 = *v14;
      else
        v15 = 0;
      objc_storeStrong((id *)&tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationUsernameKey, v15);
    }
    if (!tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationPasswordKey)
    {
      v16 = (void **)MEMORY[0x193FF3C24]("AKAuthenticationPasswordKey", CFSTR("AuthKit"));
      if (v16)
        v17 = *v16;
      else
        v17 = 0;
      objc_storeStrong((id *)&tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationPasswordKey, v17);
    }
    objc_msgSend(v9, "objectForKey:", tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationUsernameKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", tapToSignInViewController_didAuthenticateWithResults_error___AKAuthenticationPasswordKey);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v18 && v19)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "AKTapToSignInViewController results had username+password", buf, 2u);
        }

      }
      v22 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_73;
      v29[3] = &unk_1E274A208;
      v29[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v29);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Registering", buf, 2u);
        }

      }
      -[CKRegistrationViewController accountRegistrar](self, "accountRegistrar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v22;
      v28[1] = 3221225472;
      v28[2] = __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_74;
      v28[3] = &unk_1E274BB80;
      v28[4] = self;
      objc_msgSend(v24, "registerAccountWithUsername:password:service:completionBlock:", v18, v20, v25, v28);

    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_2;
      v27[3] = &unk_1E274A208;
      v27[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v27);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Authentication handler: Missing either username or password", buf, 2u);
        }

      }
    }

  }
}

void __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSigningIn:", 0);

}

void __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_73(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSigningIn:", 1);

}

uint64_t __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRegistrarCompletion:errorAlertController:", a2, a3);
}

void __91__CKRegistrationViewController_tapToSignInViewController_didAuthenticateWithResults_error___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSigningIn:", 0);

}

- (void)_handleRegistrarCompletion:(BOOL)a3 errorAlertController:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Handling registration callback", buf, 2u);
    }

  }
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Success! Calling completion block", buf, 2u);
      }

    }
    -[CKRegistrationViewController completionBlock](self, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKRegistrationViewController completionBlock](self, "completionBlock");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10[2](v10, 1);

    }
  }
  else if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Failure. showing error alert", buf, 2u);
      }

    }
    -[CKRegistrationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CKRegistrationViewController__handleRegistrarCompletion_errorAlertController___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__CKRegistrationViewController__handleRegistrarCompletion_errorAlertController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSigningIn:", 0);

}

- (void)setErrorPresentationViewController:(id)a3
{
  AKTapToSignInViewController *akSignInVC;
  id v4;
  id v5;

  akSignInVC = self->_akSignInVC;
  v4 = a3;
  -[AKTapToSignInViewController context](akSignInVC, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", v4);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (AKTapToSignInViewController)akSignInVC
{
  return self->_akSignInVC;
}

- (void)setAkSignInVC:(id)a3
{
  objc_storeStrong((id *)&self->_akSignInVC, a3);
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (void)setPrivacyLinkController:(id)a3
{
  objc_storeStrong((id *)&self->_privacyLinkController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_akSignInVC, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
