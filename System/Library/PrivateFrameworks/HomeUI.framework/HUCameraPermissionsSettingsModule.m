@implementation HUCameraPermissionsSettingsModule

- (HUCameraPermissionsSettingsModule)initWithItemUpdater:(id)a3 home:(id)a4 displayStyle:(unint64_t)a5
{
  id v9;
  id v10;
  HUCameraPermissionsSettingsModule *v11;
  HUCameraPermissionsSettingsModule *v12;
  NSArray *userSectionModules;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraPermissionsSettingsModule.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  v16.receiver = self;
  v16.super_class = (Class)HUCameraPermissionsSettingsModule;
  v11 = -[HFItemModule initWithItemUpdater:](&v16, sel_initWithItemUpdater_, v9);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    userSectionModules = v12->_userSectionModules;
    v12->_userSectionModules = (NSArray *)MEMORY[0x1E0C9AA60];

    v12->_displayStyle = a5;
    -[HUCameraPermissionsSettingsModule _buildItemProviders](v12, "_buildItemProviders");
  }

  return v12;
}

- (HUCameraPermissionsSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_displayStyle_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraPermissionsSettingsModule.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraPermissionsSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUCameraPermissionsSettingsModule headerItemProvider](self, "headerItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (unint64_t)accessModeSettingForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[HUCameraPermissionsSettingsModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "camerasAccessLevel");
  return v7;
}

- (void)_buildItemProviders
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];

  v4 = objc_alloc(MEMORY[0x1E0D31848]);
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke;
  v26[3] = &unk_1E6F4D018;
  v26[4] = self;
  __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke((uint64_t)v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithItems:", v6);
  -[HUCameraPermissionsSettingsModule setHeaderItemProvider:](self, "setHeaderItemProvider:", v7);

  -[HUCameraPermissionsSettingsModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_allNonOwnerUsers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_2;
    v24[3] = &unk_1E6F4D040;
    v25 = v8;
    objc_msgSend(v9, "na_filter:", v24);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_3;
  v23[3] = &unk_1E6F4D068;
  v23[4] = self;
  objc_msgSend(v9, "na_map:", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPermissionsSettingsModule setUserSectionModules:](self, "setUserSectionModules:", v11);

  v12 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraPermissionsSettingsModule expandableModules](self, "expandableModules");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_flatMap:", &__block_literal_global_11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPermissionsSettingsModule headerItemProvider](self, "headerItemProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setByAddingObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraPermissionsSettingsModule setItemProviders:](self, "setItemProviders:", v17);

  v18 = (void *)MEMORY[0x1E0D314C0];
  -[HUCameraPermissionsSettingsModule itemProviders](self, "itemProviders");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "requestToReloadItemProviders:senderSelector:", v19, a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "performItemUpdateRequest:", v20);

}

id __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraPermissionsSettingsHeader_Title"), CFSTR("HUCameraPermissionsSettingsHeader_Title"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraPermissionsSettingsHeader_Body"), CFSTR("HUCameraPermissionsSettingsHeader_Body"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HUCameraBuildHeaderAttributedString(2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D31840]);
  v6 = *MEMORY[0x1E0D30BF8];
  v15[0] = v4;
  v7 = *MEMORY[0x1E0D30D70];
  v14[0] = v6;
  v14[1] = v7;
  v8 = objc_msgSend(*(id *)(a1 + 32), "displayStyle");
  v9 = MEMORY[0x1E0C9AAB0];
  if (v8 == 2)
    v9 = MEMORY[0x1E0C9AAA0];
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithResults:", v10);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_userIsRestrictedGuest:", a2) ^ 1;
}

HUCameraUserPermissionsSettingsModule *__56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  HUCameraUserPermissionsSettingsModule *v4;
  void *v5;
  void *v6;
  HUCameraUserPermissionsSettingsModule *v7;

  v3 = a2;
  v4 = [HUCameraUserPermissionsSettingsModule alloc];
  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUCameraUserPermissionsSettingsModule initWithItemUpdater:user:home:](v4, "initWithItemUpdater:user:home:", v5, v3, v6);

  return v7;
}

uint64_t __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemProviders");
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PermissionsOptionsHeader"));
  -[HUCameraPermissionsSettingsModule headerItemProvider](self, "headerItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v8);

  v9 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HUCameraPermissionsSettingsModule expandableModules](self, "expandableModules", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "buildSectionsWithDisplayedItems:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "na_flatMap:", &__block_literal_global_30_0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PermissionsOptions"));
  objc_msgSend(v17, "setItems:", v9);
  v18 = (void *)MEMORY[0x1E0D314B0];
  v26[0] = v5;
  v26[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filterSections:toDisplayedItems:", v19, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __69__HUCameraPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

- (id)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCameraPermissionsSettingsModule expandableModules](self, "expandableModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HUCameraPermissionsSettingsModule_didSelectItem___block_invoke;
  v9[3] = &unk_1E6F4D110;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "na_each:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__HUCameraPermissionsSettingsModule_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_opt_class();
  v9 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  v5 = v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "didSelectItem:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (HMHome)home
{
  return self->_home;
}

- (HFItemProvider)headerItemProvider
{
  return self->_headerItemProvider;
}

- (void)setHeaderItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_headerItemProvider, a3);
}

- (NSArray)userSectionModules
{
  return self->_userSectionModules;
}

- (void)setUserSectionModules:(id)a3
{
  objc_storeStrong((id *)&self->_userSectionModules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSectionModules, 0);
  objc_storeStrong((id *)&self->_headerItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
