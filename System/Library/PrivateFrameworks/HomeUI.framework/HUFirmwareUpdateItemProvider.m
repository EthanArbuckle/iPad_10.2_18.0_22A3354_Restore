@implementation HUFirmwareUpdateItemProvider

+ (id)itemComparator
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D319D0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "comparatorWithSortedClasses:secondaryComparator:", v3, &__block_literal_global_269);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __46__HUFirmwareUpdateItemProvider_itemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
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
  v10 = objc_msgSend(v7, "localizedStandardCompare:", v9);

  return v10;
}

- (HUFirmwareUpdateItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_style_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFirmwareUpdateItemProvider.m"), 41, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFirmwareUpdateItemProvider init]",
    v5);

  return 0;
}

- (HUFirmwareUpdateItemProvider)initWithHome:(id)a3 style:(unint64_t)a4
{
  id v7;
  HUFirmwareUpdateItemProvider *v8;
  HUFirmwareUpdateItemProvider *v9;
  HULinkedApplicationItemProvider *v10;
  void *v11;
  uint64_t v12;
  NSSet *linkedApplicationItems;
  id v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  HUInstructionsItem *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HUFirmwareUpdateItemProvider;
  v8 = -[HFItemProvider init](&v26, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    v9->_style = a4;
    v10 = -[HULinkedApplicationItemProvider initWithHome:]([HULinkedApplicationItemProvider alloc], "initWithHome:", v7);
    -[HUFirmwareUpdateItemProvider _effectiveFilter](v9, "_effectiveFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULinkedApplicationItemProvider setFilter:](v10, "setFilter:", v11);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    linkedApplicationItems = v9->_linkedApplicationItems;
    v9->_linkedApplicationItems = (NSSet *)v12;

    if (-[HUFirmwareUpdateItemProvider style](v9, "style") == 2)
    {
      objc_initWeak(&location, v9);
      v14 = objc_alloc(MEMORY[0x1E0D31928]);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke;
      v23[3] = &unk_1E6F5EDB8;
      v15 = &v24;
      objc_copyWeak(&v24, &location);
      v16 = objc_msgSend(v14, "initWithSourceProvider:transformationBlock:", v10, v23);
      v17 = 64;
    }
    else
    {
      objc_storeStrong((id *)&v9->_linkedApplicationItemProvider, v10);
      objc_initWeak(&location, v9);
      v18 = [HUInstructionsItem alloc];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_4;
      v21[3] = &unk_1E6F4C4E8;
      v15 = &v22;
      objc_copyWeak(&v22, &location);
      v16 = -[HFStaticItem initWithResultsBlock:](v18, "initWithResultsBlock:", v21);
      v17 = 48;
    }
    v19 = *(Class *)((char *)&v9->super.super.isa + v17);
    *(Class *)((char *)&v9->super.super.isa + v17) = (Class)v16;

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);

  }
  return v9;
}

id __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_2;
  v7[3] = &unk_1E6F5E0B8;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v5 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v3, v7);
  objc_destroyWeak(&v8);

  return v5;
}

id __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HFResultApplicationAssociatedAccessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_15_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v10 = &stru_1E6F60E80;
  if (v9)
    v10 = v9;
  v11 = v10;

  objc_msgSend(WeakRetained, "_localizedDescriptionForAppName:accessoriesWithFirmwareUpdates:visibleAccessoryTileDisplayNames:", v11, v6, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30BF8]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30B80]);

  return v5;
}

uint64_t __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_displayNamesForVisibleTiles");
}

id __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "linkedApplicationItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v2, "linkedApplicationItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_instructionsItemResultsWithSampleLinkedApplicationItem:numberOfLinkedApplicationItems:", v5, objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D519C0];
    v12 = *MEMORY[0x1E0D30D70];
    v13[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithResult:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "flatMap:", &__block_literal_global_23_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __51__HUFirmwareUpdateItemProvider_initWithHome_style___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30B78]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUFirmwareUpdateItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:style:", v5, -[HUFirmwareUpdateItemProvider style](self, "style"));

  return v6;
}

+ (BOOL)prefersNonBlockingReloads
{
  return +[HULinkedApplicationItemProvider prefersNonBlockingReloads](HULinkedApplicationItemProvider, "prefersNonBlockingReloads");
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HUFirmwareUpdateItemProvider linkedApplicationItemProvider](self, "linkedApplicationItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HUFirmwareUpdateItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_1E6F4D2A0;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__HUFirmwareUpdateItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v3, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setLinkedApplicationItems:", v5);
  if (objc_msgSend(*(id *)(a1 + 32), "style") != 2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "hasProvidedInstructionsItem"))
    {
      objc_msgSend(v4, "existingItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "instructionsItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setByAddingObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setExistingItems:", v8);
    }
    else
    {
      objc_msgSend(v4, "addedItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "instructionsItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setByAddingObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAddedItems:", v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "setHasProvidedInstructionsItem:", 1);
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)items
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HUFirmwareUpdateItemProvider style](self, "style") == 2
    || !-[HUFirmwareUpdateItemProvider hasProvidedInstructionsItem](self, "hasProvidedInstructionsItem"))
  {
    -[HUFirmwareUpdateItemProvider linkedApplicationItems](self, "linkedApplicationItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUFirmwareUpdateItemProvider linkedApplicationItems](self, "linkedApplicationItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFirmwareUpdateItemProvider instructionsItem](self, "instructionsItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setByAddingObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUFirmwareUpdateItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D308A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFilter:(id)a3
{
  void *v4;
  id filter;
  void *v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)objc_msgSend(a3, "copy");
  filter = self->_filter;
  self->_filter = v4;

  objc_opt_class();
  -[HUFirmwareUpdateItemProvider linkedApplicationItemProvider](self, "linkedApplicationItemProvider");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v14;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    -[HUFirmwareUpdateItemProvider linkedApplicationItemProvider](self, "linkedApplicationItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HUFirmwareUpdateItemProvider linkedApplicationItemProvider](self, "linkedApplicationItemProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v10, "sourceProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v14 = v12;

    }
    else
    {
      v14 = 0;
    }
  }
  -[HUFirmwareUpdateItemProvider _effectiveFilter](self, "_effectiveFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFilter:", v13);

}

- (id)_effectiveFilter
{
  void *v2;
  id v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  -[HUFirmwareUpdateItemProvider filter](self, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HUFirmwareUpdateItemProvider__effectiveFilter__block_invoke;
  aBlock[3] = &unk_1E6F5EE20;
  v7 = v2;
  v3 = v2;
  v4 = _Block_copy(aBlock);

  return v4;
}

uint64_t __48__HUFirmwareUpdateItemProvider__effectiveFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && !(*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3))
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "isFirmwareUpdateAvailable");

  return v5;
}

- (id)_localizedDescriptionForAppName:(id)a3 accessoriesWithFirmwareUpdates:(id)a4 visibleAccessoryTileDisplayNames:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HUFirmwareUpdateItemProvider style](self, "style");
  if (v11 == 2)
    goto LABEL_4;
  if (v11 != 1)
  {
    if (v11)
    {
      v13 = 0;
      goto LABEL_35;
    }
LABEL_4:
    if (objc_msgSend(v8, "length") && objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
      objc_msgSend(v10, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (uint64_t)v12;
      v24 = v8;
LABEL_33:
      HFLocalizedStringWithFormat();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_35;
    }
    if (!objc_msgSend(v8, "length") || (unint64_t)objc_msgSend(v10, "count") < 2)
    {
      if (!objc_msgSend(v8, "length")
        && objc_msgSend(v10, "count") == 1
        && objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
      {
        objc_msgSend(v10, "anyObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (uint64_t)v12;
        goto LABEL_33;
      }
      if (!objc_msgSend(v8, "length")
        && (unint64_t)objc_msgSend(v10, "count") >= 2
        && objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
      {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  if (!objc_msgSend(v8, "length") || objc_msgSend(v9, "count") != 1)
  {
    if (!objc_msgSend(v8, "length") || (unint64_t)objc_msgSend(v9, "count") < 2)
    {
      if (!objc_msgSend(v8, "length")
        && objc_msgSend(v9, "count") == 1
        && objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
      {
        v23 = (uint64_t)v8;
        goto LABEL_34;
      }
      if (!objc_msgSend(v8, "length")
        && (unint64_t)objc_msgSend(v9, "count") >= 2
        && objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
      {
        v23 = (uint64_t)v8;
        goto LABEL_34;
      }
LABEL_32:
      objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
LABEL_20:
      v23 = objc_msgSend(v10, "count");
      goto LABEL_34;
    }
LABEL_23:
    objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
    v23 = objc_msgSend(v10, "count");
    v24 = v8;
    goto LABEL_34;
  }
  v23 = (uint64_t)v8;
  objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
LABEL_34:
  HFLocalizedStringWithFormat();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
  if (objc_msgSend(v9, "na_any:", &__block_literal_global_60_0, v23, v24))
  {
    objc_msgSend(v9, "count");
    HFLocalizedWiFiString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3498];
    HFLocalizedStringWithFormat();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedWiFiString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D31970];
    -[HUFirmwareUpdateItemProvider home](self, "home", v13, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "networkRouterSettingsURLForHome:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_attributedLinkStringForString:linkString:linkURL:", v16, v17, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v21;
  }

  return v13;
}

uint64_t __128__HUFirmwareUpdateItemProvider__localizedDescriptionForAppName_accessoriesWithFirmwareUpdates_visibleAccessoryTileDisplayNames___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "hf_networkConfigurationProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_62_0);

  return v3;
}

BOOL __128__HUFirmwareUpdateItemProvider__localizedDescriptionForAppName_accessoriesWithFirmwareUpdates_visibleAccessoryTileDisplayNames___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentProtectionMode") == 1;
}

- (id)_instructionsItemResultsWithSampleLinkedApplicationItem:(id)a3 numberOfLinkedApplicationItems:(int64_t)a4
{
  id v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t v28;
  SEL v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HUFirmwareUpdateItemProvider home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFirmwareUpdateItemProvider _effectiveFilter](self, "_effectiveFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_filter:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "na_map:", &__block_literal_global_73_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_setByFlattening");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "na_map:", &__block_literal_global_74_2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_setByFlattening");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if ((a4 || objc_msgSend(MEMORY[0x1E0D319D0], "isAMac")) && objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", &stru_1E6F60E80);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1)
    {
      objc_msgSend(v7, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "flatMap:", &__block_literal_global_76_3);
      v21 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v21;
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke_4;
    v25[3] = &unk_1E6F5EEE8;
    v28 = v18;
    v25[4] = self;
    v26 = v13;
    v27 = v15;
    v29 = a2;
    objc_msgSend(v19, "flatMap:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0D519C0];
    v30 = *MEMORY[0x1E0D30D70];
    v31[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "futureWithResult:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

uint64_t __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_displayName");
}

uint64_t __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "storeID");
}

id __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke_3(uint64_t a1, void *a2)
{
  __CFString *v2;
  const __CFString *v3;
  void *v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2;
  else
    v3 = &stru_1E6F60E80;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __119__HUFirmwareUpdateItemProvider__instructionsItemResultsWithSampleLinkedApplicationItem_numberOfLinkedApplicationItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = a2;
  HFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_localizedDescriptionForAppName:accessoriesWithFirmwareUpdates:visibleAccessoryTileDisplayNames:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("HUFirmwareUpdateItemProvider.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("description != nil"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeSetObject:forKey:", v4, *MEMORY[0x1E0D30D18]);
  objc_msgSend(v6, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0D30BF8]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E7041C68, CFSTR("instructionsStyle"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E7041C80, *MEMORY[0x1E0D30CA0]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMHome)home
{
  return self->_home;
}

- (id)filter
{
  return self->_filter;
}

- (unint64_t)style
{
  return self->_style;
}

- (HUInstructionsItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsItem, a3);
}

- (NSSet)linkedApplicationItems
{
  return self->_linkedApplicationItems;
}

- (void)setLinkedApplicationItems:(id)a3
{
  objc_storeStrong((id *)&self->_linkedApplicationItems, a3);
}

- (HFItemProvider)linkedApplicationItemProvider
{
  return self->_linkedApplicationItemProvider;
}

- (void)setLinkedApplicationItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_linkedApplicationItemProvider, a3);
}

- (BOOL)hasProvidedInstructionsItem
{
  return self->_hasProvidedInstructionsItem;
}

- (void)setHasProvidedInstructionsItem:(BOOL)a3
{
  self->_hasProvidedInstructionsItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplicationItemProvider, 0);
  objc_storeStrong((id *)&self->_linkedApplicationItems, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
