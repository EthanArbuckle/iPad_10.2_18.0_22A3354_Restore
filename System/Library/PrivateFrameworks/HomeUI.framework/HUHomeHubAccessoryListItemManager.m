@implementation HUHomeHubAccessoryListItemManager

- (HUHomeHubAccessoryListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessories_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeHubAccessoryListItemManager.m"), 25, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUHomeHubAccessoryListItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUHomeHubAccessoryListItemManager)initWithAccessories:(id)a3 delegate:(id)a4
{
  id v7;
  HUHomeHubAccessoryListItemManager *v8;
  HUHomeHubAccessoryListItemManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeHubAccessoryListItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a4, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_accessories, a3);

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUHomeHubAccessoryListItemManager accessories](self, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[HUHomeHubAccessoryListItemManager _buildItemProvidersForHome:]";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s accessories: %@.", buf, 0x16u);

  }
  -[HUHomeHubAccessoryListItemManager accessories](self, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__HUHomeHubAccessoryListItemManager__buildItemProvidersForHome___block_invoke;
  v11[3] = &unk_1E6F58A38;
  v11[4] = self;
  objc_msgSend(v6, "na_map:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v7);
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __64__HUHomeHubAccessoryListItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_itemForAccessory:", a2);
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubAccessoryListItemManager accessories](self, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_165);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_12_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v16[3] = &unk_1E6F58808;
  v17 = v7;
  v18 = v4;
  v10 = v5;
  v19 = v10;
  v11 = v4;
  v12 = v7;
  objc_msgSend(v9, "na_each:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

uint64_t __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "home");
}

uint64_t __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "uniqueIdentifier");
  }
  else
  {
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "name");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

void __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x1E0D31570]);
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v5, "initWithIdentifier:", v7);

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") <= 1)
  {
    objc_msgSend(v13, "setHeaderTitle:", 0);
  }
  else
  {
    objc_msgSend(v3, "hf_displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHeaderTitle:", v8);

  }
  v9 = *(void **)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_4;
  v14[3] = &unk_1E6F53050;
  v15 = v3;
  v16 = v4;
  v10 = v4;
  v11 = v3;
  objc_msgSend(v9, "na_each:", v14);
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_16_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItems:", v12);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);

}

void __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D78]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

uint64_t __70__HUHomeHubAccessoryListItemManager__buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

- (id)_itemForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "hf_displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D30D78]);

  v8 = (void *)MEMORY[0x1E0D31530];
  objc_msgSend(v3, "mediaProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isHomePodMini:", v9);

  if ((_DWORD)v8)
  {
    v10 = (void *)MEMORY[0x1E0CEA638];
    v11 = *MEMORY[0x1E0D30F88];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D31530];
    objc_msgSend(v3, "mediaProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "isHomePodOriginal:", v13);

    v14 = (void *)MEMORY[0x1E0CEA638];
    if (!(_DWORD)v12)
    {
      objc_msgSend(v3, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hu_symbolFromProductPlatform:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "na_safeSetObject:forKey:", v16, *MEMORY[0x1E0D30C70]);
      goto LABEL_7;
    }
    v11 = *MEMORY[0x1E0D30F90];
    v10 = (void *)MEMORY[0x1E0CEA638];
  }
  objc_msgSend(v10, "systemImageNamed:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "hu_keyColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithTintColor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v17, *MEMORY[0x1E0D30C70]);

LABEL_7:
  v18 = objc_alloc(MEMORY[0x1E0D31840]);
  v19 = (void *)objc_msgSend(v4, "copy");
  v20 = (void *)objc_msgSend(v18, "initWithResults:", v19);

  return v20;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end
