@implementation HUUserNotificationTopicListModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  HUUserNotificationTopicListModuleController *v36;
  uint8_t buf[4];
  HUUserNotificationTopicListModuleController *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  objc_msgSend(v9, "setIconDisplayStyle:", 1);
  +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentMetrics:", v10);

  objc_msgSend(v9, "setDisableContinuousIconAnimation:", 1);
  objc_msgSend(v9, "setAccessoryType:", 1);
  objc_msgSend(v9, "setIconForegroundColorFollowsTintColor:", 1);
  objc_opt_class();
  objc_msgSend(v8, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = objc_msgSend(v14, "isSystemImage");
  if (v15)
  {
    v36 = self;
    objc_opt_class();
    v16 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "topic");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accessoryType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "hu_tintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topic");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topicName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqualToString:", v24);

    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      HFLogForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "topic");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "topicName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v38 = v36;
        v39 = 2112;
        v40 = v28;
        v41 = 2112;
        v42 = v30;
        v43 = 2112;
        v44 = v26;
        _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@ Setting new color for %@ to %@", buf, 0x2Au);

      }
    }
    else
    {
      v26 = v21;
    }
    objc_opt_class();
    v31 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
    v33 = v32;

    if (v26)
    {
      objc_msgSend(v33, "categoryType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqual:", *MEMORY[0x1E0CB7A58]);

      if ((v35 & 1) == 0)
      {
        objc_msgSend(v9, "setIconForegroundColor:", v26);
        objc_msgSend(v9, "setIconForegroundColorFollowsTintColor:", 0);
      }
    }

  }
}

- (BOOL)canSelectItem:(id)a3
{
  return 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  __objc2_class *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  id v25;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bridgesItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HomeHubsAndBridgesHelper createHomeHubsAndBridgesListViewHostingControllerWithHome:](_TtC6HomeUI24HomeHubsAndBridgesHelper, "createHomeHubsAndBridgesListViewHostingControllerWithHome:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUItemModuleController module](self, "module");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "networkRoutersListItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "isEqual:", v12);

    if (v13)
    {
      v14 = HUNetworkRouterSettingsViewController;
    }
    else
    {
      -[HUItemModuleController module](self, "module");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "speakerSettingsItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v4, "isEqual:", v16);

      if (!v17)
      {
        -[HUItemModuleController module](self, "module");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "topicForItem:", v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = -[HUUserNotificationTopicListModuleController presentNotificationSettingsForTopic:animated:](self, "presentNotificationSettingsForTopic:animated:", v19, 1);
        goto LABEL_9;
      }
      v14 = HUMediaAccessControlEditorTableViewController;
    }
    v18 = [v14 alloc];
    -[HUItemModuleController module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v18, "initWithHome:", v9);
  }
  v19 = (void *)v10;

  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreferredPresentationType:", 1);
  -[HUItemModuleController host](self, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "moduleController:presentViewControllerForRequest:", self, v20);

LABEL_9:
  return 0;
}

- (id)presentNotificationSettingsForTopic:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  HULockCategorySettingsViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  HULockCategorySettingsViewController *v14;
  HUUserNotificationTopicServiceListViewController *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "serviceTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0CB9A80]);

  if (!v8)
  {
    v15 = [HUUserNotificationTopicServiceListViewController alloc];
    -[HUItemModuleController module](self, "module");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HUUserNotificationTopicServiceListViewController initWithHome:topic:](v15, "initWithHome:topic:", v12, v6);
LABEL_6:
    v14 = (HULockCategorySettingsViewController *)v16;
    goto LABEL_7;
  }
  -[HUUserNotificationTopicListModuleController pinCodeManager](self, "pinCodeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [HULockCategorySettingsViewController alloc];
  if (!v9)
  {
    -[HUItemModuleController module](self, "module");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HULockCategorySettingsViewController initWithLockTopic:home:](v10, "initWithLockTopic:home:", v6, v12);
    goto LABEL_6;
  }
  -[HUUserNotificationTopicListModuleController pinCodeManager](self, "pinCodeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HULockCategorySettingsViewController initWithLockTopic:pinCodeManager:home:](v10, "initWithLockTopic:pinCodeManager:home:", v6, v11, v13);

LABEL_7:
  +[HUViewControllerPresentationRequest requestWithViewController:](HUViewControllerPresentationRequest, "requestWithViewController:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPreferredPresentationType:", 1);
  objc_msgSend(v17, "setAnimated:", v4);
  -[HUItemModuleController host](self, "host");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleController:presentViewControllerForRequest:", self, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v4 = a4;
  v6 = a3;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_userNotificationTopicForObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserNotificationTopicListModuleController presentNotificationSettingsForTopic:animated:](self, "presentNotificationSettingsForTopic:animated:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__HUUserNotificationTopicListModuleController_showNotificationSettingsForHomeKitObject_animated___block_invoke;
  v14[3] = &unk_1E6F58958;
  v15 = v6;
  v16 = v4;
  v11 = v6;
  objc_msgSend(v10, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __97__HUUserNotificationTopicListModuleController_showNotificationSettingsForHomeKitObject_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "showNotificationSettingsForHomeKitObject:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end
