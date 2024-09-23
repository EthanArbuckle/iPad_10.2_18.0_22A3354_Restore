@implementation HUUpdateListeningHistorySettingsItemModule

- (HUUpdateListeningHistorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 user:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HUUpdateListeningHistorySettingsItemModule *v13;
  HUUpdateListeningHistorySettingsItemModule *v14;
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUpdateListeningHistorySettingsItemModule.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUpdateListeningHistorySettingsItemModule.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user != nil"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HUUpdateListeningHistorySettingsItemModule;
  v13 = -[HFItemModule initWithItemUpdater:](&v18, sel_initWithItemUpdater_, v9);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_user, a5);
    -[HUUpdateListeningHistorySettingsItemModule _buildItemProviders](v14, "_buildItemProviders");
  }

  return v14;
}

- (HUUpdateListeningHistorySettingsItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUpdateListeningHistorySettingsItemModule.m"), 49, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUUpdateListeningHistorySettingsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUUpdateListeningHistorySettingsItemModule mediaDeviceItemProvider](self, "mediaDeviceItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUpdateListeningHistorySettingsItemModule otherDeviceItemProvider](self, "otherDeviceItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUUpdateListeningHistoryDeviceItemSectionIdentifier"));
  v6 = (void *)objc_opt_new();
  -[HUUpdateListeningHistorySettingsItemModule mediaDeviceItemProvider](self, "mediaDeviceItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeAddObjectsFromArray:", v9);

  -[HUUpdateListeningHistorySettingsItemModule otherDeviceItemProvider](self, "otherDeviceItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeAddObjectsFromArray:", v12);

  _HULocalizedStringWithDefaultValue(CFSTR("HUUpdateListeningHistoryDeviceSectionTitle"), CFSTR("HUUpdateListeningHistoryDeviceSectionTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderTitle:", v13);

  HFLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v14, "stringByAppendingString:", CFSTR(" "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithString:", v17);

  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  v32 = *MEMORY[0x1E0CEA0C0];
  objc_msgSend(MEMORY[0x1E0D31970], "musicPrivacyURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithString:attributes:", v15, v21);
  objc_msgSend(v18, "appendAttributedString:", v22);

  objc_msgSend(v5, "setAttributedFooterTitle:", v18);
  v23 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend((id)objc_opt_class(), "_ulhDeviceItemComparator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sortedArrayUsingComparator:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __78__HUUpdateListeningHistorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v30[3] = &unk_1E6F4DAD8;
  v31 = v4;
  v26 = v4;
  objc_msgSend(v25, "na_filter:", v30);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v27);

  objc_msgSend(v29, "addObject:", v5);
  return v29;
}

uint64_t __78__HUUpdateListeningHistorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)setUpdateListeningHistorySetting:(BOOL)a3 forItem:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  HUUpdateListeningHistorySettingsItemModule *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  _BYTE v41[14];
  __int16 v42;
  void *v43;
  uint64_t v44;

  v4 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[HUUpdateListeningHistorySettingsItemModule user](self, "user");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v41 = v4;
    *(_WORD *)&v41[4] = 2112;
    *(_QWORD *)&v41[6] = v6;
    v42 = 2112;
    v43 = v8;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "setUpdateListeningHistorySetting enable? %{BOOL}d for item %@ user %@", buf, 0x1Cu);

  }
  objc_opt_class();
  objc_msgSend(v6, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v6, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  -[HUUpdateListeningHistorySettingsItemModule user](self, "user");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUpdateListeningHistorySettingsItemModule home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userListeningHistoryUpdateControlForHome:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v17, "accessories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v41 = v19;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "updateListeningHistoryUpdateControl accessories %@", buf, 0xCu);

  }
  v20 = (void *)objc_msgSend(v17, "mutableCopy");
  if (v14)
  {
    objc_msgSend(v14, "accessory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v20, "addAccessory:", v21);
    else
      objc_msgSend(v20, "removeAccessory:", v21);
LABEL_27:

    v27 = (void *)MEMORY[0x1E0D519C0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __87__HUUpdateListeningHistorySettingsItemModule_setUpdateListeningHistorySetting_forItem___block_invoke;
    v32[3] = &unk_1E6F4D600;
    v33 = v20;
    v34 = self;
    objc_msgSend(v27, "futureWithBlock:", v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  if (v11)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v11, "accessories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v22)
    {
      v23 = v22;
      v31 = v11;
      v24 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (v4)
            objc_msgSend(v20, "addAccessory:", v26);
          else
            objc_msgSend(v20, "removeAccessory:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v23);
      v11 = v31;
    }
    goto LABEL_27;
  }
  HFLogForCategory();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v30, OS_LOG_TYPE_DEFAULT, "Unable to find accessory to update user listening history setting", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v28;
}

void __87__HUUpdateListeningHistorySettingsItemModule_setUpdateListeningHistorySetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Updating user listening history setting %@ for home %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__HUUpdateListeningHistorySettingsItemModule_setUpdateListeningHistorySetting_forItem___block_invoke_33;
  v13[3] = &unk_1E6F56310;
  v14 = v3;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v12 = v3;
  objc_msgSend(v7, "updateUserListeningHistoryUpdateControl:forHome:completionHandler:", v8, v9, v13);

}

void __87__HUUpdateListeningHistorySettingsItemModule_setUpdateListeningHistorySetting_forItem___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Failed to update user listening history setting with error : %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated user listening history setting %@ for home %@", (uint8_t *)&v8, 0x16u);

    }
  }

}

+ (id)_ulhDeviceItemComparator
{
  return &__block_literal_global_37_2;
}

uint64_t __70__HUUpdateListeningHistorySettingsItemModule__ulhDeviceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0D314B0];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "defaultItemComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, id, id))v7)[2](v7, v6, v5);

  return v8;
}

- (void)_buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = objc_alloc(MEMORY[0x1E0D31510]);
  -[HUUpdateListeningHistorySettingsItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);

  -[HUUpdateListeningHistorySettingsItemModule user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUpdateListeningHistorySettingsItemModule home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userListeningHistoryUpdateControlForHome:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFilter:", &__block_literal_global_41_2);
  v9 = objc_alloc(MEMORY[0x1E0D31928]);
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_3;
  v24[3] = &unk_1E6F58CB0;
  v11 = v8;
  v25 = v11;
  v12 = (void *)objc_msgSend(v9, "initWithSourceProvider:transformationBlock:", v5, v24);
  -[HUUpdateListeningHistorySettingsItemModule setMediaDeviceItemProvider:](self, "setMediaDeviceItemProvider:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D310B0]);
  -[HUUpdateListeningHistorySettingsItemModule home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithHome:", v14);

  objc_msgSend(v15, "setFilter:", &__block_literal_global_313_0);
  v16 = objc_alloc(MEMORY[0x1E0D31928]);
  v19 = v10;
  v20 = 3221225472;
  v21 = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_8;
  v22 = &unk_1E6F4FB28;
  v23 = v11;
  v17 = v11;
  v18 = (void *)objc_msgSend(v16, "initWithSourceProvider:transformationBlock:", v15, &v19);
  -[HUUpdateListeningHistorySettingsItemModule setOtherDeviceItemProvider:](self, "setOtherDeviceItemProvider:", v18, v19, v20, v21, v22);

}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF347468))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_290);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v2, "hf_supportsUserLevelUpdateListeningHistorySetting");
    else
      v7 = 0;
  }

  return v7;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsUserLevelUpdateListeningHistorySetting");
}

id __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_4;
  v8[3] = &unk_1E6F554C8;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v5, v8);

  return v6;
}

id __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = *(id *)(a1 + 32);
  v8 = &unk_1EF2AC1D8;
  if (objc_msgSend(v7, "conformsToProtocol:", v8))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_5;
  v14[3] = &unk_1E6F4E5D8;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v11, "na_all:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30E20]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  return v6;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_6;
  v8[3] = &unk_1E6F4E5D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  return v8;
}

void *__65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
    goto LABEL_8;
  objc_msgSend(v5, "hf_siriEndpointProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "hf_primaryService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = (void *)objc_msgSend(v5, "hf_supportsUserLevelUpdateListeningHistorySetting");
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

id __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_9;
  v8[3] = &unk_1E6F554C8;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v5, v8);

  return v6;
}

id __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = *(id *)(a1 + 32);
  v8 = &unk_1EF2AC1D8;
  if (objc_msgSend(v7, "conformsToProtocol:", v8))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_10;
  v14[3] = &unk_1E6F4E5D8;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v11, "na_all:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30E20]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  return v6;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_11;
  v8[3] = &unk_1E6F4E5D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __65__HUUpdateListeningHistorySettingsItemModule__buildItemProviders__block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (HFItemProvider)mediaDeviceItemProvider
{
  return self->_mediaDeviceItemProvider;
}

- (void)setMediaDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaDeviceItemProvider, a3);
}

- (HFItemProvider)otherDeviceItemProvider
{
  return self->_otherDeviceItemProvider;
}

- (void)setOtherDeviceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_otherDeviceItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaDeviceItemProvider, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
