@implementation HUPrimaryUserSettingsItemModule

- (HUPrimaryUserSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 mediaProfileContainer:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HUPrimaryUserSettingsItemModule *v13;
  HUPrimaryUserSettingsItemModule *v14;
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
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPrimaryUserSettingsItemModule.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPrimaryUserSettingsItemModule.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HUPrimaryUserSettingsItemModule;
  v13 = -[HFItemModule initWithItemUpdater:](&v18, sel_initWithItemUpdater_, v9);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_mediaProfileContainer, a5);
    -[HUPrimaryUserSettingsItemModule _buildItemProviders](v14, "_buildItemProviders");
  }

  return v14;
}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUPrimaryUserSettingsItemModule primaryUserItemProvider](self, "primaryUserItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPrimaryUserSettingsItemModule staticItemProvider](self, "staticItemProvider");
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
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUPrimaryUserSettingsItemModule mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_backingAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v7, "hf_isSiriEndpoint");

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUPrimaryUserSettingsHeaderSectionIdentifier"));
  if (v22)
    v9 = CFSTR("HUPrimaryUserSettingsHeaderSection_SiriEndpoint_Footer");
  else
    v9 = CFSTR("HUPrimaryUserSettingsHeaderSection_Footer");
  _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFooterTitle:", v10);

  v23 = v8;
  v24 = v5;
  objc_msgSend(v5, "addObject:", v8);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUPrimaryUserSettingsUserSectionIdentifier"));
  v12 = (void *)objc_opt_new();
  -[HUPrimaryUserSettingsItemModule primaryUserItemProvider](self, "primaryUserItemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_userItemComparator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __67__HUPrimaryUserSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v25[3] = &unk_1E6F4DAD8;
  v26 = v4;
  v18 = v4;
  objc_msgSend(v17, "na_filter:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_safeAddObjectsFromArray:", v19);

  if ((v22 & 1) == 0)
  {
    -[HUPrimaryUserSettingsItemModule homePodAccountSelectionItem](self, "homePodAccountSelectionItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_safeAddObject:", v20);

  }
  objc_msgSend(v11, "setItems:", v12);
  objc_msgSend(v24, "addObject:", v11);

  return v24;
}

uint64_t __67__HUPrimaryUserSettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

+ (id)_userItemComparator
{
  return &__block_literal_global_141;
}

uint64_t __54__HUPrimaryUserSettingsItemModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
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
  HUPrimaryUserItemProvider *v3;
  void *v4;
  void *v5;
  HUPrimaryUserItemProvider *v6;
  HUPrimaryUserHomePodAccountItem *v7;
  void *v8;
  void *v9;
  void *v10;
  HUPrimaryUserHomePodAccountItem *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = [HUPrimaryUserItemProvider alloc];
  -[HUPrimaryUserSettingsItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPrimaryUserSettingsItemModule mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUPrimaryUserItemProvider initWithHome:mediaProfileContainer:](v3, "initWithHome:mediaProfileContainer:", v4, v5);
  -[HUPrimaryUserSettingsItemModule setPrimaryUserItemProvider:](self, "setPrimaryUserItemProvider:", v6);

  v7 = [HUPrimaryUserHomePodAccountItem alloc];
  -[HUPrimaryUserSettingsItemModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_characteristicValueManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPrimaryUserSettingsItemModule mediaProfileContainer](self, "mediaProfileContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUPrimaryUserHomePodAccountItem initWithValueSource:mediaProfileContainer:](v7, "initWithValueSource:mediaProfileContainer:", v9, v10);
  -[HUPrimaryUserSettingsItemModule setHomePodAccountSelectionItem:](self, "setHomePodAccountSelectionItem:", v11);

  v12 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[HUPrimaryUserSettingsItemModule homePodAccountSelectionItem](self, "homePodAccountSelectionItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithArray:", v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v15);
  -[HUPrimaryUserSettingsItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v16);

}

- (id)_updatePrimaryUserSelectionType:(unint64_t)a3 user:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v25[6];
  id v26;
  SEL v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)MEMORY[0x1E0C99E20];
  -[HUPrimaryUserSettingsItemModule mediaProfileContainer](self, "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[HUPrimaryUserSettingsItemModule mediaProfileContainer](self, "mediaProfileContainer", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_backingAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "na_safeAddObject:", v13);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v19, "supportsPreferredMediaUser", v24))
        {
          v20 = (void *)MEMORY[0x1E0D519C0];
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __72__HUPrimaryUserSettingsItemModule__updatePrimaryUserSelectionType_user___block_invoke;
          v25[3] = &unk_1E6F574B0;
          v25[4] = self;
          v25[5] = v19;
          v27 = a2;
          v28 = a3;
          v26 = v24;
          objc_msgSend(v20, "futureWithBlock:", v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v21);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __72__HUPrimaryUserSettingsItemModule__updatePrimaryUserSelectionType_user___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id location;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(*(id *)(a1 + 32), "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestToReloadItemProviders:senderSelector:", v5, *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__HUPrimaryUserSettingsItemModule__updatePrimaryUserSelectionType_user___block_invoke_2;
  v12[3] = &unk_1E6F57488;
  v12[4] = v8;
  v10 = v3;
  v13 = v10;
  objc_copyWeak(&v15, &location);
  v11 = v6;
  v14 = v11;
  objc_msgSend(v8, "updatePreferredMediaUserSelectionType:user:completionHandler:", v7, v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __72__HUPrimaryUserSettingsItemModule__updatePrimaryUserSelectionType_user___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Failed to update primary user for accessory %@ with error %@", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated primary user setting for accessory %@", (uint8_t *)&v11, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "itemUpdater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "performItemUpdateRequest:", *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

- (HMHome)home
{
  return self->_home;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFItem)primaryUserSettingsHeaderItem
{
  return self->_primaryUserSettingsHeaderItem;
}

- (void)setPrimaryUserSettingsHeaderItem:(id)a3
{
  objc_storeStrong((id *)&self->_primaryUserSettingsHeaderItem, a3);
}

- (HFItem)homePodAccountSelectionItem
{
  return self->_homePodAccountSelectionItem;
}

- (void)setHomePodAccountSelectionItem:(id)a3
{
  objc_storeStrong((id *)&self->_homePodAccountSelectionItem, a3);
}

- (HUPrimaryUserItemProvider)primaryUserItemProvider
{
  return self->_primaryUserItemProvider;
}

- (void)setPrimaryUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_primaryUserItemProvider, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_primaryUserItemProvider, 0);
  objc_storeStrong((id *)&self->_homePodAccountSelectionItem, 0);
  objc_storeStrong((id *)&self->_primaryUserSettingsHeaderItem, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
