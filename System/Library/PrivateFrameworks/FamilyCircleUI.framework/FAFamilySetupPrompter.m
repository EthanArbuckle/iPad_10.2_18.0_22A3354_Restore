@implementation FAFamilySetupPrompter

- (FAFamilySetupPrompter)init
{
  return -[FAFamilySetupPrompter initWithiTunesAccount:](self, "initWithiTunesAccount:", 0);
}

- (FAFamilySetupPrompter)initWithiTunesAccount:(id)a3
{
  id v5;
  FAFamilySetupPrompter *v6;
  uint64_t v7;
  ACAccountStore *accountStore;
  NSOperationQueue *v9;
  NSOperationQueue *networkingQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FAFamilySetupPrompter;
  v6 = -[FAFamilySetupPrompter init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v7 = objc_claimAutoreleasedReturnValue();
    accountStore = v6->_accountStore;
    v6->_accountStore = (ACAccountStore *)v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    networkingQueue = v6->_networkingQueue;
    v6->_networkingQueue = v9;

    objc_storeStrong((id *)&v6->_iTunesAccount, a3);
    v6->_isRequestInFlight = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_networkingQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)FAFamilySetupPrompter;
  -[FAFamilySetupPrompter dealloc](&v3, sel_dealloc);
}

- (void)promptIfEligibleWithPresentingViewController:(id)a3 isFirstRun:(BOOL)a4
{
  NSObject *v4;
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[16];

  if (self->_isRequestInFlight)
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "We already have a prompt request in progress.", buf, 2u);
    }

  }
  else
  {
    objc_storeWeak((id *)&self->_presentingViewController, a3);
    self->_isRequestInFlight = 1;
    dispatch_get_global_queue(25, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke;
    v8[3] = &unk_24C88BD08;
    v8[4] = self;
    v9 = a4;
    dispatch_async(v7, v8);

  }
}

void __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void (**WeakRetained)(id, void *);
  void *v18;
  NSObject *v19;
  uint8_t v20[16];
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[5];
  char v25;
  _QWORD aBlock[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    objc_msgSend(*(id *)(v2 + 8), "aa_primaryAppleAccount");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 24))
  {
    objc_msgSend(*(id *)(v2 + 8), "aa_grandSlamAccountForiCloudAccount:", *(_QWORD *)(v2 + 16));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_QWORD *)(v2 + 32))
  {
    objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_activeiTunesAccount");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = v10;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 16))
  {
    v13 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_2;
    aBlock[3] = &unk_24C88B998;
    aBlock[4] = v2;
    v14 = _Block_copy(aBlock);
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_3;
    v24[3] = &unk_24C88D398;
    v24[4] = *(_QWORD *)(a1 + 32);
    v25 = *(_BYTE *)(a1 + 40);
    v15 = _Block_copy(v24);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_4;
    v21[3] = &unk_24C88CBF0;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v14;
    v23 = v15;
    v16 = v15;
    WeakRetained = v14;
    v18 = _Block_copy(v21);
    WeakRetained[2](WeakRetained, v18);

  }
  else
  {
    _AALogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_20DE41000, v19, OS_LOG_TYPE_DEFAULT, "No primary iCloud account found on device! Will not prompt for Family Setup.", v20, 2u);
    }

    WeakRetained = (void (**)(id, void *))objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(WeakRetained, "familySetupPrompterDidFinish:", *(_QWORD *)(a1 + 32));
  }

}

void __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BE04990];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithAppleAccount:grandSlamAccount:accountStore:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v6, "setITunesAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04A18]), "initWithRequest:handler:", v6, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addOperation:", v5);
}

uint64_t __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFamilyEligibilityResponse:isFirstRun:", a2, *(unsigned __int8 *)(a1 + 40));
}

void __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[16];

  v3 = a2;
  if (objc_msgSend(v3, "statusCode") == 401)
  {
    _AALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, "Family eligibility check request returned 401. We need to re-auth...", buf, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(v5 + 8);
    v8 = *(_QWORD *)(v5 + 16);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_10;
    v9[3] = &unk_24C88CBC8;
    v11 = v6;
    v12 = *(id *)(a1 + 48);
    v10 = v3;
    objc_msgSend(v7, "renewCredentialsForAccount:force:reason:completion:", v8, 1, 0, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family eligibility check request: %ld. Error: %@", buf, 0x16u);
  }

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_11;
    v7[3] = &unk_24C88BA38;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
}

uint64_t __81__FAFamilySetupPrompter_promptIfEligibleWithPresentingViewController_isFirstRun___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_handleFamilyEligibilityResponse:(id)a3 isFirstRun:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__FAFamilySetupPrompter__handleFamilyEligibilityResponse_isFirstRun___block_invoke;
  block[3] = &unk_24C88D3C0;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __69__FAFamilySetupPrompter__handleFamilyEligibilityResponse_isFirstRun___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  id WeakRetained;
  int v6;
  void *v7;
  __int16 v8;
  uint8_t buf[2];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  if (!objc_msgSend(*(id *)(a1 + 40), "eligibilityStatus"))
  {
    _AALogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v3 = "The user is not eligible for family.";
      v4 = buf;
      goto LABEL_8;
    }
LABEL_9:

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(WeakRetained, "familySetupPrompterDidFinish:", *(_QWORD *)(a1 + 32));

    return;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "eligibilityStatus") == 2)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      _AALogSystem();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        v3 = "User is underage and we are in first-run. Not prompting.";
        v4 = (uint8_t *)&v8;
LABEL_8:
        _os_log_impl(&dword_20DE41000, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "_showUnderageAlertWithEligibilityResponse:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "hasPendingInvites");
    v7 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
    {
      if (v6)
        objc_msgSend(v7, "_showConfirmationForStartingFamilySetupWithPendingInvite");
      else
        objc_msgSend(v7, "_showConfirmationForStartingFamilySetup");
    }
    else if (v6)
    {
      objc_msgSend(v7, "_showPendingInvitesDialog");
    }
    else
    {
      objc_msgSend(v7, "_startFamilySetupFlowWithEligibilityResponse:", *(_QWORD *)(a1 + 40));
    }
  }
}

- (void)_showConfirmationForStartingFamilySetup
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
  id WeakRetained;
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY_SHARING_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY_SHARING_MESSAGE"), &stru_24C8A3000, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY_NOT_NOW_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY_YES_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__FAFamilySetupPrompter__showConfirmationForStartingFamilySetup__block_invoke;
  v13[3] = &unk_24C88CA60;
  v13[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:", v4, v6, v8, v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __64__FAFamilySetupPrompter__showConfirmationForStartingFamilySetup__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_goToFamilySetup");
  return result;
}

- (void)_showConfirmationForStartingFamilySetupWithPendingInvite
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
  id WeakRetained;
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY_SHARING_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY_SHARING_MESSAGE"), &stru_24C8A3000, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY_NOT_NOW_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SETUP_FAMILY_YES_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__FAFamilySetupPrompter__showConfirmationForStartingFamilySetupWithPendingInvite__block_invoke;
  v13[3] = &unk_24C88CA60;
  v13[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:", v4, v6, v8, v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __81__FAFamilySetupPrompter__showConfirmationForStartingFamilySetupWithPendingInvite__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_showPendingInvitesDialog");
  return result;
}

- (void)_showPendingInvitesDialog
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
  id WeakRetained;
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PENDING_INVITE_ALERT_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PENDING_INVITE_ALERT_MESSAGE"), &stru_24C8A3000, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PENDING_INVITE_NOT_NOW_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PENDING_INVITE_RESPOND_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__FAFamilySetupPrompter__showPendingInvitesDialog__block_invoke;
  v13[3] = &unk_24C88CA60;
  v13[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:", v4, v6, v8, v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __50__FAFamilySetupPrompter__showPendingInvitesDialog__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "_goToFamilySetup");
  else
    return objc_msgSend(v2, "_goToInvitations");
}

- (void)_showUnderageAlertWithEligibilityResponse:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(v4, "underageEligibilityAlertTitle");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underageEligibilityAlertMessage");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 | v6)
  {
    v9 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C8A3000, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertWithTitle:message:buttonTitle:", v5, v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Server did not provide under alert title and message. Cannot show alert!", v13, 2u);
    }

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "familySetupPrompterDidFinish:", self);
  }

}

- (void)_goToInvitations
{
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  uint8_t buf[16];

  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "Taking user to settings...", buf, 2u);
  }

  v7 = 0;
  objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 4, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "familySetupPrompterDidFinish:", self);

}

- (void)_goToFamilySetup
{
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  uint8_t buf[16];

  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "Taking user to settings...", buf, 2u);
  }

  v7 = 0;
  objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 5, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "familySetupPrompterDidFinish:", self);

}

- (void)_startFamilySetupFlowWithEligibilityResponse:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  FAFamilySetupViewController *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t v15[16];

  v4 = (objc_class *)MEMORY[0x24BE049B0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithAccountStore:grandSlamAccount:appTokenID:", self->_accountStore, self->_grandSlamAccount, *MEMORY[0x24BE04878]);
  v8 = -[FAFamilySetupViewController initWithAccount:grandSlamSigner:familyEligibilityResponse:]([FAFamilySetupViewController alloc], "initWithAccount:grandSlamSigner:familyEligibilityResponse:", self->_appleAccount, v7, v5);

  -[FAFamilySetupViewController setDelegate:](v8, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  -[FAFamilySetupViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2 * ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    objc_msgSend(v12, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_20DE41000, v13, OS_LOG_TYPE_DEFAULT, "Cannot show Family Setup UI without a presenting view controller!", v15, 2u);
    }

    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "familySetupPrompterDidFinish:", self);

  }
}

- (void)familySetupViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "familySetupPrompterDidFinish:", self);

}

- (FAFamilySetupPrompterDelegate)delegate
{
  return (FAFamilySetupPrompterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
