@implementation HUCameraRecordingOnboardingFlow

- (HUCameraRecordingOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUCameraRecordingOnboardingFlow *v8;
  HUCameraRecordingOnboardingFlow *v9;
  id v10;
  HMHome *home;
  void *v12;
  uint64_t v13;
  HFUserItem *userItem;
  void *v15;
  uint64_t v16;
  NAFuture *onboardingFuture;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUCameraRecordingOnboardingFlow;
  v8 = -[HUCameraRecordingOnboardingFlow init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v10 = objc_alloc(MEMORY[0x1E0D31988]);
    home = v9->_home;
    -[HMHome currentUser](home, "currentUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithHome:user:nameStyle:", home, v12, 0);
    userItem = v9->_userItem;
    v9->_userItem = (HFUserItem *)v13;

    objc_initWeak(&location, v9);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__HUCameraRecordingOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v19[3] = &unk_1E6F4EA10;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v15, "flatMap:", v19);
    v16 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __61__HUCameraRecordingOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HUCameraRecordingOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6F4E9E8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v6;
}

void __61__HUCameraRecordingOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    objc_msgSend(WeakRetained, "_determineInitialViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setInitialViewController:", v4);

  }
  objc_msgSend(WeakRetained, "initialViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v6, "finishWithNoResult");

}

- (void)_setThisUserDismissedCameraOnboardingAndReminder
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("HUHomeFeatureOnboardingKey_CameraRecording_DismissReminderBanner");
  v6[1] = CFSTR("HUHomeFeatureOnboardingKey_CameraRecording_FinishedOnboarding");
  v7[0] = MEMORY[0x1E0C9AAB0];
  v7[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingOnboardingFlow home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HUHomeFeatureOnboardingUtilities home:processHomeFeatureOnboarderResults:](HUHomeFeatureOnboardingUtilities, "home:processHomeFeatureOnboarderResults:", v4, v3);

}

- (id)_determineInitialViewController
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HUCameraRecordingIntroViewController *v19;
  HUCameraRecordingIntroViewController *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  -[HUCameraRecordingOnboardingFlow home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_cameraRecordingHasBeenOnboarded");

  -[HUCameraRecordingOnboardingFlow userItem](self, "userItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDismissedCameraRecordingOnboarding");

  -[HUCameraRecordingOnboardingFlow home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_currentUserIsOwner");

  -[HUCameraRecordingOnboardingFlow home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "residentDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  -[HUCameraRecordingOnboardingFlow home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hf_hasCameraRecordingResident");

  -[HUCameraRecordingOnboardingFlow home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hf_hasSecureRecordingCameras");

  -[HUCameraRecordingOnboardingFlow home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hf_allCameraProfiles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  v19 = 0;
  if (v18 && (v6 & 1) == 0)
  {
    -[HUCameraRecordingOnboardingFlow _setThisUserDismissedCameraOnboardingAndReminder](self, "_setThisUserDismissedCameraOnboardingAndReminder");
    v20 = [HUCameraRecordingIntroViewController alloc];
    -[HUCameraRecordingOnboardingFlow home](self, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 3;
    if (v11)
      v22 = 4;
    if (v15)
      v23 = v22;
    else
      v23 = 1;
    if (v15 && v11 && ((v13 ^ 1) & 1) == 0)
    {
      if (v4)
      {
        if (v8)
          v23 = 5;
        else
          v23 = 6;
      }
      else if (v8)
      {
        v23 = 2;
      }
      else
      {
        v23 = 0;
      }
    }
    v19 = -[HUCameraRecordingIntroViewController initWithIntroVariant:home:](v20, "initWithIntroVariant:home:", v23, v21);

  }
  return v19;
}

- (NSString)description
{
  return (NSString *)CFSTR("Multi User Camera Recording Setup");
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HUSimpleItemModuleTableViewController *v9;
  HUCameraRecordingPermissionsViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  HUCameraRecordingPermissionsViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  HUSimpleItemModuleTableViewController *v18;
  HUCameraRecordingSetupViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD aBlock[4];
  id v32;
  uint8_t buf[4];
  HUCameraRecordingOnboardingFlow *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUCameraRecordingOnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = self;
    v35 = 2112;
    v36 = v8;
    v37 = 2112;
    v38 = v5;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue") == 1)
  {
    -[HUCameraRecordingOnboardingFlow onboardingFuture](self, "onboardingFuture");
    v9 = (HUSimpleItemModuleTableViewController *)objc_claimAutoreleasedReturnValue();
    -[HUSimpleItemModuleTableViewController finishWithNoResult](v9, "finishWithNoResult");
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "integerValue"))
  {
    if (objc_msgSend(v6, "integerValue") != 2)
    {
      v23 = objc_alloc(MEMORY[0x1E0D31988]);
      -[HUCameraRecordingOnboardingFlow home](self, "home");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCameraRecordingOnboardingFlow home](self, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "currentUser");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (HUSimpleItemModuleTableViewController *)objc_msgSend(v23, "initWithHome:user:nameStyle:", v24, v26, 0);

      if ((-[HUSimpleItemModuleTableViewController hasDismissedCameraRecordingOnboarding](v9, "hasDismissedCameraRecordingOnboarding") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("HUHomeFeatureOnboardingKey_CameraRecording_DismissReminderBanner"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("HUHomeFeatureOnboardingKey_CameraRecording_DismissReminderBanner"));
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[HUCameraRecordingOnboardingFlow processUserInput:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("HUCameraRecordingOnboardingFlow.m"), 190, CFSTR("We should have handled all cases! results: %@"), v5);

      goto LABEL_13;
    }
    v9 = -[HUSimpleItemModuleTableViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:]([HUSimpleItemModuleTableViewController alloc], "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 2, &__block_literal_global_21_0, &__block_literal_global_23);
    v10 = [HUCameraRecordingPermissionsViewController alloc];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraPermissionsSettingsHeader_Title"), CFSTR("HUCameraPermissionsSettingsHeader_Title"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraPermissionsSettingsHeader_Body"), CFSTR("HUCameraPermissionsSettingsHeader_Body"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingOnboardingFlow home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUCameraRecordingPermissionsViewController initWithTitle:detailText:icon:itemTableViewController:home:](v10, "initWithTitle:detailText:icon:itemTableViewController:home:", v11, v12, 0, v9, v13);

  }
  else
  {
    -[HUCameraRecordingOnboardingFlow home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_allCameraProfilesSupportingRecording");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke;
    aBlock[3] = &unk_1E6F4FDA0;
    v32 = v16;
    v9 = v16;
    v17 = _Block_copy(aBlock);
    v18 = -[HUSimpleItemModuleTableViewController initWithTableViewStyle:moduleCreator:moduleControllerBuilder:]([HUSimpleItemModuleTableViewController alloc], "initWithTableViewStyle:moduleCreator:moduleControllerBuilder:", 2, v17, &__block_literal_global_47);
    v19 = [HUCameraRecordingSetupViewController alloc];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSetup_Title"), CFSTR("HUCameraRecordingSetup_Title"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSetup_Detail"), CFSTR("HUCameraRecordingSetup_Detail"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraRecordingOnboardingFlow home](self, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUCameraRecordingSetupViewController initWithTitle:detailText:icon:itemTableViewController:home:](v19, "initWithTitle:detailText:icon:itemTableViewController:home:", v20, v21, 0, v18, v22);

  }
LABEL_14:

  return v14;
}

id __52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUCameraRecordingSettingsModule *v5;
  void *v6;
  HUCameraRecordingSettingsModule *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HUCameraRecordingSettingsModule alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUCameraRecordingSettingsModule initWithItemUpdater:cameraProfiles:displayStyle:](v5, "initWithItemUpdater:cameraProfiles:displayStyle:", v4, v6, 1);

  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

HUCameraSettingsModuleController *__52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HUCameraSettingsModuleController *v3;

  v2 = a2;
  v3 = -[HUCameraSettingsModuleController initWithModule:]([HUCameraSettingsModuleController alloc], "initWithModule:", v2);

  return v3;
}

id __52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HUCameraPermissionsSettingsModule *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  v6 = -[HUCameraPermissionsSettingsModule initWithItemUpdater:home:displayStyle:]([HUCameraPermissionsSettingsModule alloc], "initWithItemUpdater:home:displayStyle:", v4, v5, 1);

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

HUCameraSettingsModuleController *__52__HUCameraRecordingOnboardingFlow_processUserInput___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  HUCameraSettingsModuleController *v3;

  v2 = a2;
  v3 = -[HUCameraSettingsModuleController initWithModule:]([HUCameraSettingsModuleController alloc], "initWithModule:", v2);

  return v3;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;
  char v15;

  v6 = a3;
  v7 = objc_msgSend(v6, "hf_hasSecureRecordingCameras");
  v8 = (void *)MEMORY[0x1E0D519C0];
  if ((v7 & 1) != 0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__HUCameraRecordingOnboardingFlow_needsOnboardingForHome_options___block_invoke;
    v11[3] = &unk_1E6F4FE68;
    v12 = v6;
    v13 = a1;
    v14 = a2;
    v15 = 1;
    objc_msgSend(v8, "futureWithBlock:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __66__HUCameraRecordingOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D31988];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithHome:user:nameStyle:", v6, v7, 0);

  v9 = objc_msgSend(v8, "hasDismissedCameraRecordingOnboarding");
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = CFSTR("Can");
    v16 = *(unsigned __int8 *)(a1 + 56);
    v18 = 138413826;
    if (v9)
      v15 = CFSTR("Cannot");
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v14;
    v28 = 1024;
    v29 = v9 ^ 1;
    v30 = 1024;
    v31 = v16;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: user(%@) in home(%@):\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\thasSecureRecordingCameras = %{BOOL}d", (uint8_t *)&v18, 0x40u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 ^ 1u);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v17);

}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFuture, a3);
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
  objc_storeStrong((id *)&self->_initialViewController, a3);
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3
{
  self->_shouldAbortThisOnboardingFlowGroup = a3;
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (void)setShouldAbortAllOnboarding:(BOOL)a3
{
  self->_shouldAbortAllOnboarding = a3;
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (void)setUserItem:(id)a3
{
  objc_storeStrong((id *)&self->_userItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userItem, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
