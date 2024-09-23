@implementation CNFRegWizardController

- (CNFRegWizardController)initWithRegController:(id)a3
{
  id v4;
  CNFRegWizardController *v5;
  CNFRegWizardController *v6;
  void *v7;
  void *v8;
  void *v9;
  CNFRegWizardController *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFRegWizardController;
  v5 = -[PSSetupController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_wizardFlags |= 2u;
    if (!v4)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v5->_serviceType = objc_msgSend(v4, "serviceType");
    -[CNFRegWizardController setRegController:](v6, "setRegController:", v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__restrictionsChanged, *MEMORY[0x24BE30330], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel__applicationDidFinishLaunching, *MEMORY[0x24BEBDFA0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__applicationDidEnterBackground, *MEMORY[0x24BEBDF98], 0);

  }
  v10 = v6;
LABEL_6:

  return v10;
}

- (CNFRegWizardController)initWithServiceTypes:(int64_t)a3
{
  void *v4;
  CNFRegWizardController *v5;

  +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNFRegWizardController initWithRegController:](self, "initWithRegController:", v4);

  return v5;
}

- (CNFRegWizardController)init
{
  return -[CNFRegWizardController initWithServiceTypes:](self, "initWithServiceTypes:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  self->_firstRunDelegate = 0;
  -[CNFRegWizardController _stopListeningForResignResume](self, "_stopListeningForResignResume");
  v4.receiver = self;
  v4.super_class = (Class)CNFRegWizardController;
  -[PSRootController dealloc](&v4, sel_dealloc);
}

- (int)_firstRunState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v4 = a3;
  -[CNFRegWizardController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isConnected") & 1) == 0)
    objc_msgSend(v5, "connect:", 1);
  v6 = objc_msgSend(v5, "accountState:", v4);
  if ((v6 & 4) != 0)
    v7 = 4;
  else
    v7 = 3;
  if ((v6 & 2) != 0)
    v8 = v7;
  else
    v8 = 2;
  if ((v6 & 1) != 0)
    v9 = v8;
  else
    v9 = 1;
  if ((v6 & 0x20000000) != 0)
    v10 = 5;
  else
    v10 = v9;

  return v10;
}

- (void)_checkRestrictions
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  if (-[CNFRegWizardController shouldShowFirstRunController](self, "shouldShowFirstRunController")
    && !-[CNFRegWizardController shouldTerminateInBackground](self, "shouldTerminateInBackground"))
  {
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "accountModificationRestricted");

    if (v4)
    {
      CNFRegSetStringTableForServiceType(self->_serviceType);
      CommunicationsSetupUIBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACCOUNT_RESTRICTION_ERROR_TITLE"), &stru_24D077260, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      CNFRegStringTableName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CommunicationsSetupUIBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CNFLocalizedStringFromTableInBundleWithFallback(CFSTR("FACETIME_ACCOUNT_CREATION_ERROR_MESSAGE"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      CommunicationsSetupUIBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNFRegWizardController setShouldTerminateInBackground:](self, "setShouldTerminateInBackground:", 1);
      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v10, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __44__CNFRegWizardController__checkRestrictions__block_invoke;
      v16[3] = &unk_24D075A28;
      v16[4] = self;
      objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 0, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAction:", v15);

      -[CNFRegWizardController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
    }
  }
}

void __44__CNFRegWizardController__checkRestrictions__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accountModificationRestricted");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setShouldTerminateInBackground:", 0);
  }
}

- (id)controllerClassesToShow:(BOOL)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  BOOL v15;
  uint64_t v16;

  -[CNFRegWizardController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceSupported");

  if (!v6)
    return 0;
  -[CNFRegWizardController regController](self, "regController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appleIDAccounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNFRegWizardController _firstRunState:](self, "_firstRunState:", v8);

  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v9 >= 4)
  {
    -[CNFRegWizardController regController](self, "regController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasFailedLogin");

    if (!v12)
    {
      if (v9 == 5)
        -[CNFRegWizardController canShowDisabledScreen](self, "canShowDisabledScreen");
      objc_msgSend(v10, "addObject:", objc_opt_class());
      return v10;
    }
  }
  v13 = (id)objc_opt_class();
  if (v9 == 2)
    goto LABEL_9;
  if (v9 != 3)
  {
    v15 = -[CNFRegWizardController canShowSplashScreen](self, "canShowSplashScreen");
    v16 = (uint64_t)v13;
    if (!v15)
    {
LABEL_14:
      objc_msgSend(v10, "addObject:", v16);
      goto LABEL_15;
    }
LABEL_13:
    v16 = objc_opt_class();
    goto LABEL_14;
  }
  if (a3)
  {
LABEL_9:
    objc_msgSend(v10, "addObject:", v13);
    goto LABEL_13;
  }
LABEL_15:

  return v10;
}

- (id)controllersToShow:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[16];

  v3 = a3;
  -[CNFRegWizardController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isServiceSupported");

  if (!v6)
    return 0;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Getting controllers to show", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegWizardController controllerClassesToShow:](self, "controllerClassesToShow:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((*(_WORD *)&self->_wizardFlags & 4) == 0 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v9, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  if (v9 && objc_msgSend(v9, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    if (objc_msgSend(v9, "count"))
    {
      v14 = 0;
      do
      {
        v15 = (objc_class *)(id)objc_msgSend(v9, "objectAtIndex:", v14);
        -[CNFRegWizardController regController](self, "regController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appleIDAccounts");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v17, "objectAtIndex:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v19 = [v15 alloc];
        -[CNFRegWizardController regController](self, "regController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithRegController:account:", v20, v18);

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "setHideLearnMoreButton:", (*(_WORD *)&self->_wizardFlags >> 5) & 1);
        if (!v14 && (*(_WORD *)&self->_wizardFlags & 0x100) != 0)
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__doCancel);
          objc_msgSend(v21, "setCustomLeftButton:", v22);

        }
        objc_msgSend(v13, "addObject:", v21);

        ++v14;
      }
      while (v14 < objc_msgSend(v9, "count"));
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)controllersToShow
{
  return -[CNFRegWizardController controllersToShow:](self, "controllersToShow:", 1);
}

- (BOOL)shouldShowFirstRunController
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  int v21;
  NSObject *v22;
  const __CFString *v23;
  uint64_t v25;
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "shouldShowFirstRunController", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegWizardController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isServiceSupported");

  if ((v5 & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Service is not supported", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog())
      goto LABEL_19;
LABEL_18:
    IMLogString();
LABEL_19:
    LOBYTE(v10) = 0;
    return v10;
  }
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "supportsSMSIdentification"))
  {
    v7 = (*(_WORD *)&self->_wizardFlags & 0x200) == 0;

    if (v7)
    {
      OSLogHandleForIDSCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "SMS identification is supported", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !IMShouldLog())
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else
  {

  }
  -[CNFRegWizardController regController](self, "regController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isConnected");

  if ((v12 & 1) == 0)
  {
    -[CNFRegWizardController regController](self, "regController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connect:", 1);

  }
  OSLogHandleForIDSCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_DEFAULT, "Checking to see if we need to show the first-run experience", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CNFRegLogIndent();
  -[CNFRegWizardController regController](self, "regController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accounts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CNFRegWizardController _firstRunState:](self, "_firstRunState:", v16);

  OSLogHandleForIDSCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v17;
    _os_log_impl(&dword_2138BA000, v18, OS_LOG_TYPE_DEFAULT, "State: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v25 = v17;
    IMLogString();
  }
  v19 = v17 < 4;
  -[CNFRegWizardController regController](self, "regController", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isServiceEnabled");

  v10 = v21 ^ 1 | v19;
  OSLogHandleForIDSCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("NO");
    if (v10)
      v23 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v27 = v23;
    _os_log_impl(&dword_2138BA000, v22, OS_LOG_TYPE_DEFAULT, "Should show first run controller:%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CNFRegLogOutdent();
  return v10;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNFRegWizardController;
  -[CNFRegWizardController viewDidLoad](&v6, sel_viewDidLoad);
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "View did load", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegWizardController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 1);

  -[CNFRegWizardController setupController](self, "setupController");
}

- (void)setupController
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  char isKindOfClass;
  NSObject *v34;
  NSObject *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Setting up wizard controller", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  CNFRegSetStringTableForServiceType(self->_serviceType);
  v3 = CNFRegGlobalAppearanceStyle();
  switch(v3)
  {
    case 6:
      -[CNFRegWizardController navigationBar](self, "navigationBar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBarStyle:", 1);

      -[CNFRegWizardController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 1);
      break;
    case 5:
      -[CNFRegWizardController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 1);
      break;
    case 3:
      -[CNFRegWizardController navigationBar](self, "navigationBar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBarStyle:", 1);

      break;
  }
  CNFRegGlobalAppearanceController();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "navigationBarTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegWizardController navigationBar](self, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBarTintColor:", v6);

  v8 = objc_msgSend(v49, "navigationBarTranslucent");
  -[CNFRegWizardController navigationBar](self, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslucent:", v8);

  v10 = objc_msgSend(v49, "navigationBarHidesShadow");
  -[CNFRegWizardController navigationBar](self, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setHidesShadow:", v10);

  objc_msgSend(v49, "navigationBarBackgroundImage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    -[CNFRegWizardController navigationBar](self, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundImage:forBarPosition:barMetrics:", v48, 0, 0);

  }
  -[CNFRegWizardController controllerClassesToShow:](self, "controllerClassesToShow:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegWizardController viewControllers](self, "viewControllers");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_wizardFlags & 4) == 0 && objc_msgSend(v13, "count"))
  {
    v14 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v13, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithObject:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  OSLogHandleForIDSCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "  => Controller classes to show:", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v13;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v63 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
        OSLogHandleForIDSCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v21;
          _os_log_impl(&dword_2138BA000, v22, OS_LOG_TYPE_DEFAULT, "    => %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v47 = v21;
          IMLogString();
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v18);
  }

  OSLogHandleForIDSCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v23, OS_LOG_TYPE_DEFAULT, "  => Current controller stack:", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v51 = v50;
  v24 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v59 != v25)
          objc_enumerationMutation(v51);
        v27 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
        OSLogHandleForIDSCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v27;
          _os_log_impl(&dword_2138BA000, v28, OS_LOG_TYPE_DEFAULT, "    => %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v47 = v27;
          IMLogString();
        }
      }
      v24 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v51, "count"))
  {
    v29 = objc_msgSend(obj, "count");
    if (v29 == objc_msgSend(v51, "count"))
    {
      if (!objc_msgSend(obj, "count"))
        goto LABEL_81;
      v30 = 0;
      while (1)
      {
        objc_msgSend(v51, "objectAtIndex:", v30, v47);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (id)objc_msgSend(obj, "objectAtIndex:", v30);
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        if (objc_msgSend(obj, "count") <= (unint64_t)++v30)
          goto LABEL_81;
      }
    }
  }
  OSLogHandleForIDSCategory();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v34, OS_LOG_TYPE_DEFAULT, "  => Should reload controllers", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  OSLogHandleForIDSCategory();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = (*(_WORD *)&self->_wizardFlags >> 2) & 1;
    *(_DWORD *)buf = 67109120;
    LODWORD(v69) = v36;
    _os_log_impl(&dword_2138BA000, v35, OS_LOG_TYPE_DEFAULT, "  => Can start nested: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v47 = (*(_WORD *)&self->_wizardFlags >> 2) & 1;
    IMLogString();
  }
  -[CNFRegWizardController controllersToShow:](self, "controllersToShow:", 1, v47);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if ((*(_WORD *)&self->_wizardFlags & 4) != 0)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v42 = v37;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(v42);
          v46 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          objc_msgSend(v46, "setRootController:", self);
          objc_msgSend(v46, "setParentController:", self);
          objc_msgSend(v46, "setDelegate:", self);
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v43);
    }

    -[CNFRegWizardController setViewControllers:](self, "setViewControllers:", v42);
  }
  else
  {
    objc_msgSend(v37, "objectAtIndex:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      objc_msgSend(v39, "setRootController:", self);
      objc_msgSend(v40, "setParentController:", self);
      objc_msgSend(v40, "setDelegate:", self);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegWizardController setViewControllers:](self, "setViewControllers:", v41);

    }
  }

LABEL_81:
}

- (void)_updateNavigationBarTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "navigationBarHidesTitle"))
  {
    v3 = objc_alloc(MEMORY[0x24BEBDB00]);
    v4 = (void *)objc_msgSend(v3, "initWithSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[CNFRegWizardController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleView:", v4);

  }
}

- (void)_updateNavigationBarHiddenForPush
{
  id v3;

  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "firstNavigationBarHidden"))
    -[CNFRegWizardController setNavigationBarHidden:](self, "setNavigationBarHidden:", 0);
  -[CNFRegWizardController _updateNavigationBarTitle](self, "_updateNavigationBarTitle");

}

- (void)_updateNavigationBarHiddenForPop
{
  void *v3;
  id v4;

  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "firstNavigationBarHidden"))
  {
    -[CNFRegWizardController viewControllers](self, "viewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegWizardController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", objc_msgSend(v3, "count") == 2, 1);

  }
  -[CNFRegWizardController _updateNavigationBarTitle](self, "_updateNavigationBarTitle");

}

- (void)_updateNavigationBarHiddenForCurrentState
{
  void *v3;
  id v4;

  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "firstNavigationBarHidden"))
  {
    -[CNFRegWizardController viewControllers](self, "viewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegWizardController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", objc_msgSend(v3, "count") == 1, 0);

  }
  -[CNFRegWizardController _updateNavigationBarTitle](self, "_updateNavigationBarTitle");

}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNFRegWizardController;
  -[PSRootController setViewControllers:animated:](&v5, sel_setViewControllers_animated_, a3, a4);
  -[CNFRegWizardController _updateNavigationBarHiddenForCurrentState](self, "_updateNavigationBarHiddenForCurrentState");
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v6;

  v3 = a3;
  -[CNFRegWizardController _updateNavigationBarHiddenForPop](self, "_updateNavigationBarHiddenForPop");
  v6.receiver = self;
  v6.super_class = (Class)CNFRegWizardController;
  -[PSRootController popViewControllerAnimated:](&v6, sel_popViewControllerAnimated_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)popViewControllerWithTransition:(int)a3
{
  uint64_t v3;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  -[CNFRegWizardController _updateNavigationBarHiddenForPop](self, "_updateNavigationBarHiddenForPop");
  v6.receiver = self;
  v6.super_class = (Class)CNFRegWizardController;
  -[CNFRegWizardController popViewControllerWithTransition:](&v6, sel_popViewControllerWithTransition_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[CNFRegWizardController _updateNavigationBarHiddenForPush](self, "_updateNavigationBarHiddenForPush");
  v7.receiver = self;
  v7.super_class = (Class)CNFRegWizardController;
  -[CNFRegWizardController pushViewController:transition:](&v7, sel_pushViewController_transition_, v6, v4);

}

- (void)pushViewController:(id)a3 transition:(int)a4
{
  uint64_t v4;
  id v6;
  objc_super v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[CNFRegWizardController _updateNavigationBarHiddenForPush](self, "_updateNavigationBarHiddenForPush");
  v7.receiver = self;
  v7.super_class = (Class)CNFRegWizardController;
  -[CNFRegWizardController pushViewController:transition:](&v7, sel_pushViewController_transition_, v6, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  __int16 wizardFlags;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[16];

  v3 = a3;
  CNFRegSetStringTableForServiceType(self->_serviceType);
  wizardFlags = (__int16)self->_wizardFlags;
  if ((wizardFlags & 0x80) != 0)
    *(_WORD *)&self->_wizardFlags = wizardFlags & 0xFF7F;
  else
    -[CNFRegWizardController setupController](self, "setupController");
  if (CNFRegGlobalAppearanceStyle() == 3)
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Setting bar style to black", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CNFRegWizardController navigationBar](self, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBarStyle:", 1);

  }
  v8.receiver = self;
  v8.super_class = (Class)CNFRegWizardController;
  -[CNFRegWizardController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  __int16 IsAutomaticAppearanceEnabled;
  objc_super v6;

  v3 = a3;
  IsAutomaticAppearanceEnabled = UIKeyboardIsAutomaticAppearanceEnabled();
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFFE | IsAutomaticAppearanceEnabled ^ 1;
  if ((IsAutomaticAppearanceEnabled & 1) == 0)
    UIKeyboardEnableAutomaticAppearance();
  -[CNFRegWizardController _startListeningForResignResume](self, "_startListeningForResignResume");
  v6.receiver = self;
  v6.super_class = (Class)CNFRegWizardController;
  -[CNFRegWizardController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegWizardController;
  -[PSSetupController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CNFRegWizardController _stopListeningForResignResume](self, "_stopListeningForResignResume");
  if ((*(_WORD *)&self->_wizardFlags & 1) != 0)
    UIKeyboardDisableAutomaticAppearance();
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegWizardController;
  -[PSSetupController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)_startListeningForResignResume
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id resignListener;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id resumeListener;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  if (!self->_resignListener && (*(_WORD *)&self->_wizardFlags & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BEBE010];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __56__CNFRegWizardController__startListeningForResignResume__block_invoke;
    v17[3] = &unk_24D076088;
    v18 = v3;
    v5 = v3;
    v6 = (void *)MEMORY[0x2199B8E98](v17);
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    resignListener = self->_resignListener;
    self->_resignListener = v7;

  }
  if (!self->_resumeListener && (*(_WORD *)&self->_wizardFlags & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BEBDF88];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __56__CNFRegWizardController__startListeningForResignResume__block_invoke_2;
    v15[3] = &unk_24D0760B0;
    v15[4] = self;
    v16 = v9;
    v11 = v9;
    v12 = (void *)MEMORY[0x2199B8E98](v15);
    objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", v10, 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    resumeListener = self->_resumeListener;
    self->_resumeListener = v13;

  }
}

uint64_t __56__CNFRegWizardController__startListeningForResignResume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postNotificationName:object:", CFSTR("com.apple.PreferencesApp.willResignActive"), 0);
}

uint64_t __56__CNFRegWizardController__startListeningForResignResume__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetNetworkFirstRunAlert");

  return objc_msgSend(*(id *)(a1 + 40), "postNotificationName:object:", CFSTR("com.apple.PreferencesApp.willBecomeActive"), 0);
}

- (void)_stopListeningForResignResume
{
  void *v3;
  id resignListener;
  id resumeListener;
  id v6;

  if (self->_resignListener)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_resignListener);
    resignListener = self->_resignListener;
    self->_resignListener = 0;

  }
  if (self->_resumeListener)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self->_resumeListener);
    resumeListener = self->_resumeListener;
    self->_resumeListener = 0;

  }
}

- (void)applicationWillSuspend
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CNFRegWizardController;
  -[CNFRegWizardController applicationWillSuspend](&v2, sel_applicationWillSuspend);
}

- (void)applicationDidResume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegWizardController;
  -[CNFRegWizardController applicationDidResume](&v3, sel_applicationDidResume);
  -[CNFRegWizardController _checkRestrictions](self, "_checkRestrictions");
}

- (void)_applicationDidEnterBackground
{
  id v2;

  if (-[CNFRegWizardController shouldTerminateInBackground](self, "shouldTerminateInBackground"))
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "terminateWithSuccess");

  }
}

- (void)dismissWithState:(unint64_t)a3
{
  -[CNFRegWizardController dismissFinished:](self, "dismissFinished:", (a3 >> 30) & 1);
}

- (void)dismissFinished:(BOOL)a3
{
  _BOOL8 v3;
  CNFRegWizardControllerDelegate *firstRunDelegate;
  CNFRegWizardControllerDelegate *v6;
  CNFRegWizardControllerDelegate *v7;
  id *v8;
  id WeakRetained;
  void *v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  firstRunDelegate = self->_firstRunDelegate;
  if (firstRunDelegate)
  {
    v6 = firstRunDelegate;
LABEL_3:
    v7 = v6;
    goto LABEL_8;
  }
  v8 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75710]);
  WeakRetained = objc_loadWeakRetained(v8);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained(v8);
    v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_254D2D1D8);

    if (v12)
    {
      v6 = (CNFRegWizardControllerDelegate *)objc_loadWeakRetained(v8);
      goto LABEL_3;
    }
  }
  v7 = 0;
LABEL_8:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CNFRegWizardController viewControllers](self, "viewControllers", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setDelegate:", 0);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  -[CNFRegWizardControllerDelegate firstRunControllerDidFinish:finished:](v7, "firstRunControllerDidFinish:finished:", self, v3);
}

- (void)firstRunController:(id)a3 finishedWithState:(unint64_t)a4
{
  -[CNFRegWizardController dismissWithState:](self, "dismissWithState:", a4);
}

- (void)_doCancel
{
  void *v3;
  void *v4;
  id v5;

  -[CNFRegWizardController regController](self, "regController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegWizardController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleIDAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegWizardController dismissWithState:](self, "dismissWithState:", objc_msgSend(v5, "accountState:", v4));

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;

  -[CNFRegWizardController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return a3 == 1;
  -[CNFRegWizardController topViewController](self, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isSupportedInterfaceOrientation:", a3);

  return v7;
}

+ (void)setGlobalAppearanceStyle:(int64_t)a3
{
  CNFRegSetGlobalAppearanceStyle(a3);
}

+ (void)setSupportsAutoRotation:(BOOL)a3
{
  CNFRegSetSupportsAutoRotation(a3);
}

- (BOOL)canStartNested
{
  return (*(_WORD *)&self->_wizardFlags >> 2) & 1;
}

- (void)setCanStartNested:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFFB | v3;
}

- (BOOL)canShowSplashScreen
{
  return (*(_WORD *)&self->_wizardFlags >> 3) & 1;
}

- (void)setCanShowSplashScreen:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFF7 | v3;
}

- (BOOL)canShowDisabledScreen
{
  return (*(_WORD *)&self->_wizardFlags >> 4) & 1;
}

- (void)setCanShowDisabledScreen:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFEF | v3;
}

- (BOOL)skipReloadOnNextViewWillAppear
{
  return (*(_WORD *)&self->_wizardFlags >> 7) & 1;
}

- (void)setSkipReloadOnNextViewWillAppear:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFF7F | v3;
}

- (BOOL)shouldListenForSuspension
{
  return (*(_WORD *)&self->_wizardFlags >> 1) & 1;
}

- (void)setShouldListenForSuspension:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFFD | v3;
}

- (BOOL)allowCancel
{
  return HIBYTE(*(_WORD *)&self->_wizardFlags) & 1;
}

- (void)setAllowCancel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFEFF | v3;
}

- (BOOL)allowSMS
{
  return (*(_WORD *)&self->_wizardFlags >> 9) & 1;
}

- (void)setAllowSMS:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFDFF | v3;
}

- (BOOL)hideLearnMoreButton
{
  return (*(_WORD *)&self->_wizardFlags >> 5) & 1;
}

- (void)setHideLearnMoreButton:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFDF | v3;
}

- (BOOL)showSplashOnSignin
{
  return (*(_WORD *)&self->_wizardFlags >> 6) & 1;
}

- (void)setShowSplashOnSignin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFFBF | v3;
}

- (BOOL)shouldTerminateInBackground
{
  return (*(_WORD *)&self->_wizardFlags >> 10) & 1;
}

- (void)setShouldTerminateInBackground:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_wizardFlags = *(_WORD *)&self->_wizardFlags & 0xFBFF | v3;
}

- (CNFRegWizardControllerDelegate)firstRunDelegate
{
  return self->_firstRunDelegate;
}

- (void)setFirstRunDelegate:(id)a3
{
  self->_firstRunDelegate = (CNFRegWizardControllerDelegate *)a3;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
  objc_storeStrong((id *)&self->_regController, a3);
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong(&self->_resumeListener, 0);
  objc_storeStrong(&self->_resignListener, 0);
  objc_storeStrong((id *)&self->_regController, 0);
}

@end
