@implementation HUServiceDetailsSectionFactory

- (id)buildServiceDetailsItemSectionForSourceItem:(id)a3 sectionIdentifier:(id)a4 items:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  HUServiceDetailsSectionFactory *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  char v42;
  char v43;
  __CFString *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v11 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v13, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hf_isVisibleAsBridge");

    v16 = v15 ^ 1;
  }
  else
  {
    v16 = 1;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v9);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("HUServiceDetailsGroupSectionIdentifier")))
  {
    objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_149);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "latestResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("HUServiceDetailsAddGroupSectionHeaderResultKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "latestResults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("HUServiceDetailsAddGroupSectionFooterResultKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
      v21 = 0;
    }
    objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_46);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "latestResults");
      v51 = v9;
      v29 = v21;
      v30 = v17;
      v31 = v10;
      v32 = self;
      v33 = v8;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HUServiceDetailsSeparateTileSectionFooterResultKey"));
      v35 = objc_claimAutoreleasedReturnValue();

      v8 = v33;
      self = v32;
      v10 = v31;
      v17 = v30;
      v21 = v29;
      v9 = v51;
      v23 = (void *)v35;
    }

  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("HUServiceDetailsIdentifyHomePodSectionIdentifier")))
    {
      objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_48);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "latestResults");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("HUServiceDetailsIdentifyHomePodFooterResultKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("HUServiceDetailsLinkedApplicationSectionIdentifier")))
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsManufacturerTitle"), CFSTR("HUServiceDetailsManufacturerTitle"), 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        goto LABEL_25;
      }
      if (((objc_msgSend(v9, "isEqualToString:", CFSTR("HUServiceDetailsRemoveSectionIdentifier")) ^ 1 | v16) & 1) != 0)
      {
        v23 = 0;
      }
      else
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsRemoveBridgeFooter"), CFSTR("HUServiceDetailsRemoveBridgeFooter"), 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v21 = 0;
  }
LABEL_25:
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("HUServiceDetailsPrimaryInfoSectionIdentifier")))
    goto LABEL_40;
  v36 = v8;
  if (objc_msgSend(v36, "conformsToProtocol:", &unk_1EF2AC0A8))
    v37 = v36;
  else
    v37 = 0;
  v38 = v37;

  objc_msgSend(v38, "accessoryRepresentableObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v39, "conformsToProtocol:", &unk_1EF348210))
    v40 = v39;
  else
    v40 = 0;
  v41 = v40;

  v42 = objc_msgSend(v41, "hf_shouldHideForContextType:", 2);
  v43 = objc_msgSend(v41, "hf_shouldHideForContextType:", 3);

  if ((v42 & 1) != 0 || (v43 & 1) != 0)
  {
    if ((v42 & 1) != 0)
    {
      if ((v43 & 1) != 0)
        goto LABEL_40;
      v44 = CFSTR("HUServiceDetailsShowInHomeDashboardFooterTitle");
    }
    else
    {
      v44 = CFSTR("HUServiceDetailsFavoritesFooterTitle");
    }
  }
  else
  {
    v44 = CFSTR("HUServiceDetailsShowInHomeDashboardAndFavoritesFooterTitle");
  }
  _HULocalizedStringWithDefaultValue(v44, v44, 1);
  v45 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)v45;
LABEL_40:
  if (v21)
    objc_msgSend(v17, "setHeaderTitle:", v21);
  if (v23)
    objc_msgSend(v17, "setFooterTitle:", v23);
  -[HUServiceDetailsSectionFactory _serviceDetailsItemComparatorForSectionIdentifier:](self, "_serviceDetailsItemComparatorForSectionIdentifier:", v9);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v46)
  {
    v49 = (void *)objc_msgSend(v47, "mutableCopy");

    objc_msgSend(v49, "sortUsingComparator:", v46);
    v48 = v49;
  }
  objc_msgSend(v17, "setItems:", v48);

  return v17;
}

uint64_t __102__HUServiceDetailsSectionFactory_buildServiceDetailsItemSectionForSourceItem_sectionIdentifier_items___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __102__HUServiceDetailsSectionFactory_buildServiceDetailsItemSectionForSourceItem_sectionIdentifier_items___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __102__HUServiceDetailsSectionFactory_buildServiceDetailsItemSectionForSourceItem_sectionIdentifier_items___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_serviceDetailsItemComparatorForSectionIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsFirmwareUpdateSectionPromptIdentifier")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsFirmwareUpdateAppStoreSectionIdentifier")))
  {
    +[HUFirmwareUpdateItemProvider itemComparator](HUFirmwareUpdateItemProvider, "itemComparator");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v6 = (void *)v5;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceDetailsAccessoryInfoSectionIdentifier")))
  {
    objc_msgSend(MEMORY[0x1E0D31090], "accessoryInfoServiceDetailComparator");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  -[HUServiceDetailsSectionFactory customComparator](self, "customComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v6 = _Block_copy(v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(v10);

  }
LABEL_5:

  return v6;
}

- (id)customComparator
{
  return self->_customComparator;
}

- (void)setCustomComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_customComparator, 0);
}

@end
