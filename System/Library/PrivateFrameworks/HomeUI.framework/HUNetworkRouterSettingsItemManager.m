@implementation HUNetworkRouterSettingsItemManager

- (HUNetworkRouterSettingsItemManager)initWithHome:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  HUNetworkRouterSettingsItemManager *v10;
  HUNetworkRouterSettingsItemManager *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterSettingsItemManager.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HUNetworkRouterSettingsItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v14, sel_initWithDelegate_sourceItem_, v9, 0);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_overrideHome, a3);

  return v11;
}

- (HUNetworkRouterSettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterSettingsItemManager.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkRouterSettingsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (BOOL)isItemNetworkRouterServiceItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUNetworkRouterSettingsItemManager networkRouterServiceItemProvider](self, "networkRouterServiceItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (id)networkRouterServiceItemForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUNetworkRouterSettingsItemManager networkRouterServiceItemProvider](self, "networkRouterServiceItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__HUNetworkRouterSettingsItemManager_networkRouterServiceItemForAccessory___block_invoke;
  v10[3] = &unk_1E6F4DAD8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __75__HUNetworkRouterSettingsItemManager_networkRouterServiceItemForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  return v11;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HUNetworkRouterHomeProtectionItem *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D317D8];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = *MEMORY[0x1E0CB9B20];
  v21[0] = *MEMORY[0x1E0CB9B18];
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithHome:serviceTypes:", v5, v8);
  -[HUNetworkRouterSettingsItemManager setNetworkRouterServiceItemProvider:](self, "setNetworkRouterServiceItemProvider:", v9);

  v10 = -[HUNetworkRouterHomeProtectionItem initWithHome:]([HUNetworkRouterHomeProtectionItem alloc], "initWithHome:", v5);
  -[HUNetworkRouterSettingsItemManager setHomeProtectionItem:](self, "setHomeProtectionItem:", v10);

  -[HUNetworkRouterSettingsItemManager homeProtectionItem](self, "homeProtectionItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithItems:", v14);

  -[HUNetworkRouterSettingsItemManager networkRouterServiceItemProvider](self, "networkRouterServiceItemProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  HUNetworkConfigurationItemListModule *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUNetworkConfigurationItemListModule initWithItemUpdater:home:]([HUNetworkConfigurationItemListModule alloc], "initWithItemUpdater:home:", self, v4);

  -[HUNetworkRouterSettingsItemManager setNetworkConfigurationItemListModule:](self, "setNetworkConfigurationItemListModule:", v5);
  -[HUNetworkRouterSettingsItemManager networkConfigurationItemListModule](self, "networkConfigurationItemListModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUNetworkRouterSettingsRouterListSectionIdentifier"));
  -[HUNetworkRouterSettingsItemManager networkRouterServiceItemProvider](self, "networkRouterServiceItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_networkRouterServiceItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:filteringToDisplayedItems:", v11, v4);

  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkRouterSettingsRouterListSectionTitle"), CFSTR("HUNetworkRouterSettingsRouterListSectionTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v12);

  objc_msgSend(v5, "addObject:", v6);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUNetworkRouterSettingsHomeProtectionSectionIdentifier"));
  -[HUNetworkRouterSettingsItemManager homeProtectionItem](self, "homeProtectionItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItems:", v15);

  -[HUNetworkRouterSettingsItemManager homeProtectionItem](self, "homeProtectionItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "latestResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("HFResultNetworkRouterHomeProtectionDescriptionKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFooterTitle:", v18);

  objc_msgSend(v5, "addObject:", v13);
  -[HUNetworkRouterSettingsItemManager networkConfigurationItemListModule](self, "networkConfigurationItemListModule");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "buildSectionsWithDisplayedItems:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v20);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUNetworkRouterSettingsItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_networkRouterServiceItemComparator
{
  return &__block_literal_global_237;
}

uint64_t __73__HUNetworkRouterSettingsItemManager__networkRouterServiceItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t (**v23)(_QWORD, _QWORD, _QWORD);

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v4;
  if (!v7)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_7:
    v9 = 0;
  }

  v12 = objc_opt_class();
  v13 = v5;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v13;
    if (v14)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

  }
  v15 = 0;
LABEL_15:

  objc_msgSend(v9, "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hf_isNetworkRouterSatellite");

  objc_msgSend(v15, "service");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hf_isNetworkRouterSatellite");

  if ((v19 & 1) != 0 || !v21)
  {
    if ((v19 ^ 1 | v21) == 1)
    {
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
      v23 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v22 = ((uint64_t (**)(_QWORD, id, id))v23)[2](v23, v7, v13);

    }
    else
    {
      v22 = 1;
    }
  }
  else
  {
    v22 = -1;
  }

  return v22;
}

- (HFItem)homeProtectionItem
{
  return self->_homeProtectionItem;
}

- (void)setHomeProtectionItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeProtectionItem, a3);
}

- (HUNetworkConfigurationItemListModule)networkConfigurationItemListModule
{
  return self->_networkConfigurationItemListModule;
}

- (void)setNetworkConfigurationItemListModule:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfigurationItemListModule, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFServiceItemProvider)networkRouterServiceItemProvider
{
  return self->_networkRouterServiceItemProvider;
}

- (void)setNetworkRouterServiceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkRouterServiceItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkRouterServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_networkConfigurationItemListModule, 0);
  objc_storeStrong((id *)&self->_homeProtectionItem, 0);
}

@end
