@implementation HKFitnessDiagnosticsRequestViewController

- (id)improveHealthPrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.improvehealth");
}

- (void)viewDidLoad
{
  NSString *baseAutomationIdentifier;
  NSString *v4;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)HKFitnessDiagnosticsRequestViewController;
  -[OBBaseWelcomeController viewDidLoad](&v49, sel_viewDidLoad);
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  self->_baseAutomationIdentifier = (NSString *)CFSTR("UIA.Health.Onboarding.ImproveHealthAndActivity");

  v4 = self->_baseAutomationIdentifier;
  -[HKFitnessDiagnosticsRequestViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

  v6 = (void *)MEMORY[0x1E0D65148];
  -[HKFitnessDiagnosticsRequestViewController improveHealthPrivacyIdentifier](self, "improveHealthPrivacyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleWithIdentifier:", v7);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D651A0], "accessoryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v48, "privacyFlow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("\n%@"), v11);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:forState:", v47, 0);
  objc_msgSend(v8, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__showDataCollectionAdditionalInfo, 64);
  v52[0] = self->_baseAutomationIdentifier;
  v52[1] = CFSTR("LearnMoreButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v14);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_MESSAGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:accessoryButton:](self, "addSectionWithHeader:content:accessoryButton:", &stru_1E9C4C428, v16, v8);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_BODY_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:](self, "addSectionWithHeader:content:", v18, &stru_1E9C4C428);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_BODY_BULLET_1"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v20, 0);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_BODY_BULLET_2"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v22, 0);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_BODY_BULLET_3"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v24, 0);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_BODY_BULLET_4"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v26, 0);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_BODY_BULLET_5"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v28, 0);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_BODY_BULLET_6"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v30, 0);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_BODY_BULLET_7"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addBulletedListItemWithTitle:description:](self, "addBulletedListItemWithTitle:description:", v32, 0);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel__enableDataCollection, 64);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_ENABLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTitle:forState:", v35, 0);

  v51[0] = self->_baseAutomationIdentifier;
  v51[1] = CFSTR("EnableButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAccessibilityIdentifier:", v37);

  -[HKFitnessDiagnosticsRequestViewController buttonTray](self, "buttonTray");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addButton:", v33);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addTarget:action:forControlEvents:", self, sel__disableDataCollection, 64);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_DISABLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTitle:forState:", v41, 0);

  v50[0] = self->_baseAutomationIdentifier;
  v50[1] = CFSTR("DisableButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAccessibilityIdentifier:", v43);

  -[HKFitnessDiagnosticsRequestViewController buttonTray](self, "buttonTray");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addButton:", v39);

  -[HKFitnessDiagnosticsRequestViewController headerView](self, "headerView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v46) = 1045220557;
  objc_msgSend(v45, "setTitleHyphenationFactor:", v46);

}

+ (void)presentInViewController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  HKFitnessDiagnosticsRequestViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  HKFitnessDiagnosticsRequestViewController *v11;

  v5 = a4;
  v6 = a3;
  v7 = [HKFitnessDiagnosticsRequestViewController alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[OBTextWelcomeController initWithTitle:](v7, "initWithTitle:", v9);

  -[HKFitnessDiagnosticsRequestViewController setCompletion:](v11, "setCompletion:", v5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v11);
  objc_msgSend(v10, "setModalInPresentation:", 1);
  objc_msgSend(v10, "setModalPresentationStyle:", 2);
  objc_msgSend(v6, "presentViewController:animated:completion:", v10, 1, 0);

}

- (BOOL)shouldInlineButtonTray
{
  return 0;
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
    v5 = objc_msgSend(v4, "hasHealthDataSubmissionAllowedBeenSet") ^ 1;

  }
  return v5;
}

- (void)_enableDataCollection
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  HKFitnessDiagnosticsRequestViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enabled Data Collection", buf, 0xCu);
  }
  v4 = *MEMORY[0x1E0D28E38];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke;
  v5[3] = &unk_1E9C3FB40;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D28E50], "setUserDidAccept:currentAgreement:completion:", 1, v4, v5);
}

void __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke_2;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke_3;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

void __66__HKFitnessDiagnosticsRequestViewController__enableDataCollection__block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 1);

  }
}

- (void)_disableDataCollection
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  HKFitnessDiagnosticsRequestViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Disabled Data Collection", buf, 0xCu);
  }
  v4 = *MEMORY[0x1E0D28E38];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke;
  v5[3] = &unk_1E9C3FB40;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D28E50], "setUserDidAccept:currentAgreement:completion:", 0, v4, v5);
}

void __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke_2;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke_3;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

void __67__HKFitnessDiagnosticsRequestViewController__disableDataCollection__block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

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
  HKFitnessDiagnosticsRequestViewController *v9;
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
  -[HKFitnessDiagnosticsRequestViewController improveHealthPrivacyIdentifier](self, "improveHealthPrivacyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenterForPrivacySplashWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKFitnessDiagnosticsRequestViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentInNavigationStack:", v7);

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
