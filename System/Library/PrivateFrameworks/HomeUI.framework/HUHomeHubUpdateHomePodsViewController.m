@implementation HUHomeHubUpdateHomePodsViewController

- (HUHomeHubUpdateHomePodsViewController)initWithOwnedHomes:(id)a3 homePodsToUpdate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  HUHomeHubAccessoryListItemManager *v12;
  void *v13;
  HUHomeHubAccessoryListItemManager *v14;
  HUHomeHubSimpleTableViewController *v15;
  void *v16;
  HUHomeHubUpdateHomePodsViewController *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "na_all:", &__block_literal_global_220) & 1) == 0)
    NSLog(CFSTR("Must only pass in HomePod accessories only."));
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredDescriptionSingularHomePodSingularHome"), CFSTR("HUHomePodSoftwareUpdateRequiredDescriptionSingularHomePodSingularHome"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1 && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v10 = CFSTR("HUHomePodSoftwareUpdateRequiredDescriptionSingularHomePodMultipleHomes");
LABEL_12:
    _HULocalizedStringWithDefaultValue(v10, v10, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
    goto LABEL_13;
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2 && objc_msgSend(v7, "count") == 1)
  {
    v10 = CFSTR("HUHomePodSoftwareUpdateRequiredDescriptionMultipleHomePodsSingularHome");
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v8, "count") >= 2 && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v10 = CFSTR("HUHomePodSoftwareUpdateRequiredDescriptionMultipleHomePodsMultipleHomes");
    goto LABEL_12;
  }
LABEL_13:
  v12 = [HUHomeHubAccessoryListItemManager alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUHomeHubAccessoryListItemManager initWithAccessories:delegate:](v12, "initWithAccessories:delegate:", v13, self);

  v15 = -[HUItemTableViewController initWithItemManager:tableViewStyle:]([HUHomeHubSimpleTableViewController alloc], "initWithItemManager:tableViewStyle:", v14, 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredTitle"), CFSTR("HUHomePodSoftwareUpdateRequiredTitle"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)HUHomeHubUpdateHomePodsViewController;
  v17 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v19, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v16, v9, 0, 2, v15);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_homes, a3);
    objc_storeStrong((id *)&v17->_homePods, a4);
    v17->_userTappedUpdate = 0;
  }

  return v17;
}

uint64_t __77__HUHomeHubUpdateHomePodsViewController_initWithOwnedHomes_homePodsToUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomePod");
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  HUHomeHubUpdateHomePodsViewController *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)HUHomeHubUpdateHomePodsViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v34, sel_viewDidLoad);
  -[HUHomeHubUpdateHomePodsViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043220);

  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredCaptionSingularHomePodSingularHome"), CFSTR("HUHomePodSoftwareUpdateRequiredCaptionSingularHomePodSingularHome"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubUpdateHomePodsViewController homePods](self, "homePods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    -[HUHomeHubUpdateHomePodsViewController homes](self, "homes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 >= 2)
    {
      v10 = CFSTR("HUHomePodSoftwareUpdateRequiredCaptionSingularHomePodMultipleHomes");
LABEL_12:
      _HULocalizedStringWithDefaultValue(v10, v10, 1);
      v14 = v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {

  }
  -[HUHomeHubUpdateHomePodsViewController homePods](self, "homePods");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") <= 1)
  {

  }
  else
  {
    -[HUHomeHubUpdateHomePodsViewController homes](self, "homes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 == 1)
    {
      v10 = CFSTR("HUHomePodSoftwareUpdateRequiredCaptionMultipleHomePodsSingularHome");
      goto LABEL_12;
    }
  }
  -[HUHomeHubUpdateHomePodsViewController homePods](self, "homePods");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "count") >= 2)
  {
    -[HUHomeHubUpdateHomePodsViewController homes](self, "homes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 < 2)
      goto LABEL_14;
    v10 = CFSTR("HUHomePodSoftwareUpdateRequiredCaptionMultipleHomePodsMultipleHomes");
    goto LABEL_12;
  }
LABEL_13:

LABEL_14:
  -[HUHomeHubUpdateHomePodsViewController buttonTray](self, "buttonTray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addCaptionText:", v6);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubUpdateHomePodsViewController setContinueButton:](self, "setContinueButton:", v18);

  -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredUpdateNowButton"), CFSTR("HUHomePodSoftwareUpdateRequiredUpdateNowButton"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:forState:", v20, 0);

  -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__continueButtonPressed_, 64);

  -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("Home.Onboarding.HomeHubMigration.HUHomeHubUpdateHomePod.NotNowButton"));

  -[HUHomeHubUpdateHomePodsViewController buttonTray](self, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addButton:", v25);

  v26 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithTitle:style:target:action:", v27, 0, self, sel__cancelButtonPressed_);
  -[HUHomeHubUpdateHomePodsViewController setCancelButton:](self, "setCancelButton:", v28);

  -[HUHomeHubUpdateHomePodsViewController cancelButton](self, "cancelButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAccessibilityIdentifier:", CFSTR("Home.Onboarding.HomeHubMigration.HUHomeHubUpdateHomePod.CancelButton"));

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubUpdateHomePodsViewController cancelButton](self, "cancelButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRightBarButtonItem:", v31);

  -[HUHomeHubUpdateHomePodsViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v36 = self;
    v37 = 2112;
    v38 = v33;
    _os_log_impl(&dword_1B8E1E000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubUpdateHomePodsViewController", buf, 0x16u);

  }
}

- (id)hu_preloadContent
{
  -[HUHomeHubUpdateHomePodsViewController _fetchSoftwareUpdates](self, "_fetchSoftwareUpdates");
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)softwareUpdateUIManager:(id)a3 presentViewController:(id)a4
{
  return -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", a4, 1);
}

- (id)softwareUpdateUIManager:(id)a3 dismissViewController:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  -[HUHomeHubUpdateHomePodsViewController _hideSpinner](self, "_hideSpinner", a3, a4);
  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__HUHomeHubUpdateHomePodsViewController_softwareUpdateUIManager_dismissViewController___block_invoke;
  v8[3] = &unk_1E6F4D988;
  v6 = v5;
  v9 = v6;
  -[HUHomeHubUpdateHomePodsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

  return v6;
}

uint64_t __87__HUHomeHubUpdateHomePodsViewController_softwareUpdateUIManager_dismissViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (void)_continueButtonPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  HUHomeHubUpdateHomePodsViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v7, 0x16u);

  }
  -[HUHomeHubUpdateHomePodsViewController setUserTappedUpdate:](self, "setUserTappedUpdate:", 1);
  -[HUHomeHubUpdateHomePodsViewController _startUpdate](self, "_startUpdate");
}

- (void)_cancelButtonPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  HUHomeHubUpdateHomePodsViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v7, 0x16u);

  }
  -[HUHomeHubUpdateHomePodsViewController _dismiss](self, "_dismiss");
}

- (void)_dismiss
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HUHomeHubUpdateHomePodsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v6[0] = &unk_1E7041680;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController:didFinishWithConfigurationResults:", self, v4);

}

- (void)_fetchSoftwareUpdates
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
  HUHomeHubUpdateHomePodsViewController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HUHomeHubUpdateHomePodsViewController softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[HUHomeHubUpdateHomePodsViewController setSoftwareUpdateFetchFuture:](self, "setSoftwareUpdateFetchFuture:", v4);

  }
  v5 = -[HUHomeHubUpdateHomePodsViewController _allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2](self, "_allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2");
  -[HUHomeHubUpdateHomePodsViewController setRanIntoFetchError:](self, "setRanIntoFetchError:", 0);
  if (v5)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Skipping software update fetch since HomePods have valid SU or already support HH2", buf, 0xCu);
    }

    -[HUHomeHubUpdateHomePodsViewController softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithNoResult");

  }
  else
  {
    +[HUSoftwareUpdateUIManager sharedManager](HUSoftwareUpdateUIManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[HUHomeHubUpdateHomePodsViewController homePods](self, "homePods");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchAvailableUpdatesForAccessories:options:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__HUHomeHubUpdateHomePodsViewController__fetchSoftwareUpdates__block_invoke;
    v14[3] = &unk_1E6F4CDD0;
    v14[4] = self;
    v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v14);

  }
}

void __62__HUHomeHubUpdateHomePodsViewController__fetchSoftwareUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "softwareUpdateFetchFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:error:", v5, v6);

  if (v6)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = 138412546;
      v22 = v20;
      v23 = 2112;
      v24 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching software updates: %@", (uint8_t *)&v21, 0x16u);
    }

    v9 = objc_msgSend(*(id *)(a1 + 32), "_allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2");
    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      if (objc_msgSend(v10, "userTappedUpdate"))
      {
        HFLogForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 32);
          v21 = 138412290;
          v22 = v12;
          v13 = "%@ Error fetching software updates but will start updating since all HomePods have valid software updates";
          v14 = v11;
          v15 = 12;
LABEL_11:
          _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v10, "setRanIntoFetchError:", 1);
      if (objc_msgSend(*(id *)(a1 + 32), "userTappedUpdate"))
      {
        v17 = objc_msgSend(v6, "code");
        v18 = *(void **)(a1 + 32);
        if (v17 == 8)
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredFetchTimeoutErrorMessage"), CFSTR("HUHomePodSoftwareUpdateRequiredFetchTimeoutErrorMessage"), 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_presentErrorWithMessage:", v19);

        }
        else
        {
          objc_msgSend(v18, "_presentGenericError");
        }
      }
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "userTappedUpdate"))
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v21 = 138412546;
      v22 = v16;
      v23 = 2112;
      v24 = v5;
      v13 = "%@ Completed fetching software updates with result: %@, and no error";
      v14 = v11;
      v15 = 22;
      goto LABEL_11;
    }
LABEL_12:

    objc_msgSend(*(id *)(a1 + 32), "_startUpdate");
  }

}

- (void)_startUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  HUHomeHubUpdateHomePodsViewController *v30;
  __int16 v31;
  _BYTE v32[10];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HUHomeHubUpdateHomePodsViewController _showSpinner](self, "_showSpinner");
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUHomeHubUpdateHomePodsViewController softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = self;
    v31 = 1024;
    *(_DWORD *)v32 = objc_msgSend(v4, "isFinished");
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = -[HUHomeHubUpdateHomePodsViewController ranIntoFetchError](self, "ranIntoFetchError");
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ Did fetching software updates finish: %{BOOL}d. Did fetching software updates run into errors: %{BOOL}d", buf, 0x18u);

  }
  -[HUHomeHubUpdateHomePodsViewController softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isFinished"))
  {

    goto LABEL_8;
  }
  v6 = -[HUHomeHubUpdateHomePodsViewController ranIntoFetchError](self, "ranIntoFetchError");

  if (v6)
  {
LABEL_8:
    -[HUHomeHubUpdateHomePodsViewController _fetchSoftwareUpdates](self, "_fetchSoftwareUpdates");
    return;
  }
  -[HUHomeHubUpdateHomePodsViewController _homePodsReadyToInstallSoftwareUpdate](self, "_homePodsReadyToInstallSoftwareUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    +[HUSoftwareUpdateUIManager sharedManager](HUSoftwareUpdateUIManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
    -[HUHomeHubUpdateHomePodsViewController _homePodsReadyToInstallSoftwareUpdate](self, "_homePodsReadyToInstallSoftwareUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startUpdatesForAccessories:presentationDelegate:", v12, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __53__HUHomeHubUpdateHomePodsViewController__startUpdate__block_invoke;
    v28[3] = &unk_1E6F4E2D8;
    v28[4] = self;
    v15 = (id)objc_msgSend(v13, "addFailureBlock:", v28);
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __53__HUHomeHubUpdateHomePodsViewController__startUpdate__block_invoke_62;
    v27[3] = &unk_1E6F502A0;
    v27[4] = self;
    v16 = (id)objc_msgSend(v13, "addSuccessBlock:", v27);

  }
  else
  {
    -[HUHomeHubUpdateHomePodsViewController _homePodsDownloadingSoftwareUpdate](self, "_homePodsDownloadingSoftwareUpdate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[HUHomeHubUpdateHomePodsViewController _homePodsDownloadingSoftwareUpdate](self, "_homePodsDownloadingSoftwareUpdate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        -[HUHomeHubUpdateHomePodsViewController _homePodsDownloadingSoftwareUpdate](self, "_homePodsDownloadingSoftwareUpdate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = self;
        v31 = 2048;
        *(_QWORD *)v32 = v21;
        *(_WORD *)&v32[8] = 2112;
        v33 = v22;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@ Not starting installation since %lu software update(s) are being downloaded for HomePods: %@... should start installation once finished", buf, 0x20u);

      }
      -[HUHomeHubUpdateHomePodsViewController _hideSpinner](self, "_hideSpinner");
      -[HUHomeHubUpdateHomePodsViewController _dismiss](self, "_dismiss");
    }
    else
    {
      v23 = -[HUHomeHubUpdateHomePodsViewController _noHomePodsWithAvailableUpdates](self, "_noHomePodsWithAvailableUpdates");
      HFLogForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (v23)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138412290;
          v30 = self;
          _os_log_error_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_ERROR, "%@ There are no available software updates for any HomePods... showing error message", buf, 0xCu);
        }

        _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredNoAvailableUpdateErrorMessage"), CFSTR("HUHomePodSoftwareUpdateRequiredNoAvailableUpdateErrorMessage"), 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUHomeHubUpdateHomePodsViewController _presentErrorWithMessage:](self, "_presentErrorWithMessage:", v26);

      }
      else
      {
        if (v25)
        {
          *(_DWORD *)buf = 138412290;
          v30 = self;
          _os_log_error_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_ERROR, "%@ There are no software update downloads in progress... showing error message", buf, 0xCu);
        }

        -[HUHomeHubUpdateHomePodsViewController _presentGenericError](self, "_presentGenericError");
      }
    }
  }
}

void __53__HUHomeHubUpdateHomePodsViewController__startUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = *(void **)(a1 + 32);
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "homePods");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "%@ Error installing software updates for HomePods: %@, error: %@", (uint8_t *)&v12, 0x20u);

  }
  v5 = objc_msgSend(v3, "code");
  v6 = *(void **)(a1 + 32);
  if (v5 == 8)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredUpdateTimeoutErrorMessage"), CFSTR("HUHomePodSoftwareUpdateRequiredUpdateTimeoutErrorMessage"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_presentErrorWithMessage:", v7);

  }
  else
  {
    objc_msgSend(v6, "_presentGenericError");
  }

}

uint64_t __53__HUHomeHubUpdateHomePodsViewController__startUpdate__block_invoke_62(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "_homePodsReadyToInstallSoftwareUpdate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@ Successfully started installing software updates for HomePods: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_hideSpinner");
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

- (BOOL)_allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2
{
  void *v4;
  char v5;

  if ((HFPreferencesBoolForKey() & 1) != 0)
    return 1;
  -[HUHomeHubUpdateHomePodsViewController homePods](self, "homePods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_64_1);

  return v5;
}

uint64_t __90__HUHomeHubUpdateHomePodsViewController__allHomePodsHaveValidSoftwareUpdatesOrSupportsHH2__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_hasNewValidSoftwareUpdate") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "supportsHH2");

  }
  return v3;
}

- (id)_homePodsReadyToInstallSoftwareUpdate
{
  void *v2;
  void *v3;

  -[HUHomeHubUpdateHomePodsViewController homePods](self, "homePods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_65_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __78__HUHomeHubUpdateHomePodsViewController__homePodsReadyToInstallSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isControllable"))
    v3 = objc_msgSend(v2, "hf_isReadyToInstallSoftwareUpdate");
  else
    v3 = 0;

  return v3;
}

- (id)_homePodsDownloadingSoftwareUpdate
{
  void *v2;
  void *v3;

  -[HUHomeHubUpdateHomePodsViewController homePods](self, "homePods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_66_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __75__HUHomeHubUpdateHomePodsViewController__homePodsDownloadingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isDownloadingSoftwareUpdate");
}

- (BOOL)_noHomePodsWithAvailableUpdates
{
  void *v2;
  char v3;

  -[HUHomeHubUpdateHomePodsViewController homePods](self, "homePods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_67_1);

  return v3;
}

BOOL __72__HUHomeHubUpdateHomePodsViewController__noHomePodsWithAvailableUpdates__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "softwareUpdateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "state") == 4;
  else
    v4 = 1;

  return v4;
}

- (void)_showSpinner
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
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[HUHomeHubUpdateHomePodsViewController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidesBackButton:animated:", 1, 1);

    -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

    -[HUHomeHubUpdateHomePodsViewController cancelButton](self, "cancelButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    -[HUHomeHubUpdateHomePodsViewController setSpinner:](self, "setSpinner:", v9);

    -[HUHomeHubUpdateHomePodsViewController spinner](self, "spinner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeToFit");

    -[HUHomeHubUpdateHomePodsViewController spinner](self, "spinner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startAnimating");

    -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "center");
    v14 = v13;
    v16 = v15;
    -[HUHomeHubUpdateHomePodsViewController spinner](self, "spinner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCenter:", v14, v16);

    -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubUpdateHomePodsViewController spinner](self, "spinner");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

  }
}

- (void)_hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HUHomeHubUpdateHomePodsViewController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUHomeHubUpdateHomePodsViewController spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[HUHomeHubUpdateHomePodsViewController setSpinner:](self, "setSpinner:", 0);
    -[HUHomeHubUpdateHomePodsViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesBackButton:animated:", 0, 1);

  -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 0);

  -[HUHomeHubUpdateHomePodsViewController continueButton](self, "continueButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  -[HUHomeHubUpdateHomePodsViewController cancelButton](self, "cancelButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 1);

}

- (void)_presentGenericError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[HUHomeHubUpdateHomePodsViewController setUserTappedUpdate:](self, "setUserTappedUpdate:", 0);
  v3 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredErrorTitle"), CFSTR("HUHomePodSoftwareUpdateRequiredErrorTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredErrorMessage"), CFSTR("HUHomePodSoftwareUpdateRequiredErrorMessage"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HUHomeHubUpdateHomePodsViewController__presentGenericError__block_invoke;
  v10[3] = &unk_1E6F4C6E0;
  v10[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  -[HUHomeHubUpdateHomePodsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

uint64_t __61__HUHomeHubUpdateHomePodsViewController__presentGenericError__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideSpinner");
}

- (void)_presentErrorWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  -[HUHomeHubUpdateHomePodsViewController setUserTappedUpdate:](self, "setUserTappedUpdate:", 0);
  v5 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUHomePodSoftwareUpdateRequiredErrorTitle"), CFSTR("HUHomePodSoftwareUpdateRequiredErrorTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HUHomeHubUpdateHomePodsViewController__presentErrorWithMessage___block_invoke;
  v11[3] = &unk_1E6F4C6E0;
  v11[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  -[HUHomeHubUpdateHomePodsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __66__HUHomeHubUpdateHomePodsViewController__presentErrorWithMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideSpinner");
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (NSArray)homePods
{
  return self->_homePods;
}

- (void)setHomePods:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (NAFuture)softwareUpdateFetchFuture
{
  return self->_softwareUpdateFetchFuture;
}

- (void)setSoftwareUpdateFetchFuture:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (BOOL)userTappedUpdate
{
  return self->_userTappedUpdate;
}

- (void)setUserTappedUpdate:(BOOL)a3
{
  self->_userTappedUpdate = a3;
}

- (BOOL)ranIntoFetchError
{
  return self->_ranIntoFetchError;
}

- (void)setRanIntoFetchError:(BOOL)a3
{
  self->_ranIntoFetchError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_homePods, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
