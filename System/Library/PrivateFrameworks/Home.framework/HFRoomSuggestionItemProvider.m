@implementation HFRoomSuggestionItemProvider

- (HFRoomSuggestionItemProvider)initWithHome:(id)a3
{
  id v4;
  void *v5;
  HFRoomSuggestionItemProvider *v6;

  v4 = a3;
  +[HFDefaultRoomSuggestionVendor homeAppSuggestionVendor](HFDefaultRoomSuggestionVendor, "homeAppSuggestionVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFRoomSuggestionItemProvider initWithHome:suggestionVendor:](self, "initWithHome:suggestionVendor:", v4, v5);

  return v6;
}

- (HFRoomSuggestionItemProvider)initWithHome:(id)a3 suggestionVendor:(id)a4
{
  id v7;
  id v8;
  HFRoomSuggestionItemProvider *v9;
  HFRoomSuggestionItemProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFRoomSuggestionItemProvider;
  v9 = -[HFItemProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    v10->_suggestedRoomLimit = 3;
    objc_storeStrong((id *)&v10->_suggestionVendor, a4);
  }

  return v10;
}

- (HFRoomSuggestionItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFRoomSuggestionItemProvider.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFRoomSuggestionItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFRoomSuggestionItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)reloadItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HFItemProviderReloadResults *v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  HFRoomSuggestionItemProvider *v34;
  _QWORD aBlock[5];

  -[HFRoomSuggestionItemProvider suggestionItems](self, "suggestionItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_215);
  v4 = objc_claimAutoreleasedReturnValue();

  -[HFRoomSuggestionItemProvider _filteredSuggestions](self, "_filteredSuggestions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFRoomSuggestion priorityComparator](HFRoomSuggestion, "priorityComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  while (1)
  {
    v9 = objc_msgSend(v8, "count");
    if (v9 <= -[HFRoomSuggestionItemProvider suggestedRoomLimit](self, "suggestedRoomLimit"))
      break;
    objc_msgSend(v8, "removeLastObject");
  }
  v10 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v8, "na_map:", &__block_literal_global_10_15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFRoomSuggestionItemProvider _filteredSupplementaryRoomBuilders](self, "_filteredSupplementaryRoomBuilders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_dictionaryWithKeyGenerator:", &__block_literal_global_12_13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v15);

  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_4;
  aBlock[3] = &unk_1EA73E9E0;
  aBlock[4] = self;
  v17 = _Block_copy(aBlock);
  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v4, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "additions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_6;
  v32[3] = &unk_1EA73EA08;
  v33 = v14;
  v34 = self;
  v20 = v14;
  objc_msgSend(v19, "na_map:", v32);
  v30 = (void *)v4;
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "deletions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_map:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "updates");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "na_map:", v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setByAddingObjectsFromSet:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRoomSuggestionItemProvider setSuggestionItems:](self, "setSuggestionItems:", v26);

  v27 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", v21, v23, v25);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

id __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "roomBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

id __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "suggestionItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_5;
  v8[3] = &unk_1EA73E9B8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "roomBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

HFRoomBuilderItem *__43__HFRoomSuggestionItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  HFRoomBuilder *v4;
  HFRoomBuilder *v5;
  void *v6;
  HFRoomBuilderItem *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (HFRoomBuilder *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = [HFRoomBuilder alloc];
    objc_msgSend(*(id *)(a1 + 40), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HFItemBuilder initWithHome:](v5, "initWithHome:", v6);

    -[HFRoomBuilder setName:](v4, "setName:", v3);
  }
  v7 = -[HFRoomBuilderItem initWithRoomBuilder:]([HFRoomBuilderItem alloc], "initWithRoomBuilder:", v4);

  return v7;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFRoomSuggestionItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("room"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_filteredSupplementaryRoomBuilders
{
  void *v2;
  void *v3;

  -[HFRoomSuggestionItemProvider supplementaryRoomBuilders](self, "supplementaryRoomBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_23_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __66__HFRoomSuggestionItemProvider__filteredSupplementaryRoomBuilders__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)_filteredSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFRoomSuggestionItemProvider suggestionVendor](self, "suggestionVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roomSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke;
  v7[3] = &unk_1EA73EAF8;
  v7[4] = self;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyForRoomName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "aliases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_2;
  v22[3] = &unk_1EA727B38;
  v22[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "na_map:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rooms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_map:", &__block_literal_global_26_3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_filteredSupplementaryRoomBuilders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_map:", &__block_literal_global_27_10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v16);

  if (objc_msgSend(v14, "count"))
  {
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_5;
    v19[3] = &unk_1EA73EAD0;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v9;
    v21 = v6;
    v17 = objc_msgSend(v14, "na_all:", v19);

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_keyForRoomName:", a2);
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_keyForRoomName:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setByAddingObject:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_6;
  v8[3] = &unk_1EA726EA8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_all:", v8);

  return v6;
}

uint64_t __52__HFRoomSuggestionItemProvider__filteredSuggestions__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsString:", a2) ^ 1;
}

- (id)_keyForRoomName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "stringByApplyingTransform:reverse:", CFSTR("Any-Latin; Latin-ASCII; Any-Lower"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFRoomSuggestionRoomKey"), CFSTR("HFRoomSuggestionRoomKey"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v5, &stru_1EA741FF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", &stru_1EA741FF8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)suggestedRoomLimit
{
  return self->_suggestedRoomLimit;
}

- (void)setSuggestedRoomLimit:(unint64_t)a3
{
  self->_suggestedRoomLimit = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (HFRoomSuggestionVendor)suggestionVendor
{
  return self->_suggestionVendor;
}

- (void)setSuggestionVendor:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionVendor, a3);
}

- (NSSet)supplementaryRoomBuilders
{
  return self->_supplementaryRoomBuilders;
}

- (void)setSupplementaryRoomBuilders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)suggestionItems
{
  return self->_suggestionItems;
}

- (void)setSuggestionItems:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionItems, 0);
  objc_storeStrong((id *)&self->_supplementaryRoomBuilders, 0);
  objc_storeStrong((id *)&self->_suggestionVendor, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
