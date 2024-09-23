@implementation HUUserNotificationTopicServiceListViewController

- (id)buildSwiftItemModuleControllerForModule:(id)a3
{
  uint64_t ObjCClassFromMetadata;
  id v6;
  HUUserNotificationTopicServiceListViewController *v7;
  unsigned int v8;
  id v9;

  type metadata accessor for ActivityLogItemModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v6, sel_isKindOfClass_, ObjCClassFromMetadata);
  v9 = 0;
  if (v8)
    v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityLogSettingsModuleController()), sel_initWithModule_, v6);

  return v9;
}

- (HUUserNotificationTopicServiceListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_topic_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserNotificationTopicServiceListViewController.m"), 45, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUUserNotificationTopicServiceListViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUUserNotificationTopicServiceListViewController)initWithHome:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  HUUserNotificationTopicServiceListViewController *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_topic, a4);
  objc_initWeak(&location, self);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__HUUserNotificationTopicServiceListViewController_initWithHome_topic___block_invoke;
  v20[3] = &unk_1E6F4C518;
  v10 = v6;
  v21 = v10;
  objc_msgSend(v8, "setHomeCreator:", v20);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __71__HUUserNotificationTopicServiceListViewController_initWithHome_topic___block_invoke_2;
  v17[3] = &unk_1E6F4E8D8;
  objc_copyWeak(&v19, &location);
  v11 = v7;
  v18 = v11;
  objc_msgSend(v8, "setItemModuleCreator:", v17);
  objc_msgSend(MEMORY[0x1E0D31858], "policyWithDecision:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReadPolicy:", v12);

  v16.receiver = self;
  v16.super_class = (Class)HUUserNotificationTopicServiceListViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v16, sel_initWithItemManager_tableViewStyle_, v8, 1);
  if (v13)
  {
    objc_msgSend(v11, "topicName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserNotificationTopicServiceListViewController setTitle:](v13, "setTitle:", v14);

  }
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return v13;
}

uint64_t __71__HUUserNotificationTopicServiceListViewController_initWithHome_topic___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id __71__HUUserNotificationTopicServiceListViewController_initWithHome_topic___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  HUUserNotificationTopicServiceListModule *v9;
  HUFaceRecognitionItemModule *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  HUActivityLogItemModule *v15;
  HUAnnounceSettingsItemModule *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  HUSafetyAndSecuritySettingsItemModule *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  HUEnergySettingsItemModule *v30;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUUserNotificationTopicServiceListModule initWithItemUpdater:home:topic:]([HUUserNotificationTopicServiceListModule alloc], "initWithItemUpdater:home:topic:", v6, v5, *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "addObject:", v9);
  if (objc_msgSend(WeakRetained, "_shouldShowFaceRecognition"))
  {
    v10 = -[HUFaceRecognitionItemModule initWithItemUpdater:home:]([HUFaceRecognitionItemModule alloc], "initWithItemUpdater:home:", v6, v5);
    objc_msgSend(v8, "addObject:", v10);

  }
  if (objc_msgSend(v5, "hf_shouldShowActivityLogSetting"))
  {
    objc_msgSend(WeakRetained, "topic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topicName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      v15 = -[HUActivityLogItemModule initWithHome:itemUpdater:]([HUActivityLogItemModule alloc], "initWithHome:itemUpdater:", v5, v6);
      objc_msgSend(v8, "addObject:", v15);

    }
  }
  if (objc_msgSend(v5, "hf_shouldShowAnnounceFeatureForThisHome"))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryCategoryTypes");
    v16 = (HUAnnounceSettingsItemModule *)objc_claimAutoreleasedReturnValue();
    if (!-[HUAnnounceSettingsItemModule containsObject:](v16, "containsObject:", *MEMORY[0x1E0CB7A58]))
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(WeakRetained, "topic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topicName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToString:", v19);

    if (v20)
    {
      v16 = -[HUAnnounceSettingsItemModule initWithItemUpdater:home:settingsContext:]([HUAnnounceSettingsItemModule alloc], "initWithItemUpdater:home:settingsContext:", v6, v5, 1);
      objc_msgSend(v8, "addObject:", v16);
      goto LABEL_10;
    }
  }
LABEL_11:
  if (objc_msgSend(v5, "hf_canUpdateToHH2") && (objc_msgSend(v5, "hf_hasHomePods") & 1) != 0
    || objc_msgSend(v5, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory"))
  {
    objc_msgSend(WeakRetained, "topic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topicName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if (v24)
    {
      v25 = -[HUSafetyAndSecuritySettingsItemModule initWithItemUpdater:home:]([HUSafetyAndSecuritySettingsItemModule alloc], "initWithItemUpdater:home:", v6, v5);
      objc_msgSend(v8, "addObject:", v25);

    }
  }
  objc_msgSend(WeakRetained, "topic");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topicName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqualToString:", v28);

  if (v29)
  {
    v30 = -[HUEnergySettingsItemModule initWithItemUpdater:home:]([HUEnergySettingsItemModule alloc], "initWithItemUpdater:home:", v6, v5);
    objc_msgSend(v8, "addObject:", v30);

  }
  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUFaceRecognitionItemModuleController *v5;
  uint64_t v6;
  HUAnnounceSettingsItemModuleController *v7;
  HUSafetyAndSecuritySettingsItemModuleController *v8;
  HUEnergySettingsItemModuleController *v9;
  HUUserNotificationTopicServiceListModuleController *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[HUItemModuleController initWithModule:]([HUFaceRecognitionItemModuleController alloc], "initWithModule:", v4);
    -[HUUserNotificationTopicServiceListViewController setFaceRecognitionModuleController:](self, "setFaceRecognitionModuleController:", v5);

    -[HUUserNotificationTopicServiceListViewController faceRecognitionModuleController](self, "faceRecognitionModuleController");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[HUItemModuleController initWithModule:]([HUAnnounceSettingsItemModuleController alloc], "initWithModule:", v4);
      -[HUUserNotificationTopicServiceListViewController setAnnounceSettingsModuleController:](self, "setAnnounceSettingsModuleController:", v7);

      -[HUUserNotificationTopicServiceListViewController announceSettingsModuleController](self, "announceSettingsModuleController");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = -[HUSafetyAndSecuritySettingsItemModuleController initWithModule:delegate:]([HUSafetyAndSecuritySettingsItemModuleController alloc], "initWithModule:delegate:", v4, self);
        -[HUUserNotificationTopicServiceListViewController setSafetyAndSecuritySettingsItemModuleController:](self, "setSafetyAndSecuritySettingsItemModuleController:", v8);

        -[HUUserNotificationTopicServiceListViewController safetyAndSecuritySettingsItemModuleController](self, "safetyAndSecuritySettingsItemModuleController");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = -[HUItemModuleController initWithModule:]([HUEnergySettingsItemModuleController alloc], "initWithModule:", v4);
          -[HUUserNotificationTopicServiceListViewController setEnergySettingsModuleController:](self, "setEnergySettingsModuleController:", v9);

          -[HUUserNotificationTopicServiceListViewController energySettingsModuleController](self, "energySettingsModuleController");
          v6 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[HUUserNotificationTopicServiceListViewController buildSwiftItemModuleControllerForModule:](self, "buildSwiftItemModuleControllerForModule:", v4);
            v6 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              NSLog(CFSTR("Unexpected module %@"), v4);
            v10 = -[HUItemModuleController initWithModule:]([HUUserNotificationTopicServiceListModuleController alloc], "initWithModule:", v4);
            -[HUUserNotificationTopicServiceListViewController setModuleController:](self, "setModuleController:", v10);

            -[HUUserNotificationTopicServiceListViewController moduleController](self, "moduleController");
            v6 = objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
  v11 = (void *)v6;

  return v11;
}

- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  HUUserNotificationTopicServiceListViewController *v16;
  BOOL v17;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke;
  v18[3] = &unk_1E6F4E900;
  v18[4] = self;
  v19 = v6;
  v8 = v6;
  __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke((uint64_t)v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke_2;
  v14[3] = &unk_1E6F4C990;
  v15 = v9;
  v16 = self;
  v17 = a4;
  v11 = v9;
  objc_msgSend(v10, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_characteristicValueManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = *(id *)(a1 + 40);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D317D0], "serviceItemForService:valueSource:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v9 = *(id *)(a1 + 40);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31228]), "initWithProfile:valueSource:", v11, v4);
    }
    else
    {
      NSLog(CFSTR("Unexpected object type %@"), *(_QWORD *)(a1 + 40));
      v8 = 0;
    }

  }
  return v8;
}

id __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "moduleController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "showNotificationSettingsForServiceLikeItem:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)presentHH2OnboardingForHome:(id)a3 withDevices:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[HUUserNotificationTopicServiceListViewController presentHH2OnboardingForHome:withDevices:]";
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%s Now starting HH2 onboarding...", (uint8_t *)&v11, 0xCu);
  }

  +[HUHomeFeatureOnboardingUtilities home:onboardHomeHub2FromPresentingViewController:devices:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardHomeHub2FromPresentingViewController:devices:usageOptions:", v7, self, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v9, "flatMap:", &__block_literal_global_28);
}

uint64_t __92__HUUserNotificationTopicServiceListViewController_presentHH2OnboardingForHome_withDevices___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)dismissToHomeSettings
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUUserNotificationTopicServiceListViewController parentViewController](self, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[HUUserNotificationTopicServiceListViewController dismissToHomeSettings]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%s Dismissing to Home Settings ... using navController = %@", (uint8_t *)&v9, 0x16u);

  }
  objc_opt_class();
  -[HUUserNotificationTopicServiceListViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v12;
  HUUserNotificationTopicServiceListViewController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "openURL:", v7);

  return 0;
}

- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a4;
  if (-[HUUserNotificationTopicServiceListViewController _shouldShowFaceRecognition](self, "_shouldShowFaceRecognition"))
  {
    -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __121__HUUserNotificationTopicServiceListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke;
    v15[3] = &unk_1E6F4E968;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v18 = a5;
    objc_msgSend(v10, "flatMap:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

id __121__HUUserNotificationTopicServiceListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "faceRecognitionModuleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentFaceRecognitionPersonSettingsForPerson:personManager:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = a3;
  if (-[HUUserNotificationTopicServiceListViewController _shouldShowFaceRecognition](self, "_shouldShowFaceRecognition"))
  {
    -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __122__HUUserNotificationTopicServiceListViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke;
    v12[3] = &unk_1E6F4C990;
    v12[4] = self;
    v13 = v6;
    v14 = a4;
    objc_msgSend(v7, "flatMap:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

id __122__HUUserNotificationTopicServiceListViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "faceRecognitionModuleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_shouldShowFaceRecognition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  char v9;
  char v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserNotificationTopicServiceListViewController topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D319A8], "_cameraTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v4, "hf_isFaceRecognitionAvailable");
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v12 = CFSTR("Showing");
      else
        v12 = CFSTR("Not showing");
      -[HUUserNotificationTopicServiceListViewController topic](self, "topic");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@ face recognition settings for topic %@", (uint8_t *)&v15, 0x16u);

    }
    v10 = v8 | v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (HUUserNotificationTopicServiceListModuleController)moduleController
{
  return self->_moduleController;
}

- (void)setModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_moduleController, a3);
}

- (HUAnnounceSettingsItemModuleController)announceSettingsModuleController
{
  return self->_announceSettingsModuleController;
}

- (void)setAnnounceSettingsModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_announceSettingsModuleController, a3);
}

- (HUSafetyAndSecuritySettingsItemModuleController)safetyAndSecuritySettingsItemModuleController
{
  return self->_safetyAndSecuritySettingsItemModuleController;
}

- (void)setSafetyAndSecuritySettingsItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_safetyAndSecuritySettingsItemModuleController, a3);
}

- (HUFaceRecognitionItemModuleController)faceRecognitionModuleController
{
  return self->_faceRecognitionModuleController;
}

- (void)setFaceRecognitionModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_faceRecognitionModuleController, a3);
}

- (HUEnergySettingsItemModuleController)energySettingsModuleController
{
  return self->_energySettingsModuleController;
}

- (void)setEnergySettingsModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_energySettingsModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energySettingsModuleController, 0);
  objc_storeStrong((id *)&self->_faceRecognitionModuleController, 0);
  objc_storeStrong((id *)&self->_safetyAndSecuritySettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_announceSettingsModuleController, 0);
  objc_storeStrong((id *)&self->_moduleController, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
