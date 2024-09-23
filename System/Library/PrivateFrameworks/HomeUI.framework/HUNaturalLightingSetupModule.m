@implementation HUNaturalLightingSetupModule

- (HUNaturalLightingSetupModule)initWithHome:(id)a3 itemUpdater:(id)a4
{
  id v7;
  HUNaturalLightingSetupModule *v8;
  HUNaturalLightingSetupModule *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNaturalLightingSetupModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_home, a3);

  return v9;
}

- (id)selectedItems
{
  void *v2;
  void *v3;

  -[HFItemModule allItems](self, "allItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_253);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __45__HUNaturalLightingSetupModule_selectedItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = objc_msgSend(v5, "selected");
  }
  else
  {
    objc_msgSend(v3, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "BOOLValue");

  }
  return v6;
}

- (void)toggleSelectedForItem:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];

  v5 = a3;
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", objc_msgSend(v10, "BOOLValue") ^ 1);

  v11 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestToUpdateItems:senderSelector:", v12, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performItemUpdateRequest:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__HUNaturalLightingSetupModule_toggleSelectedForItem___block_invoke;
  v17[3] = &unk_1E6F52828;
  v17[4] = self;
  v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v17);

}

void __54__HUNaturalLightingSetupModule_toggleSelectedForItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "selectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naturalLanguageSetupModule:didUpdateSelectedItems:", v2, v3);

}

- (id)commitSelectedItems
{
  void *v3;
  void *v4;
  void *v5;
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

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUNaturalLightingSetupModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_allLightProfilesSupportingNaturalLighting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule allItems](self, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_flatMap:", &__block_literal_global_5_3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUNaturalLightingSetupModule selectedItems](self, "selectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_flatMap:", &__block_literal_global_6_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_setByIntersectingWithSet:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v11, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_3;
  v18[3] = &unk_1E6F5DE70;
  v19 = v10;
  v14 = v10;
  objc_msgSend(v13, "na_map:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "combineAllFutures:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "lightProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "lightProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_4;
  v8[3] = &unk_1E6F4FA10;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __51__HUNaturalLightingSetupModule_commitSelectedItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "setNaturalLightingEnabled:completionHandler:", objc_msgSend(v3, "containsObject:", v2), v4);

}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v4;
  NSSet *v5;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    -[HUNaturalLightingSetupModule _buildItemProviders](self, "_buildItemProviders");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
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
  _QWORD v12[5];

  v4 = a3;
  -[HFItemModule allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_setByIntersectingWithSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_11_5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D314B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__HUNaturalLightingSetupModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v12[3] = &unk_1E6F5DED8;
  v12[4] = self;
  objc_msgSend(v7, "na_map:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterSections:toDisplayedItems:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__HUNaturalLightingSetupModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "hf_parentRoom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_zeroUUID");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

id __64__HUNaturalLightingSetupModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_roomWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D31570]);
    objc_msgSend(v9, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithIdentifier:", v12);

    objc_msgSend(v9, "hf_displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHeaderTitle:", v14);

    objc_msgSend(v5, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sortedArrayUsingComparator:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v17);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_buildItemProviders
{
  HUNaturalLightingItemProvider *v3;
  void *v4;
  HUNaturalLightingItemProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = [HUNaturalLightingItemProvider alloc];
  -[HUNaturalLightingSetupModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUNaturalLightingItemProvider initWithHome:](v3, "initWithHome:", v4);

  -[HUNaturalLightingSetupModule filter](self, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNaturalLightingItemProvider setLightProfileFilter:](v5, "setLightProfileFilter:", v6);

  -[HUNaturalLightingSetupModule defaultSelectedValue](self, "defaultSelectedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNaturalLightingItemProvider setDefaultSelectedValue:](v5, "setDefaultSelectedValue:", v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HUNaturalLightingSetupModule__buildItemProviders__block_invoke;
  v10[3] = &unk_1E6F4D8E8;
  v10[4] = self;
  -[HUNaturalLightingItemProvider setHomeKitObjectFilter:](v5, "setHomeKitObjectFilter:", v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __51__HUNaturalLightingSetupModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "showNaturalLightingContainingHomeKitObject:", v2);

  return v3;
}

+ (BOOL)showNaturalLightingContainingHomeKitObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithSafeObject:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_12;
  if (objc_msgSend(v9, "hf_isVisibleAccessory") && (objc_msgSend(v9, "hf_isVisibleAsBridge") & 1) == 0)
  {
    objc_msgSend(v9, "services");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
LABEL_12:
    v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_22_4);
    goto LABEL_13;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

uint64_t __75__HUNaturalLightingSetupModule_showNaturalLightingContainingHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisible");
}

- (HUNaturalLightingSetupModuleDelegate)delegate
{
  return (HUNaturalLightingSetupModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)defaultSelectedValue
{
  return self->_defaultSelectedValue;
}

- (void)setDefaultSelectedValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSelectedValue, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFAccessoryItemProvider)accessoryItemProvider
{
  return self->_accessoryItemProvider;
}

- (void)setAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryItemProvider, a3);
}

- (HFServiceItemProvider)serviceItemProvider
{
  return self->_serviceItemProvider;
}

- (void)setServiceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_serviceItemProvider, a3);
}

- (HFServiceGroupItemProvider)serviceGroupItemProvider
{
  return self->_serviceGroupItemProvider;
}

- (void)setServiceGroupItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_serviceGroupItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGroupItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_defaultSelectedValue, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
