@implementation HUValveItemModule

+ (id)supportedServiceTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB9B08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUChildServiceEditorItemModule childServiceItemProvider](self, "childServiceItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
    v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_140) ^ 1;
  else
    v8 = 0;
  if (objc_msgSend(v7, "intersectsSet:", v4) && (v8 & 1) == 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUValveItemSectionIdentifier"));
    if (-[HUChildServiceEditorItemModule editingMode](self, "editingMode") == 1)
      objc_msgSend((id)objc_opt_class(), "childItemComparator");
    else
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = _Block_copy(v10);

    objc_msgSend(v7, "na_setByIntersectingWithSet:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setItems:", v14);
    v15 = objc_alloc(MEMORY[0x1E0CB3550]);
    objc_msgSend(v14, "na_map:", &__block_literal_global_7_1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);

    objc_msgSend(v17, "na_mostCommonObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB9978]))
    {
      v19 = CFSTR("HUValveModuleSectionHeaderTitleIrrigation");
    }
    else if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB9990]))
    {
      v19 = CFSTR("HUValveModuleSectionHeaderTitleFaucet");
    }
    else if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB9980]))
    {
      v19 = CFSTR("HUValveModuleSectionHeaderTitleShower");
    }
    else
    {
      v19 = CFSTR("HUValveModuleSectionHeaderTitleGeneric");
    }
    _HULocalizedStringWithDefaultValue(v19, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHeaderTitle:", v20);
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

uint64_t __53__HUValveItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_parentService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB9A50]);

  return v5;
}

id __53__HUValveItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceSubtype");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
