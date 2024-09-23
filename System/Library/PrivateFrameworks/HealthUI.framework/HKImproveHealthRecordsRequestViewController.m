@implementation HKImproveHealthRecordsRequestViewController

- (id)improveHealthRecordsIdentifier
{
  return CFSTR("com.apple.onboarding.improvehealthrecords");
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
  double v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)HKImproveHealthRecordsRequestViewController;
  -[OBBaseWelcomeController viewDidLoad](&v33, sel_viewDidLoad);
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  self->_baseAutomationIdentifier = (NSString *)CFSTR("UIA.Health.Onboarding.ImproveHealthRecords");

  v4 = self->_baseAutomationIdentifier;
  -[HKImproveHealthRecordsRequestViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

  v6 = (void *)MEMORY[0x1E0D65148];
  -[HKImproveHealthRecordsRequestViewController improveHealthRecordsIdentifier](self, "improveHealthRecordsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleWithIdentifier:", v7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D651A0], "accessoryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v32, "privacyFlow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("\n%@"), v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:forState:", v31, 0);
  objc_msgSend(v8, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__showDataCollectionAdditionalInfo, 64);
  v36[0] = self->_baseAutomationIdentifier;
  v36[1] = CFSTR("LearnMoreButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", v14);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.health.HealthRecordsUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("IMPROVE_HEALTH_RECORDS_BODY"), &stru_1E9C4C428, CFSTR("HealthRecordsUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTextWelcomeController addSectionWithHeader:content:accessoryButton:](self, "addSectionWithHeader:content:accessoryButton:", &stru_1E9C4C428, v16, v8);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__enableDataCollection, 64);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.health.HealthRecordsUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("IMPROVE_HEALTH_RECORDS_ALLOW"), &stru_1E9C4C428, CFSTR("HealthRecordsUI-Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:forState:", v19, 0);

  v35[0] = self->_baseAutomationIdentifier;
  v35[1] = CFSTR("EnableButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", v21);

  -[HKImproveHealthRecordsRequestViewController buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButton:", v17);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__disableDataCollection, 64);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.health.HealthRecordsUI"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("IMPROVE_HEALTH_RECORDS_DO_NOT_ALLOW"), &stru_1E9C4C428, CFSTR("HealthRecordsUI-Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:forState:", v25, 0);

  v34[0] = self->_baseAutomationIdentifier;
  v34[1] = CFSTR("DisableButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityIdentifier:", v27);

  -[HKImproveHealthRecordsRequestViewController buttonTray](self, "buttonTray");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addButton:", v23);

  -[HKImproveHealthRecordsRequestViewController headerView](self, "headerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = 1045220557;
  objc_msgSend(v29, "setTitleHyphenationFactor:", v30);

}

+ (void)presentInViewController:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  HKImproveHealthRecordsRequestViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  HKImproveHealthRecordsRequestViewController *v11;

  v5 = a4;
  v6 = a3;
  v7 = [HKImproveHealthRecordsRequestViewController alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.health.HealthRecordsUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("IMPROVE_HEALTH_RECORDS_TITLE"), &stru_1E9C4C428, CFSTR("HealthRecordsUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[OBTextWelcomeController initWithTitle:](v7, "initWithTitle:", v9);

  -[HKImproveHealthRecordsRequestViewController setCompletion:](v11, "setCompletion:", v5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v11);
  objc_msgSend(v10, "setModalInPresentation:", 1);
  objc_msgSend(v10, "setModalPresentationStyle:", 2);
  objc_msgSend(v6, "presentViewController:animated:completion:", v10, 1, 0);

}

- (BOOL)shouldInlineButtonTray
{
  return 0;
}

+ (void)needsRequestedPermissionWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  id v6;
  void *v7;
  void (**v8)(id, _QWORD);
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (void (**)(id, _QWORD))a3;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode"))
    v4[2](v4, 0);
  v5 = objc_alloc(MEMORY[0x1E0CB6768]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB6780]);
  v7 = (void *)objc_msgSend(v5, "initWithHealthStore:", v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__HKImproveHealthRecordsRequestViewController_needsRequestedPermissionWithCompletion___block_invoke;
  v9[3] = &unk_1E9C3FBB8;
  v10 = v4;
  v11 = a1;
  v8 = v4;
  objc_msgSend(v7, "fetchShouldPromptForImproveHealthRecordsDataSubmissionWithCompletion:", v9);

}

void __86__HKImproveHealthRecordsRequestViewController_needsRequestedPermissionWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1D7813000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] IHR should prompt: %@", (uint8_t *)&v8, 0x16u);
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "BOOLValue"));
  }

}

- (void)_enableDataCollection
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  HKImproveHealthRecordsRequestViewController *v7;
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
  v4 = *MEMORY[0x1E0D28E40];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__HKImproveHealthRecordsRequestViewController__enableDataCollection__block_invoke;
  v5[3] = &unk_1E9C3FB40;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D28E50], "setUserDidAccept:currentAgreement:completion:", 1, v4, v5);
}

void __68__HKImproveHealthRecordsRequestViewController__enableDataCollection__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HKImproveHealthRecordsRequestViewController__enableDataCollection__block_invoke_2;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __68__HKImproveHealthRecordsRequestViewController__enableDataCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__HKImproveHealthRecordsRequestViewController__enableDataCollection__block_invoke_3;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

void __68__HKImproveHealthRecordsRequestViewController__enableDataCollection__block_invoke_3(uint64_t a1)
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
  HKImproveHealthRecordsRequestViewController *v7;
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
  v4 = *MEMORY[0x1E0D28E40];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__HKImproveHealthRecordsRequestViewController__disableDataCollection__block_invoke;
  v5[3] = &unk_1E9C3FB40;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D28E50], "setUserDidAccept:currentAgreement:completion:", 0, v4, v5);
}

void __69__HKImproveHealthRecordsRequestViewController__disableDataCollection__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HKImproveHealthRecordsRequestViewController__disableDataCollection__block_invoke_2;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __69__HKImproveHealthRecordsRequestViewController__disableDataCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__HKImproveHealthRecordsRequestViewController__disableDataCollection__block_invoke_3;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

void __69__HKImproveHealthRecordsRequestViewController__disableDataCollection__block_invoke_3(uint64_t a1)
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
  HKImproveHealthRecordsRequestViewController *v9;
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
  -[HKImproveHealthRecordsRequestViewController improveHealthRecordsIdentifier](self, "improveHealthRecordsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenterForPrivacySplashWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKImproveHealthRecordsRequestViewController navigationController](self, "navigationController");
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
