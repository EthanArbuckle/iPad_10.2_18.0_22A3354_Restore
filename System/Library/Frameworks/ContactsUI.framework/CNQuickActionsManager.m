@implementation CNQuickActionsManager

void __50__CNQuickActionsManager_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  v1 = *MEMORY[0x1E0C966A8];
  v6[0] = *MEMORY[0x1E0C967C0];
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNQuickActionsManager descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_3;
  descriptorForRequiredKeys_cn_once_object_3 = v4;

}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_3 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_3, &__block_literal_global_1795);
  return (id)descriptorForRequiredKeys_cn_once_object_3;
}

- (CNQuickActionsManager)initWithContacts:(id)a3
{
  id v4;
  CNQuickActionsManager *v5;
  uint64_t v6;
  NSMutableArray *updateBlocks;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CNQuickActionsUsageManager *usageManager;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _QWORD v28[2];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CNQuickActionsManager;
  v5 = -[CNQuickActionsManager init](&v27, sel_init);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = objc_claimAutoreleasedReturnValue();
  updateBlocks = v5->_updateBlocks;
  v5->_updateBlocks = (NSMutableArray *)v6;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
        objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys", (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assertKeysAreAvailable:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v10);
  }

  -[CNQuickActionsManager setContacts:](v5, "setContacts:", v8);
  -[CNQuickActionsManager contact](v5, "contact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = *MEMORY[0x1E0C966A8];
    v28[0] = *MEMORY[0x1E0C967C0];
    v28[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsManager _createGroupsForPropertyKeys:](v5, "_createGroupsForPropertyKeys:", v18);

    -[CNQuickActionsManager contact](v5, "contact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNQuickActionsUsageManager managerForContact:](CNQuickActionsUsageManager, "managerForContact:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    usageManager = v5->_usageManager;
    v5->_usageManager = (CNQuickActionsUsageManager *)v20;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CNQuickActionsManager stopUpdatingActions](self, "stopUpdatingActions");
  v3.receiver = self;
  v3.super_class = (Class)CNQuickActionsManager;
  -[CNQuickActionsManager dealloc](&v3, sel_dealloc);
}

- (CNContact)contact
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CNQuickActionsManager contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[CNQuickActionsManager contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (CNContact *)v6;
}

- (NSArray)categories
{
  NSArray *categories;

  categories = self->_categories;
  if (categories)
    return categories;
  objc_msgSend((id)objc_opt_class(), "defaultCategories");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSortsWithDuet:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CNQuickActionsManager usageManager](self, "usageManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortsWithDuet:", v3);

}

- (BOOL)sortsWithDuet
{
  void *v2;
  char v3;

  -[CNQuickActionsManager usageManager](self, "usageManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sortsWithDuet");

  return v3;
}

- (void)_createGroupsForPropertyKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
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
        -[CNQuickActionsManager contact](self, "contact", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v11, v12, 0, 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKey:", v13, v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[CNQuickActionsManager setGroups:](self, "setGroups:", v5);
}

- (id)_orderedLabels
{
  if (_orderedLabels_cn_once_token_5 != -1)
    dispatch_once(&_orderedLabels_cn_once_token_5, &__block_literal_global_14);
  return (id)_orderedLabels_cn_once_object_5;
}

- (id)_ignoredLabels
{
  if (_ignoredLabels_cn_once_token_6 != -1)
    dispatch_once(&_ignoredLabels_cn_once_token_6, &__block_literal_global_15_1783);
  return (id)_ignoredLabels_cn_once_object_6;
}

- (BOOL)_shouldGroupActionsInCategory:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CNQuickActionCategoryAddToContacts) ^ 1;
}

- (id)_groupedActionsFromOrderedActionsByCategories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CNQuickActionsManager categories](self, "categories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNQuickActionsManager _hierarchicalActionsForCategory:fromActions:askDelegate:](self, "_hierarchicalActionsForCategory:fromActions:askDelegate:", v11, v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "unionOrderedSet:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_hierarchicalActionsForCategory:(id)a3 fromActions:(id)a4 askDelegate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  CNQuickDisambiguateAction *v36;
  void *v37;
  CNQuickDisambiguateAction *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v5 = a5;
  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  if ((unint64_t)objc_msgSend(v9, "count") < 2
    || !-[CNQuickActionsManager _shouldGroupActionsInCategory:](self, "_shouldGroupActionsInCategory:", v8))
  {
    v34 = v9;
LABEL_33:
    v33 = v34;
    goto LABEL_34;
  }
  if (!v5)
    goto LABEL_41;
  -[CNQuickActionsManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
    goto LABEL_41;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (!v14)
  {
    v16 = 0;
    goto LABEL_39;
  }
  v15 = v14;
  v16 = 0;
  v44 = v12;
  v45 = *(_QWORD *)v51;
  obj = v13;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v51 != v45)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      objc_opt_class();
      v19 = v18;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      if (!v21)
      {
        v21 = v16;
LABEL_38:

        v16 = 0;
        v13 = obj;
        goto LABEL_39;
      }
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "propertyAction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "propertyItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contactProperty");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {

        v12 = v44;
        goto LABEL_38;
      }
      objc_msgSend(v16, "setObject:forKey:", v21, v24);
      v12 = v44;
      objc_msgSend(v44, "addObject:", v24);

    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v15)
      continue;
    break;
  }

  if (!v16)
    goto LABEL_40;
  -[CNQuickActionsManager delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "actionsManager:orderedPropertiesForProperties:category:", self, v44, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13 || (objc_msgSend(v13, "isEqualToArray:", v44) & 1) != 0)
  {
LABEL_39:

LABEL_40:
LABEL_41:
    v36 = [CNQuickDisambiguateAction alloc];
    v37 = (void *)objc_msgSend(v9, "copy");
    v38 = -[CNQuickDisambiguateAction initWithActions:](v36, "initWithActions:", v37);

    -[CNQuickDisambiguateAction actions](v38, "actions");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickDisambiguateAction setMainAction:](v38, "setMainAction:", v40);
    -[CNQuickContactAction setDelegate:](v38, "setDelegate:", self);
    -[CNQuickAction setIdentifier:](v38, "setIdentifier:", CFSTR("disambiguate"));
    objc_msgSend(v41, "category");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickAction setCategory:](v38, "setCategory:", v42);

    -[CNQuickAction setUseDuetIfAvailable:](v38, "setUseDuetIfAvailable:", -[CNQuickActionsManager useDuetIfAvailable](self, "useDuetIfAvailable"));
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v27 = v13;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v47 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v32);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v29);
  }

  -[CNQuickActionsManager _hierarchicalActionsForCategory:fromActions:askDelegate:](self, "_hierarchicalActionsForCategory:fromActions:askDelegate:", v8, v26, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
  return v33;
}

- (void)_addAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_actionsByCategories, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_actionsByCategories, "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(v4, "setManager:", self);
  objc_msgSend(v4, "setUseDuetIfAvailable:", -[CNQuickActionsManager useDuetIfAvailable](self, "useDuetIfAvailable"));
  objc_opt_class();
  v9 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v6, "addObject:", v9);

}

- (id)_addActionForPropertyItem:(id)a3 category:(id)a4 propertyActionClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  CNQuickPropertyAction *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "labeledValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (-[CNQuickActionsManager _ignoredLabels](self, "_ignoredLabels"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "containsObject:", v11),
        v12,
        (v13 & 1) != 0))
  {
    v14 = 0;
  }
  else
  {
    v15 = [a5 alloc];
    -[CNQuickActionsManager contact](self, "contact");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithContact:propertyItem:", v16, v8);

    v14 = -[CNQuickPropertyAction initWithPropertyAction:]([CNQuickPropertyAction alloc], "initWithPropertyAction:", v17);
    -[CNQuickAction setCategory:](v14, "setCategory:", v9);
    -[CNQuickActionsManager _orderedLabels](self, "_orderedLabels");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "indexOfObject:", v11);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      v20 = 0;
    else
      v20 = objc_msgSend(v18, "count") - v19 + 1;
    -[CNQuickAction setScore:](v14, "setScore:", v20);
    -[CNQuickActionsManager _addAction:](self, "_addAction:", v14);

  }
  return v14;
}

- (void)_updateActionsForPropertyItems:(id)a3 category:(id)a4 propertyActionClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CNQuickActionsManager categories](self, "categories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if (v11)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = -[CNQuickActionsManager _addActionForPropertyItem:category:propertyActionClass:](self, "_addActionForPropertyItem:category:propertyActionClass:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), v9, a5, (_QWORD)v18);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (void)_updateIDSActionsForPropertyItems:(id)a3 category:(id)a4 serviceName:(id)a5 propertyActionClass:(Class)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  CNPropertyIDSRequest *v21;
  void *v22;
  CNPropertyIDSRequest *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v10 = a4;
  v24 = a5;
  -[CNQuickActionsManager categories](self, "categories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v10);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v25;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[CNQuickActionsManager _addActionForPropertyItem:category:propertyActionClass:](self, "_addActionForPropertyItem:category:propertyActionClass:", v18, v10, a6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v13, "addObject:", v18);
            objc_msgSend(v26, "setObject:forKey:", v19, v18);
            if (-[CNQuickActionsManager bypassActionValidation](self, "bypassActionValidation"))
            {
              objc_msgSend(v19, "setEnabled:", 1);
            }
            else
            {
              -[CNQuickActionsManager usageManager](self, "usageManager");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "updateCachedEnabledStateForAction:", v19);

            }
          }

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v15);
    }

    if (!-[CNQuickActionsManager bypassActionValidation](self, "bypassActionValidation"))
    {
      objc_initWeak(&location, self);
      v21 = [CNPropertyIDSRequest alloc];
      v22 = (void *)objc_msgSend(v13, "copy");
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __100__CNQuickActionsManager__updateIDSActionsForPropertyItems_category_serviceName_propertyActionClass___block_invoke;
      v27[3] = &unk_1E2047FC8;
      objc_copyWeak(&v29, &location);
      v28 = v26;
      v23 = -[CNPropertyIDSRequest initWithPropertyItems:service:postToMainQueue:resultBlock:](v21, "initWithPropertyItems:service:postToMainQueue:resultBlock:", v22, v24, 1, v27);

      -[NSMutableSet addObject:](self->_requests, "addObject:", v23);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_openURL:(id)a3
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = (void *)MEMORY[0x1E0C99E98];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E20507A8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v9;
    if (v6)
    {
LABEL_6:
      +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openSensitiveURLInBackground:withOptions:", v6, 0);

    }
  }
LABEL_7:

}

- (id)_propertyItemsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNQuickActionsManager contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[NSDictionary objectForKeyedSubscript:](self->_groups, "objectForKeyedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNQuickActionsManager contact](self, "contact");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupItem, "propertyGroupItemWithLabeledValue:group:contact:", v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v17, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v17;
}

- (void)updateActionsWithBlock:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *requests;
  NSMutableDictionary *v6;
  NSMutableDictionary *actionsByCategories;
  NSArray *subManagers;
  NSMutableArray *updateBlocks;
  void *v10;
  void *v11;
  id aBlock;

  aBlock = a3;
  -[CNQuickActionsManager stopUpdatingActions](self, "stopUpdatingActions");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  requests = self->_requests;
  self->_requests = v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  actionsByCategories = self->_actionsByCategories;
  self->_actionsByCategories = v6;

  subManagers = self->_subManagers;
  self->_subManagers = 0;

  if (aBlock)
  {
    updateBlocks = self->_updateBlocks;
    v10 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](updateBlocks, "addObject:", v10);

  }
  -[CNQuickActionsManager contact](self, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[CNQuickActionsManager _updateSingleContactActions](self, "_updateSingleContactActions");
  else
    -[CNQuickActionsManager _updateMultiContactActions](self, "_updateMultiContactActions");

}

- (void)_updateSingleContactActions
{
  void *v3;
  void *v4;
  char v5;
  int v6;
  char v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  CNPropertyFaceTimeAction *v17;
  void *v18;
  CNPropertyFaceTimeAction *v19;
  void *v20;
  int v21;
  CNQuickFaceTimeAction *v22;
  void *v23;
  int v24;
  CNQuickFaceTimeAction *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  CNContactCreateNewContactAction *v30;
  void *v31;
  int v32;
  CNContactCreateNewContactAction *v33;
  void *v34;
  CNQuickContactAction *v35;
  void *v36;
  void *v37;
  CNContactAddToExistingContactAction *v38;
  void *v39;
  CNContactAddToExistingContactAction *v40;
  CNQuickContactAction *v41;
  void *v42;
  void *v43;
  CNQuickAction *v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id location;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[CNQuickActionsManager _propertyItemsForKey:](self, "_propertyItemsForKey:", *MEMORY[0x1E0C967C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickActionsManager _propertyItemsForKey:](self, "_propertyItemsForKey:", *MEMORY[0x1E0C966A8]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFaceTimeAppAvailable"))
    v5 = objc_msgSend(v4, "isConferencingAvailable");
  else
    v5 = 0;
  v6 = objc_msgSend(v4, "isFaceTimeAudioAvailable");
  if (objc_msgSend(v3, "count"))
    v7 = objc_msgSend(v4, "hasCellularTelephonyCapability");
  else
    v7 = 0;
  if (objc_msgSend(v3, "count"))
    v8 = objc_msgSend(v4, "hasSMSCapability");
  else
    v8 = 0;
  LODWORD(v47) = v6;
  if (objc_msgSend(v4, "isMessagesAppAvailable")
    && (objc_msgSend(v3, "count") || objc_msgSend(v48, "count")))
  {
    HIDWORD(v47) = objc_msgSend(v4, "isMadridConfigured", v47);
  }
  else
  {
    HIDWORD(v47) = 0;
  }
  if ((v7 & 1) != 0 || -[CNQuickActionsManager bypassActionValidation](self, "bypassActionValidation"))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v53 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "setAllowsPhone:", 1, v47);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v10);
    }

    -[CNQuickActionsManager _updateActionsForPropertyItems:category:propertyActionClass:](self, "_updateActionsForPropertyItems:category:propertyActionClass:", v9, CNQuickActionCategoryAudioCall, objc_opt_class());
  }
  if ((v8 & 1) != 0 || -[CNQuickActionsManager bypassActionValidation](self, "bypassActionValidation"))
    -[CNQuickActionsManager _updateActionsForPropertyItems:category:propertyActionClass:](self, "_updateActionsForPropertyItems:category:propertyActionClass:", v3, CNQuickActionCategoryInstantMessage, objc_opt_class());
  -[CNQuickActionsManager _updateActionsForPropertyItems:category:propertyActionClass:](self, "_updateActionsForPropertyItems:category:propertyActionClass:", v48, CNQuickActionCategoryMail, objc_opt_class());
  if ((v5 & 1) != 0 || -[CNQuickActionsManager bypassActionValidation](self, "bypassActionValidation"))
  {
    -[CNQuickActionsManager categories](self, "categories", v47);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "containsObject:", CNQuickActionCategoryVideoCall))
    {

    }
    else
    {
      -[CNQuickActionsManager categories](self, "categories");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", CNQuickActionCategoryAudioCall);

      if (!v15)
        goto LABEL_39;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v3);
    objc_msgSend(v16, "addObjectsFromArray:", v48);
    v17 = [CNPropertyFaceTimeAction alloc];
    -[CNQuickActionsManager contact](self, "contact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CNPropertyFaceTimeAction initWithContact:propertyItems:](v17, "initWithContact:propertyItems:", v18, v16);

    -[CNQuickActionsManager categories](self, "categories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", CNQuickActionCategoryVideoCall);

    if (v21)
    {
      v22 = -[CNQuickPropertyAction initWithPropertyAction:]([CNQuickFaceTimeAction alloc], "initWithPropertyAction:", v19);
      -[CNQuickFaceTimeAction setAudioOnly:](v22, "setAudioOnly:", 0);
      -[CNQuickActionsUsageManager updateCachedEnabledStateForAction:](self->_usageManager, "updateCachedEnabledStateForAction:", v22);
      -[CNQuickActionsManager setFaceTimeVideoAction:](self, "setFaceTimeVideoAction:", v22);
      -[CNQuickActionsManager _addAction:](self, "_addAction:", v22);

    }
    if ((_DWORD)v47)
    {
      -[CNQuickActionsManager categories](self, "categories");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", CNQuickActionCategoryAudioCall);

      if (v24)
      {
        v25 = -[CNQuickPropertyAction initWithPropertyAction:]([CNQuickFaceTimeAction alloc], "initWithPropertyAction:", v19);
        -[CNQuickFaceTimeAction setAudioOnly:](v25, "setAudioOnly:", 1);
        -[CNQuickActionsUsageManager updateCachedEnabledStateForAction:](self->_usageManager, "updateCachedEnabledStateForAction:", v25);
        -[CNQuickActionsManager setFaceTimeAudioAction:](self, "setFaceTimeAudioAction:", v25);
        -[CNQuickActionsManager _addAction:](self, "_addAction:", v25);

      }
    }

  }
LABEL_39:
  if ((v47 & 0x100000000) != 0 || -[CNQuickActionsManager bypassActionValidation](self, "bypassActionValidation"))
  {
    v26 = CNQuickActionCategoryInstantMessage;
    getIDSServiceNameiMessage_1752();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsManager _updateIDSActionsForPropertyItems:category:serviceName:propertyActionClass:](self, "_updateIDSActionsForPropertyItems:category:serviceName:propertyActionClass:", v48, v26, v27, objc_opt_class());

    v28 = CNQuickActionCategoryInstantMessage;
    getIDSServiceNameiMessage_1752();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsManager _updateIDSActionsForPropertyItems:category:serviceName:propertyActionClass:](self, "_updateIDSActionsForPropertyItems:category:serviceName:propertyActionClass:", v3, v28, v29, objc_opt_class());

  }
  -[CNQuickActionsManager categories](self, "categories", v47);
  v30 = (CNContactCreateNewContactAction *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactCreateNewContactAction containsObject:](v30, "containsObject:", CNQuickActionCategoryAddToContacts))
  {
    -[CNQuickActionsManager contact](self, "contact");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isUnknown");

    if (!v32)
      goto LABEL_46;
    v33 = [CNContactCreateNewContactAction alloc];
    -[CNQuickActionsManager contact](self, "contact");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CNContactAction initWithContact:](v33, "initWithContact:", v34);

    v35 = -[CNQuickContactAction initWithContactAction:]([CNQuickContactAction alloc], "initWithContactAction:", v30);
    -[CNQuickAction setCategory:](v35, "setCategory:", CNQuickActionCategoryAddToContacts);
    CNContactsUIBundle();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CARD_CREATE_NEW_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickAction setTitle:](v35, "setTitle:", v37);

    -[CNQuickAction setIdentifier:](v35, "setIdentifier:", CFSTR("create-new"));
    -[CNQuickActionsManager _addAction:](self, "_addAction:", v35);
    v38 = [CNContactAddToExistingContactAction alloc];
    -[CNQuickActionsManager contact](self, "contact");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[CNContactAction initWithContact:](v38, "initWithContact:", v39);

    v41 = -[CNQuickContactAction initWithContactAction:]([CNQuickContactAction alloc], "initWithContactAction:", v40);
    -[CNQuickAction setCategory:](v41, "setCategory:", CNQuickActionCategoryAddToContacts);
    CNContactsUIBundle();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CARD_ADD_TO_EXISTING_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickAction setTitle:](v41, "setTitle:", v43);

    -[CNQuickAction setIdentifier:](v41, "setIdentifier:", CFSTR("add-existing"));
    -[CNQuickActionsManager _addAction:](self, "_addAction:", v41);

  }
LABEL_46:
  -[CNQuickActionsManager categories](self, "categories");
  v44 = (CNQuickAction *)objc_claimAutoreleasedReturnValue();
  if (!-[CNQuickAction containsObject:](v44, "containsObject:", CNQuickActionCategoryInfo))
  {
LABEL_49:

    goto LABEL_50;
  }
  -[CNQuickActionsManager contact](self, "contact");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isUnknown");

  if ((v46 & 1) == 0)
  {
    v44 = objc_alloc_init(CNQuickAction);
    -[CNQuickAction setCategory:](v44, "setCategory:", CNQuickActionCategoryInfo);
    -[CNQuickAction setIdentifier:](v44, "setIdentifier:", CFSTR("info"));
    objc_initWeak(&location, self);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __52__CNQuickActionsManager__updateSingleContactActions__block_invoke;
    v49[3] = &unk_1E204F880;
    objc_copyWeak(&v50, &location);
    -[CNQuickAction setPerformBlock:](v44, "setPerformBlock:", v49);
    -[CNQuickActionsManager _addAction:](self, "_addAction:", v44);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
    goto LABEL_49;
  }
LABEL_50:
  -[CNQuickActionsManager refreshActionsAndForceSendUpdate:](self, "refreshActionsAndForceSendUpdate:", 1);

}

- (void)_updateMultiContactActions
{
  void *v3;
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD aBlock[5];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_contacts, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CNQuickActionsManager__updateMultiContactActions__block_invoke;
  aBlock[3] = &unk_1E204F648;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_contacts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNQuickActionsManager actionsManagerForContacts:](CNQuickActionsManager, "actionsManagerForContacts:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNQuickActionsManager categories](self, "categories");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCategories:", v11);

        objc_msgSend(v10, "setBypassActionValidation:", -[CNQuickActionsManager bypassActionValidation](self, "bypassActionValidation"));
        -[CNQuickActionsManager delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDelegate:", v12);

        objc_msgSend(v3, "addObject:", v10);
        objc_msgSend(v10, "updateActionsWithBlock:", v4);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  -[CNQuickActionsManager setSubManagers:](self, "setSubManagers:", v3);
  v4[2](v4);

}

- (void)refreshActionsAndForceSendUpdate:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CNQuickActionsManager contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v18 = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_actionsByCategories, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[CNQuickActionsManager categories](self, "categories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_actionsByCategories, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNQuickActionsManager usageManager](self, "usageManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sortedActions:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "count"))
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v12);
            objc_msgSend(v15, "count");
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    -[CNQuickActionsManager _groupedActionsFromOrderedActionsByCategories:](self, "_groupedActionsFromOrderedActionsByCategories:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v18 || (objc_msgSend(v16, "isEqualToOrderedSet:", self->_actions) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_actions, v17);
      -[CNQuickActionsManager _actionsUpdated](self, "_actionsUpdated");
    }

  }
}

- (void)refreshActions
{
  -[CNQuickActionsManager refreshActionsAndForceSendUpdate:](self, "refreshActionsAndForceSendUpdate:", 0);
}

- (void)stopUpdatingActions
{
  NSMutableSet *requests;

  -[NSMutableSet makeObjectsPerformSelector:](self->_requests, "makeObjectsPerformSelector:", sel_cancel);
  requests = self->_requests;
  self->_requests = 0;

}

- (void)_actionsUpdated
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_updateBlocks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)actionPerformed:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CNQuickActionsManager usageManager](self, "usageManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionPerformed:", v8);

  -[CNQuickActionsManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNQuickActionsManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionsManager:actionDidPerform:", self, v8);

  }
  -[CNQuickActionsManager refreshActionsAndForceSendUpdate:](self, "refreshActionsAndForceSendUpdate:", 0);

}

- (NSArray)actions
{
  return -[NSOrderedSet array](self->_actions, "array");
}

- (id)quickActions
{
  void *v2;
  void *v3;
  void *v4;

  -[CNQuickActionsManager actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexesOfObjectsPassingTest:", &__block_literal_global_63);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)contactActionDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  CNQuickActionsUsageManager *usageManager;
  void *v7;
  void *v8;
  void *v9;
  CNQuickActionsUsageManager *v10;
  void *v11;

  -[CNQuickActionsManager faceTimeVideoAction](self, "faceTimeVideoAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNQuickActionsManager faceTimeVideoAction](self, "faceTimeVideoAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCached:", 0);

    usageManager = self->_usageManager;
    -[CNQuickActionsManager faceTimeVideoAction](self, "faceTimeVideoAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsUsageManager cacheEnabledStateForAction:](usageManager, "cacheEnabledStateForAction:", v7);

  }
  -[CNQuickActionsManager faceTimeAudioAction](self, "faceTimeAudioAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNQuickActionsManager faceTimeAudioAction](self, "faceTimeAudioAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCached:", 0);

    v10 = self->_usageManager;
    -[CNQuickActionsManager faceTimeAudioAction](self, "faceTimeAudioAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsUsageManager cacheEnabledStateForAction:](v10, "cacheEnabledStateForAction:", v11);

  }
  -[CNQuickActionsManager refreshActionsAndForceSendUpdate:](self, "refreshActionsAndForceSendUpdate:", 0);
}

- (void)contactAction:(id)a3 presentViewController:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CNQuickActionsManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNQuickActionsManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionsManager:presentingViewControllerForAction:", self, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v10, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (CNQuickActionsManagerDelegate)delegate
{
  return (CNQuickActionsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)desiredNumberOfActions
{
  return self->_desiredNumberOfActions;
}

- (void)setDesiredNumberOfActions:(unint64_t)a3
{
  self->_desiredNumberOfActions = a3;
}

- (BOOL)bypassActionValidation
{
  return self->_bypassActionValidation;
}

- (void)setBypassActionValidation:(BOOL)a3
{
  self->_bypassActionValidation = a3;
}

- (BOOL)useDuetIfAvailable
{
  return self->_useDuetIfAvailable;
}

- (void)setUseDuetIfAvailable:(BOOL)a3
{
  self->_useDuetIfAvailable = a3;
}

- (NSMutableArray)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setUpdateBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_updateBlocks, a3);
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (CNQuickFaceTimeAction)faceTimeVideoAction
{
  return self->_faceTimeVideoAction;
}

- (void)setFaceTimeVideoAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeVideoAction, a3);
}

- (CNQuickFaceTimeAction)faceTimeAudioAction
{
  return self->_faceTimeAudioAction;
}

- (void)setFaceTimeAudioAction:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeAudioAction, a3);
}

- (CNQuickActionsUsageManager)usageManager
{
  return self->_usageManager;
}

- (void)setUsageManager:(id)a3
{
  objc_storeStrong((id *)&self->_usageManager, a3);
}

- (NSArray)subManagers
{
  return self->_subManagers;
}

- (void)setSubManagers:(id)a3
{
  objc_storeStrong((id *)&self->_subManagers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subManagers, 0);
  objc_storeStrong((id *)&self->_usageManager, 0);
  objc_storeStrong((id *)&self->_faceTimeAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeVideoAction, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionsByCategories, 0);
}

uint64_t __37__CNQuickActionsManager_quickActions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CNQuickActionCategoryMail) ^ 1;

  return v3;
}

void __51__CNQuickActionsManager__updateMultiContactActions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "subManagers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E10];
    objc_msgSend(*(id *)(a1 + 32), "subManagers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "subManagers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "actions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v5;
    v14 = v5;

    objc_msgSend(*(id *)(a1 + 32), "_actionsUpdated");
  }
}

void __52__CNQuickActionsManager__updateSingleContactActions__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)MEMORY[0x1E0C99E98];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(WeakRetained, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("contact://show?id=%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_openURL:", v6);
}

void __100__CNQuickActionsManager__updateIDSActionsForPropertyItems_category_serviceName_propertyActionClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setEnabled:", 1);
        objc_msgSend(WeakRetained, "usageManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cacheEnabledStateForAction:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19), (_QWORD)v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setEnabled:", 0);
        objc_msgSend(WeakRetained, "usageManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "cacheEnabledStateForAction:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  objc_msgSend(WeakRetained, "refreshActionsAndForceSendUpdate:", 0);
}

void __39__CNQuickActionsManager__ignoredLabels__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0C97050];
  v7[0] = *MEMORY[0x1E0C97010];
  v7[1] = v1;
  v2 = *MEMORY[0x1E0C97038];
  v7[2] = *MEMORY[0x1E0C97030];
  v7[3] = v2;
  v3 = *MEMORY[0x1E0C97048];
  v7[4] = *MEMORY[0x1E0C97018];
  v7[5] = v3;
  v7[6] = *MEMORY[0x1E0C97040];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_ignoredLabels_cn_once_object_6;
  _ignoredLabels_cn_once_object_6 = v5;

}

void __39__CNQuickActionsManager__orderedLabels__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C97008];
  v5[0] = *MEMORY[0x1E0C97058];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0C97020];
  v5[2] = *MEMORY[0x1E0C97028];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0C97070];
  v5[4] = *MEMORY[0x1E0C96FF8];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_orderedLabels_cn_once_object_5;
  _orderedLabels_cn_once_object_5 = v3;

}

+ (BOOL)hasActionsForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  objc_msgSend(v3, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v4, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_9;
  }
LABEL_5:
  objc_msgSend(v4, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_cn_any:", &__block_literal_global_4);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v4, "emailAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "_cn_any:", &__block_literal_global_5);

  }
LABEL_9:

  return v10;
}

+ (id)defaultCategories
{
  if (defaultCategories_cn_once_token_4 != -1)
    dispatch_once(&defaultCategories_cn_once_token_4, &__block_literal_global_6);
  return (id)defaultCategories_cn_once_object_4;
}

+ (id)actionsManagerForContacts:(id)a3
{
  id v3;
  CNQuickActionsManager *v4;

  v3 = a3;
  v4 = -[CNQuickActionsManager initWithContacts:]([CNQuickActionsManager alloc], "initWithContacts:", v3);

  return v4;
}

void __42__CNQuickActionsManager_defaultCategories__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CNQuickActionCategoryAudioCall;
  v2[1] = CNQuickActionCategoryInstantMessage;
  v2[2] = CNQuickActionCategoryVideoCall;
  v2[3] = CNQuickActionCategoryMail;
  v2[4] = CNQuickActionCategoryAddToContacts;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultCategories_cn_once_object_4;
  defaultCategories_cn_once_object_4 = v0;

}

uint64_t __46__CNQuickActionsManager_hasActionsForContact___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested") ^ 1;
}

uint64_t __46__CNQuickActionsManager_hasActionsForContact___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggested") ^ 1;
}

@end
