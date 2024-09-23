@implementation HUSoftwareUpdateItemModule

- (HUSoftwareUpdateItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_sourceItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateItemModule.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUSoftwareUpdateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5
{
  id v9;
  id v10;
  HUSoftwareUpdateItemModule *v11;
  HUSoftwareUpdateItemModule *v12;
  void *v13;
  uint64_t v14;
  NSSet *accessories;
  uint64_t v16;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HUSoftwareUpdateItemModule;
  v11 = -[HFItemModule initWithItemUpdater:](&v18, sel_initWithItemUpdater_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    objc_storeStrong((id *)&v12->_sourceItem, a5);
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF2AC2D0))
    {
      objc_msgSend(v10, "accessories");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "na_filter:", &__block_literal_global_73);
      v14 = objc_claimAutoreleasedReturnValue();
      accessories = v12->_accessories;
      v12->_accessories = (NSSet *)v14;

    }
    else
    {
      objc_msgSend(v9, "accessoriesSupportingSoftwareUpdate");
      v16 = objc_claimAutoreleasedReturnValue();
      v13 = v12->_accessories;
      v12->_accessories = (NSSet *)v16;
    }

  }
  return v12;
}

BOOL __66__HUSoftwareUpdateItemModule_initWithItemUpdater_home_sourceItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "softwareUpdateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_reloadItemProviders
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[HFItemModule itemProviders](self, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFItemModule itemUpdater](self, "itemUpdater");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D314C0];
    -[HFItemModule itemProviders](self, "itemProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v7);

  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  int v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("hideSectionHeaders")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("hideAppleUpdates")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("hideThirdPartyUpdates")))
  {
    v8 = objc_msgSend(v6, "BOOLValue");
    -[HUSoftwareUpdateItemModule valueForKey:](self, "valueForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v8 != v10)
    {
      v11.receiver = self;
      v11.super_class = (Class)HUSoftwareUpdateItemModule;
      -[HUSoftwareUpdateItemModule setValue:forKey:](&v11, sel_setValue_forKey_, v6, v7);
      -[HUSoftwareUpdateItemModule _reloadItemProviders](self, "_reloadItemProviders");
    }
  }

}

- (id)buildItemProviders
{
  HUSoftwareUpdateInfoItemProvider *v3;
  void *v4;
  HUSoftwareUpdateInfoItemProvider *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = [HUSoftwareUpdateInfoItemProvider alloc];
  -[HUSoftwareUpdateItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUSoftwareUpdateInfoItemProvider initWithHome:](v3, "initWithHome:", v4);
  -[HUSoftwareUpdateItemModule setSoftwareUpdateInfoItemProvider:](self, "setSoftwareUpdateInfoItemProvider:", v5);

  -[HUSoftwareUpdateItemModule accessories](self, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__HUSoftwareUpdateItemModule_buildItemProviders__block_invoke;
  v13[3] = &unk_1E6F4D8E8;
  v14 = v6;
  v7 = v6;
  -[HUSoftwareUpdateItemModule softwareUpdateInfoItemProvider](self, "softwareUpdateInfoItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilter:", v13);

  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HUSoftwareUpdateItemModule softwareUpdateInfoItemProvider](self, "softwareUpdateInfoItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_setWithSafeObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __48__HUSoftwareUpdateItemModule_buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
  return v7;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", 0, 1, &__block_literal_global_75_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", 0, 1, &__block_literal_global_76);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", 0, 1, &__block_literal_global_77);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSoftwareUpdateItemModule softwareUpdateInfoItemProvider](self, "softwareUpdateInfoItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingDescriptors:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke_4;
  v25 = &unk_1E6F52268;
  v16 = v14;
  v26 = v16;
  v17 = v15;
  v27 = v17;
  objc_msgSend(v13, "na_each:", &v22);
  if (!-[HUSoftwareUpdateItemModule hideAppleUpdates](self, "hideAppleUpdates", v22, v23, v24, v25)
    && objc_msgSend(v16, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSoftwareUpdateAppleUpdatesSectionIdentifier"));
    objc_msgSend(v18, "setItems:", v16);
    objc_msgSend(v5, "addObject:", v18);

  }
  if (!-[HUSoftwareUpdateItemModule hideThirdPartyUpdates](self, "hideThirdPartyUpdates") && objc_msgSend(v17, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSoftwareUpdateThirdPartyUpdatesSectionIdentifier"));
    objc_msgSend(v19, "setItems:", v17);
    objc_msgSend(v5, "addObject:", v19);

  }
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "manufacturer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

uint64_t __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_userFriendlyLocalizedCapitalizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_userFriendlyLocalizedCapitalizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

uint64_t __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_softwareUpdateVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "versionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_softwareUpdateVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "versionString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "compare:", v12);

  return v13;
}

void __62__HUSoftwareUpdateItemModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_isHomePod");

  v6 = 40;
  if (v5)
    v6 = 32;
  objc_msgSend(*(id *)(a1 + v6), "addObject:", v7);

}

- (HMHome)home
{
  return self->_home;
}

- (HFSoftwareUpdatableItemProtocol)sourceItem
{
  return self->_sourceItem;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (BOOL)hideAppleUpdates
{
  return self->_hideAppleUpdates;
}

- (void)setHideAppleUpdates:(BOOL)a3
{
  self->_hideAppleUpdates = a3;
}

- (BOOL)hideThirdPartyUpdates
{
  return self->_hideThirdPartyUpdates;
}

- (void)setHideThirdPartyUpdates:(BOOL)a3
{
  self->_hideThirdPartyUpdates = a3;
}

- (HUSoftwareUpdateInfoItemProvider)softwareUpdateInfoItemProvider
{
  return self->_softwareUpdateInfoItemProvider;
}

- (void)setSoftwareUpdateInfoItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateInfoItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateInfoItemProvider, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
