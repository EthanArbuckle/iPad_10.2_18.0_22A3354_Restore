@implementation ATXHomeScreenConfigurationComponentsDiffer

- (ATXHomeScreenConfigurationComponentsDiffer)initWithPreviousComponents:(id)a3 currentComponents:(id)a4
{
  id v6;
  id v7;
  ATXHomeScreenConfigurationComponentsDiffer *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSOrderedCollectionDifference *pinnedWidgetsDifference;
  void *v13;
  void *v14;
  uint64_t v15;
  NSOrderedCollectionDifference *stacksDifference;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  NSArray *userAddedPreviousSuggestedWidgets;
  NSArray *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSOrderedCollectionDifference *appsDifference;
  void *v57;
  ATXHomeScreenConfigurationComponentsDiffer *v58;
  void *v59;
  NSArray *v60;
  id obj;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)ATXHomeScreenConfigurationComponentsDiffer;
  v8 = -[ATXHomeScreenConfigurationComponentsDiffer init](&v76, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "pinnedWidgets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pinnedWidgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "differenceFromArray:withOptions:usingEquivalenceTest:", v10, 0, &__block_literal_global_58);
    v11 = objc_claimAutoreleasedReturnValue();
    pinnedWidgetsDifference = v8->_pinnedWidgetsDifference;
    v8->_pinnedWidgetsDifference = (NSOrderedCollectionDifference *)v11;

    objc_msgSend(v7, "stacks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stacks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "differenceFromArray:withOptions:usingEquivalenceTest:", v14, 0, &__block_literal_global_5_2);
    v15 = objc_claimAutoreleasedReturnValue();
    stacksDifference = v8->_stacksDifference;
    v8->_stacksDifference = (NSOrderedCollectionDifference *)v15;

    obj = (id)objc_opt_new();
    v57 = v6;
    objc_msgSend(v6, "stackedWidgets");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v8;
    -[ATXHomeScreenConfigurationComponentsDiffer _widgetsByWidgetUniqueIds:](v8, "_widgetsByWidgetUniqueIds:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v59 = v7;
    objc_msgSend(v7, "stackedWidgets");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v73 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          if ((objc_msgSend(v24, "isSuggestedWidget") & 1) == 0)
          {
            objc_msgSend(v24, "widgetUniqueId");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26 || objc_msgSend(v26, "isSuggestedWidget"))
              objc_msgSend(obj, "addObject:", v24);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      }
      while (v21);
    }

    objc_storeStrong((id *)&v8->_userAddedStackedWidgets, obj);
    v63 = (id)objc_opt_new();
    v62 = (id)objc_opt_new();
    objc_msgSend(v59, "stackedWidgets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenConfigurationComponentsDiffer _widgetsByWidgetUniqueIds:](v8, "_widgetsByWidgetUniqueIds:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    objc_msgSend(v57, "stackedWidgets");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v69 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_msgSend(v34, "widgetUniqueId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
            if (objc_msgSend(v34, "isSuggestedWidget"))
              v37 = v62;
            else
              v37 = v63;
            objc_msgSend(v37, "addObject:", v34);
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      }
      while (v31);
    }

    objc_storeStrong((id *)&v8->_userDeletedStackedWidgets, v63);
    objc_storeStrong((id *)&v8->_deletedPreviousSuggestedWidgets, v62);
    v60 = (NSArray *)objc_opt_new();
    objc_msgSend(v59, "stackedWidgets");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "pinnedWidgets");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "arrayByAddingObjectsFromArray:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v43; ++k)
        {
          if (*(_QWORD *)v65 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
          if ((objc_msgSend(v46, "isSuggestedWidget") & 1) == 0)
          {
            objc_msgSend(v46, "widgetUniqueId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "isSuggestedWidget");

            if (v49)
              -[NSArray addObject:](v60, "addObject:", v46);
          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      }
      while (v43);
    }

    v8 = v58;
    userAddedPreviousSuggestedWidgets = v58->_userAddedPreviousSuggestedWidgets;
    v58->_userAddedPreviousSuggestedWidgets = v60;
    v51 = v60;

    v7 = v59;
    objc_msgSend(v59, "apps");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v57;
    objc_msgSend(v57, "apps");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "differenceFromArray:withOptions:usingEquivalenceTest:", v53, 0, &__block_literal_global_7_1);
    v54 = objc_claimAutoreleasedReturnValue();
    appsDifference = v58->_appsDifference;
    v58->_appsDifference = (NSOrderedCollectionDifference *)v54;

  }
  return v8;
}

void *__91__ATXHomeScreenConfigurationComponentsDiffer_initWithPreviousComponents_currentComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "widgetUniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "widgetUniqueId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widgetUniqueId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "isEqualToString:", v8);

  }
  return v6;
}

uint64_t __91__ATXHomeScreenConfigurationComponentsDiffer_initWithPreviousComponents_currentComponents___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

BOOL __91__ATXHomeScreenConfigurationComponentsDiffer_initWithPreviousComponents_currentComponents___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    objc_msgSend(v4, "page");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "pageIndex");
    objc_msgSend(v5, "page");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == objc_msgSend(v8, "pageIndex");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSArray)addedApps
{
  void *v2;
  void *v3;

  -[NSOrderedCollectionDifference insertions](self->_appsDifference, "insertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_9_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __55__ATXHomeScreenConfigurationComponentsDiffer_addedApps__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (NSArray)removedApps
{
  void *v2;
  void *v3;

  -[NSOrderedCollectionDifference removals](self->_appsDifference, "removals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_10_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __57__ATXHomeScreenConfigurationComponentsDiffer_removedApps__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (NSArray)addedPinnedWidgets
{
  void *v2;
  void *v3;

  -[NSOrderedCollectionDifference insertions](self->_pinnedWidgetsDifference, "insertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_11_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __64__ATXHomeScreenConfigurationComponentsDiffer_addedPinnedWidgets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (NSArray)deletedPinnedWidgets
{
  void *v2;
  void *v3;

  -[NSOrderedCollectionDifference removals](self->_pinnedWidgetsDifference, "removals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __66__ATXHomeScreenConfigurationComponentsDiffer_deletedPinnedWidgets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (NSArray)addedStacks
{
  void *v2;
  void *v3;

  -[NSOrderedCollectionDifference insertions](self->_stacksDifference, "insertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __57__ATXHomeScreenConfigurationComponentsDiffer_addedStacks__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (NSArray)deletedStacks
{
  void *v2;
  void *v3;

  -[NSOrderedCollectionDifference removals](self->_stacksDifference, "removals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_14_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __59__ATXHomeScreenConfigurationComponentsDiffer_deletedStacks__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (id)_widgetsByWidgetUniqueIds:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "widgetUniqueId", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "widgetUniqueId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSArray)userAddedStackedWidgets
{
  return self->_userAddedStackedWidgets;
}

- (NSArray)userDeletedStackedWidgets
{
  return self->_userDeletedStackedWidgets;
}

- (NSArray)userAddedPreviousSuggestedWidgets
{
  return self->_userAddedPreviousSuggestedWidgets;
}

- (NSArray)deletedPreviousSuggestedWidgets
{
  return self->_deletedPreviousSuggestedWidgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedPreviousSuggestedWidgets, 0);
  objc_storeStrong((id *)&self->_userAddedPreviousSuggestedWidgets, 0);
  objc_storeStrong((id *)&self->_userDeletedStackedWidgets, 0);
  objc_storeStrong((id *)&self->_userAddedStackedWidgets, 0);
  objc_storeStrong((id *)&self->_appsDifference, 0);
  objc_storeStrong((id *)&self->_stacksDifference, 0);
  objc_storeStrong((id *)&self->_pinnedWidgetsDifference, 0);
}

@end
