@implementation HUCameraUserPermissionsSettingsModule

- (HUCameraUserPermissionsSettingsModule)initWithItemUpdater:(id)a3 user:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HUCameraUserPermissionsSettingsModule *v13;
  HUCameraUserPermissionsSettingsModule *v14;
  void *v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraUserPermissionsSettingsModule.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user != nil && home != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HUCameraUserPermissionsSettingsModule;
  v13 = -[HFItemModule initWithItemUpdater:](&v17, sel_initWithItemUpdater_, v9);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_user, a4);
    objc_storeStrong((id *)&v14->_home, a5);
    -[HUCameraUserPermissionsSettingsModule _buildItemProvider](v14, "_buildItemProvider");
  }

  return v14;
}

- (HUCameraUserPermissionsSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_user_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraUserPermissionsSettingsModule.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraUserPermissionsSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (unint64_t)userAccessLevelSetting
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HUCameraUserPermissionsSettingsModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUserPermissionsSettingsModule user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "camerasAccessLevel");

  return v6;
}

- (id)updateUserAccessLevelSetting:(unint64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[5];
  id v13[2];
  id location;

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0D519C0];
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke;
  v12[3] = &unk_1E6F5BF78;
  v12[4] = self;
  v13[1] = (id)a3;
  objc_copyWeak(v13, &location);
  objc_msgSend(v6, "futureWithBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke_3;
  v11[3] = &unk_1E6F4F960;
  v11[4] = self;
  v11[5] = a2;
  objc_msgSend(v8, "addCompletionBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v9;
}

void __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAccessControlForUser:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke_2;
  v9[3] = &unk_1E6F5BF50;
  v8 = v3;
  v10 = v8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  objc_msgSend(v6, "updateCamerasAccessLevel:completionHandler:", v7, v9);

  objc_destroyWeak(&v11);
}

void __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dispatchUpdateForHome:user:", v2, v3);

}

void __70__HUCameraUserPermissionsSettingsModule_updateUserAccessLevelSetting___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(*(id *)(a1 + 32), "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToReloadItemProviders:senderSelector:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v4);

}

- (void)_dispatchUpdateForHome:(id)a3 user:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__HUCameraUserPermissionsSettingsModule__dispatchUpdateForHome_user___block_invoke;
  v10[3] = &unk_1E6F4F418;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "dispatchHomeObserverMessage:sender:", v10, 0);

}

uint64_t __69__HUCameraUserPermissionsSettingsModule__dispatchUpdateForHome_user___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "home:didUpdateAccessControlForUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUCameraSettingResultKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[HUCameraUserPermissionsSettingsModule accessLevelSettingItemProvider](self, "accessLevelSettingItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v4);

  if (v10)
    -[HUCameraUserPermissionsSettingsModule updateUserAccessLevelSetting:](self, "updateUserAccessLevelSetting:", v7);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraUserPermissionsSettingsModule itemProvider](self, "itemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_buildItemProvider
{
  id v3;
  void *v4;
  void *v5;
  HFItem *v6;
  HFItem *showOptionsItem;
  HUCameraAccessLevelOptionItemProvider *v8;
  void *v9;
  void *v10;
  HUCameraAccessLevelOptionItemProvider *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = objc_alloc(MEMORY[0x1E0D31980]);
  -[HUCameraUserPermissionsSettingsModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUserPermissionsSettingsModule user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (HFItem *)objc_msgSend(v3, "initWithHome:user:nameStyle:", v4, v5, 2);
  showOptionsItem = self->_showOptionsItem;
  self->_showOptionsItem = v6;

  v8 = [HUCameraAccessLevelOptionItemProvider alloc];
  -[HUCameraUserPermissionsSettingsModule user](self, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUserPermissionsSettingsModule home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUCameraAccessLevelOptionItemProvider initWithUser:home:](v8, "initWithUser:home:", v9, v10);
  -[HUCameraUserPermissionsSettingsModule setAccessLevelSettingItemProvider:](self, "setAccessLevelSettingItemProvider:", v11);

  -[HUCameraUserPermissionsSettingsModule accessLevelSettingItemProvider](self, "accessLevelSettingItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "reloadItems");

  -[HUCameraUserPermissionsSettingsModule accessLevelSettingItemProvider](self, "accessLevelSettingItemProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUserPermissionsSettingsModule setOptionItems:](self, "setOptionItems:", v16);

  v17 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraUserPermissionsSettingsModule optionItems](self, "optionItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraUserPermissionsSettingsModule showOptionsItem](self, "showOptionsItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setByAddingObject:", v20);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v22);
  -[HUCameraUserPermissionsSettingsModule setItemProvider:](self, "setItemProvider:", v21);

}

- (id)buildSectionsWithDisplayedItems:(id)a3
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
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D31570]);
  -[HUCameraUserPermissionsSettingsModule user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:", v7);

  v9 = (void *)MEMORY[0x1E0C99DE8];
  -[HUCameraUserPermissionsSettingsModule showOptionsItem](self, "showOptionsItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUExpandableItemModule showOptions](self, "showOptions"))
  {
    -[HUCameraUserPermissionsSettingsModule optionItems](self, "optionItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_227);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObjectsFromArray:", v13);
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__HUCameraUserPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke_3;
  v18[3] = &unk_1E6F4DAD8;
  v19 = v4;
  v14 = v4;
  objc_msgSend(v11, "na_filter:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v15);

  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __73__HUCameraUserPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30DA8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30DA8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = -1;
  else
    v10 = v9 != 0;
  if (v7)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
    v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

uint64_t __73__HUCameraUserPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)showOptionsItem
{
  return self->_showOptionsItem;
}

- (HMUser)user
{
  return self->_user;
}

- (HMHome)home
{
  return self->_home;
}

- (HUCameraAccessLevelOptionItemProvider)accessLevelSettingItemProvider
{
  return self->_accessLevelSettingItemProvider;
}

- (void)setAccessLevelSettingItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessLevelSettingItemProvider, a3);
}

- (HFStaticItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (NSArray)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
  objc_storeStrong((id *)&self->_optionItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionItems, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_accessLevelSettingItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_showOptionsItem, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
