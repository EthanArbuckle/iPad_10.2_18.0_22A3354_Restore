@implementation CKBusinessOnboardingController

+ (BOOL)shouldShowBusinessOnboarding
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("BusinessChatPrivacyPageDisplayed"));

  if (v3 > 2)
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat");
}

+ (void)checkForBusinessAlertsIDSIssues:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D342E8]);
    v5 = (void *)objc_msgSend(v4, "initWithService:queue:", *MEMORY[0x1E0D34248], MEMORY[0x1E0C80D38]);
    objc_msgSend(MEMORY[0x1E0D342D8], "optionsWithFeatureID:", CFSTR("bia-opt-out"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__CKBusinessOnboardingController_checkForBusinessAlertsIDSIssues___block_invoke;
    v7[3] = &unk_1E2750070;
    v8 = v3;
    objc_msgSend(v5, "retrieveFeatureToggleStateForOptions:completion:", v6, v7);

  }
}

void __66__CKBusinessOnboardingController_checkForBusinessAlertsIDSIssues___block_invoke(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "success") && (objc_msgSend(v4, "state") == 3 || !objc_msgSend(v4, "state")))
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  else
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  v3();

}

- (CKBusinessOnboardingController)initWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  CKBusinessOnboardingController *v12;
  CKBusinessOnboardingController *v13;
  void *v14;
  int v15;
  void *v17;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKBusinessOnboardingController.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isBIAEnabled");

  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v10 = &stru_1E276D870;
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BUSINESS_INITIATED_ALERTS"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MESSAGES_FOR_BUSINESS"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BUSINESS_DESCRIPTION_PLACEHOLDER"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v18.receiver = self;
  v18.super_class = (Class)CKBusinessOnboardingController;
  v12 = -[CKBusinessOnboardingController initWithTitle:detailText:icon:](&v18, sel_initWithTitle_detailText_icon_, v11, v10, 0);
  v13 = v12;
  if (v12)
  {
    -[CKBusinessOnboardingController setCompletionHandler:](v12, "setCompletionHandler:", v5);
    -[CKBusinessOnboardingController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 2);
    -[CKBusinessOnboardingController setModalInPresentation:](v13, "setModalInPresentation:", 1);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isBIAEnabled");

    if (v15)
      -[CKBusinessOnboardingController _addBusinessInitiatedBullets](v13, "_addBusinessInitiatedBullets");
  }

  return v13;
}

- (void)_addBusinessInitiatedBullets
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
  void *v12;
  void *v13;
  id v14;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BUSINESS_INITIATED_WELCOME_TRUST_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BUSINESS_INITIATED_WELCOME_TRUST_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessOnboardingController addBulletedListItemWithTitle:description:symbolName:](self, "addBulletedListItemWithTitle:description:symbolName:", v4, v6, CFSTR("checkmark.seal.fill"));

  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BUSINESS_INITIATED_WELCOME_OPTOUT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BUSINESS_INITIATED_WELCOME_OPTOUT_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessOnboardingController addBulletedListItemWithTitle:description:symbolName:](self, "addBulletedListItemWithTitle:description:symbolName:", v8, v10, CFSTR("rectangle.portrait.and.arrow.right.fill"));

  CKFrameworkBundle();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BUSINESS_INITIATED_WELCOME_CHAT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("BUSINESS_INITIATED_WELCOME_CHAT_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessOnboardingController addBulletedListItemWithTitle:description:symbolName:](self, "addBulletedListItemWithTitle:description:symbolName:", v11, v13, CFSTR("message.and.message.fill"));

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKBusinessOnboardingController;
  -[OBBaseWelcomeController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 64);
  -[CKBusinessOnboardingController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButton:", v3);

  -[CKBusinessOnboardingController buttonTray](self, "buttonTray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrivacyLinkForBundles:", &unk_1E286F508);

}

- (void)setupNotNowWithActionHandler:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id notNowActionHandler;
  id aBlock;

  aBlock = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBIAEnabled");

  if (v5)
  {
    if (!self->_notNowActionHandler)
    {
      objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BUSINESS_INITIATED_WELCOME_OPTOUT_BUTTON"), &stru_1E276D870, CFSTR("ChatKit"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:forState:", v8, 0);

      objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_notNowButtonTapped_, 64);
      -[CKBusinessOnboardingController buttonTray](self, "buttonTray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addButton:", v6);

    }
    v10 = _Block_copy(aBlock);
    notNowActionHandler = self->_notNowActionHandler;
    self->_notNowActionHandler = v10;

  }
}

- (void)continueButtonTapped:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteger:forKey:", 3, CFSTR("BusinessChatPrivacyPageDisplayed"));

  location = 0;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CKBusinessOnboardingController_continueButtonTapped___block_invoke;
  v6[3] = &unk_1E274B548;
  objc_copyWeak(&v7, &location);
  -[CKBusinessOnboardingController _setBusinessInitiatedFeatureStateOn:completion:](self, "_setBusinessInitiatedFeatureStateOn:completion:", 1, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __55__CKBusinessOnboardingController_continueButtonTapped___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void (**v5)(void);
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "completionHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "setCompletionHandler:", 0);

  }
}

- (void)notNowButtonTapped:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CKBusinessOnboardingController_notNowButtonTapped___block_invoke;
  v5[3] = &unk_1E274B548;
  objc_copyWeak(&v6, &location);
  -[CKBusinessOnboardingController _setBusinessInitiatedFeatureStateOn:completion:](self, "_setBusinessInitiatedFeatureStateOn:completion:", 0, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __53__CKBusinessOnboardingController_notNowButtonTapped___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void (**v5)(void);
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notNowActionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "notNowActionHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "setNotNowActionHandler:", 0);

  }
}

- (void)_setBusinessInitiatedFeatureStateOn:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0D342E8]);
  v7 = (void *)objc_msgSend(v6, "initWithService:queue:", *MEMORY[0x1E0D34248], MEMORY[0x1E0C80D38]);
  if (v4)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(MEMORY[0x1E0D342E0], "optionsWithFeatureID:state:", CFSTR("bia-opt-out"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__CKBusinessOnboardingController__setBusinessInitiatedFeatureStateOn_completion___block_invoke;
  v11[3] = &unk_1E2750098;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v7, "updateFeatureToggleStateWithOptions:completion:", v9, v11);

}

uint64_t __81__CKBusinessOnboardingController__setBusinessInitiatedFeatureStateOn_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (id)notNowActionHandler
{
  return self->_notNowActionHandler;
}

- (void)setNotNowActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notNowActionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
