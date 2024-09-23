@implementation DMCEnrollmentInterface

- (id)initFromViewController:(id)a3 enrollmentResultBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = -[DMCEnrollmentInterface initFromViewController:enrollmentResultBlock:managedConfigurationHelper:](self, "initFromViewController:enrollmentResultBlock:managedConfigurationHelper:", v7, v6, v8);

  return v9;
}

- (id)initFromViewController:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  DMCEnrollmentInterface *v11;

  v6 = a3;
  -[DMCEnrollmentInterface setDelegate:](self, "setDelegate:", a4);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__DMCEnrollmentInterface_initFromViewController_delegate___block_invoke;
  v10[3] = &unk_24D52EA88;
  v11 = self;
  v7 = (void *)objc_opt_new();
  v8 = -[DMCEnrollmentInterface initFromViewController:enrollmentResultBlock:managedConfigurationHelper:](v11, "initFromViewController:enrollmentResultBlock:managedConfigurationHelper:", v6, v10, v7);

  return v8;
}

void __58__DMCEnrollmentInterface_initFromViewController_delegate___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2)
  {
    objc_msgSend(v7, "enrollmentDidSucceed");
  }
  else if (a3)
  {
    objc_msgSend(v7, "enrollmentWasCanceled");
  }
  else
  {
    objc_msgSend(v7, "enrollmentDidFailWithError:", v9);
  }

}

- (id)initFromViewController:(id)a3 enrollmentResultBlock:(id)a4 managedConfigurationHelper:(id)a5
{
  id v8;
  id v9;
  id v10;
  DMCEnrollmentInterface *v11;
  DMCAccountSpecifierProvider *v12;
  void *v13;
  uint64_t v14;
  DMCAccountSpecifierProvider *accountSpecifierProvider;
  uint64_t v16;
  id enrollmentResultBlock;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMCEnrollmentInterface;
  v11 = -[DMCEnrollmentInterface init](&v19, sel_init);
  if (v11)
  {
    v12 = [DMCAccountSpecifierProvider alloc];
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[DMCAccountSpecifierProvider initWithAccountStore:](v12, "initWithAccountStore:", v13);
    accountSpecifierProvider = v11->_accountSpecifierProvider;
    v11->_accountSpecifierProvider = (DMCAccountSpecifierProvider *)v14;

    objc_storeWeak((id *)&v11->_parentViewController, v8);
    v16 = MEMORY[0x2199F7854](v9);
    enrollmentResultBlock = v11->_enrollmentResultBlock;
    v11->_enrollmentResultBlock = (id)v16;

    objc_storeStrong((id *)&v11->_mcHelper, a5);
    v11->_isUpdatingEnrollment = 0;
  }

  return v11;
}

- (void)startBYODEnrollment
{
  DMCBYODEnrollmentFlowUIPresenter *v3;
  void *v4;
  DMCBYODEnrollmentFlowUIPresenter *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = [DMCBYODEnrollmentFlowUIPresenter alloc];
  -[DMCEnrollmentInterface parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DMCEnrollmentFlowUIPresenterBase initWithBaseViewController:](v3, "initWithBaseViewController:", v4);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __45__DMCEnrollmentInterface_startBYODEnrollment__block_invoke;
  v13[3] = &unk_24D52E7F8;
  objc_copyWeak(&v14, &location);
  -[DMCEnrollmentFlowUIPresenterBase setDismissedCompletionBlock:](v5, "setDismissedCompletionBlock:", v13);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPresenter:", v5);
  objc_msgSend(MEMORY[0x24BE2A4D8], "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentInterface setEnrollmentFlowController:](self, "setEnrollmentFlowController:", v8);

  -[DMCEnrollmentInterface setIsUpdatingEnrollment:](self, "setIsUpdatingEnrollment:", 1);
  -[DMCEnrollmentInterface delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enrollmentDidBegin");

  -[DMCEnrollmentInterface enrollmentFlowController](self, "enrollmentFlowController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __45__DMCEnrollmentInterface_startBYODEnrollment__block_invoke_2;
  v11[3] = &unk_24D52EAB0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "startBYODEnrollmentFlowRestartIfFail:completionHandler:", 1, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __45__DMCEnrollmentInterface_startBYODEnrollment__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "enrollmentFlowController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "terminateEnrollmentFlow");

    WeakRetained = v3;
  }

}

void __45__DMCEnrollmentInterface_startBYODEnrollment__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setIsUpdatingEnrollment:", 0);
    objc_msgSend(v8, "enrollmentResultBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, uint64_t, id))v9)[2](v9, a2, a3, v10);

  }
}

- (void)startInBuddyEnrollment
{
  DMCBYODEnrollmentFlowUIPresenter *v3;
  void *v4;
  DMCBYODEnrollmentFlowUIPresenter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (objc_msgSend(MEMORY[0x24BE2A7E8], "isAppleInternal"))
  {
    if (objc_msgSend(MEMORY[0x24BE2A7D8], "ADETestModeEnabled"))
    {
      v3 = [DMCBYODEnrollmentFlowUIPresenter alloc];
      -[DMCEnrollmentInterface parentViewController](self, "parentViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[DMCEnrollmentFlowUIPresenterBase initWithBaseViewController:](v3, "initWithBaseViewController:", v4);

      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setPresenter:", v5);
      objc_msgSend(MEMORY[0x24BE2A4D8], "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCEnrollmentInterface setEnrollmentFlowController:](self, "setEnrollmentFlowController:", v7);

      -[DMCEnrollmentInterface setIsUpdatingEnrollment:](self, "setIsUpdatingEnrollment:", 1);
      -[DMCEnrollmentInterface delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enrollmentDidBegin");

      objc_initWeak(&location, self);
      -[DMCEnrollmentInterface enrollmentFlowController](self, "enrollmentFlowController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __48__DMCEnrollmentInterface_startInBuddyEnrollment__block_invoke;
      v10[3] = &unk_24D52EAB0;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v9, "startInBuddyEnrollmentFlowRestartIfFail:completionHandler:", 1, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);

    }
  }
}

void __48__DMCEnrollmentInterface_startInBuddyEnrollment__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setIsUpdatingEnrollment:", 0);
    objc_msgSend(v8, "enrollmentResultBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, uint64_t, id))v9)[2](v9, a2, a3, v10);

  }
}

- (void)startUnenrollmentWithAltDSID:(id)a3 silent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  DMCUnenrollmentFlowUIPresenter *v7;
  DMCUnenrollmentFlowUIPresenter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = 0;
  }
  else
  {
    v8 = [DMCUnenrollmentFlowUIPresenter alloc];
    -[DMCEnrollmentInterface parentViewController](self, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DMCEnrollmentFlowUIPresenterBase initWithBaseViewController:](v8, "initWithBaseViewController:", v9);

  }
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A4E8]), "initWithPresenter:managedConfigurationHelper:", v7, v10);
  -[DMCEnrollmentInterface setUnenrollmentFlowController:](self, "setUnenrollmentFlowController:", v11);

  -[DMCEnrollmentInterface setIsUpdatingEnrollment:](self, "setIsUpdatingEnrollment:", 1);
  objc_initWeak(&location, self);
  -[DMCEnrollmentInterface unenrollmentFlowController](self, "unenrollmentFlowController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__DMCEnrollmentInterface_startUnenrollmentWithAltDSID_silent___block_invoke;
  v13[3] = &unk_24D52EAB0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v12, "unenrollAccountWithAltDSID:silent:completionHandler:", v6, v4, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __62__DMCEnrollmentInterface_startUnenrollmentWithAltDSID_silent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setIsUpdatingEnrollment:", 0);
    objc_msgSend(v8, "enrollmentResultBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, uint64_t, id))v9)[2](v9, a2, a3, v10);

  }
}

- (void)startReauthWithRMAccountID:(id)a3
{
  id v4;
  DMCBYODEnrollmentFlowUIPresenter *v5;
  void *v6;
  DMCBYODEnrollmentFlowUIPresenter *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  v5 = [DMCBYODEnrollmentFlowUIPresenter alloc];
  -[DMCEnrollmentInterface parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMCEnrollmentFlowUIPresenterBase initWithBaseViewController:](v5, "initWithBaseViewController:", v6);

  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE2A4D8], "enrollmentFlowControllerWithPresenter:managedConfigurationHelper:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentInterface setEnrollmentFlowController:](self, "setEnrollmentFlowController:", v9);

  objc_initWeak(&location, self);
  -[DMCEnrollmentInterface enrollmentFlowController](self, "enrollmentFlowController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__DMCEnrollmentInterface_startReauthWithRMAccountID___block_invoke;
  v11[3] = &unk_24D52EAB0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "reauthBYODEnrollmentFlowRestartIfFail:rmAccountIdentifier:completionHandler:", 0, v4, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __53__DMCEnrollmentInterface_startReauthWithRMAccountID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "enrollmentResultBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, uint64_t, id))v9)[2](v9, a2, a3, v10);

  }
}

- (void)setManagedSignInButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[DMCEnrollmentInterface managedSignInButton](self, "managedSignInButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v4, *MEMORY[0x24BE75A18]);

}

- (id)_specifiersForManagedAccountSignIn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE75590];
  +[DMCAccountSpecifierProvider groupSpecifierID](DMCAccountSpecifierProvider, "groupSpecifierID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCEnrollmentInterface managedSignInButton](self, "managedSignInButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BE75590];
    DMCLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, 13, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setButtonAction:", sel_startBYODEnrollment);
    v10 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75A18]);
    -[DMCEnrollmentInterface setManagedSignInButton:](self, "setManagedSignInButton:", v9);

  }
  v11 = (void *)MEMORY[0x24BDBCEB8];
  v18[0] = v5;
  -[DMCEnrollmentInterface managedSignInButton](self, "managedSignInButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE2A7E8], "isAppleInternal")
    && objc_msgSend(MEMORY[0x24BE2A7D8], "ADETestModeEnabled"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Start Setup Assistant Enrollment…"), self, 0, 0, 0, 13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setButtonAction:", sel_startInBuddyEnrollment);
    v16 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v15, "setProperty:forKey:", v16, *MEMORY[0x24BE75A18]);
    objc_msgSend(v14, "addObject:", v15);

  }
  return v14;
}

- (id)specifiersForManagedAccounts
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;

  if (-[DMCEnrollmentInterface isUpdatingEnrollment](self, "isUpdatingEnrollment"))
  {
    -[DMCEnrollmentInterface _specifiersForManagedAccountSignIn](self, "_specifiersForManagedAccountSignIn");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[DMCEnrollmentInterface accountSpecifierProvider](self, "accountSpecifierProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifiersWithTitle:includePrimaryAccounts:", 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = v5;
LABEL_23:
    v19 = v6;
    goto LABEL_24;
  }
  -[DMCEnrollmentInterface mcHelper](self, "mcHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[DMCEnrollmentInterface mcHelper](self, "mcHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDeviceMDMEnrolled");

    if (v9)
    {
      v10 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v22 = 0;
        v11 = "No Managed Sign In button because we are enrolled in MDM";
        v12 = (uint8_t *)&v22;
LABEL_19:
        _os_log_impl(&dword_216358000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  else
  {

  }
  -[DMCEnrollmentInterface mcHelper](self, "mcHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_15:
    -[DMCEnrollmentInterface mcHelper](self, "mcHelper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[DMCEnrollmentInterface mcHelper](self, "mcHelper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isDeviceSharediPad");

      if (v18)
      {
        v10 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v20 = 0;
          v11 = "No Managed Sign In button because we are in Shared iPad";
          v12 = (uint8_t *)&v20;
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
    -[DMCEnrollmentInterface _specifiersForManagedAccountSignIn](self, "_specifiersForManagedAccountSignIn");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  -[DMCEnrollmentInterface mcHelper](self, "mcHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDeviceSupervised");

  if (!v15)
    goto LABEL_15;
  v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v21 = 0;
    v11 = "No Managed Sign In button because we are Supervised";
    v12 = (uint8_t *)&v21;
    goto LABEL_19;
  }
LABEL_20:
  v19 = 0;
LABEL_24:

  return v19;
}

+ (Class)preferredViewControllerClassForAccount:(id)a3 preferiCloudAccount:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  int v16;
  id v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dmc_altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;

      v5 = v9;
    }
    else
    {
      v10 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v5;
        _os_log_impl(&dword_216358000, v10, OS_LOG_TYPE_INFO, "No iCloud account for DMC account %@", (uint8_t *)&v16, 0xCu);
      }
    }

  }
  objc_msgSend(MEMORY[0x24BE00EE8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "viewControllerClassForViewingAccount:", v5);

  if (!v12)
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl(&dword_216358000, v13, OS_LOG_TYPE_ERROR, "No view controller available for DMC account %@", (uint8_t *)&v16, 0xCu);
    }
  }
  v14 = v12;

  return v14;
}

+ (id)accountControllerFromSpecifier:(id)a3 baseViewController:(id)a4 preferiCloudAccount:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE00EC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (id)objc_msgSend(a1, "preferredViewControllerClassForAccount:preferiCloudAccount:", v10, v5);
    if (v11)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setSpecifier:", v8);
      if (v9)
      {
        if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) == 0
          && (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
        {
          v17 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = 138412290;
            v19 = v11;
            _os_log_impl(&dword_216358000, v17, OS_LOG_TYPE_INFO, "DMC is returning a dataclass configuration account page controller: %@", (uint8_t *)&v18, 0xCu);
          }
          v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE75588]), "initWithRootViewController:", v12);
          objc_msgSend(v11, "setSpecifier:", v8);
          objc_msgSend(v11, "setParentController:", v9);
          objc_msgSend(v12, "setParentController:", v11);
          objc_msgSend(v12, "setRootController:", v11);
          goto LABEL_10;
        }
        v13 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v11;
          _os_log_impl(&dword_216358000, v13, OS_LOG_TYPE_INFO, "DMC is returning an account page controller: %@", (uint8_t *)&v18, 0xCu);
        }
        objc_msgSend(v12, "setParentController:", v9);
        objc_msgSend(v9, "rootController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRootController:", v14);

      }
      v11 = v12;
LABEL_10:

    }
  }
  else
  {
    v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_216358000, v15, OS_LOG_TYPE_ERROR, "A DMC account cell was tapped but had no account associated with it! %@", (uint8_t *)&v18, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (DMCAccountSpecifierProvider)accountSpecifierProvider
{
  return self->_accountSpecifierProvider;
}

- (void)setAccountSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountSpecifierProvider, a3);
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (id)enrollmentResultBlock
{
  return self->_enrollmentResultBlock;
}

- (void)setEnrollmentResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (DMCEnrollmentFlowMCBridge)mcHelper
{
  return self->_mcHelper;
}

- (void)setMcHelper:(id)a3
{
  objc_storeStrong((id *)&self->_mcHelper, a3);
}

- (BOOL)isUpdatingEnrollment
{
  return self->_isUpdatingEnrollment;
}

- (void)setIsUpdatingEnrollment:(BOOL)a3
{
  self->_isUpdatingEnrollment = a3;
}

- (DMCEnrollmentFlowController)enrollmentFlowController
{
  return self->_enrollmentFlowController;
}

- (void)setEnrollmentFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentFlowController, a3);
}

- (DMCUnenrollmentFlowController)unenrollmentFlowController
{
  return self->_unenrollmentFlowController;
}

- (void)setUnenrollmentFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_unenrollmentFlowController, a3);
}

- (PSSpecifier)managedSignInButton
{
  return self->_managedSignInButton;
}

- (void)setManagedSignInButton:(id)a3
{
  objc_storeStrong((id *)&self->_managedSignInButton, a3);
}

- (DMCEnrollmentDelegate)delegate
{
  return (DMCEnrollmentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedSignInButton, 0);
  objc_storeStrong((id *)&self->_unenrollmentFlowController, 0);
  objc_storeStrong((id *)&self->_enrollmentFlowController, 0);
  objc_storeStrong((id *)&self->_mcHelper, 0);
  objc_storeStrong(&self->_enrollmentResultBlock, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_accountSpecifierProvider, 0);
}

@end
