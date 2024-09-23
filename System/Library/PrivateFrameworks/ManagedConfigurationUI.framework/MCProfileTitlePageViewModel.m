@implementation MCProfileTitlePageViewModel

- (MCProfileTitlePageViewModel)initWithProfile:(id)a3 profileData:(id)a4
{
  id v7;
  id v8;
  MCProfileTitlePageViewModel *v9;
  MCProfileTitlePageViewModel *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[MCProfileTitlePageViewModel init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong((id *)&v10->_profileData, a4);
  }

  return v10;
}

- (MCProfileTitlePageViewModel)init
{
  MCProfileTitlePageViewModel *v2;
  MCProfileTitlePageViewModel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCProfileTitlePageViewModel;
  v2 = -[MCProfileTitlePageViewModel init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MCProfileTitlePageViewModel _setup](v2, "_setup");
  return v3;
}

- (void)_setup
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *serialQueue;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("MCUI_profile_installation_queue", 0);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v3;

  self->_installState = 1;
}

- (void)dealloc
{
  objc_super v3;

  -[MCProfileTitlePageViewModel terminateProfileInstallationFlow](self, "terminateProfileInstallationFlow");
  v3.receiver = self;
  v3.super_class = (Class)MCProfileTitlePageViewModel;
  -[MCProfileTitlePageViewModel dealloc](&v3, sel_dealloc);
}

- (DMCProfileViewModel)profileViewModel
{
  DMCProfileViewModel *profileViewModel;
  id v4;
  void *v5;
  DMCProfileViewModel *v6;
  DMCProfileViewModel *v7;

  profileViewModel = self->_profileViewModel;
  if (!profileViewModel)
  {
    v4 = objc_alloc(MEMORY[0x1E0D1BFD0]);
    -[MCProfileTitlePageViewModel profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (DMCProfileViewModel *)objc_msgSend(v4, "initWithProfile:managedPayloads:", v5, 0);
    v7 = self->_profileViewModel;
    self->_profileViewModel = v6;

    profileViewModel = self->_profileViewModel;
  }
  return profileViewModel;
}

- (NSString)accountIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D1C190];
  -[MCProfileTitlePageViewModel personaID](self, "personaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountIdentifierForAppleAccountWithPersonaID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setInstallState:(int)a3
{
  int installState;
  void (*v5)(uint64_t);
  uint64_t *p_block;
  uint64_t v7;
  uint64_t block;

  if (self->_installState != a3)
  {
    self->_installState = a3;
    NSLog(CFSTR("set state:%d"), a2, a3);
    installState = self->_installState;
    if ((installState - 4) < 6)
      goto LABEL_3;
    if (installState == 2)
    {
      v7 = MEMORY[0x1E0C809B0];
      v5 = __47__MCProfileTitlePageViewModel_setInstallState___block_invoke_2;
      p_block = &v7;
      goto LABEL_4;
    }
    if (installState == 1)
    {
LABEL_3:
      block = MEMORY[0x1E0C809B0];
      v5 = __47__MCProfileTitlePageViewModel_setInstallState___block_invoke;
      p_block = &block;
LABEL_4:
      p_block[1] = 3221225472;
      p_block[2] = (uint64_t)v5;
      p_block[3] = (uint64_t)&unk_1EA2B5BC0;
      p_block[4] = (uint64_t)self;
      dispatch_async(MEMORY[0x1E0C80D38], p_block);
    }
  }
}

void __47__MCProfileTitlePageViewModel_setInstallState___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

void __47__MCProfileTitlePageViewModel_setInstallState___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 0);

}

- (void)startProfileInstallationFlow
{
  NSObject *v3;
  _QWORD block[5];

  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke;
  block[3] = &unk_1EA2B5BC0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  if (v3)
  {
    NSLog(CFSTR("MCProfileTitlePageViewModel: passcode set. Will prompt for passcode"));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_2;
    block[3] = &unk_1EA2B5BC0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isInstallingProfile"))
  {
    NSLog(CFSTR("MCProfileTitlePageViewModel: profile installation has started. Returning..."));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsInstallingProfile:", 1);
    NSLog(CFSTR("MCProfileTitlePageViewModel: passcode not set. Will start installing profile"));
    objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 2);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "profileData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installProfileData:interactionDelegate:", v4, *(_QWORD *)(a1 + 32));

  }
}

void __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_3;
  v3[3] = &unk_1EA2B5F08;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "promptForPasscodeWithCompletionHandler:", v3);

}

void __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_4;
  block[3] = &unk_1EA2B5EE0;
  v10 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __59__MCProfileTitlePageViewModel_startProfileInstallationFlow__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPin:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setIsInstallingProfile:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 2);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "profileData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "installProfileData:interactionDelegate:", v2, *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsInstallingProfile:", 0);
  }
}

- (void)_continueInstallAfterPresentingWarnings
{
  NSObject *v2;

  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_0);

}

void __70__MCProfileTitlePageViewModel__continueInstallAfterPresentingWarnings__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "respondToWarningsContinueInstallation:", 1);

}

- (void)_installFinishedWithIdentifier:(id)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke;
  v8[3] = &unk_1EA2B5E68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setIsInstallingProfile:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_2;
  v3[3] = &unk_1EA2B5E68;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (objc_msgSend(*(id *)(a1 + 32), "_installErrorIsUserCancelledError:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v2;
    v3 = 0;
    v4 = 0;
    v5 = 0;
LABEL_3:
    v6 = 0;
LABEL_6:
    objc_msgSend(v2, "installationFinishedSuccessfully:shouldDismiss:shouldRedirect:errorToDisplay:", v3, v4, v5, v6);

    return;
  }
  v7 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v7, "setInstallState:", 1);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v2;
    v6 = *(_QWORD *)(a1 + 40);
    v3 = 0;
    v4 = 0;
    v5 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "installState") != 7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 9);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v2;
    v3 = 1;
    v4 = 1;
    v5 = 1;
    goto LABEL_3;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_3;
  v9[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(*(id *)(a1 + 32), "setPostRestoreTask:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_3(uint64_t a1)
{
  _QWORD v1[4];
  id v2;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_4;
  v1[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v2, &to);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
  objc_destroyWeak(&v2);
  objc_destroyWeak(&to);
}

void __68__MCProfileTitlePageViewModel__installFinishedWithIdentifier_error___block_invoke_4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setInstallState:", 9);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installationFinishedSuccessfully:shouldDismiss:shouldRedirect:errorToDisplay:", 1, 1, 1, 0);

}

- (void)terminateProfileInstallationFlow
{
  void *v3;
  void (**v4)(void);

  NSLog(CFSTR("terminateProfileInstallationFlow"), a2);
  -[MCProfileTitlePageViewModel cleanupTask](self, "cleanupTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCProfileTitlePageViewModel cleanupTask](self, "cleanupTask");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[MCProfileTitlePageViewModel setCleanupTask:](self, "setCleanupTask:", 0);
  }
}

- (void)terminateProfileInstallationFlowAndDeleteProfile
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[MCProfileTitlePageViewModel terminateProfileInstallationFlow](self, "terminateProfileInstallationFlow");
  NSLog(CFSTR("Will delete profile"));
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewModel profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x1E0D47220], "thisDeviceType");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__MCProfileTitlePageViewModel_terminateProfileInstallationFlowAndDeleteProfile__block_invoke;
  v7[3] = &unk_1EA2B5BC0;
  v7[4] = self;
  objc_msgSend(v3, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:completion:", v5, 1, v6, v7);

}

void __79__MCProfileTitlePageViewModel_terminateProfileInstallationFlowAndDeleteProfile__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MCProfileTitlePageViewModel_terminateProfileInstallationFlowAndDeleteProfile__block_invoke_2;
  block[3] = &unk_1EA2B5BC0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __79__MCProfileTitlePageViewModel_terminateProfileInstallationFlowAndDeleteProfile__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "installationFinishedSuccessfully:shouldDismiss:shouldRedirect:errorToDisplay:", 0, 1, 0, 0);

  }
}

- (void)_handleUserInputRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke;
  v7[3] = &unk_1EA2B5E68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 4);
  objc_msgSend(*(id *)(a1 + 32), "setCleanupTask:", &__block_literal_global_39);
  NSLog(CFSTR("MCProfileTitlePageViewModel: Will ask for user input"));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_3;
  v3[3] = &unk_1EA2B5E68;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

void __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cancelUserInputResponses");

}

void __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_4;
  v4[3] = &unk_1EA2B5F70;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "promptForUserInput:completionHandler:", v3, v4);

}

uint64_t __55__MCProfileTitlePageViewModel__handleUserInputRequest___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_respondToUserInputRequest:cancelled:", a2, a3);
}

- (void)_respondToUserInputRequest:(id)a3 cancelled:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MCProfileTitlePageViewModel__respondToUserInputRequest_cancelled___block_invoke;
  block[3] = &unk_1EA2B5EE0;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __68__MCProfileTitlePageViewModel__respondToUserInputRequest_cancelled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setCleanupTask:", 0);
  if (*(_BYTE *)(a1 + 48) || !objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 1);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelUserInputResponses");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 2);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "submitUserInputResponses:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_handleMAIDSignInRequestWithAccountID:(id)a3 personaID:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke;
  v15[3] = &unk_1EA2B5E90;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke(id *a1)
{
  uint64_t v2;
  _QWORD block[5];
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a1[4], "setPersonaID:", a1[5]);
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_2;
  v7[3] = &unk_1EA2B5BC0;
  v8 = a1[6];
  objc_msgSend(a1[4], "setCleanupTask:", v7);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_3;
  block[3] = &unk_1EA2B5E90;
  block[4] = a1[4];
  v4 = a1[7];
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondToMAIDAuthenticationRequest:error:isCancelled:", 0, 0, 1);
}

void __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_3(id *a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  objc_msgSend(a1[4], "setInstallState:", 5);
  v2 = a1[4];
  v3 = a1[5];
  objc_msgSend(v2, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_createAuthenticationContext:presentingViewController:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("MCProfileTitlePageViewModel: Will ask to authenticate MAID: %@"), a1[5]);
  objc_msgSend(a1[4], "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_4;
  v14[3] = &unk_1EA2B5F98;
  v8 = a1[6];
  v9 = a1[4];
  v15 = v8;
  v16 = v9;
  v17 = a1[7];
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_5;
  v10[3] = &unk_1EA2B5FE8;
  v10[4] = a1[4];
  v11 = a1[7];
  v12 = a1[5];
  v13 = a1[6];
  objc_msgSend(v6, "presentAuthenticationViewControllerWithContext:authenticationPreparationHandler:authenticationCompletionHandler:", v5, v14, v10);

}

void __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void (**v5)(void);

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(MEMORY[0x1E0D1C1F0], "performBlockUnderPersona:block:", *(_QWORD *)(a1 + 32), v5);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
    {
      NSLog(CFSTR("Failed to adopt persona with error:%@, terminating authentication"), v3);
      v5[2]();
      objc_msgSend(*(id *)(a1 + 40), "_respondToMAIDAuthenticationRequestIfNeeded:successful:error:isCancelled:", *(_QWORD *)(a1 + 48), 0, v4, 0);
    }

  }
  else
  {
    v5[2]();
  }

}

void __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_5(_QWORD *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = (void *)a1[4];
    v11 = a1[5];
    v12 = 0;
    v13 = 1;
LABEL_7:
    objc_msgSend(v10, "_respondToMAIDAuthenticationRequestIfNeeded:successful:error:isCancelled:", v11, 0, v12, v13);
    goto LABEL_8;
  }
  v14 = (void *)a1[4];
  if (!v7 || v8)
  {
    v11 = a1[5];
    v10 = (void *)a1[4];
    v12 = v9;
    v13 = 0;
    goto LABEL_7;
  }
  v16 = a1[6];
  v15 = a1[7];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_6;
  v17[3] = &unk_1EA2B5FC0;
  v17[4] = v14;
  v18 = (id)a1[5];
  objc_msgSend(v14, "_signInMAID:authenticationResult:personaID:completionHandler:", v16, v7, v15, v17);

LABEL_8:
}

uint64_t __90__MCProfileTitlePageViewModel__handleMAIDSignInRequestWithAccountID_personaID_connection___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_respondToMAIDAuthenticationRequestIfNeeded:successful:error:isCancelled:", *(_QWORD *)(a1 + 40), a2, a3, 0);
}

- (void)_respondToMAIDAuthenticationRequestIfNeeded:(id)a3 successful:(BOOL)a4 error:(id)a5 isCancelled:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a5;
  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__MCProfileTitlePageViewModel__respondToMAIDAuthenticationRequestIfNeeded_successful_error_isCancelled___block_invoke;
  v15[3] = &unk_1EA2B6010;
  v15[4] = self;
  v16 = v10;
  v18 = a4;
  v17 = v11;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, v15);

}

uint64_t __104__MCProfileTitlePageViewModel__respondToMAIDAuthenticationRequestIfNeeded_successful_error_isCancelled___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCleanupTask:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "isInstallingProfile");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 2);
    return objc_msgSend(*(id *)(a1 + 40), "respondToMAIDAuthenticationRequest:error:isCancelled:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 57));
  }
  return result;
}

- (void)_signInMAID:(id)a3 authenticationResult:(id)a4 personaID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[5];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[MCProfileTitlePageViewModel isInstallingProfile](self, "isInstallingProfile"))
  {
    NSLog(CFSTR("MCProfileTitlePageViewModel: Will ask to sign-in MAID: %@"), v10);
    v14 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__MCProfileTitlePageViewModel__signInMAID_authenticationResult_personaID_completionHandler___block_invoke;
    block[3] = &unk_1EA2B5BC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[MCProfileTitlePageViewModel setInstallState:](self, "setInstallState:", 6);
    v15 = (void *)objc_opt_new();
    v16 = *MEMORY[0x1E0C8F170];
    v22[0] = *MEMORY[0x1E0C8F030];
    v22[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCProfileTitlePageViewModel delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __92__MCProfileTitlePageViewModel__signInMAID_authenticationResult_personaID_completionHandler___block_invoke_2;
    v19[3] = &unk_1EA2B6038;
    v20 = v13;
    objc_msgSend(v15, "signInAccountsWithTypes:authenticationResult:personaID:canMakeAccountActive:baseViewController:completionHandler:", v17, v11, v12, 0, v18, v19);

  }
}

void __92__MCProfileTitlePageViewModel__signInMAID_authenticationResult_personaID_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentSpinnerViewController");

}

uint64_t __92__MCProfileTitlePageViewModel__signInMAID_authenticationResult_personaID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_createAuthenticationContext:(id)a3 presentingViewController:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D002F8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setIsEphemeral:", 0);
  objc_msgSend(v8, "setAuthenticationType:", 2);
  objc_msgSend(v8, "setPresentingViewController:", v6);

  objc_msgSend(v8, "setUsername:", v7);
  objc_msgSend(v8, "setIsUsernameEditable:", 0);
  v11 = CFSTR("shouldAllowManagedAppleIDOnly");
  v12[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppProvidedData:", v9);

  return v8;
}

- (void)profileConnectionDidRequestCurrentPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MCProfileTitlePageViewModel pin](self, "pin");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondToCurrentPasscodeRequestContinue:passcode:", 1, v5);

}

- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5
{
  -[MCProfileTitlePageViewModel _handleMAIDSignInRequestWithAccountID:personaID:connection:](self, "_handleMAIDSignInRequestWithAccountID:personaID:connection:", a4, a5, a3);
}

- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5
{
  -[MCProfileTitlePageViewModel _installFinishedWithIdentifier:error:](self, "_installFinishedWithIdentifier:error:", a4, a5);
}

- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4
{
  -[MCProfileTitlePageViewModel _handleUserInputRequest:](self, "_handleUserInputRequest:", a4);
}

- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MCProfileTitlePageViewModel_profileConnection_didFinishPreflightWithError___block_invoke;
  block[3] = &unk_1EA2B6060;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __77__MCProfileTitlePageViewModel_profileConnection_didFinishPreflightWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "informQuestionViewControllerOfPreflightResult:profileConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)profileConnection:(id)a3 didRequestManagedRestoreWithManagedAppleID:(id)a4 personaID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MCProfileTitlePageViewModel serialQueue](self, "serialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke;
  v15[3] = &unk_1EA2B5E90;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "setManagedAppleID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setInstallState:", 7);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BFE0]), "initWithPersonaIdentifier:delegate:", *(_QWORD *)(a1 + 48), 0);
  v3 = objc_alloc_init(MEMORY[0x1E0D1BFD8]);
  v4 = objc_alloc(MEMORY[0x1E0D1BFE8]);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_2;
  v10 = &unk_1EA2B6088;
  v11 = v5;
  v12 = *(id *)(a1 + 56);
  v6 = (void *)objc_msgSend(v4, "initWithSnapshotSource:interactionClient:deviceEnvironment:completion:", v2, v5, v3, &v7);
  objc_msgSend(v6, "startManagedRestoreWorkflow", v7, v8, v9, v10, v11);

}

void __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  _QWORD v12[2];
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    NSLog(CFSTR("MCProfileTitlePageViewModel: Restore failed with error: %@"), v3);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_3;
    v13[3] = &unk_1EA2B6060;
    v6 = &v14;
    v14 = *(id *)(a1 + 40);
    v7 = v4;
    v8 = *(_QWORD *)(a1 + 32);
    v15 = v7;
    v16 = v8;
    objc_msgSend(v5, "presentRestoreFailedAlertWithError:completionHandler:", v7, v13);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_4;
    block[3] = &unk_1EA2B5E68;
    v6 = (id *)v12;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v12[0] = v9;
    v12[1] = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "respondToManagedRestoreRequest:error:isCancelled:", 0, *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 48), "setInstallState:", 8);
  objc_msgSend(*(id *)(a1 + 48), "postRestoreTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "postRestoreTask");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 48), "setPostRestoreTask:", 0);
  }
}

void __102__MCProfileTitlePageViewModel_profileConnection_didRequestManagedRestoreWithManagedAppleID_personaID___block_invoke_4(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "respondToManagedRestoreRequest:error:isCancelled:", 1, 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "setInstallState:", 8);
  objc_msgSend(*(id *)(a1 + 40), "postRestoreTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "postRestoreTask");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 40), "setPostRestoreTask:", 0);
  }
}

- (void)doesUserWantToRestoreSnapshot:(id)a3 withConflictingApps:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[MCProfileTitlePageViewModel delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCProfileTitlePageViewModel managedAppleID](self, "managedAppleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__MCProfileTitlePageViewModel_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke;
  v15[3] = &unk_1EA2B60B0;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v11, "promptForManagedRestoreWithManagedAppleID:snapshot:conflictingApps:completionHandler:", v12, v10, v13, v15);

}

uint64_t __92__MCProfileTitlePageViewModel_doesUserWantToRestoreSnapshot_withConflictingApps_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (BOOL)_installErrorIsUserCancelledError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v3 = a3;
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *MEMORY[0x1E0D471B8];
  v6 = *MEMORY[0x1E0CB3388];
  do
  {
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v5))
    {
      v8 = objc_msgSend(v4, "code");

      if (v8 == 4004)
      {
        v11 = 1;
        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  while (v10);
  v11 = 0;
LABEL_10:

  return v11;
}

- (MCProfileTitlePageViewModelDelegate)delegate
{
  return (MCProfileTitlePageViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MCProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_profileData, a3);
}

- (BOOL)isInstallingProfile
{
  return self->_isInstallingProfile;
}

- (void)setIsInstallingProfile:(BOOL)a3
{
  self->_isInstallingProfile = a3;
}

- (void)setProfileViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_profileViewModel, a3);
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (int)installState
{
  return self->_installState;
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)cleanupTask
{
  return self->_cleanupTask;
}

- (void)setCleanupTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)postRestoreTask
{
  return self->_postRestoreTask;
}

- (void)setPostRestoreTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postRestoreTask, 0);
  objc_storeStrong(&self->_cleanupTask, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_profileViewModel, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
