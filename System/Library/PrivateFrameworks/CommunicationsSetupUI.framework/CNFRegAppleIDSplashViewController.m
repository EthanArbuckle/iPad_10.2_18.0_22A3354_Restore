@implementation CNFRegAppleIDSplashViewController

+ (BOOL)shouldShowSplashViewForService:(id)a3 inProgressRegisteringNonPhoneAccount:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned __int8 v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  BOOL v23;
  uint64_t v24;
  BOOL v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  char v31;
  char v32;
  id *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BE4FE08], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSIMsWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BE4FE08], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsIdentification") ^ 1;

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportsSMS");

  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountsForService:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v15)
  {
    v16 = v15;
    v31 = v11;
    v32 = v9;
    v33 = a4;
    v34 = v5;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v14);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v23 = objc_msgSend(v22, "accountType") == 2;
        v24 = objc_msgSend(v22, "registrationStatus");
        v25 = v24 == 5;
        if (v24 == 1)
          v17 |= objc_msgSend(v22, "CNFRegIsSignedOut") ^ 1;
        v19 |= v23;
        v18 |= v25;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v16);
    v26 = v19 | v17;
    a4 = v33;
    v5 = v34;
    v11 = v31;
    LOBYTE(v9) = v32;
  }
  else
  {
    v18 = 0;
    v26 = 0;
  }

  +[CNFRegAppleIDSplashViewController _inProgressRegisteringNonPhoneAccountForService:](CNFRegAppleIDSplashViewController, "_inProgressRegisteringNonPhoneAccountForService:", v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (a4)
    *a4 = objc_retainAutorelease(v27);
  if (v26 & 1 | v18 & (v28 == 0))
    v29 = 0;
  else
    v29 = v9 | v11 ^ 1;

  return v29;
}

+ (id)_inProgressRegisteringNonPhoneAccountForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountsForService:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "accountType", (_QWORD)v15);
        v12 = objc_msgSend(v10, "registrationStatus");
        if (v12 != 5 && v11 != 2 && (unint64_t)(v12 - 2) <= 2)
        {
          v7 = v10;
          goto LABEL_14;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
LABEL_14:

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNFRegAppleIDSplashViewController;
  -[PSAppleIDSplashViewController dealloc](&v4, sel_dealloc);
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNFRegAppleIDSplashViewController;
  v4 = a3;
  -[CNFRegAppleIDSplashViewController setSpecifier:](&v7, sel_setSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("ft-serviceType"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFRegAppleIDSplashViewController setServiceType:](self, "setServiceType:", objc_msgSend(v5, "integerValue"));
  CNFRegSetStringTableForServiceType(-[CNFRegAppleIDSplashViewController serviceType](self, "serviceType"));
  +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", -[CNFRegAppleIDSplashViewController serviceType](self, "serviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAppleIDSplashViewController setRegController:](self, "setRegController:", v6);

}

- (id)serviceName
{
  int64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  v2 = -[CNFRegAppleIDSplashViewController serviceType](self, "serviceType");
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      CommunicationsSetupUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("MESSAGES");
      goto LABEL_6;
    }
    if (v2)
    {
      v6 = &stru_24D077260;
      return v6;
    }
  }
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("FACETIME");
LABEL_6:
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D077260, v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serviceDescription
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v5 = CFSTR("FACETIME_SIGNIN_SETTINGS_BLURB_APPLEACCOUNT");
  else
    v5 = CFSTR("FACETIME_SIGNIN_SETTINGS_BLURB");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D077260, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serviceFooter
{
  void *v2;
  void *v3;
  void *v4;

  CommunicationsSetupUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACETIME_SWITCH_STATUS_DEFAULT"), &stru_24D077260, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serviceIcon
{
  unint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = -[CNFRegAppleIDSplashViewController serviceType](self, "serviceType");
  if (v2 > 2)
  {
    v6 = 0;
  }
  else
  {
    v3 = off_24D076678[v2];
    v4 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    objc_msgSend(v4, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegAppleIDSplashViewController;
  -[PSAppleIDSplashViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CNFRegAppleIDSplashViewController serviceName](self, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegAppleIDSplashViewController setTitle:](self, "setTitle:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNFRegAppleIDSplashViewController;
  -[PSAppleIDSplashViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (-[CNFRegAppleIDSplashViewController showBusyUIOnAppearance](self, "showBusyUIOnAppearance"))
    -[PSAppleIDSplashViewController showBusyUI](self, "showBusyUI");
  -[CNFRegAppleIDSplashViewController setShowBusyUIOnAppearance:](self, "setShowBusyUIOnAppearance:", 0);
  -[CNFRegAppleIDSplashViewController _iCloudUserName](self, "_iCloudUserName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    -[PSAppleIDSplashViewController setUsername:](self, "setUsername:", v4);
  v5 = (void *)objc_opt_class();
  -[CNFRegAppleIDSplashViewController _imService](self, "_imService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_inProgressRegisteringNonPhoneAccountForService:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[CNFRegAppleIDSplashViewController continueRegisteringAccount:](self, "continueRegisteringAccount:", v7);

}

- (id)navigationItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  objc_super v10;

  -[CNFRegAppleIDSplashViewController parentViewController](self, "parentViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[CNFRegAppleIDSplashViewController parentViewController](self, "parentViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    -[CNFRegAppleIDSplashViewController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CNFRegAppleIDSplashViewController;
    -[CNFRegAppleIDSplashViewController navigationItem](&v10, sel_navigationItem);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)willBeginAuthWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "willBeginAuthWithContext: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v11 = v4;
    IMLogString();
  }
  -[CNFRegAppleIDSplashViewController regController](self, "regController", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "serviceType") == 0;

  if (v7)
  {
    v10 = 5;
    goto LABEL_10;
  }
  -[CNFRegAppleIDSplashViewController regController](self, "regController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "serviceType") == 1;

  if (v9)
  {
    v10 = 4;
LABEL_10:
    objc_msgSend(v4, "setServiceType:", v10);
  }
  v12.receiver = self;
  v12.super_class = (Class)CNFRegAppleIDSplashViewController;
  -[PSAppleIDSplashViewController willBeginAuthWithContext:](&v12, sel_willBeginAuthWithContext_, v4);

}

- (void)continueRegisteringAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  CNFAccountRegistrar *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSAppleIDSplashViewController showBusyUI](self, "showBusyUI");
  -[CNFRegAppleIDSplashViewController setShowBusyUIOnAppearance:](self, "setShowBusyUIOnAppearance:", 1);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = -[CNFAccountRegistrar initWithServiceType:presentationViewController:]([CNFAccountRegistrar alloc], "initWithServiceType:presentationViewController:", -[CNFRegAppleIDSplashViewController serviceType](self, "serviceType"), self);
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Continuing registration of account: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v7 = v4;
    IMLogString();
  }
  v6 = (void *)v10[5];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__CNFRegAppleIDSplashViewController_continueRegisteringAccount___block_invoke;
  v8[3] = &unk_24D076658;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v6, "continueRegistrationForAccount:completionBlock:", v4, v8, v7);
  _Block_object_dispose(&v9, 8);

}

uint64_t __64__CNFRegAppleIDSplashViewController_continueRegisteringAccount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleRegistarResults:alertController:", a2, a3);
  return objc_msgSend(*(id *)(a1 + 32), "setShowBusyUIOnAppearance:", 0);
}

- (id)_imService
{
  int64_t v2;
  void *v3;

  v2 = -[CNFRegAppleIDSplashViewController serviceType](self, "serviceType");
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      objc_msgSend(MEMORY[0x24BE50370], "iMessageService");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    if (v2)
    {
      v3 = 0;
      return v3;
    }
  }
  objc_msgSend(MEMORY[0x24BE50370], "facetimeService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (void)_showSettingsController
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("CNFSettingsViewControllerNeedsContainerUpdate"), 0);

}

- (void)_completeIfAccountIsAlreadyRegistered
{
  void *v3;
  BOOL v4;

  -[CNFRegAppleIDSplashViewController _imService](self, "_imService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CNFRegAppleIDSplashViewController shouldShowSplashViewForService:inProgressRegisteringNonPhoneAccount:](CNFRegAppleIDSplashViewController, "shouldShowSplashViewForService:inProgressRegisteringNonPhoneAccount:", v3, 0);

  if (!v4)
    -[CNFRegAppleIDSplashViewController _showSettingsController](self, "_showSettingsController");
}

- (void)handleAuthCompletionWithResults:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v10[16];
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNFRegAppleIDSplashViewController;
  -[PSAppleIDSplashViewController handleAuthCompletionWithResults:](&v11, sel_handleAuthCompletionWithResults_, v4);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE0ABF0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE0ABD0]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "AuthKit callback complete. Signing in.", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[PSAppleIDSplashViewController showBusyUI](self, "showBusyUI");
    -[CNFRegAppleIDSplashViewController _cnfSignInWithUsername:password:](self, "_cnfSignInWithUsername:password:", v5, v7);
  }

}

- (void)_handleRegistarResults:(BOOL)a3 alertController:(id)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[PSAppleIDSplashViewController hideBusyUI](self, "hideBusyUI");
  if (v4)
  {
    -[CNFRegAppleIDSplashViewController _showSettingsController](self, "_showSettingsController");
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  v6 = v7;
  if (v7)
  {
    -[CNFRegAppleIDSplashViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_cnfSignInWithUsername:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[6];
  uint8_t v15[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  CNFAccountRegistrar *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CNFRegAppleIDSplashViewController _imService](self, "_imService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *(_QWORD *)v15 = 0;
    v16 = v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__5;
    v19 = __Block_byref_object_dispose__5;
    v20 = -[CNFAccountRegistrar initWithServiceType:presentationViewController:]([CNFAccountRegistrar alloc], "initWithServiceType:presentationViewController:", -[CNFRegAppleIDSplashViewController serviceType](self, "serviceType"), self);
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Registering account: %@ (service: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v12 = v6;
      v13 = v8;
      IMLogString();
    }
    v10 = (void *)*((_QWORD *)v16 + 5);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __69__CNFRegAppleIDSplashViewController__cnfSignInWithUsername_password___block_invoke;
    v14[3] = &unk_24D076658;
    v14[4] = self;
    v14[5] = v15;
    objc_msgSend(v10, "registerAccountWithUsername:password:service:completionBlock:", v6, v7, v8, v14, v12, v13);
    _Block_object_dispose(v15, 8);

  }
  else
  {
    OSLogHandleForIDSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't generate a service to register with!", v15, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }

}

uint64_t __69__CNFRegAppleIDSplashViewController__cnfSignInWithUsername_password___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRegistarResults:alertController:", a2, a3);
}

- (id)_iCloudUserName
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNFRegController)regController
{
  return (CNFRegController *)objc_getProperty(self, a2, 1544, 1);
}

- (void)setRegController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1544);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (BOOL)showBusyUIOnAppearance
{
  return self->_showBusyUIOnAppearance;
}

- (void)setShowBusyUIOnAppearance:(BOOL)a3
{
  self->_showBusyUIOnAppearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regController, 0);
}

@end
