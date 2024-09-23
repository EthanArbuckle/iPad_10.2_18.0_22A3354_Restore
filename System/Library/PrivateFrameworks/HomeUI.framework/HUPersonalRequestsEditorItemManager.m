@implementation HUPersonalRequestsEditorItemManager

- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalRequestsEditorItemManager.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPersonalRequestsEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 userItem:(id)a4 onlyShowDeviceSwitches:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  HUPersonalRequestsEditorItemManager *v9;
  uint64_t v10;
  HMHome *homeForUser;
  void *v12;
  void *v13;
  void *v14;
  HUPersonalRequestsDevicesItemModule *v15;
  HUPersonalRequestsDevicesItemModule *prDevicesModule;
  uint64_t v17;
  HULocationDeviceManager *locationDeviceManager;
  objc_super v20;

  v5 = a5;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUPersonalRequestsEditorItemManager;
  v9 = -[HFItemManager initWithDelegate:sourceItem:](&v20, sel_initWithDelegate_sourceItem_, a3, v8);
  if (v9)
  {
    objc_msgSend(v8, "home");
    v10 = objc_claimAutoreleasedReturnValue();
    homeForUser = v9->_homeForUser;
    v9->_homeForUser = (HMHome *)v10;

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_accessorySettingsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[HUPersonalRequestsDevicesItemModule initWithItemUpdater:userItem:home:settingsController:onlyShowDeviceSwitches:]([HUPersonalRequestsDevicesItemModule alloc], "initWithItemUpdater:userItem:home:settingsController:onlyShowDeviceSwitches:", v9, v8, v9->_homeForUser, v14, v5);
    prDevicesModule = v9->_prDevicesModule;
    v9->_prDevicesModule = v15;

    +[HULocationDeviceManager sharedInstance](HULocationDeviceManager, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    locationDeviceManager = v9->_locationDeviceManager;
    v9->_locationDeviceManager = (HULocationDeviceManager *)v17;

    v9->_onlyShowDeviceSwitches = v5;
  }

  return v9;
}

- (HUPersonalRequestsEditorItemManager)initWithDelegate:(id)a3 userItem:(id)a4 accessorySettingItem:(id)a5 module:(id)a6 onlyShowDeviceSwitches:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  HUPersonalRequestsEditorItemManager *v13;
  uint64_t v14;
  HMHome *homeForUser;
  HUPersonalRequestsDevicesItemModule *v16;
  HMHome *v17;
  void *v18;
  uint64_t v19;
  HUPersonalRequestsDevicesItemModule *prDevicesModule;
  objc_super v22;

  v7 = a7;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HUPersonalRequestsEditorItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v22, sel_initWithDelegate_sourceItem_, a3, v11);
  if (v13)
  {
    objc_msgSend(v11, "home");
    v14 = objc_claimAutoreleasedReturnValue();
    homeForUser = v13->_homeForUser;
    v13->_homeForUser = (HMHome *)v14;

    v16 = [HUPersonalRequestsDevicesItemModule alloc];
    v17 = v13->_homeForUser;
    objc_msgSend(v12, "settingsController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HUPersonalRequestsDevicesItemModule initWithItemUpdater:userItem:home:settingsController:onlyShowDeviceSwitches:](v16, "initWithItemUpdater:userItem:home:settingsController:onlyShowDeviceSwitches:", v13, v11, v17, v18, v7);
    prDevicesModule = v13->_prDevicesModule;
    v13->_prDevicesModule = (HUPersonalRequestsDevicesItemModule *)v19;

    v13->_onlyShowDeviceSwitches = v7;
  }

  return v13;
}

- (HMUser)user
{
  void *v2;
  void *v3;

  -[HFItemManager sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMUser *)v3;
}

- (HMAssistantAccessControl)accessControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFItemManager sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsEditorItemManager homeForUser](self, "homeForUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantAccessControlForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAssistantAccessControl *)v6;
}

- (BOOL)_arePersonalRequestsEnabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUPersonalRequestsEditorItemManager homeForUser](self, "homeForUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_currentUserIsOwner");

  -[HUPersonalRequestsEditorItemManager accessControl](self, "accessControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsEditorItemManager prDevicesModule](self, "prDevicesModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedMULanguageCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "hf_effectivelyEnabledForSupportedVoiceRecognitionLanguages:currentUserIsOwner:", v7, v4);

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  HFItem *v9;
  HFItem *activityNotificationsItem;
  void *v11;
  HFStaticItemProvider *v12;
  HFStaticItemProvider *staticItemProvider;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v4 = a3;
  if (-[HUPersonalRequestsEditorItemManager onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_initWeak(&location, self);
    -[HUPersonalRequestsEditorItemManager staticItemProvider](self, "staticItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      v8 = objc_alloc(MEMORY[0x1E0D31840]);
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __66__HUPersonalRequestsEditorItemManager__buildItemProvidersForHome___block_invoke;
      v20 = &unk_1E6F4C4E8;
      objc_copyWeak(&v21, &location);
      v9 = (HFItem *)objc_msgSend(v8, "initWithResultsBlock:", &v17);
      activityNotificationsItem = self->_activityNotificationsItem;
      self->_activityNotificationsItem = v9;

      -[HUPersonalRequestsEditorItemManager activityNotificationsItem](self, "activityNotificationsItem", v17, v18, v19, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      v12 = (HFStaticItemProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v7);
      staticItemProvider = self->_staticItemProvider;
      self->_staticItemProvider = v12;

      objc_destroyWeak(&v21);
    }
    v14 = (void *)MEMORY[0x1E0C99D20];
    -[HUPersonalRequestsEditorItemManager staticItemProvider](self, "staticItemProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithObject:", v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&location);
  }

  return v5;
}

id __66__HUPersonalRequestsEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsActivityNotificationsTitle"), CFSTR("HUUsersPersonalRequestsActivityNotificationsTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "_arePersonalRequestsEnabled") ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D70]);

  objc_msgSend(WeakRetained, "accessControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "areActivityNotificationsEnabledForPersonalRequests"))
    v9 = &unk_1E7041290;
  else
    v9 = &unk_1E70412A8;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30E20]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_buildItemModulesForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99D20];
  -[HUPersonalRequestsEditorItemManager prDevicesModule](self, "prDevicesModule", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUPersonalRequestsEditorItemManager prDevicesModule](self, "prDevicesModule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildSectionsWithDisplayedItems:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    if (!-[HUPersonalRequestsEditorItemManager onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      -[HUPersonalRequestsEditorItemManager activityNotificationsItem](self, "activityNotificationsItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "na_setByIntersectingWithSet:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("kHUEditUserPersonalRequestsRequireAuthSection"));
        objc_msgSend(v12, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setItems:", v14);

        -[HUPersonalRequestsEditorItemManager _updateRequiredAuthSectionFooterForSection:](self, "_updateRequiredAuthSectionFooterForSection:", v13);
        objc_msgSend(v5, "addObject:", v13);

      }
    }
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (BOOL)personalRequestsAuthenticationRequired
{
  void *v2;
  char v3;

  -[HUPersonalRequestsEditorItemManager accessControl](self, "accessControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowUnauthenticatedRequests") ^ 1;

  return v3;
}

- (void)setActivityNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[6];
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Setting activityNotificationsEnabled to: %@", buf, 0xCu);
  }

  -[HUPersonalRequestsEditorItemManager accessControl](self, "accessControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setActivityNotificationsEnabledForPersonalRequests:", v3);
  -[HUPersonalRequestsEditorItemManager _commitUpdateToAccessControl:](self, "_commitUpdateToAccessControl:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__HUPersonalRequestsEditorItemManager_setActivityNotificationsEnabled___block_invoke;
  v12[3] = &unk_1E6F4F960;
  v12[4] = self;
  v12[5] = a2;
  v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v12);

}

void __71__HUPersonalRequestsEditorItemManager_setActivityNotificationsEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0D314C0];
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v2, "activityNotificationsItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestToUpdateItems:senderSelector:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "performItemUpdateRequest:", v6);

}

- (id)_commitUpdateToAccessControl:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  HUPersonalRequestsEditorItemManager *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  HUPersonalRequestsEditorItemManager *v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke;
  v19[3] = &unk_1E6F4FA10;
  v7 = v4;
  v20 = v7;
  v21 = self;
  objc_msgSend(v5, "futureWithErrorOnlyHandlerAdapterBlock:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = 3221225472;
  v15 = __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_32;
  v16 = &unk_1E6F4D188;
  v17 = self;
  v18 = v7;
  v9 = v7;
  v10 = (id)objc_msgSend(v8, "addSuccessBlock:", &v13);
  v11 = (id)objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_166, v13, v14, v15, v16, v17);

  return v8;
}

void __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Committing update to assistant access control: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAssistantAccessControl:forHome:completionHandler:", v7, v8, v3);

}

void __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_2;
  v4[3] = &unk_1E6F4FA38;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "dispatchUserObserverMessage:sender:", v4, 0);

}

void __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "user:didUpdateAssistantAccessControl:forHome:", v4, v5, v6);

  }
}

void __68__HUPersonalRequestsEditorItemManager__commitUpdateToAccessControl___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

- (void)_updateRequiredAuthSectionFooterForSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUPersonalRequestsEditorItemManager locationDeviceManager](self, "locationDeviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeLocationDeviceFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__HUPersonalRequestsEditorItemManager__updateRequiredAuthSectionFooterForSection___block_invoke;
  v9[3] = &unk_1E6F58B00;
  v10 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

}

void __82__HUPersonalRequestsEditorItemManager__updateRequiredAuthSectionFooterForSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a2)
  {
    objc_msgSend(a2, "name");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUsersPersonalRequestsActivityNotificationsFooterItem"), CFSTR("%@"), v3, v4, v5, v6, v7, v8, (uint64_t)v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFooterTitle:", v9);

  }
}

- (HUPersonalRequestsDevicesItemModule)prDevicesModule
{
  return self->_prDevicesModule;
}

- (void)setPrDevicesModule:(id)a3
{
  objc_storeStrong((id *)&self->_prDevicesModule, a3);
}

- (void)setPersonalRequestsAuthenticationRequired:(BOOL)a3
{
  self->_personalRequestsAuthenticationRequired = a3;
}

- (HFItem)activityNotificationsItem
{
  return self->_activityNotificationsItem;
}

- (BOOL)activityNotificationsEnabled
{
  return self->_activityNotificationsEnabled;
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (void)setLocationDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationDeviceManager, a3);
}

- (BOOL)onlyShowDeviceSwitches
{
  return self->_onlyShowDeviceSwitches;
}

- (void)setOnlyShowDeviceSwitches:(BOOL)a3
{
  self->_onlyShowDeviceSwitches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_activityNotificationsItem, 0);
  objc_storeStrong((id *)&self->_prDevicesModule, 0);
}

@end
