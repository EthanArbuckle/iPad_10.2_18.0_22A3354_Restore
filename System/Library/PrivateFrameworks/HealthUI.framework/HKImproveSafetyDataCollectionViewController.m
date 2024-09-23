@implementation HKImproveSafetyDataCollectionViewController

+ (void)presentInViewController:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HKImproveSafetyDataCollectionViewController *v11;
  void *v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0D65148];
  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "improveSafetyPrivacyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleWithIdentifier:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "privacyFlow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedShortTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[OBTextWelcomeController initWithTitle:]([HKImproveSafetyDataCollectionViewController alloc], "initWithTitle:", v10);
  -[HKImproveSafetyDataCollectionViewController setCompletion:](v11, "setCompletion:", v6);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v11);
  objc_msgSend(v12, "setModalInPresentation:", 1);
  objc_msgSend(v7, "presentViewController:animated:completion:", v12, 1, 0);

}

+ (BOOL)needsRequestedPermission
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  if ((objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isDiagnosticSubmissionAllowed"),
        v2,
        !v3))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasSafetyDataSubmissionAllowedBeenSet") ^ 1;

  }
  return v5;
}

- (BOOL)shouldInlineButtonTray
{
  return 0;
}

+ (id)improveSafetyPrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.improveSafetyFeatures");
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  NSString *baseAutomationIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKImproveSafetyDataCollectionViewController;
  -[OBBaseWelcomeController viewDidLoad](&v6, sel_viewDidLoad);
  -[HKImproveSafetyDataCollectionViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1045220557;
  objc_msgSend(v3, "setTitleHyphenationFactor:", v4);

  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  self->_baseAutomationIdentifier = (NSString *)CFSTR("UIA.Health.Onboarding.ImproveSafety");

  -[HKImproveSafetyDataCollectionViewController setUpContent](self, "setUpContent");
  -[HKImproveSafetyDataCollectionViewController setUpButtons](self, "setUpButtons");
}

- (void)setUpContent
{
  NSString *baseAutomationIdentifier;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  -[HKImproveSafetyDataCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", baseAutomationIdentifier);

  v5 = (void *)MEMORY[0x1E0D65148];
  objc_msgSend((id)objc_opt_class(), "improveSafetyPrivacyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D651A0], "accessoryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "privacyFlow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("\n%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:forState:", v12, 0);
  objc_msgSend(v8, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__showDataCollectionAdditionalInfo, 64);
  v20[0] = self->_baseAutomationIdentifier;
  v20[1] = CFSTR("LearnMoreButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v15);

  -[HKImproveSafetyDataCollectionViewController localizedStringWithKey:](self, "localizedStringWithKey:", CFSTR("IMPROVE_SAFETY_DESCRIPTION"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:accessoryButton:](self, "addSectionWithHeader:content:accessoryButton:", &stru_1E9C4C428, v16, v8);

  -[HKImproveSafetyDataCollectionViewController localizedStringWithKey:](self, "localizedStringWithKey:", CFSTR("IMPROVE_SAFETY_EXAMPLES_HEADER_TITLE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", v17, &stru_1E9C4C428);

  -[HKImproveSafetyDataCollectionViewController localizedStringWithKey:](self, "localizedStringWithKey:", CFSTR("IMPROVE_SAFETY_EXAMPLES_BULLET_1"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v18, 0);

  -[HKImproveSafetyDataCollectionViewController localizedStringWithKey:](self, "localizedStringWithKey:", CFSTR("IMPROVE_SAFETY_EXAMPLES_BULLET_2"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v19, 0);

}

- (void)setUpButtons
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
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__enableDataCollection, 64);
  -[HKImproveSafetyDataCollectionViewController localizedStringWithKey:](self, "localizedStringWithKey:", CFSTR("IMPROVE_SAFETY_ENABLE_BUTTON_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v4, 0);

  v14[0] = self->_baseAutomationIdentifier;
  v14[1] = CFSTR("EnableButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v6);

  -[HKImproveSafetyDataCollectionViewController buttonTray](self, "buttonTray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addButton:", v3);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__disableDataCollection, 64);
  -[HKImproveSafetyDataCollectionViewController localizedStringWithKey:](self, "localizedStringWithKey:", CFSTR("IMPROVE_SAFETY_DISABLE_BUTTON_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  v13[0] = self->_baseAutomationIdentifier;
  v13[1] = CFSTR("DisableButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v11);

  -[HKImproveSafetyDataCollectionViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v8);

}

- (void)_enableDataCollection
{
  -[HKImproveSafetyDataCollectionViewController _setDataCollectionToNewValue:](self, "_setDataCollectionToNewValue:", 1);
}

- (void)_disableDataCollection
{
  -[HKImproveSafetyDataCollectionViewController _setDataCollectionToNewValue:](self, "_setDataCollectionToNewValue:", 0);
}

- (void)_setDataCollectionToNewValue:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  HKImproveSafetyDataCollectionViewController *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_1D7813000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set Improve Safety Data Collection to %d", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSafetyDataSubmissionAllowed:", v3);

  -[HKImproveSafetyDataCollectionViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HKImproveSafetyDataCollectionViewController__setDataCollectionToNewValue___block_invoke;
  v8[3] = &unk_1E9C429F0;
  v8[4] = self;
  v9 = v3;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

}

void __76__HKImproveSafetyDataCollectionViewController__setDataCollectionToNewValue___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_showDataCollectionAdditionalInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  HKImproveSafetyDataCollectionViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting Privacy view controller", (uint8_t *)&v8, 0xCu);
  }
  v4 = (void *)MEMORY[0x1E0D65198];
  objc_msgSend((id)objc_opt_class(), "improveSafetyPrivacyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenterForPrivacySplashWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKImproveSafetyDataCollectionViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentInNavigationStack:", v7);

}

+ (id)localizedStringWithKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedStringWithKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "localizedStringWithKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_baseAutomationIdentifier, 0);
}

@end
