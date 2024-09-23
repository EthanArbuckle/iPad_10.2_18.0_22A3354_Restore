@implementation HUCharacteristicEventOptionProvider

- (HUCharacteristicEventOptionProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceVendingItem_home_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCharacteristicEventOptionProvider.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCharacteristicEventOptionProvider init]",
    v5);

  return 0;
}

- (HUCharacteristicEventOptionProvider)initWithServiceVendingItem:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUCharacteristicEventOptionProvider *v9;
  HUCharacteristicEventOptionProvider *v10;
  uint64_t v11;
  NSMutableSet *optionItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicEventOptionProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_storeStrong((id *)&v10->_serviceVendingItem, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    optionItems = v10->_optionItems;
    v10->_optionItems = (NSMutableSet *)v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUCharacteristicEventOptionProvider serviceVendingItem](self, "serviceVendingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventOptionProvider home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithServiceVendingItem:home:", v5, v6);

  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[5];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventOptionProvider serviceVendingItem](self, "serviceVendingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCharacteristicEventOptionProvider serviceVendingItem](self, "serviceVendingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUCharacteristicEventOptionProvider serviceVendingItem](self, "serviceVendingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldReduceOptionItemsForNotifyingCharacteristics");

  }
  else
  {
    v9 = 1;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HUCharacteristicEventOptionProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6F5FCE0;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    (*((void (**)(void *, void *))v10 + 2))(v10, v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v12);
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v33 = v5;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "unionSet:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
      v5 = v33;
    }
  }

  -[HUCharacteristicEventOptionProvider filter](self, "filter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HUCharacteristicEventOptionProvider filter](self, "filter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_filter:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "mutableCopy");

    v3 = (void *)v22;
  }
  v23 = (void *)MEMORY[0x1E0D317F0];
  -[HUCharacteristicEventOptionProvider optionItems](self, "optionItems");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "diffFromSet:toSet:", v24, v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc(MEMORY[0x1E0D314A0]);
  objc_msgSend(v25, "additions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "deletions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updates");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v26, "initWithAddedItems:removedItems:existingItems:", v27, v28, v29);

  -[HUCharacteristicEventOptionProvider setOptionItems:](self, "setOptionItems:", v3);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

id __50__HUCharacteristicEventOptionProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "_notifyingCharacteristicsKeyedByTypeForServices:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HUCharacteristicEventOptionProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_1E6F5FCB8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __50__HUCharacteristicEventOptionProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "eventBuilderItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8
    || (objc_msgSend(*(id *)(a1 + 32), "eventBuilderItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "characteristics"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v5, "intersectsSet:", v10),
        v10,
        v9,
        v11))
  {
    objc_msgSend(*(id *)(a1 + 32), "_optionsForCharacteristicType:characteristics:", v13, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(*(id *)(a1 + 40), "unionSet:", v12);

  }
}

- (id)invalidationReasons
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUCharacteristicEventOptionProvider;
  -[HFItemProvider invalidationReasons](&v8, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308D8];
  v9[0] = *MEMORY[0x1E0D308D0];
  v9[1] = v3;
  v4 = *MEMORY[0x1E0D308A0];
  v9[2] = *MEMORY[0x1E0D308E8];
  v9[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)hasOptionsForServiceVendingItem:(id)a3 outCharacteristicType:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "hasOptionsForServices:outCharacteristicType:", v6, a4);

  return (char)a4;
}

+ (BOOL)hasOptionsForAnyServiceInHome:(id)a3
{
  return objc_msgSend(a1, "hasOptionsForAnyServiceInHome:allowingSensors:", a3, 1);
}

+ (BOOL)hasOptionsForAnyServiceInHome:(id)a3 allowingSensors:(BOOL)a4
{
  void *v6;
  char v7;
  _QWORD v9[5];
  BOOL v10;

  objc_msgSend(a3, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__HUCharacteristicEventOptionProvider_hasOptionsForAnyServiceInHome_allowingSensors___block_invoke;
  v9[3] = &__block_descriptor_41_e21_B16__0__HMAccessory_8l;
  v9[4] = a1;
  v10 = a4;
  v7 = objc_msgSend(v6, "na_any:", v9);

  return v7;
}

uint64_t __85__HUCharacteristicEventOptionProvider_hasOptionsForAnyServiceInHome_allowingSensors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "hasOptionsForServices:outCharacteristicType:allowingSensors:", v6, 0, *(unsigned __int8 *)(a1 + 40));

  return v7;
}

+ (BOOL)hasOptionsForServices:(id)a3 outCharacteristicType:(id *)a4
{
  return objc_msgSend(a1, "hasOptionsForServices:outCharacteristicType:allowingSensors:", a3, a4, 1);
}

+ (BOOL)hasOptionsForServices:(id)a3 outCharacteristicType:(id *)a4 allowingSensors:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  char v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  objc_msgSend(a1, "_supportedCharacteristicTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__32;
  v22 = __Block_byref_object_dispose__32;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__HUCharacteristicEventOptionProvider_hasOptionsForServices_outCharacteristicType_allowingSensors___block_invoke;
  v15[3] = &unk_1E6F5FD50;
  v12 = v9;
  v16 = v12;
  v17 = &v18;
  v13 = objc_msgSend(v8, "na_any:", v15);
  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __99__HUCharacteristicEventOptionProvider_hasOptionsForServices_outCharacteristicType_allowingSensors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__HUCharacteristicEventOptionProvider_hasOptionsForServices_outCharacteristicType_allowingSensors___block_invoke_2;
  v8[3] = &unk_1E6F5FD28;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = objc_msgSend(v3, "na_any:", v8);

  return v6;
}

uint64_t __99__HUCharacteristicEventOptionProvider_hasOptionsForServices_outCharacteristicType_allowingSensors___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);
  if ((_DWORD)v6)
  {
    objc_msgSend(v3, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0CB8780]);

    if (!v8)
    {
      v6 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v3, "characteristicType");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

LABEL_6:
  return v6;
}

+ (id)characteristicTypeWithOptionsForServices:(id)a3
{
  int v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  v3 = objc_msgSend(a1, "hasOptionsForServices:outCharacteristicType:", a3, &v8);
  v4 = v8;
  v5 = v4;
  if (!v3)
    v4 = 0;
  v6 = v4;

  return v6;
}

+ (BOOL)homeHubUpdateRequiredForServices:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_characteristicTypesRequiringUpdatedHomeHubs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v7, "hf_supportsSharedEventAutomation");

  if ((a1 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__HUCharacteristicEventOptionProvider_homeHubUpdateRequiredForServices_forHome___block_invoke;
    v11[3] = &unk_1E6F4EE58;
    v12 = v8;
    v9 = objc_msgSend(v6, "na_any:", v11);

  }
  return v9;
}

uint64_t __80__HUCharacteristicEventOptionProvider_homeHubUpdateRequiredForServices_forHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__HUCharacteristicEventOptionProvider_homeHubUpdateRequiredForServices_forHome___block_invoke_2;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __80__HUCharacteristicEventOptionProvider_homeHubUpdateRequiredForServices_forHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)_notifyingCharacteristicsKeyedByTypeForServices:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    v5 = *MEMORY[0x1E0CB8780];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v6;
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v7, "characteristics");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v13, "properties");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "containsObject:", v5);

              if (v15)
              {
                objc_msgSend(v13, "characteristicType");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  objc_msgSend(v4, "objectForKeyedSubscript:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v17)
                  {
                    objc_msgSend(v4, "objectForKeyedSubscript:", v16);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "addObject:", v13);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v13);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v16);
                  }

                }
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v10);
        }

        v6 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

  return v4;
}

- (id)_optionsForCharacteristicType:(id)a3 characteristics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  HUCharacteristicEventOptionProvider *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[5];

  v71[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke;
  v69[3] = &unk_1E6F4EE30;
  v10 = v6;
  v70 = v10;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v69);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "na_any:", &__block_literal_global_288);
  v51 = objc_opt_class();
  -[HUCharacteristicEventOptionProvider valueSource](self, "valueSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB8988];
  v71[0] = *MEMORY[0x1E0CB8958];
  v71[1] = v13;
  v71[2] = *MEMORY[0x1E0CB8820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v10);

  v53 = v9;
  if (v15)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_valueRangeCharacteristicTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v10);

  if (v18)
  {
    objc_msgSend(v55, "hf_maximumTriggerValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "hf_valueBeforeTriggerValue:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMaxValue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v21);

    objc_msgSend(v55, "hf_minimumTriggerValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "hf_valueAfterTriggerValue:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMinValue:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v24);

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_alarmCharacteristicTypes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "containsObject:", v10);

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CBA458], "hf_abnormalValueForAlarmCharacteristicType:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v27);

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "containsObject:", v10);

  if (v46)
  {
LABEL_2:
    objc_msgSend(v8, "addObject:", MEMORY[0x1E0C9AAB0]);
    v16 = (void *)MEMORY[0x1E0C9AAA0];
LABEL_3:
    objc_msgSend(v8, "addObject:", v16);
LABEL_8:
    v28 = v51;
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8868]))
  {
    objc_msgSend(v8, "addObject:", &unk_1E7041CF8);
    v16 = &unk_1E7041D10;
    goto LABEL_3;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8838]))
  {
    objc_msgSend(v8, "addObject:", &unk_1E7041D10);
    v16 = &unk_1E7041CF8;
    goto LABEL_3;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8888]))
  {
    objc_msgSend(v8, "addObject:", &unk_1E7041CF8);
    objc_msgSend(v8, "addObject:", &unk_1E7041D28);
    v16 = &unk_1E7041D40;
    goto LABEL_3;
  }
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8878]))
  {
    objc_msgSend(v8, "addObject:", &unk_1E7041D58);
    objc_msgSend(MEMORY[0x1E0CBA718], "numberRangeWithMinValue:", &unk_1E7041D70);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObject:", v47);

    goto LABEL_8;
  }
  v28 = v51;
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8908]) & v11) == 1)
  {
    objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_32_2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "hf_programmableSwitchValidValueSet");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_class();
    objc_msgSend(v49, "sortedValues");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v50);

  }
LABEL_9:
  -[HUCharacteristicEventOptionProvider optionItems](self, "optionItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  v31 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_2_34;
  v64[3] = &unk_1E6F5FDB8;
  v32 = v29;
  v65 = v32;
  v33 = v7;
  v67 = v12;
  v68 = v28;
  v66 = v33;
  v52 = v12;
  objc_msgSend(v30, "na_map:", v64);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v31;
  v61[1] = 3221225472;
  v61[2] = __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_3;
  v61[3] = &unk_1E6F5FDE0;
  v35 = v32;
  v62 = v35;
  v36 = v33;
  v63 = v36;
  objc_msgSend(v54, "na_map:", v61);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setByAddingObjectsFromSet:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v56[0] = v31;
  v56[1] = 3221225472;
  v56[2] = __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_4;
  v56[3] = &unk_1E6F5FE08;
  v57 = v35;
  v58 = v36;
  v59 = self;
  v60 = v10;
  v39 = v10;
  v40 = v36;
  v41 = v35;
  objc_msgSend(v53, "na_map:", v56);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setByAddingObjectsFromSet:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

uint64_t __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isProgrammableSwitch");

  return v3;
}

uint64_t __85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB8908]);

  return v3;
}

HUCharacteristicEventOptionItem *__85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_2_34(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  HUCharacteristicEventOptionItem *v14;
  HUProgrammableSwitchEventOptionItem *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v5)
    goto LABEL_14;
  v6 = v5;
  v7 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v19 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v9, "characteristics", (_QWORD)v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqualToSet:", *(_QWORD *)(a1 + 40)))
        goto LABEL_11;
      objc_msgSend(v9, "triggerValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqual:", v3) & 1) == 0)
      {

LABEL_11:
        continue;
      }
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v14 = v9;

        goto LABEL_17;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v6);
LABEL_14:

  v13 = *(_QWORD *)(a1 + 56);
  if (v13 == objc_opt_class())
  {
    v15 = [HUProgrammableSwitchEventOptionItem alloc];
    objc_msgSend(*(id *)(a1 + 40), "anyObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUProgrammableSwitchEventOptionItem initWithCharacteristic:triggerValue:valueSource:](v15, "initWithCharacteristic:triggerValue:valueSource:", v16, v3, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v14 = -[HUCharacteristicEventOptionItem initWithCharacteristics:triggerValue:]([HUCharacteristicEventOptionItem alloc], "initWithCharacteristics:triggerValue:", *(_QWORD *)(a1 + 40), v3);
  }
LABEL_17:

  return v14;
}

HUCharacteristicEventOptionItem *__85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  HUCharacteristicEventOptionItem *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "characteristics", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToSet:", *(_QWORD *)(a1 + 40)) & 1) != 0)
        {
          objc_msgSend(v9, "triggerValueRange");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hf_isEqual:", v3);

          if ((v12 & 1) != 0)
          {
            v13 = v9;

            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = -[HUCharacteristicEventOptionItem initWithCharacteristics:triggerValueRange:]([HUCharacteristicEventOptionItem alloc], "initWithCharacteristics:triggerValueRange:", *(_QWORD *)(a1 + 40), v3);
LABEL_13:

  return v13;
}

HUCharacteristicEventOptionItem *__85__HUCharacteristicEventOptionProvider__optionsForCharacteristicType_characteristics___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  HUCharacteristicEventOptionItem *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  HUCharacteristicEventOptionItem *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = (HUCharacteristicEventOptionItem *)*(id *)(a1 + 32);
  v5 = -[HUCharacteristicEventOptionItem countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "characteristics", (_QWORD)v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToSet:", *(_QWORD *)(a1 + 40)) & 1) != 0)
        {
          objc_msgSend(v9, "thresholdValueRange");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hf_isEqual:", v3);

          if ((v12 & 1) != 0)
          {
            v23 = v9;
            goto LABEL_22;
          }
        }
        else
        {

        }
      }
      v6 = -[HUCharacteristicEventOptionItem countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  v23 = -[HUCharacteristicEventOptionItem initWithCharacteristics:thresholdValueRange:]([HUCharacteristicEventOptionItem alloc], "initWithCharacteristics:thresholdValueRange:", *(_QWORD *)(a1 + 40), v3);
  v4 = -[HUCharacteristicEventOptionItem initWithCharacteristics:thresholdValueRange:]([HUCharacteristicEventOptionItem alloc], "initWithCharacteristics:thresholdValueRange:", *(_QWORD *)(a1 + 40), v3);
  -[HUCharacteristicEventOptionItem setChildItem:](v23, "setChildItem:", v4);
  objc_msgSend(*(id *)(a1 + 48), "eventBuilderItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "representativeEventBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v15 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_msgSend(v15, "characteristic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "characteristicType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *(_QWORD *)(a1 + 56));

    if (v20)
    {
      objc_msgSend(v17, "thresholdRange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "minValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[HUCharacteristicEventOptionItem setThresholdValue:](v23, "setThresholdValue:", v22);
      }
      else
      {
        objc_msgSend(v17, "thresholdRange");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "maxValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCharacteristicEventOptionItem setThresholdValue:](v23, "setThresholdValue:", v25);

      }
    }
  }

LABEL_22:
  return v23;
}

+ (id)_supportedCharacteristicTypes
{
  if (_MergedGlobals_3_11 != -1)
    dispatch_once(&_MergedGlobals_3_11, &__block_literal_global_42_3);
  return (id)qword_1EF226C68;
}

void __68__HUCharacteristicEventOptionProvider__supportedCharacteristicTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB89C8], *MEMORY[0x1E0CB8790], *MEMORY[0x1E0CB87B0], *MEMORY[0x1E0CB8868], *MEMORY[0x1E0CB8838], *MEMORY[0x1E0CB8820], *MEMORY[0x1E0CB8888], *MEMORY[0x1E0CB8878], *MEMORY[0x1E0CB8908], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1EF226C68;
  qword_1EF226C68 = v1;

}

+ (id)_characteristicTypesRequiringUpdatedHomeHubs
{
  if (qword_1EF226C70 != -1)
    dispatch_once(&qword_1EF226C70, &__block_literal_global_44);
  return (id)qword_1EF226C78;
}

void __83__HUCharacteristicEventOptionProvider__characteristicTypesRequiringUpdatedHomeHubs__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8878], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF226C78;
  qword_1EF226C78 = v0;

}

- (id)valueSource
{
  void *v3;
  void *v4;
  void *v5;

  -[HUCharacteristicEventOptionProvider overrideValueSource](self, "overrideValueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCharacteristicEventOptionProvider overrideValueSource](self, "overrideValueSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUCharacteristicEventOptionProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_characteristicValueManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HFServiceVendor)serviceVendingItem
{
  return self->_serviceVendingItem;
}

- (void)setServiceVendingItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceVendingItem, a3);
}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (void)setEventBuilderItem:(id)a3
{
  objc_storeStrong((id *)&self->_eventBuilderItem, a3);
}

- (NSMutableSet)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
  objc_storeStrong((id *)&self->_optionItems, a3);
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (void)setOverrideValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_overrideValueSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_optionItems, 0);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
  objc_storeStrong((id *)&self->_serviceVendingItem, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
