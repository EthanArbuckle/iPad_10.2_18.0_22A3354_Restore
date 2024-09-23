@implementation HFActionSetSuggestionItemProvider

- (HFActionSetSuggestionItemProvider)initWithHome:(id)a3
{
  id v5;
  HFActionSetSuggestionItemProvider *v6;
  HFActionSetSuggestionItemProvider *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  HFActionSetSuggestionItem *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HFActionSetSuggestionItemProvider;
  v6 = -[HFItemProvider init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    v21 = v5;
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    +[HFActionSetSuggestionVendor supportedBuiltInActionSetTypes](HFActionSetSuggestionVendor, "supportedBuiltInActionSetTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[HFActionSetSuggestionItemProvider _builtInActionSetOfType:](v7, "_builtInActionSetOfType:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = [HFActionSetSuggestionItem alloc];
            -[HFActionSetSuggestionItemProvider home](v7, "home");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[HFActionSetSuggestionItem initWithHome:actionSet:](v16, "initWithHome:actionSet:", v17, v15);

            -[NSObject setIncludeExistingActionSets:](v18, "setIncludeExistingActionSets:", -[HFActionSetSuggestionItemProvider includeExistingActionSets](v7, "includeExistingActionSets"));
            -[NSObject setPersistAddedSuggestions:](v18, "setPersistAddedSuggestions:", -[HFActionSetSuggestionItemProvider persistAddedSuggestions](v7, "persistAddedSuggestions"));
            objc_msgSend(v8, "addObject:", v18);
          }
          else
          {
            HFLogForCategory(0x29uLL);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              -[HFActionSetSuggestionItemProvider home](v7, "home");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v28 = v14;
              v29 = 2112;
              v30 = v19;
              _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "No action set found for builtin type %@ in home %@", buf, 0x16u);

            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v11);
    }

    -[HFActionSetSuggestionItemProvider setStaticSuggestionItems:](v7, "setStaticSuggestionItems:", v8);
    v5 = v21;
  }

  return v7;
}

- (void)setIncludeExistingActionSets:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  self->_includeExistingActionSets = a3;
  -[HFActionSetSuggestionItemProvider staticSuggestionItems](self, "staticSuggestionItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__HFActionSetSuggestionItemProvider_setIncludeExistingActionSets___block_invoke;
  v5[3] = &__block_descriptor_33_e35_v16__0__HFActionSetSuggestionItem_8l;
  v6 = a3;
  objc_msgSend(v4, "na_each:", v5);

}

uint64_t __66__HFActionSetSuggestionItemProvider_setIncludeExistingActionSets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIncludeExistingActionSets:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setPersistAddedSuggestions:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  self->_persistAddedSuggestions = a3;
  -[HFActionSetSuggestionItemProvider staticSuggestionItems](self, "staticSuggestionItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__HFActionSetSuggestionItemProvider_setPersistAddedSuggestions___block_invoke;
  v5[3] = &__block_descriptor_33_e35_v16__0__HFActionSetSuggestionItem_8l;
  v6 = a3;
  objc_msgSend(v4, "na_each:", v5);

}

uint64_t __64__HFActionSetSuggestionItemProvider_setPersistAddedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistAddedSuggestions:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setServiceLikeItem:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_storeStrong((id *)&self->_serviceLikeItem, a3);
  -[HFActionSetSuggestionItemProvider staticSuggestionItems](self, "staticSuggestionItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HFActionSetSuggestionItemProvider_setServiceLikeItem___block_invoke;
  v8[3] = &unk_1EA72E170;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "na_each:", v8);

}

uint64_t __56__HFActionSetSuggestionItemProvider_setServiceLikeItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setServiceLikeItem:", *(_QWORD *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFActionSetSuggestionItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)_builtInActionSetOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFActionSetSuggestionItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HFActionSetSuggestionItemProvider__builtInActionSetOfType___block_invoke;
  v10[3] = &unk_1EA728840;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __61__HFActionSetSuggestionItemProvider__builtInActionSetOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "actionSetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];

  if (-[HFActionSetSuggestionItemProvider hasProvidedStaticSuggestionItems](self, "hasProvidedStaticSuggestionItems"))
  {
    v3 = 0;
  }
  else
  {
    -[HFActionSetSuggestionItemProvider staticSuggestionItems](self, "staticSuggestionItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[HFActionSetSuggestionItemProvider hasProvidedStaticSuggestionItems](self, "hasProvidedStaticSuggestionItems"))
  {
    -[HFActionSetSuggestionItemProvider staticSuggestionItems](self, "staticSuggestionItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[HFActionSetSuggestionItemProvider setHasProvidedStaticSuggestionItems:](self, "setHasProvidedStaticSuggestionItems:", 1);
  -[HFActionSetSuggestionItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke;
  v17[3] = &unk_1EA72E198;
  v17[4] = self;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke_2;
  v16[3] = &unk_1EA72ABE0;
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v6, v17, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke_3;
  v13[3] = &unk_1EA72E1C0;
  v13[4] = self;
  v14 = v3;
  v15 = v4;
  v9 = v4;
  v10 = v3;
  objc_msgSend(v8, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (objc_msgSend(*(id *)(a1 + 32), "includeCustomActionSets"))
  {
    objc_msgSend(v6, "actionSetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB8238]);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

HFActionSetSuggestionItem *__48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  HFActionSetSuggestionItem *v7;
  void *v8;
  HFActionSetSuggestionItem *v9;
  void *v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = [HFActionSetSuggestionItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFActionSetSuggestionItem initWithHome:actionSet:](v7, "initWithHome:actionSet:", v8, v6);

  objc_msgSend(*(id *)(a1 + 32), "serviceLikeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetSuggestionItem setServiceLikeItem:](v9, "setServiceLikeItem:", v10);

  -[HFActionSetSuggestionItem setIncludeExistingActionSets:](v9, "setIncludeExistingActionSets:", objc_msgSend(*(id *)(a1 + 32), "includeExistingActionSets"));
  -[HFActionSetSuggestionItem setPersistAddedSuggestions:](v9, "setPersistAddedSuggestions:", objc_msgSend(*(id *)(a1 + 32), "persistAddedSuggestions"));

  return v9;
}

id __48__HFActionSetSuggestionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  HFItemProviderReloadResults *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCustomSuggestionItems:", v4);

  v5 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  v6 = (void *)MEMORY[0x1E0D519C0];
  -[HFItemProviderReloadResults resultsByMergingWithResults:](v5, "resultsByMergingWithResults:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)items
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetSuggestionItemProvider staticSuggestionItems](self, "staticSuggestionItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "unionSet:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v5);

  }
  -[HFActionSetSuggestionItemProvider customSuggestionItems](self, "customSuggestionItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "unionSet:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v7);

  }
  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (BOOL)includeExistingActionSets
{
  return self->_includeExistingActionSets;
}

- (BOOL)includeCustomActionSets
{
  return self->_includeCustomActionSets;
}

- (void)setIncludeCustomActionSets:(BOOL)a3
{
  self->_includeCustomActionSets = a3;
}

- (BOOL)persistAddedSuggestions
{
  return self->_persistAddedSuggestions;
}

- (NSSet)staticSuggestionItems
{
  return self->_staticSuggestionItems;
}

- (void)setStaticSuggestionItems:(id)a3
{
  objc_storeStrong((id *)&self->_staticSuggestionItems, a3);
}

- (NSSet)customSuggestionItems
{
  return self->_customSuggestionItems;
}

- (void)setCustomSuggestionItems:(id)a3
{
  objc_storeStrong((id *)&self->_customSuggestionItems, a3);
}

- (BOOL)hasProvidedStaticSuggestionItems
{
  return self->_hasProvidedStaticSuggestionItems;
}

- (void)setHasProvidedStaticSuggestionItems:(BOOL)a3
{
  self->_hasProvidedStaticSuggestionItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSuggestionItems, 0);
  objc_storeStrong((id *)&self->_staticSuggestionItems, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
