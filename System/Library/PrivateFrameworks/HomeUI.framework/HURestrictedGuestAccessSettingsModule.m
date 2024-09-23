@implementation HURestrictedGuestAccessSettingsModule

- (HURestrictedGuestAccessSettingsModule)initWithItemUpdater:(id)a3 home:(id)a4 accessoryToAdd:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HURestrictedGuestAccessSettingsModule *v13;
  HURestrictedGuestAccessSettingsModule *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestAccessSettingsModule.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestAccessSettingsModule.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryToAdd != nil"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HURestrictedGuestAccessSettingsModule;
  v13 = -[HFItemModule initWithItemUpdater:](&v18, sel_initWithItemUpdater_, v9);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_accessoryToAdd, a5);
    -[HURestrictedGuestAccessSettingsModule _buildItemProviders](v14, "_buildItemProviders");
  }

  return v14;
}

- (HURestrictedGuestAccessSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURestrictedGuestAccessSettingsModule.m"), 40, CFSTR("%s is unavailable; use %@ instead"),
    "-[HURestrictedGuestAccessSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HURestrictedGuestAccessSettingsModule transformedUserItemProvider](self, "transformedUserItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HURestrictedGuestAccessSettingsModule transformedUserItemProvider](self, "transformedUserItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intersectsSet:", v4);

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HURestrictedGuestAccessSettingsUserItemSectionIdentifier"));
    -[HURestrictedGuestAccessSettingsModule transformedUserItemProvider](self, "transformedUserItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_userItemComparator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__HURestrictedGuestAccessSettingsModule_buildSectionsWithDisplayedItems___block_invoke;
    v17[3] = &unk_1E6F4DAD8;
    v18 = v4;
    objc_msgSend(v14, "na_filter:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItems:", v15);

    objc_msgSend(v5, "addObject:", v9);
  }

  return v5;
}

uint64_t __73__HURestrictedGuestAccessSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)enableRestrictedGuestAccessSetting:(BOOL)a3 forItem:(id)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t buf[4];
  HURestrictedGuestAccessSettingsModule *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v4 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v44 = self;
    v45 = 2112;
    v46 = v9;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Inside enableRestrictedGuestAccessSetting...", buf, 0x16u);

  }
  -[HURestrictedGuestAccessSettingsModule home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "homeAccessControlForUser:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v12, "restrictedGuestAccessSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessAllowedToAccessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithSet:", v15);

  -[HURestrictedGuestAccessSettingsModule accessoryToAdd](self, "accessoryToAdd");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "na_safeContainsObject:", v17);

  if (v4)
  {
    if ((v18 & 1) != 0)
      goto LABEL_9;
    -[HURestrictedGuestAccessSettingsModule accessoryToAdd](self, "accessoryToAdd");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "na_safeAddObject:", v19);
  }
  else
  {
    if (!v18)
      goto LABEL_9;
    -[HURestrictedGuestAccessSettingsModule accessoryToAdd](self, "accessoryToAdd");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v19);
  }

LABEL_9:
  objc_msgSend(v12, "restrictedGuestAccessSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(v21, "setAccessAllowedToAccessories:", v16);
  HFLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v44 = self;
    v45 = 2112;
    v46 = v23;
    v47 = 2112;
    v48 = v16;
    _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating allowed accessories to: %@", buf, 0x20u);

  }
  v24 = (void *)MEMORY[0x1E0D519C0];
  v25 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke;
  v40[3] = &unk_1E6F4D600;
  v41 = v12;
  v42 = v21;
  v26 = v21;
  v27 = v12;
  objc_msgSend(v24, "futureWithBlock:", v40);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v25;
  v37[1] = 3221225472;
  v37[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_21;
  v37[3] = &unk_1E6F4D188;
  v29 = v11;
  v38 = v29;
  v39 = v10;
  v30 = v10;
  v31 = (id)objc_msgSend(v28, "addSuccessBlock:", v37);
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_2_28;
  v35[3] = &unk_1E6F4E2D8;
  v36 = v29;
  v32 = v29;
  v33 = (id)objc_msgSend(v28, "addFailureBlock:", v35);

  return v28;
}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E6F4E2D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "updateRestrictedGuestSettings:completionHandler:", v4, v7);

}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[HURestrictedGuestAccessSettingsModule enableRestrictedGuestAccessSetting:forItem:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Finished attempt to update guest access settings with error %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v5, "finishWithError:", v3);
  else
    objc_msgSend(v5, "finishWithNoResult");

}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v9 = "-[HURestrictedGuestAccessSettingsModule enableRestrictedGuestAccessSetting:forItem:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Successfully updated allowed accessories for %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_23;
  v5[3] = &unk_1E6F4F418;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v5, 0);

}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didUpdateAccessControlForUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __84__HURestrictedGuestAccessSettingsModule_enableRestrictedGuestAccessSetting_forItem___block_invoke_2_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[HURestrictedGuestAccessSettingsModule enableRestrictedGuestAccessSetting:forItem:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to update allowed accessories for %@ with error: %@.", (uint8_t *)&v6, 0x20u);
  }

}

+ (id)_userItemComparator
{
  return &__block_literal_global_98;
}

uint64_t __60__HURestrictedGuestAccessSettingsModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30ED8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "type") || !objc_msgSend(v10, "type"))
  {
    if (objc_msgSend(v8, "type") && !objc_msgSend(v10, "type"))
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
      v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v4, v5);

    }
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (void)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = objc_alloc(MEMORY[0x1E0D31990]);
  -[HURestrictedGuestAccessSettingsModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);

  objc_msgSend(v5, "setIncludeGuestUsers:", 1);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke;
  v11[3] = &unk_1E6F4DD60;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "setFilter:", v11);
  v7 = objc_alloc(MEMORY[0x1E0D31928]);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke_2;
  v9[3] = &unk_1E6F53850;
  objc_copyWeak(&v10, &location);
  v8 = (void *)objc_msgSend(v7, "initWithSourceProvider:transformationBlock:", v5, v9);
  -[HURestrictedGuestAccessSettingsModule setTransformedUserItemProvider:](self, "setTransformedUserItemProvider:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

uint64_t __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(WeakRetained, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_userIsRestrictedGuest:", v7);

  return v9;
}

id __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_alloc(MEMORY[0x1E0D31920]);
  v7 = (void *)objc_msgSend(v3, "copy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke_3;
  v11[3] = &unk_1E6F50430;
  objc_copyWeak(&v13, v4);
  v8 = v3;
  v12 = v8;
  v9 = (void *)objc_msgSend(v6, "initWithSourceItem:transformationBlock:", v7, v11);

  objc_destroyWeak(&v13);
  return v9;
}

id __60__HURestrictedGuestAccessSettingsModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_opt_class();
  v7 = *(id *)(a1 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(WeakRetained, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeAccessControlForUser:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "restrictedGuestAccessSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessAllowedToAccessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "accessoryToAdd");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_safeContainsObject:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30E20]);

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HMAccessory)accessoryToAdd
{
  return self->_accessoryToAdd;
}

- (HFTransformItemProvider)transformedUserItemProvider
{
  return self->_transformedUserItemProvider;
}

- (void)setTransformedUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_transformedUserItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformedUserItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryToAdd, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
