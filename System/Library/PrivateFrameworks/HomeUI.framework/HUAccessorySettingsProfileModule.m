@implementation HUAccessorySettingsProfileModule

- (HUAccessorySettingsProfileModule)initWithItemUpdater:(id)a3 settingGroupItem:(id)a4
{
  id v7;
  HUAccessorySettingsProfileModule *v8;
  HUAccessorySettingsProfileModule *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HFAccessorySettingManagedConfigurationAdapter *adapter;
  HUAccessorySettingsProfileItemProvider *v14;
  HFAccessorySettingManagedConfigurationAdapter *v15;
  void *v16;
  uint64_t v17;
  HUAccessorySettingsProfileItemProvider *profileItemProvider;
  objc_super v20;

  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUAccessorySettingsProfileModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v20, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_settingGroupItem, a4);
    objc_msgSend(v7, "homeKitSettingsVendor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_settingsAdapterManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "adapterForIdentifier:", *MEMORY[0x1E0D30130]);
    v12 = objc_claimAutoreleasedReturnValue();
    adapter = v9->_adapter;
    v9->_adapter = (HFAccessorySettingManagedConfigurationAdapter *)v12;

    v14 = [HUAccessorySettingsProfileItemProvider alloc];
    v15 = v9->_adapter;
    objc_msgSend(v7, "settingGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HUAccessorySettingsProfileItemProvider initWithAdapter:settingGroup:](v14, "initWithAdapter:settingGroup:", v15, v16);
    profileItemProvider = v9->_profileItemProvider;
    v9->_profileItemProvider = (HUAccessorySettingsProfileItemProvider *)v17;

    -[HFAccessorySettingManagedConfigurationAdapter addProfileObserver:](v9->_adapter, "addProfileObserver:", v9);
  }

  return v9;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUAccessorySettingsProfileModule profileItemProvider](self, "profileItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void **v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  void *v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_122);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("!!!ProfileZone!!!!"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUMobileDeviceManagement"), CFSTR("HUMobileDeviceManagement"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHeaderTitle:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("ManagedZone"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUConfigurationProfile"), CFSTR("HUConfigurationProfile"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHeaderTitle:", v9);

    v10 = objc_opt_class();
    v11 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_3;
    v25[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v25[4] = v10;
    objc_msgSend(v5, "na_filter:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v12);

    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_4;
    v24[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v24[4] = v10;
    objc_msgSend(v5, "na_filter:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItems:", v13);

    objc_msgSend(v6, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    objc_msgSend(v8, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v18 = v17;
    if (v15)
    {
      if (v17)
      {
        v28[0] = v6;
        v28[1] = v8;
        v19 = (void *)MEMORY[0x1E0C99D20];
        v20 = (void **)v28;
        v21 = 2;
      }
      else
      {
        v27 = v6;
        v19 = (void *)MEMORY[0x1E0C99D20];
        v20 = &v27;
        v21 = 1;
      }
      objc_msgSend(v19, "arrayWithObjects:count:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      if (v18)
      {
        v26 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0C9AA60];
      }
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v22;
}

uint64_t __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30D18]);
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

uint64_t __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isManagedByProfileService");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __68__HUAccessorySettingsProfileModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isManagedByProfileService") ^ 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)promptForRemoveProfileItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v5 = a3;
  -[HUAccessorySettingsProfileModule delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    NSLog(CFSTR("No Delegate! Something has gone awry."));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsProfileModule.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileItem"));

  }
  objc_initWeak(&location, self);
  -[HUAccessorySettingsProfileModule delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settingsProfileModule:wantsProfileItemDeleted:", self, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__HUAccessorySettingsProfileModule_promptForRemoveProfileItem___block_invoke;
  v13[3] = &unk_1E6F52C20;
  objc_copyWeak(&v15, &location);
  v9 = v5;
  v14 = v9;
  objc_msgSend(v8, "addCompletionBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

void __63__HUAccessorySettingsProfileModule_promptForRemoveProfileItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7)
  {
    if ((objc_msgSend(v7, "na_isCancelledError") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleError:", v7);

    }
  }
  else
  {
    v6 = (id)objc_msgSend(WeakRetained, "_actuallyRemoveProfileItem:", *(_QWORD *)(a1 + 32));
  }

}

- (id)_actuallyRemoveProfileItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsProfileModule.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profileItem"));

  }
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0D314C0];
  -[HUAccessorySettingsProfileModule itemProviders](self, "itemProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestToReloadItemProviders:senderSelector:", v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAccessorySettingsProfileModule adapter](self, "adapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeProfileFromHomeKit:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__HUAccessorySettingsProfileModule__actuallyRemoveProfileItem___block_invoke;
  v16[3] = &unk_1E6F52C20;
  objc_copyWeak(&v18, &location);
  v12 = v8;
  v17 = v12;
  objc_msgSend(v11, "addCompletionBlock:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

void __63__HUAccessorySettingsProfileModule__actuallyRemoveProfileItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleError:", v7);
  }
  else
  {
    objc_msgSend(WeakRetained, "itemUpdater");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "performItemUpdateRequest:", *(_QWORD *)(a1 + 32));
  }

}

- (void)managedConfigurationAdapterSettingsWereUpdated:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0D314C0];
  -[HUAccessorySettingsProfileModule itemProviders](self, "itemProviders", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v9);

}

- (HUAccessorySettingsProfileModuleDelegate)delegate
{
  return (HUAccessorySettingsProfileModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFAccessorySettingGroupItem)settingGroupItem
{
  return self->_settingGroupItem;
}

- (HFAccessorySettingManagedConfigurationAdapter)adapter
{
  return self->_adapter;
}

- (HUAccessorySettingsProfileItemProvider)profileItemProvider
{
  return self->_profileItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileItemProvider, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_settingGroupItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
