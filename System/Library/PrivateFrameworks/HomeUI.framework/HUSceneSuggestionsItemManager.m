@implementation HUSceneSuggestionsItemManager

+ (id)suggestionsItemProviderInHome:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D33520];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithHome:andServiceLikeItems:", v4, 0);

  objc_msgSend(v5, "setEngineOptions:", objc_msgSend(v5, "engineOptions") | 0x10);
  objc_msgSend(v5, "setFilter:", &__block_literal_global_84);
  return v5;
}

uint64_t __63__HUSceneSuggestionsItemManager_suggestionsItemProviderInHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "actionSetBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_5_0);

  return v3;
}

BOOL __63__HUSceneSuggestionsItemManager_suggestionsItemProviderInHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "actionSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (id)computeNumberOfSuggestionsInHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "suggestionsItemProviderInHome:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "reloadItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke;
  v9[3] = &unk_1E6F4D2A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combineAllFutures:ignoringErrors:scheduler:", v3, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke_3;
  v10[3] = &unk_1E6F514A0;
  v11 = v1;
  v7 = v1;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D30910];
  v8[0] = MEMORY[0x1E0C9AAB0];
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __66__HUSceneSuggestionsItemManager_computeNumberOfSuggestionsInHome___block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v16;
    v6 = *MEMORY[0x1E0D30D70];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "latestResults", (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "BOOLValue");

        v4 += v10 ^ 1u;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D31840]);
  v18 = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSceneSuggestionsAddCustomSceneButton"), CFSTR("HUSceneSuggestionsAddCustomSceneButton"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithResults:", v9);
  -[HUSceneSuggestionsItemManager setAddCustomSceneItem:](self, "setAddCustomSceneItem:", v10);

  -[HUSceneSuggestionsItemManager addCustomSceneItem](self, "addCustomSceneItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v6);
  objc_msgSend((id)objc_opt_class(), "suggestionsItemProviderInHome:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSceneSuggestionsItemManager setSuggestionItemProvider:](self, "setSuggestionItemProvider:", v13);
  v17[0] = v12;
  -[HUSceneSuggestionsItemManager suggestionItemProvider](self, "suggestionItemProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)_numberOfSections
{
  void *v2;
  unint64_t v3;

  -[HUSceneSuggestionsItemManager _currentSectionIdentifiers](self, "_currentSectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HUSceneSuggestionsItemManager _currentSectionIdentifiers](self, "_currentSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
    NSLog(CFSTR("Received identifier request for section (%ld), but only have (%ld) sections"), a3, objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("HUSceneSuggestionsSectionIdentifierSuggestions")))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSceneSuggestionsSectionHeaderTitle"), CFSTR("HUSceneSuggestionsSectionHeaderTitle"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[HUSceneSuggestionsItemManager addCustomSceneItem](self, "addCustomSceneItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    return CFSTR("HUSceneSuggestionsSectionIdentifierCustom");
  else
    return CFSTR("HUSceneSuggestionsSectionIdentifierSuggestions");
}

- (id)_currentSectionIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneSuggestionsItemManager suggestionItemProvider](self, "suggestionItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[HUSceneSuggestionsItemManager suggestionItemProvider](self, "suggestionItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_26_1);

    if (v8)
      objc_msgSend(v3, "addObject:", CFSTR("HUSceneSuggestionsSectionIdentifierSuggestions"));
  }
  else
  {

  }
  objc_msgSend(v3, "addObject:", CFSTR("HUSceneSuggestionsSectionIdentifierCustom"));
  return v3;
}

uint64_t __59__HUSceneSuggestionsItemManager__currentSectionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0C9AAB0], "isEqual:", v3) ^ 1;

  return v4;
}

- (HFItem)addCustomSceneItem
{
  return self->_addCustomSceneItem;
}

- (void)setAddCustomSceneItem:(id)a3
{
  objc_storeStrong((id *)&self->_addCustomSceneItem, a3);
}

- (HREActionSetRecommendationItemProvider)suggestionItemProvider
{
  return self->_suggestionItemProvider;
}

- (void)setSuggestionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionItemProvider, 0);
  objc_storeStrong((id *)&self->_addCustomSceneItem, 0);
}

@end
