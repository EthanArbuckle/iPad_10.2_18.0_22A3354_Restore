@implementation HUPersonalRequestsSetupViewController

- (HUPersonalRequestsSetupViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  HUPersonalRequestsSetupViewController *v7;
  objc_super v9;

  v5 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsSetup_Title"), CFSTR("HUPersonalRequestsSetup_Title"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HUPersonalRequestsSetupViewController;
  v7 = -[HUPersonalRequestsSetupViewController initWithTitle:detailText:icon:contentLayout:](&v9, sel_initWithTitle_detailText_icon_contentLayout_, v6, 0, 0, 2);

  if (v7)
    objc_storeStrong((id *)&v7->_home, a3);

  return v7;
}

- (HUPersonalRequestsSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalRequestsSetupViewController.m"), 61, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPersonalRequestsSetupViewController initWithTitle:detailText:symbolName:contentLayout:]",
    v9);

  return 0;
}

- (HUPersonalRequestsSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalRequestsSetupViewController.m"), 66, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPersonalRequestsSetupViewController initWithTitle:detailText:icon:contentLayout:]",
    v9);

  return 0;
}

+ (id)_bulletImageWithSystemName:(id)a3 color:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = (void *)MEMORY[0x1E0CEA478];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "systemWhiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 22.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", v8, v7, v9, v10, 40.0, 40.0, 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_setupPersonalRequestsItemInfrastructure
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HUPersonalRequestsEditorItemManager *v8;
  HUPersonalRequestsDevicesModuleController *v9;
  void *v10;
  void *v11;
  HUPersonalRequestsDevicesModuleController *v12;
  void *v13;
  id v14;
  id v15;

  v4 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HUPersonalRequestsSetupViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v4, "initWithHome:user:nameStyle:", v5, v7, 0);

  v8 = -[HUPersonalRequestsEditorItemManager initWithDelegate:userItem:onlyShowDeviceSwitches:]([HUPersonalRequestsEditorItemManager alloc], "initWithDelegate:userItem:onlyShowDeviceSwitches:", self, v15, 0);
  -[HUPersonalRequestsSetupViewController setPrEditorItemManager:](self, "setPrEditorItemManager:", v8);

  v9 = [HUPersonalRequestsDevicesModuleController alloc];
  -[HUPersonalRequestsSetupViewController prEditorItemManager](self, "prEditorItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prDevicesModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HUPersonalRequestsDevicesModuleController initWithModule:host:](v9, "initWithModule:host:", v11, self);
  -[HUPersonalRequestsSetupViewController setPrDevicesModuleController:](self, "setPrDevicesModuleController:", v12);

  -[HUPersonalRequestsSetupViewController prEditorItemManager](self, "prEditorItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

}

- (void)_customizePersonalRequests:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];
  uint8_t buf[4];
  HUPersonalRequestsSetupViewController *v13;
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
  -[HUPersonalRequestsSetupViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController locationDevice](self, "locationDevice", CFSTR("HUPersonalRequestsOnboardingKey_UserInput"), CFSTR("HUPersonalRequestsOnboardingKey_FMFDevice"), &unk_1E70406C0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController:didFinishWithConfigurationResults:", self, v9);

}

- (void)_dontUsePersonalRequests:(id)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  HUPersonalRequestsSetupViewController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  HUPersonalRequestsSetupViewController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (HUPersonalRequestsSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: Turning off all Personal Requests devices", buf, 0xCu);

  }
  -[HUPersonalRequestsSetupViewController prDevicesModuleController](self, "prDevicesModuleController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "setPersonalRequestsDevices:", v10);

  -[HUPersonalRequestsSetupViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("HUPersonalRequestsOnboardingKey_UserInput");
  v15 = &unk_1E70406D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewController:didFinishWithConfigurationResults:", self, v13);

}

- (void)_turnOnAllPersonalRequests:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  HUPersonalRequestsSetupViewController *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  HUPersonalRequestsSetupViewController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (HUPersonalRequestsSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: Turning on Personal Requests for all multi-user capable devices", buf, 0xCu);

  }
  -[HUPersonalRequestsSetupViewController prDevicesModuleController](self, "prDevicesModuleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "turnOnPersonalRequestsForAllMultiUserCapableDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HUPersonalRequestsSetupViewController__turnOnAllPersonalRequests___block_invoke;
  v13[3] = &unk_1E6F4F4D0;
  objc_copyWeak(&v14, (id *)buf);
  v12 = (id)objc_msgSend(v11, "addSuccessBlock:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __68__HUPersonalRequestsSetupViewController__turnOnAllPersonalRequests___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("HUPersonalRequestsOnboardingKey_UserInput");
  v5[0] = &unk_1E70406F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController:didFinishWithConfigurationResults:", WeakRetained, v3);

}

- (BOOL)_allPersonalRequestsDevicesSupportVoiceRecognition
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  HUPersonalRequestsSetupViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HUPersonalRequestsSetupViewController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_numberOfHomePods");

  -[HUPersonalRequestsSetupViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_siriEndPointAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") + v5;

  v9 = -[HUPersonalRequestsSetupViewController _numberOfDevicesSupportingVR](self, "_numberOfDevicesSupportingVR");
  if (v9 != v8)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: NO: Not all HomePods and Siri endpoints are on the supported Voice Recognition language", (uint8_t *)&v13, 0x16u);

    }
  }
  return v9 == v8;
}

- (unint64_t)_numberOfDevicesSupportingVR
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v18;
  void *v19;
  int v20;
  HUPersonalRequestsSetupViewController *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HUPersonalRequestsSetupViewController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_homePods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_41);

  -[HUPersonalRequestsSetupViewController home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_siriEndPointAccessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "na_any:", &__block_literal_global_20_0);

  if ((v6 & 1) != 0 || v9)
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@: NO: Some HomePods do NOT support voice recognition", (uint8_t *)&v20, 0x16u);

    }
    return 0;
  }
  else
  {
    -[HUPersonalRequestsSetupViewController home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonalRequestsSetupViewController supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUHomeFeatureOnboardingUtilities home:createMultiUserLanguageToHomePodsMapping:](HUHomeFeatureOnboardingUtilities, "home:createMultiUserLanguageToHomePodsMapping:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    return v16;
  }
}

uint64_t __69__HUPersonalRequestsSetupViewController__numberOfDevicesSupportingVR__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsMultiUser") ^ 1;
}

uint64_t __69__HUPersonalRequestsSetupViewController__numberOfDevicesSupportingVR__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsMultiUser") ^ 1;
}

- (id)hu_preloadContent
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33[2];
  _QWORD v34[5];
  _QWORD v35[5];
  id location[2];

  -[HUPersonalRequestsSetupViewController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hf_atleastOneMediaAccessorySupportingJustSiri"))
  {
    -[HUPersonalRequestsSetupViewController home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "siriPhraseOptions") == 2)
    {
      v6 = _os_feature_enabled_impl();
    }
    else
    {
      -[HUPersonalRequestsSetupViewController home](self, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "siriPhraseOptions") == 3)
        v6 = _os_feature_enabled_impl();
      else
        v6 = 0;

    }
  }
  else
  {
    v6 = 0;
  }

  HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_CalendarBulletText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_bulletImageWithSystemName:color:", CFSTR("calendar"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", &stru_1E6F60E80, v8, v11);

  HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_MessagesBulletText_HEY_SIRI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_MessagesBulletText_JUST_SIRI"));
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  v14 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_bulletImageWithSystemName:color:", CFSTR("message.fill"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", &stru_1E6F60E80, v12, v16);

  HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_RemindersBulletText"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_bulletImageWithSystemName:color:", CFSTR("list.bullet"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", &stru_1E6F60E80, v17, v20);

  HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_PersonalUpdateBulletText_HEY_SIRI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_PersonalUpdateBulletText_JUST_SIRI"));
    v22 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v22;
  }
  v23 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemIndigoColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_bulletImageWithSystemName:color:", CFSTR("heart.text.square.fill"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", &stru_1E6F60E80, v21, v25);

  objc_initWeak(location, self);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", &__block_literal_global_49);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_2;
  v35[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v35[4] = a2;
  v28 = (id)objc_msgSend(v26, "addFailureBlock:", v35);
  v34[0] = v27;
  v34[1] = 3221225472;
  v34[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_51;
  v34[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v34[4] = a2;
  v29 = (id)objc_msgSend(v26, "addSuccessBlock:", v34);
  v32[0] = v27;
  v32[1] = 3221225472;
  v32[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_54;
  v32[3] = &unk_1E6F4F7D0;
  objc_copyWeak(v33, location);
  v33[1] = (id)a2;
  objc_msgSend(v26, "flatMap:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v33);

  objc_destroyWeak(location);
  return v30;
}

uint64_t __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguagesWithCompletion:", a2);
}

void __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages %@", (uint8_t *)&v6, 0x16u);

  }
}

void __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned %@", (uint8_t *)&v6, 0x16u);

  }
}

id __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[4];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSupportedVoiceRecognitionLanguages:", v3);
  +[HULocationDeviceManager sharedInstance](HULocationDeviceManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeLocationDeviceFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_2_56;
  v13[3] = &unk_1E6F4F780;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  objc_msgSend(v6, "flatMap:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_3;
  v12[3] = &unk_1E6F4F7A8;
  v9 = *(_QWORD *)(a1 + 40);
  v12[4] = WeakRetained;
  v12[5] = v9;
  objc_msgSend(v8, "recover:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  return v10;
}

id __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_2_56(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setLocationDevice:", v3);

  objc_msgSend(WeakRetained, "locationDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUPersonalRequestsSetup_Detail"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "locationDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUPersonalRequestsSetup_Detail"), CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hf_numberOfHomePods");

  objc_msgSend(WeakRetained, "home");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hf_siriEndPointAccessories");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count") + v24;

  v28 = objc_msgSend(WeakRetained, "_allPersonalRequestsDevicesSupportVoiceRecognition");
  if (v27 >= 2 && objc_msgSend(WeakRetained, "_numberOfDevicesSupportingVR"))
  {
    if (v28)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsSetup_UsePersonalRequests_EveryHomePod_Button"), CFSTR("HUPersonalRequestsSetup_UsePersonalRequests_EveryHomePod_Button"), 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsSetup_UsePersonalRequests_EveryAccessory_Button"), CFSTR("HUPersonalRequestsSetup_UsePersonalRequests_EveryAccessory_Button"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsSetup_UsePersonalRequests_EverySupportedHomePod_Button"), CFSTR("HUPersonalRequestsSetup_UsePersonalRequests_EverySupportedHomePod_Button"), 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsSetup_UsePersonalRequests_EverySupportedAccessory_Button"), CFSTR("HUPersonalRequestsSetup_UsePersonalRequests_EverySupportedAccessory_Button"), 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "locationDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "locationDevice");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUPersonalRequestsSetup_Detail_WithSomeUnsupportedHomePods"), CFSTR("%@%@"), v44, v45, v46, v47, v48, v49, (uint64_t)v41);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "locationDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "name");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "locationDevice");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "name");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUPersonalRequestsSetup_Detail_WithSomeUnsupportedSiriEnabledAccessories"), CFSTR("%@%@"), v53, v54, v55, v56, v57, v58, (uint64_t)v51);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(WeakRetained, "usePRButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTitle:forState:", v30, 0);
    goto LABEL_9;
  }
  if ((v28 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "locationDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUPersonalRequestsSetup_Detail_UnsupportedLocale"), CFSTR("%@"), v32, v33, v34, v35, v36, v37, (uint64_t)v31);
    v38 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v38;
LABEL_9:

  }
  objc_msgSend(WeakRetained, "headerView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setDetailText:", v22);

  objc_msgSend(WeakRetained, "buttonTray");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsSetup_FinePrint"), CFSTR("HUPersonalRequestsSetup_FinePrint"), 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setCaptionText:", v61);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

id __58__HUPersonalRequestsSetupViewController_hu_preloadContent__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "%@:%@ Location Device future failed with %@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performPresentationRequest:](self, "hu_performPresentationRequest:", a4);
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return -[UIViewController hu_performDismissalRequest:](self, "hu_performDismissalRequest:", a4);
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
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
  char **v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  HUPersonalRequestsSetupViewController *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)HUPersonalRequestsSetupViewController;
  -[OBBaseWelcomeController viewDidLoad](&v27, sel_viewDidLoad);
  -[HUPersonalRequestsSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042E60);

  -[HUPersonalRequestsSetupViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_numberOfHomePods");

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController setUsePRButton:](self, "setUsePRButton:", v8);

  -[HUPersonalRequestsSetupViewController usePRButton](self, "usePRButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsSetup_UsePersonalRequestsButton"), CFSTR("HUPersonalRequestsSetup_UsePersonalRequestsButton"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController usePRButton](self, "usePRButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v10, 0);

  -[HUPersonalRequestsSetupViewController usePRButton](self, "usePRButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.PersonalRequests.SetUp.UsePersonalRequestsButton"));

  -[HUPersonalRequestsSetupViewController usePRButton](self, "usePRButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__turnOnAllPersonalRequests_, 64);

  -[HUPersonalRequestsSetupViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController usePRButton](self, "usePRButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v15);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsSetupViewController setCustomizeButton:](self, "setCustomizeButton:", v16);

  -[HUPersonalRequestsSetupViewController customizeButton](self, "customizeButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUPersonalRequestsSetupViewController customizeButton](self, "customizeButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < 2)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsCustomize_DoNotUseButton"), CFSTR("HUPersonalRequestsCustomize_DoNotUseButton"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:forState:", v22, 0);

    -[HUPersonalRequestsSetupViewController customizeButton](self, "customizeButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.PersonalRequests.SetUp.DoNotUseLinkButton"));
    v21 = &selRef__dontUsePersonalRequests_;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUPersonalRequestsSetup_CustomizeButton"), CFSTR("HUPersonalRequestsSetup_CustomizeButton"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:forState:", v19, 0);

    -[HUPersonalRequestsSetupViewController customizeButton](self, "customizeButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.PersonalRequests.SetUp.CustomizeLinkButton"));
    v21 = &selRef__customizePersonalRequests_;
  }

  -[HUPersonalRequestsSetupViewController customizeButton](self, "customizeButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, *v21, 64);

  -[HUPersonalRequestsSetupViewController buttonTray](self, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addButton:", self->_customizeButton);

  -[HUPersonalRequestsSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUPersonalRequestsSetupViewController _setupPersonalRequestsItemInfrastructure](self, "_setupPersonalRequestsItemInfrastructure");
  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = self;
    v30 = 2112;
    v31 = v26;
    _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: PRSVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUPersonalRequestsSetupViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUPersonalRequestsSetupViewController;
  -[HUPersonalRequestsSetupViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUPersonalRequestsSetupViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);

    }
    -[HUPersonalRequestsSetupViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerDidGoBack:", self);

  }
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

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (OBTrayButton)usePRButton
{
  return self->_usePRButton;
}

- (void)setUsePRButton:(id)a3
{
  objc_storeStrong((id *)&self->_usePRButton, a3);
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_customizeButton, a3);
}

- (HULocationDevice)locationDevice
{
  return self->_locationDevice;
}

- (void)setLocationDevice:(id)a3
{
  objc_storeStrong((id *)&self->_locationDevice, a3);
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, a3);
}

- (HUPersonalRequestsEditorItemManager)prEditorItemManager
{
  return self->_prEditorItemManager;
}

- (void)setPrEditorItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_prEditorItemManager, a3);
}

- (HUPersonalRequestsDevicesModuleController)prDevicesModuleController
{
  return self->_prDevicesModuleController;
}

- (void)setPrDevicesModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_prDevicesModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prDevicesModuleController, 0);
  objc_storeStrong((id *)&self->_prEditorItemManager, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_locationDevice, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_usePRButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
