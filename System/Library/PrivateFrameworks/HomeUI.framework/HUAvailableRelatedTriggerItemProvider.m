@implementation HUAvailableRelatedTriggerItemProvider

- (HUAvailableRelatedTriggerItemProvider)initWithHome:(id)a3 relatedItems:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUAvailableRelatedTriggerItemProvider *v12;
  HUAvailableRelatedTriggerItemProvider *v13;
  uint64_t v14;
  NSMutableSet *triggerItems;
  uint64_t v16;
  NSMutableSet *updatesDisabledReasons;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUAvailableRelatedTriggerItemProvider;
  v12 = -[HFItemProvider init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_relatedItems, a4);
    objc_storeStrong((id *)&v13->_home, a3);
    objc_storeStrong((id *)&v13->_context, a5);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    triggerItems = v13->_triggerItems;
    v13->_triggerItems = (NSMutableSet *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    updatesDisabledReasons = v13->_updatesDisabledReasons;
    v13->_updatesDisabledReasons = (NSMutableSet *)v16;

    -[HUAvailableRelatedTriggerItemProvider _buildProviders](v13, "_buildProviders");
  }

  return v13;
}

- (void)_buildProviders
{
  HUTriggerItemProvider *v3;
  void *v4;
  HUTriggerItemProvider *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = [HUTriggerItemProvider alloc];
  -[HUAvailableRelatedTriggerItemProvider home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUTriggerItemProvider initWithHome:](v3, "initWithHome:", v4);
  -[HUAvailableRelatedTriggerItemProvider setRelatedActiveTriggerItemProvider:](self, "setRelatedActiveTriggerItemProvider:", v5);

  v6 = objc_alloc(MEMORY[0x1E0D33540]);
  -[HUAvailableRelatedTriggerItemProvider home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemProvider relatedItems](self, "relatedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithHome:andServiceLikeItems:", v7, v8);
  -[HUAvailableRelatedTriggerItemProvider setRecommendationItemProvider:](self, "setRecommendationItemProvider:", v9);

  -[HUAvailableRelatedTriggerItemProvider context](self, "context");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "engineOptions") | 0x80;
  -[HUAvailableRelatedTriggerItemProvider recommendationItemProvider](self, "recommendationItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEngineOptions:", v10);

}

- (void)setTriggerFilter:(id)a3
{
  id v4;
  void *v5;
  id triggerFilter;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = _Block_copy(v4);
  triggerFilter = self->_triggerFilter;
  self->_triggerFilter = v5;

  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__HUAvailableRelatedTriggerItemProvider_setTriggerFilter___block_invoke;
    v9[3] = &unk_1E6F5DA28;
    v10 = v4;
    -[HUAvailableRelatedTriggerItemProvider relatedActiveTriggerItemProvider](self, "relatedActiveTriggerItemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilter:", v9);

  }
  else
  {
    -[HUAvailableRelatedTriggerItemProvider relatedActiveTriggerItemProvider](self, "relatedActiveTriggerItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilter:", 0);

  }
}

uint64_t __58__HUAvailableRelatedTriggerItemProvider_setTriggerFilter___block_invoke(uint64_t a1, void *a2)
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

  if (v6)
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v7 = 0;

  return v7;
}

- (void)setRecommendationsFilter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemProvider recommendationItemProvider](self, "recommendationItemProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilter:", v4);

}

- (id)recommendationsFilter
{
  void *v2;
  void *v3;

  -[HUAvailableRelatedTriggerItemProvider recommendationItemProvider](self, "recommendationItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSet)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUAvailableRelatedTriggerItemProvider recommendationItemProvider](self, "recommendationItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemProvider relatedActiveTriggerItemProvider](self, "relatedActiveTriggerItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (id)reloadItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[5];

  -[HUAvailableRelatedTriggerItemProvider updatesDisabledReasons](self, "updatesDisabledReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    v6 = objc_alloc(MEMORY[0x1E0D314A0]);
    -[HUAvailableRelatedTriggerItemProvider triggerItems](self, "triggerItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithAddedItems:removedItems:existingItems:", 0, 0, v7);
    objc_msgSend(v5, "futureWithResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUAvailableRelatedTriggerItemProvider itemProviders](self, "itemProviders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_map:", &__block_literal_global_250);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "combineAllFutures:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_2;
    v19[3] = &unk_1E6F4CD30;
    v19[4] = self;
    objc_msgSend(v14, "flatMap:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_7;
    v18[3] = &unk_1E6F4D2A0;
    v18[4] = self;
    objc_msgSend(v16, "flatMap:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

uint64_t __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadItems");
}

id __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_3;
  v15[3] = &unk_1E6F5DA90;
  v16 = v5;
  v17 = v4;
  v18 = v6;
  v7 = v6;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "na_each:", v15);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadAvailableTriggerItemsWithObjects:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(v3, "existingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_1E6F51390;
  v13 = a1[4];
  objc_msgSend(v4, "na_each:", v12);

  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_5;
  v10[3] = &unk_1E6F51390;
  v11 = a1[5];
  objc_msgSend(v6, "na_each:", v10);

  objc_msgSend(v3, "removedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_6;
  v8[3] = &unk_1E6F51390;
  v9 = a1[6];
  objc_msgSend(v7, "na_each:", v8);

}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF301990))
    v4 = v6;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v3, "na_safeAddObject:", v5);

}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF301990))
    v4 = v6;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v3, "na_safeAddObject:", v5);

}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF301990))
    v4 = v6;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v3, "na_safeAddObject:", v5);

}

id __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultActiveValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "addedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_8;
    v13[3] = &unk_1E6F5DAB8;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "na_each:", v13);

  }
  objc_msgSend(*(id *)(a1 + 32), "triggerItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(*(id *)(a1 + 32), "triggerItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __52__HUAvailableRelatedTriggerItemProvider_reloadItems__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultActiveValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", objc_msgSend(v4, "BOOLValue"));

}

- (id)itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  HUAvailableRelatedTriggerItemProvider *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v4 = a3;
  -[HUAvailableRelatedTriggerItemProvider triggerItems](self, "triggerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_setByIntersectingWithSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_filter:", &__block_literal_global_63_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemProvider triggerItems](self, "triggerItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_filter:", &__block_literal_global_64_2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_3;
  v23[3] = &unk_1E6F5DB40;
  v23[4] = self;
  objc_msgSend(v8, "na_filter:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v12);

  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_4;
  v22[3] = &unk_1E6F5DB68;
  v22[4] = self;
  objc_msgSend(v10, "na_dictionaryWithKeyGenerator:", v22);
  v16 = v11;
  v17 = 3221225472;
  v18 = __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_5;
  v19 = &unk_1E6F5DB90;
  v20 = self;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  objc_msgSend(v8, "na_filter:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v14, v16, v17, v18, v19, v20);

  return v7;
}

BOOL __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "triggerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "recommendationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(*(id *)(a1 + 32), "relatedItemsAffectedByTrigger:", v3) ^ 1;
  else
    v4 = 0;

  return v4;
}

id __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hre_triggerComparisonIdentifierInHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__HUAvailableRelatedTriggerItemProvider_itemsToHideInSet___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HUTriggerBuilderContext *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v3 = a2;
  objc_msgSend(v3, "triggerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v3, "trigger"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEnabled"),
        v5,
        v6))
  {
    objc_msgSend(v3, "trigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hre_triggerComparisonIdentifierInHome:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recommendationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recommendation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v13 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    v16 = (void *)MEMORY[0x1E0D31938];
    objc_msgSend(v3, "trigger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(HUTriggerBuilderContext);
    objc_msgSend(v16, "triggerBuilderForTrigger:inHome:context:", v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "compareForMatchingToTrigger:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      v23 = objc_msgSend(v21, "hasNoDifferencesHigherThanPriority:", 0);
    else
      v23 = 0;

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)relatedItemsAffectedByTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemProvider relatedItems](self, "relatedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__HUAvailableRelatedTriggerItemProvider_relatedItemsAffectedByTrigger___block_invoke;
  v9[3] = &unk_1E6F5DBB8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __71__HUAvailableRelatedTriggerItemProvider_relatedItemsAffectedByTrigger___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hf_affectsHomeKitObject:", v3);

  return v4;
}

- (id)reloadAvailableTriggerItemsWithObjects:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_3;
  v5[3] = &unk_1E6F5DC60;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_4;
  v4[3] = &unk_1E6F5DC88;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", a3, &__block_literal_global_71_1, &__block_literal_global_72_1, v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "trigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "relatedItemsAffectedByTrigger:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

HUAvailableTriggerItem *__80__HUAvailableRelatedTriggerItemProvider_reloadAvailableTriggerItemsWithObjects___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  HUAvailableTriggerItem *v4;
  void *v5;
  void *v6;
  HUAvailableTriggerItem *v7;

  v3 = a2;
  v4 = [HUAvailableTriggerItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "relatedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUAvailableTriggerItem initWithHome:containingItem:relatedToServiceLikeItems:](v4, "initWithHome:containingItem:relatedToServiceLikeItems:", v5, v3, v6);

  return v7;
}

- (id)invalidationReasons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUAvailableRelatedTriggerItemProvider;
  -[HFItemProvider invalidationReasons](&v8, sel_invalidationReasons);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvailableRelatedTriggerItemProvider itemProviders](self, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_flatMap:", &__block_literal_global_80_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __60__HUAvailableRelatedTriggerItemProvider_invalidationReasons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidationReasons");
}

- (void)disableUpdatesWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemProvider updatesDisabledReasons](self, "updatesDisabledReasons");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)endDisableUpdatesWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUAvailableRelatedTriggerItemProvider updatesDisabledReasons](self, "updatesDisabledReasons");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)relatedItems
{
  return self->_relatedItems;
}

- (id)triggerFilter
{
  return self->_triggerFilter;
}

- (HUAvailableRelatedTriggerItemModuleContextProviding)context
{
  return self->_context;
}

- (HRERecommendationItemProvider)recommendationItemProvider
{
  return self->_recommendationItemProvider;
}

- (void)setRecommendationItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationItemProvider, a3);
}

- (HUTriggerItemProvider)relatedActiveTriggerItemProvider
{
  return self->_relatedActiveTriggerItemProvider;
}

- (void)setRelatedActiveTriggerItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_relatedActiveTriggerItemProvider, a3);
}

- (NSMutableSet)triggerItems
{
  return self->_triggerItems;
}

- (void)setTriggerItems:(id)a3
{
  objc_storeStrong((id *)&self->_triggerItems, a3);
}

- (NSMutableSet)updatesDisabledReasons
{
  return self->_updatesDisabledReasons;
}

- (void)setUpdatesDisabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_updatesDisabledReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatesDisabledReasons, 0);
  objc_storeStrong((id *)&self->_triggerItems, 0);
  objc_storeStrong((id *)&self->_relatedActiveTriggerItemProvider, 0);
  objc_storeStrong((id *)&self->_recommendationItemProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_triggerFilter, 0);
  objc_storeStrong((id *)&self->_relatedItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
