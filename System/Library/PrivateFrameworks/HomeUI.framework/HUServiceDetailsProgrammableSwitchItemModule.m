@implementation HUServiceDetailsProgrammableSwitchItemModule

- (HUCharacteristicEventOptionProvider)programmableSwitchOptionsProvider
{
  HUCharacteristicEventOptionProvider *programmableSwitchOptionsProvider;
  void *v5;
  HUCharacteristicEventOptionProvider *v6;
  void *v7;
  void *v8;
  HUCharacteristicEventOptionProvider *v9;
  HUCharacteristicEventOptionProvider *v10;
  HUCharacteristicEventOptionProvider *v11;
  id v12;
  HUCharacteristicEventOptionProvider *v13;
  _QWORD v14[4];
  id v15;

  programmableSwitchOptionsProvider = self->_programmableSwitchOptionsProvider;
  if (programmableSwitchOptionsProvider)
    return programmableSwitchOptionsProvider;
  -[HUServiceDetailsItemModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HUCharacteristicEventOptionProvider alloc];
  -[HUServiceDetailsItemModule sourceItem](self, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsItemModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUCharacteristicEventOptionProvider initWithServiceVendingItem:home:](v6, "initWithServiceVendingItem:home:", v7, v8);
  v10 = self->_programmableSwitchOptionsProvider;
  self->_programmableSwitchOptionsProvider = v9;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__HUServiceDetailsProgrammableSwitchItemModule_programmableSwitchOptionsProvider__block_invoke;
  v14[3] = &unk_1E6F5D540;
  v15 = v5;
  v11 = self->_programmableSwitchOptionsProvider;
  v12 = v5;
  -[HUCharacteristicEventOptionProvider setFilter:](v11, "setFilter:", v14);
  v13 = self->_programmableSwitchOptionsProvider;

  return v13;
}

uint64_t __81__HUServiceDetailsProgrammableSwitchItemModule_programmableSwitchOptionsProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (NSSet)itemProviders
{
  NSSet *itemProviders;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[HUServiceDetailsProgrammableSwitchItemModule programmableSwitchOptionsProvider](self, "programmableSwitchOptionsProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v5);
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_itemProviders;
    self->_itemProviders = v6;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  objc_msgSend(a3, "na_filter:", &__block_literal_global_245);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E10];
    v6 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
    v28[3] = &unk_1E6F5D588;
    v7 = v4;
    v29 = v7;
    objc_msgSend(v3, "na_map:", v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orderedSetWithSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v6;
    v26[1] = 3221225472;
    v26[2] = __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_3;
    v26[3] = &unk_1E6F5A9A0;
    v27 = v7;
    v10 = v7;
    objc_msgSend(v9, "sortUsingComparator:", v26);
    v11 = (void *)objc_opt_new();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_5;
    v22[3] = &unk_1E6F5D5D0;
    v23 = v9;
    v24 = (id)objc_opt_new();
    v12 = v11;
    v25 = v12;
    v13 = v24;
    v14 = v9;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v22);
    objc_msgSend(v12, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_9;
    v19[3] = &unk_1E6F5D678;
    v20 = v12;
    v21 = &__block_literal_global_16_1;
    v16 = v12;
    objc_msgSend(v15, "na_map:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sectionElementIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v8);
  return v8;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = -1;
  else
    v9 = v8 != 0;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
    v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

void __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("HUServiceDetailsProgrammableSwitchSectionIdentifierPrefix-"), "stringByAppendingFormat:", CFSTR("%lu"), objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v10));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v10, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  objc_msgSend(*(id *)(a1 + 48), "na_objectForKey:withDefaultValue:", v6, &__block_literal_global_12_2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v3);

}

id __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_6()
{
  return (id)objc_opt_new();
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;

  v4 = a2;
  v5 = a3;
  HFProgrammableSwitchInputEventOptionDisplayPriorityMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v14 = -1;
  else
    v14 = v13 != 0;
  if (v10)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (!v15)
    v14 = objc_msgSend(v10, "compare:", v13);

  return v14;
}

id __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
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
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v4);

  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_19_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("sectionIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("sectionNamespace"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("sectionElementIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("sectionTitleKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v15);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), v9, v11, v13, CFSTR("HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v17);

  objc_msgSend(v5, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingComparator:", *(_QWORD *)(a1 + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v19);

  return v6;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "characteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_21_4);

  return v3;
}

uint64_t __80__HUServiceDetailsProgrammableSwitchItemModule_buildSectionsWithDisplayedItems___block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB8908]);

  return v3;
}

- (void)setItemProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_programmableSwitchOptionsProvider, 0);
}

@end
