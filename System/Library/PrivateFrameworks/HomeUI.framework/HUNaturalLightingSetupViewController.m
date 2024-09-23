@implementation HUNaturalLightingSetupViewController

- (HUNaturalLightingSetupViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HUNaturalLightingSetupViewController *v9;
  HUNaturalLightingSetupViewController *v10;
  objc_super v12;

  v5 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUNaturalLigthingSetup_Title"), CFSTR("HUNaturalLigthingSetup_Title"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUNaturalLightingSetup_Detail"), CFSTR("HUNaturalLightingSetup_Detail"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUNaturalLightingSetupViewController moduleControllerInHome:](HUNaturalLightingSetupViewController, "moduleControllerInHome:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HUNaturalLightingSetupViewController;
  v9 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v12, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v6, v7, 0, 2, v8);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_home, a3);

  return v10;
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hu_preloadContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HUNaturalLightingSetupViewController_hu_preloadContent__block_invoke;
  v7[3] = &unk_1E6F595A8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __57__HUNaturalLightingSetupViewController_hu_preloadContent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "itemTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemModules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_179);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setModule:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v6);

  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

uint64_t __57__HUNaturalLightingSetupViewController_hu_preloadContent__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)naturalLanguageSetupModule:(id)a3 didUpdateSelectedItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__HUNaturalLightingSetupViewController_naturalLanguageSetupModule_didUpdateSelectedItems___block_invoke;
  v10[3] = &unk_1E6F50A68;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "performBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __90__HUNaturalLightingSetupViewController_naturalLanguageSetupModule_didUpdateSelectedItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "itemTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allDisplayedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateButtonWithNumberOfLightsSelected:", objc_msgSend(v5, "count"));
}

- (void)_activateNaturalLighting:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  HUNaturalLightingSetupViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  HUNaturalLightingSetupViewController *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  HUNaturalLightingSetupViewController *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (HUNaturalLightingSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: Setting Up Natural Lighting", buf, 0xCu);

  }
  -[HUNaturalLightingSetupViewController useWithLightsButton](self, "useWithLightsButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityIndicator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startAnimating");

  objc_msgSend(v5, "setEnabled:", 0);
  -[HUNaturalLightingSetupViewController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commitSelectedItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__HUNaturalLightingSetupViewController__activateNaturalLighting___block_invoke;
  v21[3] = &unk_1E6F502A0;
  v21[4] = self;
  objc_msgSend(v13, "addSuccessBlock:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __65__HUNaturalLightingSetupViewController__activateNaturalLighting___block_invoke_12;
  v18[3] = &unk_1E6F4D1B0;
  v19 = v5;
  v20 = self;
  v16 = v5;
  v17 = (id)objc_msgSend(v15, "addFailureBlock:", v18);

}

void __65__HUNaturalLightingSetupViewController__activateNaturalLighting___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_markAllAccessoriesAsOnboarded");
  objc_msgSend(*(id *)(a1 + 32), "useWithLightsButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v8 = CFSTR("HUNaturalLightingOnboardingKey_UserInput");
  v9[0] = &unk_1E7041410;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController:didFinishWithConfigurationResults:", v6, v7);

}

void __65__HUNaturalLightingSetupViewController__activateNaturalLighting___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "useWithLightsButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAnimating");

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleError:", v4);

}

- (void)_doNotActivateNaturalLighting:(id)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  HUNaturalLightingSetupViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  v7 = -[HUNaturalLightingSetupViewController _markAllAccessoriesAsOnboarded](self, "_markAllAccessoriesAsOnboarded");
  -[HUNaturalLightingSetupViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("HUNaturalLightingOnboardingKey_UserInput");
  v11 = &unk_1E7041428;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", self, v9);

}

- (void)viewDidLoad
{
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
  NSObject *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  HUNaturalLightingSetupViewController *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HUNaturalLightingSetupViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v19, sel_viewDidLoad);
  -[HUNaturalLightingSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043130);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNaturalLightingSetupViewController setUseWithLightsButton:](self, "setUseWithLightsButton:", v6);

  -[HUNaturalLightingSetupViewController useWithLightsButton](self, "useWithLightsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUNaturalLightingSetupViewController useWithLightsButton](self, "useWithLightsButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__activateNaturalLighting_, 64);

  -[HUNaturalLightingSetupViewController useWithLightsButton](self, "useWithLightsButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.NaturalLighting.SetUp.UseWithLightsButton"));

  -[HUNaturalLightingSetupViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNaturalLightingSetupViewController useWithLightsButton](self, "useWithLightsButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", v11);

  -[HUNaturalLightingSetupViewController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNaturalLightingSetupViewController _updateButtonWithNumberOfLightsSelected:](self, "_updateButtonWithNumberOfLightsSelected:", objc_msgSend(v13, "count"));

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _HULocalizedStringWithDefaultValue(CFSTR("HUNaturalLightingTitle_NotNowButton"), CFSTR("HUNaturalLightingTitle_NotNowButton"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v15, 0);

  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.NaturalLighting.SetUp.NotNowButton"));
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__doNotActivateNaturalLighting_, 64);
  -[HUNaturalLightingSetupViewController buttonTray](self, "buttonTray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addButton:", v14);

  -[HUNaturalLightingSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v18;
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: NLSVC", buf, 0x16u);

  }
}

- (void)_updateButtonWithNumberOfLightsSelected:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  HULocalizedStringWithFormat(CFSTR("HUNaturalLightingSetup_UseLightsButton"), CFSTR("%lu"), a3, v3, v4, v5, v6, v7, a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUNaturalLightingSetup_UseLightsButtonSingular"), CFSTR("HUNaturalLightingSetup_UseLightsButtonSingular"), 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v10;
  }
  -[HUNaturalLightingSetupViewController useWithLightsButton](self, "useWithLightsButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v13, 0);

  -[HUNaturalLightingSetupViewController useWithLightsButton](self, "useWithLightsButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", a3 != 0);

}

- (id)_markAllAccessoriesAsOnboarded
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = (void *)MEMORY[0x1E0D519C0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke;
  v6[3] = &unk_1E6F4C660;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithBlock:scheduler:", v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_47_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_97);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combineAllFutures:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_5;
  v13[3] = &unk_1E6F4C610;
  v14 = v3;
  v11 = v3;
  v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v13);

}

id __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  void *v10;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2544A8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "homeKitObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "addObject:", v8);
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v4, "homeKitObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

id __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_4;
  v7[3] = &unk_1E6F4C5E8;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "futureWithErrorOnlyHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasOnboardedForNaturalLightingWithCompletion:", a2);
}

uint64_t __70__HUNaturalLightingSetupViewController__markAllAccessoriesAsOnboarded__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

+ (id)moduleControllerInHome:(id)a3
{
  id v5;
  HUSimpleItemModuleTableViewController *v6;
  id v7;
  HUSimpleItemModuleTableViewController *v8;
  _QWORD v10[6];
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = [HUSimpleItemModuleTableViewController alloc];
  v10[5] = a1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke;
  v11[3] = &unk_1E6F4FDA0;
  v12 = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke_4;
  v10[3] = &__block_descriptor_48_e46___HUItemModuleController_16__0__HFItemModule_8l;
  v10[4] = a2;
  v7 = v5;
  v8 = -[HUSimpleItemModuleTableViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:](v6, "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 1, v11, v10);

  return v8;
}

id __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUNaturalLightingSetupModule *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUNaturalLightingSetupModule initWithHome:itemUpdater:]([HUNaturalLightingSetupModule alloc], "initWithHome:itemUpdater:", *(_QWORD *)(a1 + 32), v4);

  -[HUNaturalLightingSetupModule setDefaultSelectedValue:](v5, "setDefaultSelectedValue:", MEMORY[0x1E0C9AAB0]);
  -[HUNaturalLightingSetupModule setFilter:](v5, "setFilter:", &__block_literal_global_103_0);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  if ((HFForceNaturalLightingOnboarding() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "services");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "na_any:", &__block_literal_global_105_0);

  }
  return v3;
}

uint64_t __63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasOnboardedForNaturalLighting") ^ 1;

  return v3;
}

HUNaturalLightingSetupModuleController *__63__HUNaturalLightingSetupViewController_moduleControllerInHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  HUNaturalLightingSetupModuleController *v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[HUNaturalLightingSetupModuleController initWithModule:]([HUNaturalLightingSetupModuleController alloc], "initWithModule:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("HUNaturalLightingSetupViewController.m"), 206, CFSTR("HUNaturalLightingSetupViewController was given unknown item module: %@"), v3);

    v4 = 0;
  }

  return v4;
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (OBTrayButton)useWithLightsButton
{
  return self->_useWithLightsButton;
}

- (void)setUseWithLightsButton:(id)a3
{
  objc_storeStrong((id *)&self->_useWithLightsButton, a3);
}

- (HUNaturalLightingSetupModule)module
{
  return self->_module;
}

- (void)setModule:(id)a3
{
  objc_storeStrong((id *)&self->_module, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_useWithLightsButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
