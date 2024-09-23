@implementation HUUtilityOnboardingTAFViewController

- (HUUtilityOnboardingTAFViewController)initWithContext:(id)a3
{
  id v4;
  HUUtilityOnboardingTAFItemManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUUtilityOnboardingTAFItemManager *v10;
  NSObject *v11;
  HUUtilityOnboardingTAFTableViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  HUUtilityOnboardingTAFViewController *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  HUUtilityOnboardingTAFViewController *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUUtilityOnboardingTAFItemManager alloc];
  objc_msgSend(v4, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUUtilityOnboardingTAFItemManager initWithDelegate:fields:sections:](v5, "initWithDelegate:fields:sections:", self, v7, v9);

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2080;
    v23 = "-[HUUtilityOnboardingTAFViewController initWithContext:]";
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%s created item manager", buf, 0x16u);
  }

  v12 = -[HUUtilityOnboardingTAFTableViewController initWithContext:itemManager:tableViewStyle:]([HUUtilityOnboardingTAFTableViewController alloc], "initWithContext:itemManager:tableViewStyle:", v4, v10, 1);
  -[HUUtilityOnboardingTAFViewController setTableViewController:](self, "setTableViewController:", v12);

  _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityOnboardingAccountLookup_Title"), CFSTR("HUUtilityOnboardingAccountLookup_Title"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityDiscoveryTAF_Detail"), CFSTR("HUUtilityDiscoveryTAF_Detail"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingTAFViewController tableViewController](self, "tableViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)HUUtilityOnboardingTAFViewController;
  v16 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v19, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v13, v14, 0, 2, v15);

  -[HUUtilityOnboardingTAFViewController setContext:](v16, "setContext:", v4);
  -[HUUtilityOnboardingTAFViewController tableViewController](v16, "tableViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", v16);

  return v16;
}

- (BOOL)needsToWaitForPreload
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char isKindOfClass;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  HUUtilityOnboardingTAFViewController *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)HUUtilityOnboardingTAFViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v25, sel_viewDidLoad);
  -[HUUtilityOnboardingTAFViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v4, &unk_1E7043180);

  -[HUUtilityOnboardingTAFViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingTAFViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateIconWithHeaderView:axID:", v6, CFSTR("Home.OnboardingView.Utility.TAF.Icon"));

  -[HUUtilityOnboardingTAFViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", self);

  if (v9)
  {
    -[HUUtilityOnboardingTAFViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v9 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityOnboardingTAFViewController setPresentingVC:](self, "setPresentingVC:", v12);

  }
  -[HUUtilityOnboardingTAFViewController _updateRightBarButton](self, "_updateRightBarButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UtilityOnboardingContext allRequiredFieldsComplete](self->_context, "allRequiredFieldsComplete");
  objc_msgSend(v13, "setEnabled:", v14);
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = self;
    v28 = 2080;
    v29 = "-[HUUtilityOnboardingTAFViewController viewDidLoad]";
    v30 = 1024;
    v31 = v14;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%s ENABLING BUTTON --> %{BOOL}d", buf, 0x1Cu);
  }

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRightBarButtonItem:", v13);

  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = self;
    v28 = 2080;
    v29 = "-[HUUtilityOnboardingTAFViewController viewDidLoad]";
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%s: presented: HUUtilityOnboardingTAFViewController", buf, 0x16u);
  }

  -[HUUtilityOnboardingTAFViewController presentingVC](self, "presentingVC");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    -[HUUtilityOnboardingTAFViewController presentingVC](self, "presentingVC");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v22 = objc_opt_isKindOfClass();

    if ((v22 & 1) != 0)
      v20 = 7;
    else
      v20 = 2;
  }
  -[HUUtilityOnboardingTAFViewController context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "utilityID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeEnergyAnalyticsHelper sendUtilityAccountLookupViewEventWithUtilityID:presentingVC:](HUHomeEnergyAnalyticsHelper, "sendUtilityAccountLookupViewEventWithUtilityID:presentingVC:", v24, v20);

}

- (id)_updateRightBarButton
{
  void *v3;
  char isKindOfClass;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HUUtilityOnboardingTAFViewController presentingVC](self, "presentingVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = objc_alloc(MEMORY[0x1E0CEA380]);
  if ((isKindOfClass & 1) != 0)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__doneAccountDetails_);

    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.TAF.DoneButton"));
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 0);

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v10, 2, self, sel__continueTAFWithFutures_);

    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.TAF.ContinueButton"));
    objc_msgSend(v7, "setHidden:", 0);
  }
  return v7;
}

- (void)_presentErrorAlert
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];

  v4 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityOnboardingTAF_EmailAlert_Title"), CFSTR("HUUtilityOnboardingTAF_EmailAlert_Title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityOnboardingTAF_EmailAlert_Detail"), CFSTR("HUUtilityOnboardingTAF_EmailAlert_Detail"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HUUtilityOnboardingTAFViewController__presentErrorAlert__block_invoke;
  v11[3] = &unk_1E6F59FC0;
  v11[4] = self;
  v11[5] = a2;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  -[HUUtilityOnboardingTAFViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

void __58__HUUtilityOnboardingTAFViewController__presentErrorAlert__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped alert button", (uint8_t *)&v5, 0x16u);

  }
}

- (void)_continueTAFWithFutures:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[5];
  _BYTE buf[24];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    v26 = (uint64_t)v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped %@ button", buf, 0x20u);

  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityOnboardingTAFViewController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tafResponses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v26 = (uint64_t)v11;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "*** %@:%@ Retrieving TAF RESPONSES %@", buf, 0x20u);

  }
  -[HUUtilityOnboardingTAFViewController context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tafResponses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TAFFieldName email](_TtC6HomeUI12TAFFieldName, "email");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    && +[HUHomeEnergyManagerHelper regexValidationWithPattern:text:](HUHomeEnergyManagerHelper, "regexValidationWithPattern:text:", CFSTR("^$|^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"), v15))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v26 = 7;
    -[HUUtilityOnboardingTAFViewController _showSpinner](self, "_showSpinner");
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke;
    v24[3] = &unk_1E6F4C660;
    v24[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_3;
    v23[3] = &unk_1E6F4C150;
    v23[4] = self;
    v23[5] = a2;
    v20 = (id)objc_msgSend(v19, "addSuccessBlock:", v23);
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_105;
    v22[3] = &unk_1E6F59FE8;
    v22[4] = self;
    v22[5] = buf;
    v21 = (id)objc_msgSend(v19, "addFailureBlock:", v22);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[HUUtilityOnboardingTAFViewController _presentErrorAlert](self, "_presentErrorAlert");
  }

}

void __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_2;
  v6[3] = &unk_1E6F4E2D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "verifyAddressAndSubmitTAFWithCompletionHandler:", v6);

}

uint64_t __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

void __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E08];
  v18 = CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput");
  v19[0] = &unk_1E7041458;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@ Finished %@ with results  %@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(*(id *)(a1 + 32), "_updateRightBarButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidesBackButton:", 0);

}

void __64__HUUtilityOnboardingTAFViewController__continueTAFWithFutures___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Address Verification OR TAF Future failed (%@)", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput");
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("HUUtilityDiscoveryOnboardingKey_Error");
  v14[0] = v8;
  v14[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didFinishWithConfigurationResults:", v7, v9);

  objc_msgSend(*(id *)(a1 + 32), "_updateRightBarButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidesBackButton:", 0);

}

- (void)_doneAccountDetails:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E7041470, CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput"));
  -[HUUtilityOnboardingTAFViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController:didFinishWithConfigurationResults:", self, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  HUUtilityOnboardingTAFViewController *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HUUtilityOnboardingTAFViewController;
  -[HUUtilityOnboardingTAFViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (-[HUUtilityOnboardingTAFViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = self;
      v9 = 2080;
      v10 = "-[HUUtilityOnboardingTAFViewController viewWillDisappear:]";
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped BACK button", buf, 0x16u);
    }

    -[HUUtilityOnboardingTAFViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerDidGoBack:", self);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;

  -[HUUtilityOnboardingTAFViewController focusedTextField](self, "focusedTextField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUUtilityOnboardingTAFViewController focusedTextField](self, "focusedTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

    -[HUUtilityOnboardingTAFViewController setFocusedTextField:](self, "setFocusedTextField:", 0);
  }
}

- (void)didCompleteAllFields:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)selectedTextField:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  HUUtilityOnboardingTAFViewController *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412802;
    v7 = self;
    v8 = 2080;
    v9 = "-[HUUtilityOnboardingTAFViewController selectedTextField:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s Selected text field %@", (uint8_t *)&v6, 0x20u);
  }

  -[HUUtilityOnboardingTAFViewController setFocusedTextField:](self, "setFocusedTextField:", v4);
}

- (void)_showSpinner
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v6);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:", 1);

  objc_msgSend(v6, "startAnimating");
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (HUUtilityOnboardingTAFTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (NSArray)otpFactors
{
  return self->_otpFactors;
}

- (void)setOtpFactors:(id)a3
{
  objc_storeStrong((id *)&self->_otpFactors, a3);
}

- (UIViewController)presentingVC
{
  return self->_presentingVC;
}

- (void)setPresentingVC:(id)a3
{
  objc_storeStrong((id *)&self->_presentingVC, a3);
}

- (UITextField)focusedTextField
{
  return self->_focusedTextField;
}

- (void)setFocusedTextField:(id)a3
{
  objc_storeStrong((id *)&self->_focusedTextField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedTextField, 0);
  objc_storeStrong((id *)&self->_presentingVC, 0);
  objc_storeStrong((id *)&self->_otpFactors, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
