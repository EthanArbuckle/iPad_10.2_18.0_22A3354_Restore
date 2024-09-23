@implementation DMCUnenrollmentFlowController

- (DMCUnenrollmentFlowController)initWithPresenter:(id)a3 managedConfigurationHelper:(id)a4
{
  id v7;
  id v8;
  DMCUnenrollmentFlowController *v9;
  DMCUnenrollmentFlowController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMCUnenrollmentFlowController;
  v9 = -[DMCEnrollmentFlowControllerBase init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    objc_storeStrong((id *)&v10->_managedConfigurationHelper, a4);
  }

  return v10;
}

- (void)unenrollAccountWithAltDSID:(id)a3 silent:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a4;
  v8 = a5;
  -[DMCUnenrollmentFlowController setAltDSID:](self, "setAltDSID:", a3);
  -[DMCUnenrollmentFlowController setUnenrollmentCompletionHandler:](self, "setUnenrollmentCompletionHandler:", v8);

  -[DMCUnenrollmentFlowController _resetToInitialStepsWithSilent:](self, "_resetToInitialStepsWithSilent:", v5);
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
}

- (void)_resetToInitialStepsWithSilent:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCUnenrollmentFlowController;
  -[DMCEnrollmentFlowControllerBase _resetToInitialSteps](&v6, sel__resetToInitialSteps);
  if (a3)
    -[DMCUnenrollmentFlowController _silentUnenrollmentSteps](self, "_silentUnenrollmentSteps");
  else
    -[DMCUnenrollmentFlowController _interactiveUnenrollmentSteps](self, "_interactiveUnenrollmentSteps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentFlowControllerBase _appendSteps:](self, "_appendSteps:", v5);

}

- (void)_workerQueue_performFlowStep:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[DMCUnenrollmentFlowController _nameForStep:](self, "_nameForStep:", a3);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_DEFAULT, "Will perform unenrollment step: %{public}@", (uint8_t *)&v13, 0xCu);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE2A838], "currentPersonaID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE2A838], "currentPersonaTypeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[DMCUnenrollmentFlowController _workerQueue_performFlowStep:]";
    v15 = 1024;
    v16 = 64;
    v17 = 2114;
    v18 = v8;
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_219D1D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", (uint8_t *)&v13, 0x26u);

  }
  -[DMCEnrollmentFlowControllerBase setCurrentStep:](self, "setCurrentStep:", a3);
  switch(a3)
  {
    case 0uLL:
      -[DMCUnenrollmentFlowController altDSID](self, "altDSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCUnenrollmentFlowController _preflightUnenrollmentWithAccoutAltDSID:](self, "_preflightUnenrollmentWithAccoutAltDSID:", v10);
      goto LABEL_10;
    case 1uLL:
      -[DMCUnenrollmentFlowController _askForUserConfirmationIsAppleMAID:](self, "_askForUserConfirmationIsAppleMAID:", -[DMCUnenrollmentFlowController isAppleMAID](self, "isAppleMAID"));
      break;
    case 2uLL:
      -[DMCUnenrollmentFlowController _askForPasscodeIfNeeded](self, "_askForPasscodeIfNeeded");
      break;
    case 3uLL:
      -[DMCUnenrollmentFlowController profileIdentifier](self, "profileIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCUnenrollmentFlowController personaID](self, "personaID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCUnenrollmentFlowController altDSID](self, "altDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCUnenrollmentFlowController _uninstallEnrollmentProfileWithIdentifier:personaID:altDSID:isAppleMAID:](self, "_uninstallEnrollmentProfileWithIdentifier:personaID:altDSID:isAppleMAID:", v10, v11, v12, -[DMCUnenrollmentFlowController isAppleMAID](self, "isAppleMAID"));

LABEL_10:
      break;
    default:
      return;
  }
}

- (void)_workerQueue_flowCompleted
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t v7[16];

  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_219D1D000, v3, OS_LOG_TYPE_DEFAULT, "Unenrollment flow completed!", v7, 2u);
  }
  -[DMCUnenrollmentFlowController presenter](self, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissUnenrollmentScene");

  -[DMCUnenrollmentFlowController unenrollmentCompletionHandler](self, "unenrollmentCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DMCUnenrollmentFlowController unenrollmentCompletionHandler](self, "unenrollmentCompletionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 1, 0, 0);

    -[DMCUnenrollmentFlowController setUnenrollmentCompletionHandler:](self, "setUnenrollmentCompletionHandler:", 0);
  }
}

- (void)_flowTerminatedWithError:(id)a3 canceled:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DMCUnenrollmentFlowController *v11;
  BOOL v12;

  v6 = a3;
  -[DMCEnrollmentFlowControllerBase workerQueue](self, "workerQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__DMCUnenrollmentFlowController__flowTerminatedWithError_canceled___block_invoke;
  v9[3] = &unk_24DBE33E8;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "queueBlock:", v9);

}

void __67__DMCUnenrollmentFlowController__flowTerminatedWithError_canceled___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(a1 + 48);
    v8 = 138543618;
    v9 = v3;
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_DEFAULT, "Unenrollment flow terminated with error: %{public}@, canceled: %d", (uint8_t *)&v8, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 40), "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissUnenrollmentScene");

  objc_msgSend(*(id *)(a1 + 40), "unenrollmentCompletionHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "unenrollmentCompletionHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "setUnenrollmentCompletionHandler:", 0);
  }
}

- (id)_interactiveUnenrollmentSteps
{
  return &unk_24DBE8038;
}

- (id)_silentUnenrollmentSteps
{
  return &unk_24DBE8050;
}

- (void)_preflightUnenrollmentWithAccoutAltDSID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dmc_remoteManagementAccountForAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "dmc_managementProfileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCUnenrollmentFlowController setIsAppleMAID:](self, "setIsAppleMAID:", objc_msgSend(v6, "dmc_enrollmentMethod") == 1);
  }
  else
  {
    v8 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v8, OS_LOG_TYPE_ERROR, "RM account is missing!", buf, 2u);
    }
    v7 = 0;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_219D1D000, v9, OS_LOG_TYPE_ERROR, "No profile identifier from the RM account!", v15, 2u);
    }
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "dmc_personaIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCUnenrollmentFlowController setPersonaID:](self, "setPersonaID:", v12);

      v6 = v11;
    }
    else
    {
      v13 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_ERROR, "No iCloud account found!", v14, 2u);
      }
      v6 = 0;
    }
  }
  -[DMCUnenrollmentFlowController setProfileIdentifier:](self, "setProfileIdentifier:", v7);
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");

}

- (void)_askForUserConfirmationIsAppleMAID:(BOOL)a3
{
  void *v4;
  _BOOL8 v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[DMCUnenrollmentFlowController presenter](self, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DMCUnenrollmentFlowController isAppleMAID](self, "isAppleMAID");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__DMCUnenrollmentFlowController__askForUserConfirmationIsAppleMAID___block_invoke;
  v6[3] = &unk_24DBE36B8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "requestUserConfirmationIsAppleMAID:completionHandler:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __68__DMCUnenrollmentFlowController__askForUserConfirmationIsAppleMAID___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __68__DMCUnenrollmentFlowController__askForUserConfirmationIsAppleMAID___block_invoke_2;
    v6[3] = &unk_24DBE3690;
    v6[4] = v4;
    v7 = a2;
    objc_msgSend(v5, "queueBlock:", v6);

  }
}

uint64_t __68__DMCUnenrollmentFlowController__askForUserConfirmationIsAppleMAID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 1)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[DMCUnenrollmentFlowController _askForUserConfirmationIsAppleMAID:]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(v3, "_pollNextStep");
  else
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:", 0, 1);
}

- (void)_askForPasscodeIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[DMCUnenrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDevicePasscodeSet");

  if (v4)
  {
    objc_initWeak(&location, self);
    -[DMCUnenrollmentFlowController presenter](self, "presenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__DMCUnenrollmentFlowController__askForPasscodeIfNeeded__block_invoke;
    v6[3] = &unk_24DBE3410;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "requestDevicePasscodeWithCompletionHandler:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");
  }
}

void __56__DMCUnenrollmentFlowController__askForPasscodeIfNeeded__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workerQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__DMCUnenrollmentFlowController__askForPasscodeIfNeeded__block_invoke_2;
    v7[3] = &unk_24DBE3690;
    v7[4] = v5;
    v8 = a3;
    objc_msgSend(v6, "queueBlock:", v7);

  }
}

uint64_t __56__DMCUnenrollmentFlowController__askForPasscodeIfNeeded__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "currentStep") != 2)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[DMCUnenrollmentFlowController _askForPasscodeIfNeeded]_block_invoke_2";
      _os_log_impl(&dword_219D1D000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(v3, "_flowTerminatedWithError:canceled:", 0, 1);
  else
    return objc_msgSend(v3, "_pollNextStep");
}

- (void)_uninstallEnrollmentProfileWithIdentifier:(id)a3 personaID:(id)a4 altDSID:(id)a5 isAppleMAID:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t buf[16];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[DMCUnenrollmentFlowController presenter](self, "presenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentActivityPageForAppleMAID:", v6);

  if (v10)
  {
    v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v14, OS_LOG_TYPE_DEFAULT, "Unenrolling with profile identifier...", buf, 2u);
    }
    -[DMCUnenrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeProfileWithIdentifier:async:", v10, 0);
LABEL_5:

    goto LABEL_6;
  }
  if (!v11)
  {
    if (!v12)
      goto LABEL_6;
    v20 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_219D1D000, v20, OS_LOG_TYPE_DEFAULT, "Unenrolling with altDSID...", v24, 2u);
    }
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 && objc_msgSend(v21, "dmc_isPrimaryAccount"))
    {
      v23 = (void *)objc_opt_new();
      objc_msgSend(v23, "signOutAllPrimaryAccounts");

    }
    objc_msgSend(v15, "dmc_removeMAIDRelatedAccountsWithAltDSID:asynchronous:", v12, 1);

    goto LABEL_5;
  }
  v16 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_219D1D000, v16, OS_LOG_TYPE_DEFAULT, "Unenrolling with persona identifier...", v26, 2u);
  }
  -[DMCUnenrollmentFlowController managedConfigurationHelper](self, "managedConfigurationHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "removeProfileAssociatedWithPersonaID:", v11);

  if ((v18 & 1) == 0)
  {
    v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_219D1D000, v19, OS_LOG_TYPE_ERROR, "No MDM profile found!", v25, 2u);
    }
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dmc_removeMAIDRelatedAccountsWithAltDSID:asynchronous:", v12, 1);
    goto LABEL_5;
  }
LABEL_6:
  -[DMCEnrollmentFlowControllerBase _pollNextStep](self, "_pollNextStep");

}

- (id)_nameForStep:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("PreflightUnenrollment");
  else
    return *(&off_24DBE3F90 + a3 - 1);
}

- (DMCUnenrollmentFlowPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (DMCEnrollmentFlowMCBridge)managedConfigurationHelper
{
  return self->_managedConfigurationHelper;
}

- (void)setManagedConfigurationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfigurationHelper, a3);
}

- (id)unenrollmentCompletionHandler
{
  return self->_unenrollmentCompletionHandler;
}

- (void)setUnenrollmentCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isAppleMAID
{
  return self->_isAppleMAID;
}

- (void)setIsAppleMAID:(BOOL)a3
{
  self->_isAppleMAID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong(&self->_unenrollmentCompletionHandler, 0);
  objc_storeStrong((id *)&self->_managedConfigurationHelper, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
