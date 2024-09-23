@implementation JFXEffectFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_20);
  return (id)sharedInstance_sInstance_1;
}

void __34__JFXEffectFactory_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sInstance_1;
  sharedInstance_sInstance_1 = v0;

}

+ (JFXEffectFactoryDelegate)delegate
{
  return (JFXEffectFactoryDelegate *)(id)jfx_factoryDelegate;
}

+ (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&jfx_factoryDelegate, a3);
}

- (void)effectCategoriesForPickerItem:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend((id)objc_opt_class(), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "effectFactory:effectCategoriesForGroupID:completion:", self, v10, v6);

  }
  else
  {
    v6[2](v6, MEMORY[0x24BDBD1A8]);
  }

}

- (void)effectCategoriesForType:(int)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v6)(id, uint64_t);
  void *v7;
  char v8;
  __CFString **v9;
  __CFString *v10;
  uint64_t v11;
  id v12;

  v4 = *(_QWORD *)&a3;
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend((id)objc_opt_class(), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    if (effectCategoriesForType_completion__onceToken != -1)
      dispatch_once(&effectCategoriesForType_completion__onceToken, &__block_literal_global_54);
    switch((_DWORD)v4)
    {
      case 1:
        v9 = &kJFXEffectPropertiesFiltersKey;
        break;
      case 2:
        v9 = &kJFXEffectPropertiesOverlaysKey;
        break;
      case 4:
        v9 = &kJFXEffectPropertiesTitleCardsKey;
        break;
      default:
        v10 = 0;
        goto LABEL_13;
    }
    v10 = *v9;
LABEL_13:
    v12 = v10;
    objc_msgSend((id)effectCategoriesForType_completion__sAllEffectCategories, "objectForKeyedSubscript:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

    v6 = (void (**)(id, uint64_t))v11;
    goto LABEL_14;
  }
  objc_msgSend((id)objc_opt_class(), "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "effectFactory:effectCategoriesAvailableForType:completion:", self, v4, v6);
LABEL_14:

}

void __55__JFXEffectFactory_effectCategoriesForType_completion___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)effectCategoriesForType_completion__sAllEffectCategories;
  effectCategoriesForType_completion__sAllEffectCategories = (uint64_t)v0;

  v2 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", kJFXEffectPropertiesResourceFile, kJFXEffectPropertiesPlistKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_59);
}

void __55__JFXEffectFactory_effectCategoriesForType_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  unsigned int v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v25 = v4;
  if ((objc_msgSend(v4, "isEqualToString:", kJFXEffectPropertiesOverlaysKey) & 1) != 0)
  {
    v6 = 0;
    v7 = 2;
LABEL_5:
    v28 = v7;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "isEqualToString:", kJFXEffectPropertiesTitleCardsKey) & 1) != 0)
  {
    v6 = 0;
    v7 = 4;
    goto LABEL_5;
  }
  v28 = objc_msgSend(v4, "isEqualToString:", kJFXEffectPropertiesFiltersKey);
  v6 = v28 ^ 1;
LABEL_7:
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v8 = v28;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v37;
    v26 = v6;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if ((v6 & 1) != 0)
          v11 = 0;
        else
          v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setEffectType:", v8);
        objc_msgSend(v10, "objectForKeyedSubscript:", kJFXEffectPropertiesIdentifierKey);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "setCategoryID:", v12);
          objc_msgSend(v12, "stringByAppendingString:", CFSTR("_Category_Display_Name"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", v13, &stru_24EE5C428, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setDisplayName:", v15);
          v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v10, "objectForKeyedSubscript:", kJFXEffectPropertiesEffectsKey);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v33;
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v33 != v21)
                    objc_enumerationMutation(v18);
                  objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "objectForKeyedSubscript:", kJFXEffectPropertiesIdentifierKey);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v23)
                    objc_msgSend(v16, "addObject:", v23);

                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              }
              while (v20);
            }
            objc_msgSend(v11, "setEffectIDs:", v16);
            v6 = v26;
            v8 = v28;
          }
          objc_msgSend(v11, "effectIDs");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            objc_msgSend(v27, "addObject:", v11);

        }
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v31);
  }

  objc_msgSend((id)effectCategoriesForType_completion__sAllEffectCategories, "setObject:forKeyedSubscript:", v27, v25);
}

- (void)effectIDsForType:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectFactory:effectIDsAvailableForType:completion:", self, v4, v6);

}

- (void)effectIDsForPickerItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__JFXEffectFactory_effectIDsForPickerItem_completion___block_invoke;
    v12[3] = &unk_24EE59018;
    v13 = v7;
    objc_msgSend(v10, "effectFactory:effectCategoriesForGroupID:completion:", self, v11, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1A8]);
  }

}

void __54__JFXEffectFactory_effectIDsForPickerItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "effectIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__JFXEffectFactory_effectIDsForPickerItem_completion___block_invoke_2;
  v13[3] = &unk_24EE58FF0;
  v11 = *(id *)(a1 + 32);
  v14 = v4;
  v15 = v11;
  v12 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

uint64_t __54__JFXEffectFactory_effectIDsForPickerItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)effectsForType:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__JFXEffectFactory_effectsForType_completion___block_invoke;
  v8[3] = &unk_24EE59040;
  v10 = v4;
  v9 = v6;
  v7 = v6;
  -[JFXEffectFactory effectIDsForType:completion:](self, "effectIDsForType:completion:", v4, v8);

}

void __46__JFXEffectFactory_effectsForType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (objc_class *)JFXEffectClassForType(*(_DWORD *)(a1 + 40));
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = [v4 alloc];
        v13 = (void *)objc_msgSend(v12, "initWithEffectID:", v11, (_QWORD)v14);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)effectsForType:(int)a3 pickerItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int v12;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__JFXEffectFactory_effectsForType_pickerItem_completion___block_invoke;
  v10[3] = &unk_24EE59040;
  v12 = a3;
  v11 = v8;
  v9 = v8;
  -[JFXEffectFactory effectIDsForPickerItem:completion:](self, "effectIDsForPickerItem:completion:", a4, v10);

}

void __57__JFXEffectFactory_effectsForType_pickerItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (objc_class *)JFXEffectClassForType(*(_DWORD *)(a1 + 40));
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = [v4 alloc];
        v13 = (void *)objc_msgSend(v12, "initWithEffectID:", v11, (_QWORD)v14);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)effectsForType:(int)a3 fromCategory:(id)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (objc_class *)JFXEffectClassForType(a3);
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "effectIDs", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend([v6 alloc], "initWithEffectID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)fetchPickerItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__JFXEffectFactory_fetchPickerItems___block_invoke;
  v7[3] = &unk_24EE59018;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "effectFactory:fetchPickerItemsWithCompletion:", self, v7);

}

void __37__JFXEffectFactory_fetchPickerItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__JFXEffectFactory_fetchPickerItems___block_invoke_2;
  v6[3] = &unk_24EE58FF0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __37__JFXEffectFactory_fetchPickerItems___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)defaultPickerItemForType:(int)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__JFXEffectFactory_defaultPickerItemForType_completion___block_invoke;
  v8[3] = &unk_24EE59040;
  v10 = a3;
  v9 = v6;
  v7 = v6;
  -[JFXEffectFactory fetchPickerItems:](self, "fetchPickerItems:", v8);

}

void __56__JFXEffectFactory_defaultPickerItemForType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  int v8;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__JFXEffectFactory_defaultPickerItemForType_completion___block_invoke_2;
  v7[3] = &__block_descriptor_36_e34_B32__0__JFXPickerListItem_8Q16_B24l;
  v8 = *(_DWORD *)(a1 + 40);
  v3 = a2;
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v7);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

BOOL __56__JFXEffectFactory_defaultPickerItemForType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "effectType") == *(_DWORD *)(a1 + 32);
}

- (void)pickerItemForCategory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke;
  v10[3] = &unk_24EE590B0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[JFXEffectFactory fetchPickerItems:](self, "fetchPickerItems:", v10);

}

void __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id obj;
  _QWORD block[5];
  id v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "collections");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke_2;
        v14[3] = &unk_24EE59088;
        v15 = *(id *)(a1 + 32);
        v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v14);

        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke_3;
          block[3] = &unk_24EE58FF0;
          v10 = *(id *)(a1 + 40);
          block[4] = v7;
          v13 = v10;
          dispatch_async(MEMORY[0x24BDAC9B8], block);

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "categoryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "categoryID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __53__JFXEffectFactory_pickerItemForCategory_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)createEffectForType:(int)a3 fromID:(id)a4 withProperties:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)JFXEffectClassForType(a3);
  if (v9)
  {
    v10 = (void *)objc_msgSend([v9 alloc], "initWithEffectID:", v7);
    v11 = v10;
    if (v8)
      objc_msgSend(v10, "addEffectParameters:", v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)noneEffectIDForType:(int)a3
{
  id v3;

  v3 = 0;
  if (a3 <= 8 && ((1 << a3) & 0x162) != 0)
    v3 = (id)*MEMORY[0x24BE79298];
  return v3;
}

- (id)createEffectContentDataSourceForEffectID:(id)a3 ofType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (+[JFXEffect effectIDIsNone:](JFXEffect, "effectIDIsNone:", v6)
    || (objc_msgSend((id)objc_opt_class(), "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) == 0))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "effectFactory:createEffectContentDataSourceForEffectID:ofType:", self, v6, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

@end
