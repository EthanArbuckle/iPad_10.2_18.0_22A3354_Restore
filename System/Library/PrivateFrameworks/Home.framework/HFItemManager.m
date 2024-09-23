@implementation HFItemManager

uint64_t __66__HFItemManager__dependentHomeKitObjectsOfClass_inHomeKitObjects___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __35__HFItemManager__itemsToHideInSet___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldHideForNotOwner"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t __35__HFItemManager__itemsToHideInSet___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldHideForNonAdminUsers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t __62__HFItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemUpdaterDidFinishUpdateTransactionWithAffectedItems:", *(_QWORD *)(a1 + 32));
}

void __35__HFItemManager__itemsToHideInSet___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F0476508))
    v3 = v10;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "allItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "_itemsToHideInSet:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v9);

  }
}

- (NSSet)allItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if (!-[HFItemManager _shouldBuildItemProvidersAndModulesForNilHome](self, "_shouldBuildItemProvidersAndModulesForNilHome"))
  {
    return (NSSet *)v3;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HFItemManager itemProviders](self, "itemProviders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSSet *)v3;
}

- (NSArray)itemProviders
{
  return self->_itemProviders;
}

- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome
{
  return 0;
}

uint64_t __35__HFItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "latestResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hidden"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateModuleIdentifierInItems");
}

- (id)childItemsForItem:(id)a3 ofClass:(Class)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[HFItemManager childItemsForItem:](self, "childItemsForItem:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__HFItemManager_childItemsForItem_ofClass___block_invoke;
  v8[3] = &__block_descriptor_40_e16_B16__0__HFItem_8lu32l8;
  v8[4] = a4;
  objc_msgSend(v5, "na_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  __int16 v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_performUpdateForChildItemsOfItem:withContext:isInternal:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke_2;
  v10[3] = &unk_1EA734B08;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v3;
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 48);
  v16 = *(_WORD *)(a1 + 65);
  v7 = v3;
  objc_msgSend(v4, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __60__HFItemManager__itemsWithDependenciesPassingTest_forItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "childItemsForItem:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_itemsWithDependenciesPassingTest:forItems:", *(_QWORD *)(a1 + 40), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "count") != 0;

  }
  return v4;
}

uint64_t __64__HFItemManager__directItemDependenciesForHomeKitObjects_class___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intersectsSet:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "latestResults", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dependentHomeKitClasses"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(a1 + 40), "isSubclassOfClass:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13)) & 1) != 0)
          {
            v7 = 1;
            goto LABEL_13;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_13:

  }
  return v7;
}

- (id)_itemsWithDependenciesPassingTest:(id)a3 forItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__HFItemManager__itemsWithDependenciesPassingTest_forItems___block_invoke;
  v10[3] = &unk_1EA734D90;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a4, "na_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_performUpdateForChildItemsOfItem:(id)a3 withContext:(id)a4 isInternal:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v37;
  BOOL v38;
  char v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD v43[4];
  char v44;
  _QWORD v45[5];
  id v46;
  BOOL v47;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("childItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager childItemsByParentItem](self, "childItemsByParentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v12;
  v16 = v14;
  if (v15 == v16)
  {
    v17 = 0;
  }
  else if (v15)
  {
    v17 = objc_msgSend(v15, "isEqual:", v16) ^ 1;
  }
  else
  {
    v17 = 1;
  }

  -[HFItemManager childItemsByParentItem](self, "childItemsByParentItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v15, v9);

  if (objc_msgSend(v15, "containsObject:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemManager.m"), 1465, CFSTR("Detected a case where an item is vending itself as a child item. For the love of all that is holy, please don't do this. Item: <%@:%p>"), objc_opt_class(), v9);

  }
  v19 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "futureWithResult:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    NSStringFromSelector((SEL)objc_msgSend(v10, "senderSelector"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("itemManagerUpdate"), "stringByAppendingFormat:", CFSTR("-%@-ChildItems-%p"), v22, v9);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFItemManager home](self, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hf_characteristicValueManager");
    v38 = a5;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFStaticReadPolicy policyWithDecision:](HFStaticReadPolicy, "policyWithDecision:", 0);
    v42 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "logger");
    v39 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "beginTransactionWithReason:readPolicy:logger:", v40, v25, v26);

    v41 = v16;
    v27 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke;
    v45[3] = &unk_1EA734B58;
    v45[4] = self;
    v46 = v42;
    v47 = v38;
    objc_msgSend(v15, "na_map:", v45);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(v28, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "combineAllFutures:ignoringErrors:scheduler:", v30, 1, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v27;
    v43[1] = 3221225472;
    v43[2] = __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke_2;
    v43[3] = &__block_descriptor_33_e27___NAFuture_16__0__NSArray_8l;
    v44 = v39;
    objc_msgSend(v32, "flatMap:", v43);
    v33 = objc_claimAutoreleasedReturnValue();

    -[HFItemManager home](self, "home");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hf_characteristicValueManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "commitTransactionWithReason:", v40);

    v10 = v42;
    v21 = (void *)v33;
    v16 = v41;
  }

  return v21;
}

- (id)childItemsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager childItemsByParentItem](self, "childItemsByParentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMapTable)childItemsByParentItem
{
  return self->_childItemsByParentItem;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HFItemManager itemModules](self, "itemModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HFItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke;
  v7[3] = &unk_1EA7347D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_each:", v7);

}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsPassingTest:", &__block_literal_global_350);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);
  -[HFItemManager _displayFilter](self, "_displayFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFItemManager _displayFilter](self, "_displayFilter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_filter:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v10);

  }
  -[HFItemManager _itemsOfClass:inItems:allowTransformedItems:](self, "_itemsOfClass:inItems:allowTransformedItems:", objc_opt_class(), v4, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  -[HFItemManager allItems](self, "allItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsOfClass:inItems:allowTransformedItems:](self, "_itemsOfClass:inItems:allowTransformedItems:", v12, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    -[HFItemManager _serviceItemsToHideInSet:allServiceGroupItems:](self, "_serviceItemsToHideInSet:allServiceGroupItems:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v5, "unionSet:", v15);

  }
  -[HFItemManager home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hf_currentUserIsAdministrator");

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v4, "na_filter:", &__block_literal_global_353);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v18);

  }
  -[HFItemManager home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hf_currentUserIsOwner");

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v4, "na_filter:", &__block_literal_global_354);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v21);

  }
  -[HFItemManager itemModules](self, "itemModules");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __35__HFItemManager__itemsToHideInSet___block_invoke_4;
  v28[3] = &unk_1EA734D40;
  v29 = v4;
  v23 = v5;
  v30 = v23;
  v24 = v4;
  objc_msgSend(v22, "na_each:", v28);

  v25 = v30;
  v26 = v23;

  return v26;
}

- (NSArray)itemModules
{
  return self->_itemModules;
}

- (id)_itemsOfClass:(Class)a3 inItems:(id)a4 allowTransformedItems:(BOOL)a5
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_msgSend(v12, "sourceHomeKitItem", (_QWORD)v16),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v13,
              (isKindOfClass & 1) != 0))
        {
          objc_msgSend(v6, "addObject:", v12, (_QWORD)v16);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_displayFilter
{
  return self->__displayFilter;
}

- (id)_processBatchUpdateForFutureWrappers:(id)a3 removedItems:(id)a4 logger:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  int v28;
  NSObject *v30;
  int v31;
  int v32;
  id v34;
  id v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  int v43;
  os_activity_scope_state_s state;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a4;
  v34 = a5;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v16, "future");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isFinished");

        if (v18)
        {
          v19 = objc_msgSend(v16, "isInternal") ? v9 : v10;
          objc_msgSend(v16, "item");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v20);

          objc_msgSend(v8, "removeObject:", v16);
          objc_msgSend(v16, "outcome");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "outcomeType");

          if (v22 == 2)
          {
            if (objc_msgSend(v16, "isInternal"))
              v23 = v36;
            else
              v23 = v37;
            objc_msgSend(v16, "item");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v24);

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v9, "count"))
    -[HFItemManager _updateRepresentationForInternalItemsWithUpdatedItems:](self, "_updateRepresentationForInternalItemsWithUpdatedItems:", v36);
  if (objc_msgSend(v10, "count") || objc_msgSend(v35, "count"))
    -[HFItemManager _updateRepresentationForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:](self, "_updateRepresentationForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:", v37, v35, v34);
  if (v34)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    objc_msgSend(v34, "loggerActivity");
    v25 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v25, &state);

    HFLogForCategory(0x29uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v9, "count");
      v28 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 67109120;
      v43 = v28 + v27;
      _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "Processed batch with %d finished items", buf, 8u);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v9, "count");
      v32 = objc_msgSend(v10, "count");
      LODWORD(state.opaque[0]) = 67109120;
      HIDWORD(state.opaque[0]) = v32 + v31;
      _os_log_impl(&dword_1DD34E000, v30, OS_LOG_TYPE_DEFAULT, "Processed batch with %d finished items", (uint8_t *)&state, 8u);
    }

  }
  return v8;
}

id __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  NSObject *v37;
  void *v38;
  __CFString *v39;
  NSObject *v40;
  uint64_t v41;
  __CFString *v42;
  const __CFString *v43;
  os_activity_scope_state_s v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "loadingState");
  v5 = objc_msgSend(*(id *)(a1 + 32), "_effectiveLoadingStateForSuggestedLoadingState:", objc_msgSend(*(id *)(a1 + 40), "_loadingStateForItem:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 32), "setLoadingState:", v5);
  v6 = *(id *)(a1 + 48);
  if (v4 == v5)
    v7 = objc_msgSend(v3, "BOOLValue");
  else
    v7 = 1;
  if (!objc_msgSend(*(id *)(a1 + 48), "outcomeType") || v7)
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    if ((v7 & 1) != 0)
    {
      v9 = 2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "results");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToDictionary:", *(_QWORD *)(a1 + 56));

      if (v11)
        v9 = 1;
      else
        v9 = 2;
    }
    objc_msgSend(v8, "setOutcomeType:", v9);

  }
  else
  {
    v8 = v6;
  }
  objc_msgSend(*(id *)(a1 + 40), "_transformedUpdateOutcomeForItem:proposedOutcome:", *(_QWORD *)(a1 + 32), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v12)
  {
    objc_msgSend(*(id *)(a1 + 64), "logger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 64), "logger", 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loggerActivity");
      v15 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v15, &v44);

      HFLogForCategory(0x29uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = *(void **)(a1 + 32);
        v18 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v46 = v17;
        v47 = 2112;
        v48 = v18;
        _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEBUG, "Results for item %@ have been transformed by item manager %@", buf, 0x16u);
      }

      os_activity_scope_leave(&v44);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = *(void **)(a1 + 32);
        v39 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v46 = v38;
        v47 = 2112;
        v48 = v39;
        _os_log_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_DEBUG, "Results for item %@ have been transformed by item manager %@", buf, 0x16u);
      }

    }
  }
  objc_msgSend(v12, "results");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLatestResults:", v19);

  if (objc_msgSend(v12, "outcomeType") == 2)
  {
    if (*(_BYTE *)(a1 + 72))
      v20 = CFSTR("Updated");
    else
      v20 = CFSTR("Added");
    v21 = v20;
    if (*(_BYTE *)(a1 + 73))
      v22 = CFSTR("child item");
    else
      v22 = CFSTR("item");
    v23 = v22;
    objc_msgSend(*(id *)(a1 + 64), "logger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v44.opaque[0] = 0;
      v44.opaque[1] = 0;
      objc_msgSend(*(id *)(a1 + 64), "logger", 0, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "loggerActivity");
      v26 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v26, &v44);

      HFLogForCategory(0x29uLL);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v46 = v21;
        v47 = 2112;
        v48 = v23;
        v49 = 2112;
        v50 = v28;
        _os_log_impl(&dword_1DD34E000, v27, OS_LOG_TYPE_DEFAULT, "%@ %@: %@", buf, 0x20u);
      }

      os_activity_scope_leave(&v44);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v46 = v21;
        v47 = 2112;
        v48 = v23;
        v49 = 2112;
        v50 = v41;
        _os_log_impl(&dword_1DD34E000, v40, OS_LOG_TYPE_DEFAULT, "%@ %@: %@", buf, 0x20u);
      }

    }
LABEL_30:

    goto LABEL_38;
  }
  objc_msgSend(*(id *)(a1 + 64), "logger");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    HFLogForCategory(0x29uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v42 = *(__CFString **)(a1 + 32);
      if (*(_BYTE *)(a1 + 73))
        v43 = CFSTR("child item");
      else
        v43 = CFSTR("item");
      *(_DWORD *)buf = 138412546;
      v46 = (void *)v43;
      v47 = 2112;
      v48 = v42;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "Updated %@, but results did not change: %@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  v44.opaque[0] = 0;
  v44.opaque[1] = 0;
  objc_msgSend(*(id *)(a1 + 64), "logger", 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "loggerActivity");
  v31 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v31, &v44);

  HFLogForCategory(0x29uLL);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = *(__CFString **)(a1 + 32);
    if (*(_BYTE *)(a1 + 73))
      v34 = CFSTR("child item");
    else
      v34 = CFSTR("item");
    *(_DWORD *)buf = 138412546;
    v46 = (void *)v34;
    v47 = 2112;
    v48 = v33;
    _os_log_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_DEFAULT, "Updated %@, but results did not change: %@", buf, 0x16u);
  }

  os_activity_scope_leave(&v44);
LABEL_38:
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (unint64_t)_loadingStateForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _dependentHomeKitObjectsOfClass:inHomeKitObjects:](self, "_dependentHomeKitObjectsOfClass:inHomeKitObjects:", objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _dependentHomeKitObjectsOfClass:inHomeKitObjects:](self, "_dependentHomeKitObjectsOfClass:inHomeKitObjects:", objc_opt_class(), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_characteristicValueManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "loadingStateForCharacteristics:actionSets:", v7, v8);
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F03FAB50))
  {
    v28 = v7;
    v12 = v4;
    objc_msgSend(v12, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("HFResultHomeKitSettingsVendorKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "hf_settingsValueManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("HFAccessorySettingRepresentitiveObjectKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keyPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "pendingWrites");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __38__HFItemManager__loadingStateForItem___block_invoke;
    v29[3] = &unk_1EA72AB68;
    v30 = v18;
    v20 = v18;
    LODWORD(v18) = objc_msgSend(v19, "na_any:", v29);

    if ((_DWORD)v18)
      v11 |= 2uLL;

LABEL_9:
    v7 = v28;
    goto LABEL_10;
  }
  objc_msgSend(v4, "latestResults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("HFMediaAccessoryItemSettingsKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v28 = v7;
    objc_msgSend(v4, "latestResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("HFResultHomeKitSettingsVendorKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "hf_settingsValueManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("HFMediaAccessoryItemSettingsKey"));
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!v20
      || (objc_msgSend(v15, "pendingWrites"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v25, "count"),
          v25,
          v26))
    {
      v11 |= 2uLL;
    }
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (HMHome)home
{
  return self->_home;
}

- (id)_dependentHomeKitObjectsOfClass:(Class)a3 inHomeKitObjects:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__HFItemManager__dependentHomeKitObjectsOfClass_inHomeKitObjects___block_invoke;
  v5[3] = &__block_descriptor_40_e27_B16__0___HFHomeKitObject__8lu32l8;
  v5[4] = a3;
  objc_msgSend(a4, "na_filter:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_performUpdateForItem:(id)a3 withContext:(id)a4 isInternal:(BOOL)a5 isChild:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  HFItemManager *v13;
  uint64_t v14;
  void *v15;
  HFItemManager *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  char v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  NSObject *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  BOOL v49;
  char v50;
  BOOL v51;
  uint8_t buf[4];
  id v53;
  os_activity_scope_state_s state;
  uint64_t v55;

  v6 = a6;
  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_debug_owningItemManager");
  v13 = (HFItemManager *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_debug_owningItemManager");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v10, "_debug_owningItemManager");
    v16 = (HFItemManager *)objc_claimAutoreleasedReturnValue();

    if (v16 != self)
    {
      objc_msgSend(v10, "_debug_owningItemManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@: Request to update an item that is owned by a different item manager (%@). This is not supported, because the update may change the item's latestResults out from under the other item manager. Not only will the other item manager not know about the changes, but if it tries to perform its own update, it may think nothing has changed by comparing the item's latestResults before and after the update. Consider copying the item before passing it into a different item manager. In release builds, we continue with the update anyway. Item: %@"), self, v17, v10);

    }
  }
  objc_msgSend(v10, "set_debug_owningItemManager:", self);
  objc_msgSend(v10, "set_debug_isChildItem:", v6);
  objc_msgSend(v11, "updateOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, HFItemUpdateOptionPreviousResults);
  objc_msgSend(v11, "logger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, HFItemUpdateOptionLogger);

  objc_msgSend(v10, "updateWithOptions:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    NSLog(CFSTR("Programmer error: Items must always return a valid future from -updateWithOptions, but this item returned nil: %@"), v10);
    objc_msgSend(v11, "logger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v11, "logger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "loggerActivity");
      v24 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v24, &state);

      HFLogForCategory(0x29uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v10;
        _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_ERROR, "Programmer error: Items must always return a valid future from -updateWithOptions, but this item returned nil: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v10;
        _os_log_impl(&dword_1DD34E000, v40, OS_LOG_TYPE_ERROR, "Programmer error: Items must always return a valid future from -updateWithOptions, but this item returned nil: %@", (uint8_t *)&state, 0xCu);
      }

    }
    v26 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", MEMORY[0x1E0C9AA70]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "futureWithResult:", v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v28 = v13 == self;
  v29 = MEMORY[0x1E0C809B0];
  v30 = v28;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke;
  v45[3] = &unk_1EA734B30;
  v45[4] = self;
  v31 = v10;
  v46 = v31;
  v32 = v11;
  v47 = v32;
  v49 = a5;
  v33 = v12;
  v48 = v33;
  v50 = v30;
  v51 = v6;
  objc_msgSend(v21, "flatMap:", v45);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v29;
  v41[1] = 3221225472;
  v41[2] = __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke_306;
  v41[3] = &unk_1EA72BCB8;
  v42 = v32;
  v43 = v31;
  v44 = v33;
  v35 = v33;
  v36 = v31;
  v37 = v32;
  objc_msgSend(v34, "recover:", v41);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  return a4;
}

- (void)_updateOverallLoadingStateAndNotifyDelegate
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[HFItemManager overallLoadingState](self, "overallLoadingState");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HFItemManager _allDisplayedItemsIncludingInternalItems](self, "_allDisplayedItemsIncludingInternalItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "loadingState");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[HFItemManager setOverallLoadingState:](self, "setOverallLoadingState:", v7);
  if (v7 != v3)
  {
    -[HFItemManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[HFItemManager delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemManager:didChangeOverallLoadingState:", self, v7);

    }
  }
}

- (void)setOverallLoadingState:(unint64_t)a3
{
  self->_overallLoadingState = a3;
}

- (unint64_t)overallLoadingState
{
  return self->_overallLoadingState;
}

- (void)_updateRepresentationForInternalItemsWithUpdatedItems:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  -[HFItemManager _internalItems](self, "_internalItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v4, "count");

  if (v6 >= 2)
  {
LABEL_5:
    -[HFItemManager _internalItems](self, "_internalItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Received unexpected internal items %@; only a source item is currently supported"), v7);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager sourceItem](self, "sourceItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      -[HFItemManager sourceItem](self, "sourceItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Unknown source item %@; expected %@"), v8, v10);

    }
    -[HFItemManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __71__HFItemManager__updateRepresentationForInternalItemsWithUpdatedItems___block_invoke;
      v17[3] = &unk_1EA727188;
      v17[4] = self;
      v18 = v8;
      objc_msgSend(v13, "performBlock:", v17);

    }
    -[HFItemManager _itemForSorting](self, "_itemForSorting");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[HFItemManager _internalItems](self, "_internalItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v14);

      if ((v16 & 1) == 0)
        NSLog(CFSTR("Sorting item %@ is not an internal item. this is not currently supported!"), v14);
      if (objc_msgSend(v4, "containsObject:", v14))
        -[HFItemManager recalculateVisibilityAndSortAllItems](self, "recalculateVisibilityAndSortAllItems");
    }

  }
}

- (void)recalculateVisibilityAndSortAllItems
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _updateRepresentationForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:](self, "_updateRepresentationForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:", v4, v3, 0);

}

uint64_t __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performUpdateForItem:withContext:isInternal:isChild:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 1);
}

void __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke_3;
  v11[3] = &unk_1EA734C70;
  v12 = v5;
  v10 = v5;
  v7 = a3;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_sortedItems:forSectionIdentifier:", v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setItems:", v9);
}

- (id)_sortedItems:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HFItemManager _comparatorForSectionIdentifier:](self, "_comparatorForSectionIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __57__HFItemManager_DiffableDataSource__generateSnapshotInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v9 = a2;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v6, v9, v10);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v8, v5);

}

uint64_t __43__HFItemManager_childItemsForItem_ofClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __59__HFItemManager__reloadAllItemProvidersFromSenderSelector___block_invoke_2()
{
  return objc_msgSend((id)objc_opt_class(), "prefersNonBlockingReloads") ^ 1;
}

void __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_processBatchUpdateForFutureWrappers:removedItems:logger:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 56), "mutableCopy");
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_batchItemUpdateFutureWrappers:removedItems:batchingIntervals:logger:", v2, v4, v3, *(_QWORD *)(a1 + 48));

}

uint64_t __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __59__HFItemManager_sectionIndexForDisplayedSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)displayedItemAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemManager.m"), 2457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)displayedItemsInSectionWithIdentifier:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](self, "sectionIndexForDisplayedSectionIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[HFItemManager displayedItemsInSection:](self, "displayedItemsInSection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)sectionIndexForDisplayedSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HFItemManager_sectionIndexForDisplayedSectionIdentifier___block_invoke;
  v11[3] = &unk_1EA734D68;
  v12 = v4;
  v8 = v4;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v11);

  return v9;
}

uint64_t __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:");
}

- (void)_updateLoadingStateAndNotifyDelegateForItems:(id)a3 canFinishTransaction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v8)
  {

    goto LABEL_22;
  }
  v9 = v8;
  v21 = v4;
  v10 = 0;
  v11 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "_effectiveLoadingStateForSuggestedLoadingState:", -[HFItemManager _loadingStateForItem:](self, "_loadingStateForItem:", v13));
      if (objc_msgSend(v13, "loadingState") != v14)
      {
        objc_msgSend(v13, "setLoadingState:", v14);
        -[HFItemManager _internalItems](self, "_internalItems");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v13);

        -[HFItemManager delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v18 = objc_opt_respondsToSelector();

          if ((v18 & 1) != 0)
          {
            -[HFItemManager delegate](self, "delegate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "itemManager:didUpdateResultsForSourceItem:", self, v13);
            goto LABEL_14;
          }
LABEL_15:
          v10 = 1;
          continue;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v19 = objc_msgSend(v22, "containsObject:", v13);

          if (!v19)
            goto LABEL_15;
          -[HFItemManager indexPathForItem:](self, "indexPathForItem:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[HFItemManager delegate](self, "delegate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "itemManager:didUpdateResultsForItem:atIndexPath:", self, v13, v17);

          }
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v9);

  if ((v10 & 1) != 0)
  {
    -[HFItemManager _updateOverallLoadingStateAndNotifyDelegate](self, "_updateOverallLoadingStateAndNotifyDelegate");
    if (v21)
      -[HFItemManager _didFinishUpdateTransactionWithAffectedItems:](self, "_didFinishUpdateTransactionWithAffectedItems:", v7);
  }
LABEL_22:

}

- (id)indexPathForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayedItemsInSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[HFItemManager diffableDataSource](self, "diffableDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFItemManager diffableDataSource](self, "diffableDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "snapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemIdentifiersInSectionWithIdentifier:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)_allDisplayedItemsIncludingInternalItems
{
  void *v3;
  void *v4;
  void *v5;

  -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _internalItems](self, "_internalItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)allDisplayedItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (id)displayedSectionIdentifierForSectionIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    HFLogForCategory(0x29uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[HFItemManager diffableDataSource](self, "diffableDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "snapshot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315650;
      v19 = "-[HFItemManager displayedSectionIdentifierForSectionIndex:]";
      v20 = 2112;
      v21 = v17;
      v22 = 2048;
      v23 = a3;
      _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "(%s) self.diffableDataSource.snapshot = %@. sectionIndex = %lu", (uint8_t *)&v18, 0x20u);

    }
    v13 = 0;
  }
  else
  {
    -[HFItemManager diffableDataSource](self, "diffableDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a1[4], "diffableDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v9);

  if (!v6)
  {
    v7 = v9;
    v8 = a1 + 7;
    goto LABEL_5;
  }
  if (objc_msgSend(a1[5], "containsObject:", v9))
  {
    v7 = v9;
    v8 = a1 + 6;
LABEL_5:
    objc_msgSend(*v8, "addObject:", v7);
  }

}

- (HFDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (id)_internalItems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFItemManager sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

uint64_t __45__HFItemManager_resetItemProvidersAndModules__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemProviders");
}

uint64_t __45__HFItemManager_resetItemProvidersAndModules__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "registerForExternalUpdates");
}

- (BOOL)diffableDataSourceDisabled
{
  return self->_diffableDataSourceDisabled;
}

uint64_t __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  HFLogForCategory(0x31uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD34E000, v3, OS_SIGNPOST_INTERVAL_END, v4, "HFFutureToUpdateItems", "Starting update", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateResultsForItems:removedItems:context:allowDelaying:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_276;
  v7[3] = &unk_1EA72A000;
  v8 = *(id *)(a1 + 64);
  v6 = (id)objc_msgSend(v5, "addCompletionBlock:", v7);

}

- (id)_updateResultsForItems:(id)a3 removedItems:(id)a4 context:(id)a5 allowDelaying:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  HFUpdateLogger *v53;
  void *v54;
  void *v55;
  void *v56;
  HFUpdateLogger *v57;
  void *v58;
  BOOL v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  void *v103;
  void *v104;
  NSObject *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  BOOL v109;
  char *spid;
  id v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  _QWORD v116[4];
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122[2];
  BOOL v123;
  _QWORD v124[5];
  id v125;
  _QWORD v126[5];
  id v127;
  os_activity_scope_state_s state;
  _QWORD v129[5];
  id v130;
  id v131;
  id v132;
  id v133;
  os_signpost_id_t v134;
  _QWORD v135[5];
  id v136;
  id v137;
  id v138;
  id v139;
  os_signpost_id_t v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint8_t buf[4];
  HFItemManager *v146;
  __int16 v147;
  id v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  void *v152;
  _BYTE v153[128];
  uint64_t v154;

  v6 = a6;
  v154 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v114 = a4;
  v12 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v115 = v12;
  objc_msgSend(v12, "readPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemManager.m"), 1220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context.readPolicy != nil"));

  }
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v141, v153, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v142 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
        if (objc_msgSend(v18, "_debug_isChildItem"))
          NSLog(CFSTR("Attempting to explicitly update item %@ that is being tracked as a child item. This is not currently supported and will result in undefined behavior!"), v18);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v141, v153, 16);
    }
    while (v15);
  }

  -[HFItemManager home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

  }
  else if (!-[HFItemManager _shouldBuildItemProvidersAndModulesForNilHome](self, "_shouldBuildItemProvidersAndModulesForNilHome"))
  {
    v21 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_45;
  }
  if (!objc_msgSend(v14, "count") && !objc_msgSend(v114, "count"))
  {
    v103 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "futureWithResult:", v104);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_45;
  }
  if (!-[HFItemManager hasRequestedFirstUpdate](self, "hasRequestedFirstUpdate"))
    goto LABEL_22;
  -[HFItemManager firstFastUpdateFuture](self, "firstFastUpdateFuture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isFinished"))
  {

LABEL_22:
    if (v6
      && objc_msgSend(v14, "count")
      && (-[HFItemManager delegate](self, "delegate"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_opt_respondsToSelector(),
          v27,
          (v28 & 1) != 0))
    {
      HFLogForCategory(0x31uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_signpost_id_generate(v29);

      HFLogForCategory(0x31uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        objc_msgSend(v115, "updateOptions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "BOOLValue"))
          v35 = CFSTR("Initial");
        else
          v35 = CFSTR("Normal");
        -[HFItemManager identifier](self, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_opt_class();
        v111 = v37;
        NSStringFromSelector((SEL)objc_msgSend(v115, "senderSelector"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v146 = (HFItemManager *)v35;
        v147 = 2112;
        v148 = v36;
        v149 = 2112;
        v150 = v37;
        v151 = 2112;
        v152 = v38;
        _os_signpost_emit_with_name_impl(&dword_1DD34E000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "HFFutureToUpdateItems", "%@ Item Update Delayed %@:%@ for sender: %@", buf, 0x2Au);

      }
      -[HFItemManager delegate](self, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "updateOptions");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "itemManager:futureToUpdateItems:itemUpdateOptions:", self, v14, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      v43 = MEMORY[0x1E0C809B0];
      v135[0] = MEMORY[0x1E0C809B0];
      v135[1] = 3221225472;
      v135[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke;
      v135[3] = &unk_1EA734A68;
      v135[4] = self;
      v44 = v115;
      v136 = v44;
      v45 = v14;
      v137 = v45;
      v140 = v30;
      v46 = v114;
      v138 = v46;
      v47 = v42;
      v139 = v47;
      v48 = (id)objc_msgSend(v41, "addFailureBlock:", v135);
      v129[0] = v43;
      v129[1] = 3221225472;
      v129[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_2;
      v129[3] = &unk_1EA734A90;
      v134 = v30;
      v129[4] = self;
      v130 = v45;
      v131 = v46;
      v132 = v44;
      v49 = v47;
      v133 = v49;
      v50 = (id)objc_msgSend(v41, "addSuccessBlock:", v129);
      v51 = v133;
      v23 = v49;

    }
    else
    {
      objc_msgSend(v115, "logger");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
        v53 = [HFUpdateLogger alloc];
        v54 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromSelector((SEL)objc_msgSend(v115, "senderSelector"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("[%@ %@]"), self, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[HFUpdateLogger initWithTimeout:description:](v53, "initWithTimeout:description:", v56, 15.0);
        objc_msgSend(v115, "setLogger:", v57);

      }
      objc_msgSend(v115, "logger");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58 == 0;

      if (v59)
      {
        HFLogForCategory(0x29uLL);
        v107 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector((SEL)objc_msgSend(v115, "senderSelector"));
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v146 = self;
          v147 = 2112;
          v148 = v108;
          _os_log_impl(&dword_1DD34E000, v107, OS_LOG_TYPE_DEFAULT, "%@: Starting update for sender: \"%@\", buf, 0x16u);

        }
      }
      else
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v115, "logger");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "loggerActivity");
        v61 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v61, &state);

        HFLogForCategory(0x29uLL);
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector((SEL)objc_msgSend(v115, "senderSelector"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v146 = self;
          v147 = 2112;
          v148 = v63;
          _os_log_impl(&dword_1DD34E000, v62, OS_LOG_TYPE_DEFAULT, "%@: Starting update for sender: \"%@\", buf, 0x16u);

        }
        os_activity_scope_leave(&state);
      }
      HFLogForCategory(0x31uLL);
      v64 = objc_claimAutoreleasedReturnValue();
      spid = (char *)os_signpost_id_generate(v64);

      HFLogForCategory(0x31uLL);
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        objc_msgSend(v115, "updateOptions");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v68, "BOOLValue"))
          v69 = CFSTR("Initial");
        else
          v69 = CFSTR("Normal");
        -[HFItemManager identifier](self, "identifier");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)objc_opt_class();
        v112 = v71;
        NSStringFromSelector((SEL)objc_msgSend(v115, "senderSelector"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v146 = (HFItemManager *)v69;
        v147 = 2112;
        v148 = v70;
        v149 = 2112;
        v150 = v71;
        v151 = 2112;
        v152 = v72;
        _os_signpost_emit_with_name_impl(&dword_1DD34E000, v66, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "HFItemManagerUpdate", "%@ Item Update Started %@:%@ for sender: %@", buf, 0x2Au);

      }
      v109 = v52 == 0;

      v73 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector((SEL)objc_msgSend(v115, "senderSelector"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("itemManagerUpdate"), v74);
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFItemManager home](self, "home");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "hf_characteristicValueManager");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "readPolicy");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "logger");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "beginTransactionWithReason:readPolicy:logger:", v113, v77, v78);

      -[HFItemManager _internalItems](self, "_internalItems");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "na_setByIntersectingWithSet:", v14);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "na_setByRemovingObjectsFromSet:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "allObjects");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = MEMORY[0x1E0C809B0];
      v126[1] = 3221225472;
      v126[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_280;
      v126[3] = &unk_1EA734AB8;
      v126[4] = self;
      v84 = v115;
      v127 = v84;
      objc_msgSend(v83, "na_map:", v126);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "addObjectsFromArray:", v85);

      objc_msgSend(v80, "allObjects");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v124[0] = MEMORY[0x1E0C809B0];
      v124[1] = 3221225472;
      v124[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_2_283;
      v124[3] = &unk_1EA734AB8;
      v124[4] = self;
      v87 = v84;
      v125 = v87;
      objc_msgSend(v86, "na_map:", v124);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "addObjectsFromArray:", v88);

      v89 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      -[HFItemManager home](self, "home");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "hf_characteristicValueManager");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "commitTransactionWithReason:", v113);

      objc_msgSend(v87, "logger");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemManager _batchItemUpdateFutureWrappers:removedItems:batchingIntervals:logger:](self, "_batchItemUpdateFutureWrappers:removedItems:batchingIntervals:logger:", v82, v114, &unk_1EA7CDDB0, v92);

      v93 = (void *)MEMORY[0x1E0D519C0];
      +[_HFItemUpdateFutureWrapper futuresFromWrappers:](_HFItemUpdateFutureWrapper, "futuresFromWrappers:", v82);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "combineAllFutures:ignoringErrors:scheduler:", v94, 1, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, self);
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_288;
      v116[3] = &unk_1EA734AE0;
      objc_copyWeak(v122, (id *)buf);
      v97 = v80;
      v117 = v97;
      v98 = v81;
      v118 = v98;
      v119 = v114;
      v122[1] = spid;
      v120 = v87;
      v123 = v109;
      v99 = v89;
      v121 = v99;
      v100 = (id)objc_msgSend(v96, "addCompletionBlock:", v116);
      v101 = v121;
      v23 = v99;

      objc_destroyWeak(v122);
      objc_destroyWeak((id *)buf);

    }
    goto LABEL_45;
  }
  objc_msgSend(v115, "updateOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  if ((v26 & 1) != 0)
    goto LABEL_22;
  HFLogForCategory(0x29uLL);
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v146 = self;
    v147 = 2112;
    v148 = v14;
    _os_log_impl(&dword_1DD34E000, v105, OS_LOG_TYPE_DEFAULT, "Request to updateResultsForItems for %@, but we're still performing the fast initial update. Once that is done, we'll reload all items anyway, so ignoring this duplicate request. itemsToUpdate: %@", buf, 0x16u);
  }

  -[HFItemManager firstFullUpdateFuture](self, "firstFullUpdateFuture");
  v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

  return v23;
}

- (id)diffableDataItemManagerDelegate
{
  void *v3;
  int v4;
  void *v5;

  -[HFItemManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1F0476878);

  if (v4)
  {
    -[HFItemManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (HFItemManagerDelegate)delegate
{
  return (HFItemManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NAFuture)firstFastUpdateFuture
{
  return self->_firstFastUpdateFuture;
}

- (void)_batchItemUpdateFutureWrappers:(id)a3 removedItems:(id)a4 batchingIntervals:(id)a5 logger:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  int v17;
  void *v18;
  float v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void (**v32)(_QWORD);
  id v33;
  NSObject *v34;
  int v35;
  int v36;
  void *v37;
  float v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t *v42;
  _QWORD v43[4];
  void (**v44)(_QWORD);
  uint8_t *v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  os_activity_scope_state_s state;
  uint8_t buf[8];
  uint8_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v12, "count"))
    NSLog(CFSTR("No batching intervals specified"));
  if (objc_msgSend(v12, "count") && (objc_msgSend(v10, "count") || objc_msgSend(v11, "count")))
  {
    if (v13)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v13, "loggerActivity");
      v14 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v14, &state);

      HFLogForCategory(0x29uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(v10, "count");
        v17 = objc_msgSend(v11, "count");
        objc_msgSend(v12, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v16;
        LOWORD(v54) = 1024;
        *(_DWORD *)((char *)&v54 + 2) = v17;
        HIWORD(v54) = 2048;
        *(double *)&v55 = v19;
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Requested batched update for %d items (+%d removed). Processing in: %.2f sec...", buf, 0x18u);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_msgSend(v10, "count");
        v36 = objc_msgSend(v11, "count");
        objc_msgSend(v12, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "floatValue");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v35;
        LOWORD(v54) = 1024;
        *(_DWORD *)((char *)&v54 + 2) = v36;
        HIWORD(v54) = 2048;
        *(double *)&v55 = v38;
        _os_log_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEFAULT, "Requested batched update for %d items (+%d removed). Processing in: %.2f sec...", buf, 0x18u);

      }
    }
    objc_initWeak((id *)&state, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke;
    aBlock[3] = &unk_1EA735198;
    objc_copyWeak(&v51, (id *)&state);
    v20 = v10;
    v47 = v20;
    v48 = v11;
    v49 = v13;
    v21 = v12;
    v50 = v21;
    v22 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[HFItemManager setUpCustomDiffableDataSource](self, "setUpCustomDiffableDataSource");
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v54 = buf;
    v55 = 0x2020000000;
    v56 = 0;
    objc_msgSend(v21, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    if (v26 >= 0.00000011920929)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke_2;
      v43[3] = &unk_1EA7351C0;
      v45 = buf;
      v44 = v22;
      objc_msgSend(v23, "afterDelay:performBlock:", v43, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v54[24] = 1;
      v22[2](v22);
      v27 = 0;
    }
    v28 = (void *)MEMORY[0x1E0D519C0];
    +[_HFItemUpdateFutureWrapper futuresFromWrappers:](_HFItemUpdateFutureWrapper, "futuresFromWrappers:", v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "combineAllFutures:ignoringErrors:scheduler:", v29, 1, v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke_3;
    v39[3] = &unk_1EA7351E8;
    v42 = buf;
    v31 = v27;
    v40 = v31;
    v32 = v22;
    v41 = v32;
    v33 = (id)objc_msgSend(v30, "addCompletionBlock:", v39);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&v51);
    objc_destroyWeak((id *)&state);
  }

}

- (BOOL)hasRequestedFirstUpdate
{
  return self->_hasRequestedFirstUpdate;
}

- (void)_updateRepresentationForExternalItemsWithUpdatedOrAddedItems:(id)a3 removedItems:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  -[HFItemManager setUpCustomDiffableDataSource](self, "setUpCustomDiffableDataSource");
  -[HFItemManager firstFastUpdateFuture](self, "firstFastUpdateFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isFinished");

  if ((v11 & 1) == 0)
    -[HFItemManager _prefetchResourcesIfNeededForItems:](self, "_prefetchResourcesIfNeededForItems:", v19);
  if (-[HFItemManager useCustomDiffableDataSource](self, "useCustomDiffableDataSource"))
  {
    -[HFItemManager _updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:](self, "_updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:", v19, v8, v9);
    v12 = (void *)MEMORY[0x1E0D519C0];
    v13 = (void *)MEMORY[0x1E0C99E60];
    -[HFItemManager diffableDataSource](self, "diffableDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "itemIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager setLatestSnapshotGenerationFuture:](self, "setLatestSnapshotGenerationFuture:", v18);

  }
  else
  {
    -[HFItemManager _updateRepresentationWithUIDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:](self, "_updateRepresentationWithUIDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:", v19, v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager setLatestSnapshotGenerationFuture:](self, "setLatestSnapshotGenerationFuture:", v14);
  }

}

- (void)setUpCustomDiffableDataSource
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  _BOOL8 diffableDataSourceDisabled;
  HFCustomDiffableDataSource *v8;
  HFDiffableDataSource *diffableDataSource;

  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[HFItemManager useCustomDiffableDataSource](self, "useCustomDiffableDataSource"))
      goto LABEL_9;
    -[HFItemManager delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      -[HFItemManager delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        diffableDataSourceDisabled = 1;
        goto LABEL_8;
      }
    }
    diffableDataSourceDisabled = self->_diffableDataSourceDisabled;
LABEL_8:
    -[HFItemManager setUseCustomDiffableDataSource:](self, "setUseCustomDiffableDataSource:", diffableDataSourceDisabled);
LABEL_9:
    if (-[HFItemManager useCustomDiffableDataSource](self, "useCustomDiffableDataSource"))
    {
      v8 = objc_alloc_init(HFCustomDiffableDataSource);
      diffableDataSource = self->_diffableDataSource;
      self->_diffableDataSource = (HFDiffableDataSource *)v8;

    }
  }
}

- (BOOL)useCustomDiffableDataSource
{
  return self->_useCustomDiffableDataSource;
}

- (void)setLatestSnapshotGenerationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_latestSnapshotGenerationFuture, a3);
}

- (void)setUseCustomDiffableDataSource:(BOOL)a3
{
  self->_useCustomDiffableDataSource = a3;
}

BOOL __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    objc_msgSend(*(id *)(result + 32), "cancel");
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
  }
  return result;
}

- (void)_prefetchResourcesIfNeededForItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HFItemManager allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    -[HFItemManager _itemsToHideInSet:](self, "_itemsToHideInSet:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_removedObjectsFromSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    -[HFItemManager diffableDataItemManagerDelegate](self, "diffableDataItemManagerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffableDataItemManager:prefetchResourcesForItems:", self, v7);

    v9 = (void *)v7;
  }
  else
  {
    v9 = v10;
  }

}

- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  uint8_t buf[4];
  HFItemManager *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x23uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = self;
    v16 = 2080;
    v17 = "-[HFItemManager(HomeKitDelegates) homeDidUpdateHomeEnergyManagerEnabled:]";
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "(%@ %s) HFItemManager Delegates ~~> Dispatching onto onto main. home name: %@", buf, 0x20u);

  }
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("homeEnergy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, v11, v5, a2);

}

- (void)walletKeyDeviceStateUpdated:(id)a3 inHome:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a4;
  v7 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedWalletKeyDeviceState:](self, "_itemsToUpdateForModifiedWalletKeyDeviceState:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], v11, a2);
}

- (void)home:(id)a3 willReadValuesForCharacteristics:(id)a4
{
  id v5;

  -[HFItemManager _itemsToUpdateForModifiedCharacteristics:](self, "_itemsToUpdateForModifiedCharacteristics:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _updateLoadingStateAndNotifyDelegateForItems:canFinishTransaction:](self, "_updateLoadingStateAndNotifyDelegateForItems:canFinishTransaction:", v5, 1);

}

- (void)home:(id)a3 didReadValuesForCharacteristics:(id)a4 failedCharacteristics:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCharacteristics:](self, "_itemsToUpdateForModifiedCharacteristics:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, MEMORY[0x1E0C9AA60], v15, a2);

}

- (id)_itemsToUpdateForModifiedCharacteristics:(id)a3
{
  return -[HFItemManager _itemsToUpdateForModifiedCharacteristics:includeSuppressedCharacteristics:](self, "_itemsToUpdateForModifiedCharacteristics:includeSuppressedCharacteristics:", a3, 0);
}

id __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  id *from;
  void *v62;
  void *v63;
  id WeakRetained;
  id obj;
  _QWORD v66[5];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76[2];
  char v77;
  char v78;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[2];
  _QWORD v86[2];
  uint8_t buf[4];
  void *v88;
  os_activity_scope_state_s state;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  from = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", *(_QWORD *)(a1 + 32));
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v82 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        objc_msgSend(v10, "addedItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          objc_msgSend(v10, "addedItems");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v13);

        }
        objc_msgSend(v10, "removedItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          objc_msgSend(v10, "removedItems");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unionSet:", v16);

          objc_msgSend(v10, "removedItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "minusSet:", v17);

        }
        objc_msgSend(v10, "existingItems");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19 && *(_BYTE *)(a1 + 80))
        {
          objc_msgSend(v10, "existingItems");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "unionSet:", v20);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    }
    while (v7);
  }

  v63 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "na_filter:", &__block_literal_global_220_0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "unionSet:", v21);

  v22 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "futureWithResult:", v23);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v60, "unionSet:", v6);
  if (objc_msgSend(WeakRetained, "_shouldPerformFastInitialUpdates") && objc_msgSend(v63, "count"))
  {
    v24 = *(void **)(a1 + 40);
    if (v24)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v24, "loggerActivity");
      v25 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v25, &state);

      HFLogForCategory(0x29uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v63;
        _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "Starting a fast initial update for items: %@", buf, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v63;
        _os_log_impl(&dword_1DD34E000, v58, OS_LOG_TYPE_DEFAULT, "Starting a fast initial update for items: %@", (uint8_t *)&state, 0xCu);
      }

    }
    if (objc_msgSend(v5, "count"))
    {
      v27 = *(void **)(a1 + 40);
      if (v27)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v27, "loggerActivity");
        v28 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v28, &state);

        HFLogForCategory(0x29uLL);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v5;
          _os_log_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEFAULT, "Processing removed items in this fast update: %@", buf, 0xCu);
        }

        os_activity_scope_leave(&state);
      }
      else
      {
        HFLogForCategory(0x29uLL);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v5;
          _os_log_impl(&dword_1DD34E000, v59, OS_LOG_TYPE_DEFAULT, "Processing removed items in this fast update: %@", (uint8_t *)&state, 0xCu);
        }

      }
    }
    v30 = (void *)objc_opt_new();
    objc_msgSend(v30, "setSenderSelector:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v30, "setLogger:", *(_QWORD *)(a1 + 40));
    v85[0] = HFItemUpdateOptionFastInitialUpdate;
    v85[1] = HFItemUpdateOptionDisableOptionalData;
    v86[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "_shouldDisableOptionalDataDuringFastInitialUpdate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setUpdateOptions:", v32);

    +[HFStaticReadPolicy policyWithDecision:](HFStaticReadPolicy, "policyWithDecision:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setReadPolicy:", v33);

    objc_msgSend(WeakRetained, "_updateResultsForItems:removedItems:context:allowDelaying:", v63, v5, v30, 1);
    v34 = objc_claimAutoreleasedReturnValue();

    v35 = 1;
    v62 = (void *)v34;
  }
  else
  {
    if (objc_msgSend(v4, "count"))
    {
      v36 = *(void **)(a1 + 40);
      if (v36)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v36, "loggerActivity");
        v37 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v37, &state);

        HFLogForCategory(0x29uLL);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v4;
          _os_log_impl(&dword_1DD34E000, v38, OS_LOG_TYPE_DEFAULT, "Item providers asked to add items: %@", buf, 0xCu);
        }

        os_activity_scope_leave(&state);
      }
      else
      {
        HFLogForCategory(0x29uLL);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v4;
          _os_log_impl(&dword_1DD34E000, v56, OS_LOG_TYPE_DEFAULT, "Item providers asked to add items: %@", (uint8_t *)&state, 0xCu);
        }

      }
    }
    if (objc_msgSend(v5, "count"))
    {
      v39 = *(void **)(a1 + 40);
      if (v39)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v39, "loggerActivity");
        v40 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v40, &state);

        HFLogForCategory(0x29uLL);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v5;
          _os_log_impl(&dword_1DD34E000, v41, OS_LOG_TYPE_DEFAULT, "Item providers asked to remove items: %@", buf, 0xCu);
        }

        os_activity_scope_leave(&state);
      }
      else
      {
        HFLogForCategory(0x29uLL);
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(state.opaque[0]) = 138412290;
          *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v5;
          _os_log_impl(&dword_1DD34E000, v57, OS_LOG_TYPE_DEFAULT, "Item providers asked to remove items: %@", (uint8_t *)&state, 0xCu);
        }

      }
    }
    v42 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "finishWithResult:", v30);
    v35 = 0;
  }

  v43 = MEMORY[0x1E0C809B0];
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_223;
  v79[3] = &unk_1EA734920;
  objc_copyWeak(&v80, from);
  objc_msgSend(v62, "flatMap:", v79);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v69[0] = v43;
  v69[1] = 3221225472;
  v69[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_3_227;
  v69[3] = &unk_1EA734998;
  objc_copyWeak(v76, from);
  v70 = *(id *)(a1 + 48);
  v77 = v35;
  v46 = v5;
  v78 = v35;
  v47 = v46;
  v48 = *(void **)(a1 + 72);
  v71 = v46;
  v76[1] = v48;
  v72 = *(id *)(a1 + 40);
  v73 = *(id *)(a1 + 56);
  v74 = *(id *)(a1 + 32);
  v49 = v60;
  v75 = v49;
  objc_msgSend(v44, "flatMap:", v69);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v43;
  v66[1] = 3221225472;
  v66[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_7;
  v66[3] = &unk_1EA726EF8;
  v66[4] = WeakRetained;
  v67 = *(id *)(a1 + 40);
  v51 = v45;
  v68 = v51;
  v52 = (id)objc_msgSend(v50, "addCompletionBlock:", v66);
  v53 = v68;
  v54 = v51;

  objc_destroyWeak(v76);
  objc_destroyWeak(&v80);

  return v54;
}

void __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSenderSelector:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v2, "setLogger:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setReadPolicy:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v8 = HFItemUpdateOptionFullUpdateIndicated;
    v9[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setUpdateOptions:", v3);

  }
  objc_msgSend(*(id *)(a1 + 56), "_updateResultsForItems:removedItems:context:allowDelaying:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_6;
  v6[3] = &unk_1EA72A000;
  v7 = *(id *)(a1 + 80);
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v6);

}

- (BOOL)_shouldPerformFastInitialUpdates
{
  return 1;
}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a3;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest")
    && (objc_msgSend(v5, "homes"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        !v7))
  {
    HFLogForCategory(0x24uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Skipping reload (for -homeManagerDidUpdateCurrentHome:) as this is an internal unit test -tearDown", v12, 2u);
    }

  }
  else
  {
    -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForCurrentHomeChange](self, "_itemsToUpdateForCurrentHomeChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], 0, a2);

  }
}

- (id)_updateResultsForItems:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _updateResultsForItems:removedItems:context:allowDelaying:](self, "_updateResultsForItems:removedItems:context:allowDelaying:", v8, v9, v7, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)homeManagerDidEndBatchNotifications:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;

  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "commitBatchWithReason:senderSelector:", CFSTR("HFItemManagerBatchingDelegateReasonHomeManagerRequest"), a2);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "commitBatchWithReason:senderSelector:", CFSTR("HFItemManagerBatchingDelegateReasonHomeManagerRequest"), a2);

}

- (HFItemManagerBatchedDelegateAdapter)batchedDelegateAdapterAllowingReads
{
  return self->_batchedDelegateAdapterAllowingReads;
}

- (void)homeManagerWillStartBatchNotifications:(id)a3
{
  void *v4;
  id v5;

  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginBatchWithReason:", CFSTR("HFItemManagerBatchingDelegateReasonHomeManagerRequest"));

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginBatchWithReason:", CFSTR("HFItemManagerBatchingDelegateReasonHomeManagerRequest"));

}

- (HFItemManagerBatchedDelegateAdapter)batchedDelegateAdapterDisallowingReads
{
  return self->_batchedDelegateAdapterDisallowingReads;
}

- (void)_updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems:(id)a3 removedItems:(id)a4 logger:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void (**v22)(_QWORD);
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  HFItemManagerDelegateUpdateRequest *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void *v41;
  os_activity_scope_state_s state;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD aBlock[5];
  id v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  HFItemManager *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  _BOOL4 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HFItemManager allItems](self, "allItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[HFItemManager _itemsToHideInSet:](self, "_itemsToHideInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  -[HFItemManager sections](self, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager sections](self, "sections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _buildSectionsWithDisplayedItems:](self, "_buildSectionsWithDisplayedItems:", v17);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[HFItemManager _buildSectionsWithDisplayedItems:](self, "_buildSectionsWithDisplayedItems:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke;
  v48[3] = &unk_1EA735238;
  v40 = v7;
  v41 = v16;
  v49 = v40;
  +[HFGroupedItemDiff diffFromGroups:toGroups:changeTest:](HFGroupedItemDiff, "diffFromGroups:toGroups:changeTest:", v16, v18, v48);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v19;
  aBlock[1] = 3221225472;
  aBlock[2] = __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke_2;
  aBlock[3] = &unk_1EA727188;
  aBlock[4] = self;
  v21 = v18;
  v47 = v21;
  v22 = (void (**)(_QWORD))_Block_copy(aBlock);
  v43[0] = v19;
  v43[1] = 3221225472;
  v43[2] = __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke_3;
  v43[3] = &unk_1EA7270A0;
  v43[4] = self;
  v23 = v20;
  v44 = v23;
  v24 = v8;
  v45 = v24;
  v25 = _Block_copy(v43);
  objc_msgSend(v23, "allOperations");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    if (v24)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v24, "loggerActivity");
      v28 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v28, &state);

      HFLogForCategory(0x29uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v51 = self;
        v52 = 2112;
        v53 = v23;
        v54 = 1024;
        v55 = v12 == 0;
        _os_log_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_DEFAULT, "%@ processing item diff %@ (initial update: %d)", buf, 0x1Cu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v51 = self;
        v52 = 2112;
        v53 = v23;
        v54 = 1024;
        v55 = v12 == 0;
        _os_log_impl(&dword_1DD34E000, v38, OS_LOG_TYPE_DEFAULT, "%@ processing item diff %@ (initial update: %d)", buf, 0x1Cu);
      }

    }
    v30 = -[HFItemManagerDelegateUpdateRequest initWithChanges:isInitialUpdate:applyChangesBlock:issueDelegateMessagesBlock:]([HFItemManagerDelegateUpdateRequest alloc], "initWithChanges:isInitialUpdate:applyChangesBlock:issueDelegateMessagesBlock:", v23, v12 == 0, v22, v25);
    -[HFItemManager delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_respondsToSelector();

    if ((v32 & 1) != 0)
    {
      -[HFItemManager delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "itemManager:performUpdateRequest:", self, v30);

      if (!-[HFItemManagerDelegateUpdateRequest debug_wasPerformed](v30, "debug_wasPerformed"))
      {
        -[HFItemManager delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("The HFItemManagerDelegate of %@ (%@) implements -itemManager:performUpdateRequest:, but did not synchronously call -[HFItemManagerDelegateUpdateRequest performWithOptions:]. Did the delegate accidentally drop the request?"), self, v34);

      }
    }
    else
    {
      -[HFItemManagerDelegateUpdateRequest performWithOptions:](v30, "performWithOptions:", 0);
    }

    v37 = v40;
  }
  else
  {
    if (v24)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(v24, "loggerActivity");
      v35 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v35, &state);

      HFLogForCategory(0x29uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v40;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = self;
        v52 = 1024;
        LODWORD(v53) = v12 == 0;
        _os_log_impl(&dword_1DD34E000, v36, OS_LOG_TYPE_DEFAULT, "%@ processed item diff, but there are no changes (initial update: %d)", buf, 0x12u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v39 = objc_claimAutoreleasedReturnValue();
      v37 = v40;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = self;
        v52 = 1024;
        LODWORD(v53) = v12 == 0;
        _os_log_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_DEFAULT, "%@ processed item diff, but there are no changes (initial update: %d)", buf, 0x12u);
      }

    }
    v22[2](v22);
  }
  -[HFItemManager _updateOverallLoadingStateAndNotifyDelegate](self, "_updateOverallLoadingStateAndNotifyDelegate");

}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  HFLogForCategory(0x31uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x31uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, WeakRetained);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    objc_msgSend(WeakRetained, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_class();
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "clientDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DD34E000, v3, OS_SIGNPOST_INTERVAL_END, v5, "HFItemManagerSnapshotApply", "%@:%@ | %@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(a1 + 48));
  objc_msgSend(WeakRetained, "diffableDataItemManagerDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "diffableDataItemManager:didUpdateItems:addItems:removeItems:", WeakRetained, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  objc_msgSend(WeakRetained, "_updateOverallLoadingStateAndNotifyDelegate");
  objc_msgSend(*(id *)(a1 + 80), "finishWithNoResult");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)applySnapshotForUpdatedExternalItems:(id)a3 removedItems:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && !-[HFItemManager isApplyingSnapshot](self, "isApplyingSnapshot"))
  {
    HFLogForCategory(0x31uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x31uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_make_with_pointer(v16, self);

    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      -[HFItemManager identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_opt_class();
      v20 = v19;
      objc_msgSend(v10, "clientDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v18;
      v43 = 2112;
      v44 = v19;
      v45 = 2112;
      v46 = v21;
      _os_signpost_emit_with_name_impl(&dword_1DD34E000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "HFItemManagerSnapshotApply", "%@:%@ | %@", buf, 0x20u);

    }
    v22 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v23 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFItemManager generateSnapshotInfo](self, "generateSnapshotInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "baseSnapshot");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke;
    v32[3] = &unk_1EA73D908;
    objc_copyWeak(&v40, (id *)buf);
    v26 = v25;
    v33 = v26;
    v34 = v8;
    v27 = v24;
    v35 = v27;
    v36 = v9;
    v37 = v10;
    v28 = v22;
    v38 = v28;
    v29 = v23;
    v39 = v29;
    -[HFItemManager applyWithBlock:](self, "applyWithBlock:", v32);
    v30 = v39;
    v14 = v28;

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    v13 = objc_alloc_init(MEMORY[0x1E0CEA210]);
    objc_msgSend(v12, "futureWithResult:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)generateSnapshotInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  HFSnapshotInfo *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HFItemManager allItems](self, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToHideInSet:](self, "_itemsToHideInSet:", v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_removedObjectsFromSet:");
  v4 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v4;
  -[HFItemManager _buildSectionsWithDisplayedItems:](self, "_buildSectionsWithDisplayedItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __57__HFItemManager_DiffableDataSource__generateSnapshotInfo__block_invoke;
  v32[3] = &unk_1EA73D930;
  v7 = v6;
  v33 = v7;
  objc_msgSend(v5, "na_each:", v32);
  v24 = v7;
  v8 = -[HFSnapshotInfo initWithSnapshot:]([HFSnapshotInfo alloc], "initWithSnapshot:", v7);
  v25 = v5;
  -[HFItemManager _generateParentChildMappingForSections:](self, "_generateParentChildMappingForSections:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HFSnapshotInfo setSectionSnapshots:](v8, "setSectionSnapshots:", v10);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v16, "items");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0CEA208]);
            v34 = v19;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "appendItems:", v21);

            objc_msgSend(v20, "appendItems:intoParentItem:", v17, v19);
            -[HFSnapshotInfo sectionSnapshots](v8, "sectionSnapshots");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v16);

          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v13);
  }

  return v8;
}

- (void)applyWithBlock:(id)a3
{
  id v3;

  v3 = (id)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
}

id __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  _BOOL8 v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v36;
  id *from;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  BOOL v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;

  v2 = a1 + 11;
  WeakRetained = objc_loadWeakRetained(a1 + 11);
  objc_msgSend(WeakRetained, "diffableDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItems");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_2;
  v57[3] = &unk_1EA73D868;
  v57[4] = WeakRetained;
  v58 = a1[5];
  v11 = v7;
  v59 = v11;
  v12 = v8;
  v60 = v12;
  objc_msgSend(v9, "na_each:", v57);

  objc_msgSend(a1[6], "sectionSnapshots");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v10;
  v53[1] = 3221225472;
  v53[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_3;
  v53[3] = &unk_1EA73D890;
  v53[4] = WeakRetained;
  v54 = a1[5];
  v14 = v11;
  v55 = v14;
  v15 = v12;
  v56 = v15;
  objc_msgSend(v13, "na_each:", v53);

  objc_msgSend(WeakRetained, "diffableDataItemManagerDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "diffableDataItemManager:willUpdateItems:addItems:removeItems:isInitialLoad:", WeakRetained, v14, v15, a1[7], v6 == 0);

  v36 = v15;
  from = v2;
  if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
  {
    v17 = v10;
    v18 = 1;
  }
  else
  {
    v17 = v10;
    v18 = objc_msgSend(a1[7], "count") != 0;
  }
  objc_msgSend(WeakRetained, "diffableDataItemManagerDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldPerformUpdateWithAnimationForDiffableDataItemManager:", WeakRetained);
  if (v6)
    v21 = v18;
  else
    v21 = 0;
  if (v20)
    v22 = v21;
  else
    v22 = 0;

  objc_msgSend(WeakRetained, "setIsApplyingSnapshot:", 1);
  v23 = (void *)objc_opt_new();
  v24 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(v23, "addObject:", v24);
  objc_msgSend(WeakRetained, "diffableDataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = a1[4];
  v51[0] = v17;
  v51[1] = 3221225472;
  v51[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_5;
  v51[3] = &unk_1EA727DD8;
  v27 = v24;
  v52 = v27;
  objc_msgSend(v25, "applySnapshot:animatingDifferences:completion:", v26, v22, v51);

  objc_msgSend(a1[6], "sectionSnapshots");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v17;
  v47[1] = 3221225472;
  v47[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_6;
  v47[3] = &unk_1EA73D8B8;
  v29 = v23;
  v48 = v29;
  v49 = WeakRetained;
  v50 = v22;
  objc_msgSend(v28, "na_each:", v47);

  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v17;
  v38[1] = 3221225472;
  v38[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_8;
  v38[3] = &unk_1EA73D8E0;
  objc_copyWeak(&v46, from);
  v39 = a1[8];
  v40 = a1[9];
  v41 = a1[4];
  v31 = v14;
  v42 = v31;
  v32 = v36;
  v43 = v32;
  v44 = a1[7];
  v45 = a1[10];
  v33 = (id)objc_msgSend(v30, "addCompletionBlock:", v38);

  objc_msgSend(WeakRetained, "setIsApplyingSnapshot:", 0);
  v34 = a1[10];

  objc_destroyWeak(&v46);
  return v34;
}

- (void)setIsApplyingSnapshot:(BOOL)a3
{
  self->_isApplyingSnapshot = a3;
}

- (id)_generateParentChildMappingForSections:(id)a3
{
  return 0;
}

- (BOOL)isApplyingSnapshot
{
  return self->_isApplyingSnapshot;
}

- (NSArray)sections
{
  return self->_sections;
}

void __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setSections:", *(_QWORD *)(a1 + 40));
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "diffableDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "setSections:", *(_QWORD *)(a1 + 40));
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (id)_itemsToUpdateForModifiedCameras:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedWalletKeyDeviceState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  return v6;
}

- (id)_itemsToUpdateForModifiedMetadataForHomes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedCharacteristics:(id)a3 includeSuppressedCharacteristics:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  if (!a4)
  {
    -[HFItemManager _allSuppressedCharacteristics](self, "_allSuppressedCharacteristics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusSet:", v7);

  }
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v6, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  return v9;
}

- (id)_directItemDependenciesForHomeKitObjects:(id)a3 class:(Class)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;
  Class v13;

  v6 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v12 = v6;
  v13 = a4;
  v7 = v6;
  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems", v11, 3221225472, __64__HFItemManager__directItemDependenciesForHomeKitObjects_class___block_invoke, &unk_1EA734DD8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsWithDependenciesPassingTest:forItems:](self, "_itemsWithDependenciesPassingTest:forItems:", &v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_allItemsIncludingInternalItems
{
  void *v3;
  void *v4;
  void *v5;

  -[HFItemManager allItems](self, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _internalItems](self, "_internalItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_allSuppressedCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HFItemManager suppressedCharacteristicUpdatesByReason](self, "suppressedCharacteristicUpdatesByReason", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "unionSet:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v3;
}

- (NSMutableDictionary)suppressedCharacteristicUpdatesByReason
{
  return self->_suppressedCharacteristicUpdatesByReason;
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return +[HFExecutionEnvironment isHomeApp](HFExecutionEnvironment, "isHomeApp")
      || +[HFExecutionEnvironment isHomeControlService](HFExecutionEnvironment, "isHomeControlService")
      || +[HFExecutionEnvironment isSpringBoard](HFExecutionEnvironment, "isSpringBoard");
}

- (id)performItemUpdateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "itemsProvidersToReload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemsToUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "senderSelector");

  -[HFItemManager _reloadAndUpdateItemsForProviders:updateItems:senderSelector:](self, "_reloadAndUpdateItemsForProviders:updateItems:senderSelector:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_reloadAndUpdateItemsForProviders:(id)a3 updateItems:(id)a4 senderSelector:(SEL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[HFItemManager readPolicy](self, "readPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _reloadItemProviders:updateItems:shouldUpdateExistingItems:senderSelector:readPolicy:](self, "_reloadItemProviders:updateItems:shouldUpdateExistingItems:senderSelector:readPolicy:", v9, v8, 1, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __45__HFItemManager_initWithDelegate_sourceItem___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setHome:", v3);

}

- (void)_registerForExternalUpdates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addHomeManagerObserver:", self);
  objc_msgSend(v6, "addHomeObserver:", self);
  objc_msgSend(v6, "addAccessoryObserver:", self);
  objc_msgSend(v6, "addResidentDeviceObserver:", self);
  objc_msgSend(v6, "addCameraObserver:", self);
  -[HFItemManager _setupDelegateNotifications](self, "_setupDelegateNotifications");
  +[HFTemperatureUnitCoordinator sharedCoordinator](HFTemperatureUnitCoordinator, "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", self);

  +[HFUserNotificationCenter sharedInstance](HFUserNotificationCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  objc_msgSend(v6, "addMediaSessionObserver:", self);
  objc_msgSend(v6, "addAudioControlObserver:", self);
  objc_msgSend(v6, "addMediaObjectObserver:", self);
  objc_msgSend(v6, "addHomeKitSettingsObserver:", self);
  objc_msgSend(v6, "addNetworkConfigurationObserver:", self);
  objc_msgSend(v6, "addSoftwareUpdateObserver:", self);
  objc_msgSend(v6, "addSoftwareUpdateControllerObserver:", self);
  objc_msgSend(v6, "addSymptomsHandlerObserver:", self);
  objc_msgSend(v6, "addTelevisionObserver:", self);
  objc_msgSend(v6, "addUserObserver:", self);
  objc_msgSend(v6, "addMediaDestinationControllerObserver:", self);
  objc_msgSend(v6, "addSiriEndpointProfileObserver:", self);
  objc_msgSend(v6, "addSymptomFixSessionObserver:", self);
  objc_msgSend(v6, "addHomePersonManagerObserver:", self);
  objc_msgSend(v6, "addLightObserver:", self);
  objc_msgSend(v6, "addWalletKeyDeviceStateObserver:", self);
  -[HFItemManager itemModules](self, "itemModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_each:", &__block_literal_global_201_0);

}

- (void)_setupDelegateNotifications
{
  id v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  -[HFItemManager _cameraForCameraControl:](self, "_cameraForCameraControl:", a3, a4, a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCameras:](self, "_itemsToUpdateForModifiedCameras:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], v11, a2);

}

- (id)_cameraForCameraControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v11, "cameraProfiles", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          v24 = v8;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v17, "streamControl");
              v18 = objc_claimAutoreleasedReturnValue();
              if ((id)v18 == v4)
              {

LABEL_20:
                v21 = v17;

                goto LABEL_21;
              }
              v19 = (void *)v18;
              objc_msgSend(v17, "snapshotControl");
              v20 = (id)objc_claimAutoreleasedReturnValue();

              if (v20 == v4)
                goto LABEL_20;
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            v9 = v23;
            v8 = v24;
            if (v14)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v21 = 0;
    }
    while (v8);
  }
  else
  {
    v21 = 0;
  }
LABEL_21:

  return v21;
}

id __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (*(_BYTE *)(a1 + 32))
    v2 = 1;
  else
    v2 = objc_msgSend(a2, "na_any:", &__block_literal_global_317);
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "itemModules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_each:", &__block_literal_global_230_0);

  objc_msgSend(*(id *)(a1 + 40), "finish");
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:error:", v8, v6);

}

- (HFItemManager)initWithDelegate:(id)a3
{
  return -[HFItemManager initWithDelegate:sourceItem:](self, "initWithDelegate:sourceItem:", a3, 0);
}

uint64_t __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

BOOL __74__HFItemManager__performUpdateForChildItemsOfItem_withContext_isInternal___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "outcomeType") == 2;
  else
    v6 = 0;

  return v6;
}

- (id)_serviceItemsToHideInSet:(id)a3 allServiceGroupItems:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id obj;
  id v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        objc_opt_class();
        objc_msgSend(v9, "homeKitObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        -[HFItemManager home](self, "home");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hf_serviceGroupsForService:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          while (2)
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              -[HFItemManager _serviceGroupItemForServiceGroup:inItems:](self, "_serviceGroupItemForServiceGroup:inItems:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19), v7);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20
                && -[HFItemManager _shouldHideServiceItem:containedInServiceGroupItem:](self, "_shouldHideServiceItem:containedInServiceGroupItem:", v9, v20))
              {

                objc_msgSend(v23, "addObject:", v9);
                goto LABEL_20;
              }

              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v17)
              continue;
            break;
          }
        }

LABEL_20:
        ++v8;
      }
      while (v8 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v25);
  }

  return v23;
}

void __45__HFItemManager_initWithDelegate_sourceItem___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_homeFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__HFItemManager_initWithDelegate_sourceItem___block_invoke_2;
  v5[3] = &unk_1EA734740;
  objc_copyWeak(&v6, v1);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

  objc_destroyWeak(&v6);
}

- (id)reloadAndUpdateAllItemsFromSenderSelector:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (-[HFItemManager hasRequestedFirstUpdate](self, "hasRequestedFirstUpdate")
    && (-[HFItemManager firstFastUpdateFuture](self, "firstFastUpdateFuture"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isFinished"),
        v5,
        (v6 & 1) == 0))
  {
    HFLogForCategory(0x29uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = self;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Request to reloadAndUpdateAllItems for %@, but we're still performing the fast initial update. Once that is done, we'll reload all items anyway, so ignoring this duplicate request", (uint8_t *)location, 0xCu);
    }

    -[HFItemManager firstFullUpdateFuture](self, "firstFullUpdateFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_initWeak(location, self);
    -[HFItemManager _homeFuture](self, "_homeFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__HFItemManager_reloadAndUpdateAllItemsFromSenderSelector___block_invoke;
    v15[3] = &unk_1EA734858;
    objc_copyWeak(v16, location);
    v16[1] = (id)a3;
    objc_msgSend(v7, "flatMap:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __59__HFItemManager_reloadAndUpdateAllItemsFromSenderSelector___block_invoke_2;
    v13[3] = &unk_1EA72A488;
    objc_copyWeak(&v14, location);
    objc_msgSend(v9, "recover:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v14);

    objc_destroyWeak(v16);
    objc_destroyWeak(location);
  }
  return v10;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_5;
  v9[3] = &unk_1EA734948;
  v17 = *(_QWORD *)(a1 + 80);
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(void **)(a1 + 64);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v15 = *(id *)(a1 + 72);
  v16 = v3;
  v8 = v3;
  objc_msgSend(v4, "performBlock:", v9);

}

- (NAFuture)latestSnapshotGenerationFuture
{
  return self->_latestSnapshotGenerationFuture;
}

- (void)setDiffableDataSource:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[HFDiffableDataSource isEqual:](self->_diffableDataSource, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_diffableDataSource, a3);
    -[HFItemManager UIDiffableDataInitializationFuture](self, "UIDiffableDataInitializationFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithNoResult");

  }
}

id __59__HFItemManager_reloadAndUpdateAllItemsFromSenderSelector___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "lastUpdatedHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqual:", v7);

    if ((v8 & 1) == 0)
      objc_msgSend(WeakRetained, "setHome:", v3);
  }
  else
  {
    objc_msgSend(WeakRetained, "lastUpdatedHome");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(WeakRetained, "setHome:", 0);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_updateRepresentationForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:", v10, v11, 0);

    }
    objc_msgSend(WeakRetained, "setHome:", v3);
    objc_msgSend(WeakRetained, "setLastUpdatedHome:", v3);
  }
  objc_msgSend(WeakRetained, "_reloadAllItemProvidersFromSenderSelector:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMHome)lastUpdatedHome
{
  return self->_lastUpdatedHome;
}

- (void)setHome:(id)a3
{
  HMHome *v5;
  void *v6;
  char v7;
  void *v8;
  HMHome *v9;

  v5 = (HMHome *)a3;
  if (self->_home != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_home, a3);
    -[HFItemManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[HFItemManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemManager:didChangeHome:", self, self->_home);

    }
    -[HFItemManager resetItemProvidersAndModules](self, "resetItemProvidersAndModules");
    v5 = v9;
  }

}

- (void)setLastUpdatedHome:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedHome, a3);
}

- (id)_reloadItemProviders:(id)a3 updateItems:(id)a4 shouldUpdateExistingItems:(BOOL)a5 senderSelector:(SEL)a6 readPolicy:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v8 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_opt_new();
  -[HFItemManager _reloadItemProviders:updateItems:shouldUpdateExistingItems:senderSelector:readPolicy:fastInitialUpdatePromise:](self, "_reloadItemProviders:updateItems:shouldUpdateExistingItems:senderSelector:readPolicy:fastInitialUpdatePromise:", v14, v13, v8, a6, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_reloadAllItemProvidersFromSenderSelector:(SEL)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD aBlock[5];
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HFItemManager__reloadAllItemProvidersFromSenderSelector___block_invoke;
  aBlock[3] = &unk_1EA727DD8;
  aBlock[4] = self;
  v33 = _Block_copy(aBlock);
  -[HFItemManager itemProviders](self, "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_206_0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0D519D8]);
  objc_msgSend(v4, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager firstFastUpdateFuture](self, "firstFastUpdateFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "addCompletionBlock:", v7);
  v34 = v4;

  -[HFItemManager _internalItems](self, "_internalItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager readPolicy](self, "readPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _reloadItemProviders:updateItems:shouldUpdateExistingItems:senderSelector:readPolicy:fastInitialUpdatePromise:](self, "_reloadItemProviders:updateItems:shouldUpdateExistingItems:senderSelector:readPolicy:fastInitialUpdatePromise:", v36, v9, 1, a3, v10, v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager firstFullUpdateFuture](self, "firstFullUpdateFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "completionHandlerAdapter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v35, "addCompletionBlock:", v12);

  v14 = objc_msgSend(v36, "count");
  -[HFItemManager itemProviders](self, "itemProviders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = v14 == objc_msgSend(v15, "count");

  if ((_DWORD)v14)
  {
    v16 = v35;
    v17 = v35;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager itemProviders](self, "itemProviders");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    objc_msgSend(v20, "removeObjectsInArray:", v36);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v40;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v21);
          v44 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v24);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFItemManager _reloadAndUpdateItemsForProviders:updateItems:senderSelector:](self, "_reloadAndUpdateItemsForProviders:updateItems:senderSelector:", v25, v26, a3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v27);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v22);
    }

    v28 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "combineAllFutures:ignoringErrors:scheduler:", v18, 1, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "flatMap:", &__block_literal_global_210);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v35;
  }

  v31 = v33;
  if (v33)
  {
    (*((void (**)(void))v33 + 2))();
    v31 = v33;
  }

  return v17;
}

- (id)_reloadItemProviders:(id)a3 updateItems:(id)a4 shouldUpdateExistingItems:(BOOL)a5 senderSelector:(SEL)a6 readPolicy:(id)a7 fastInitialUpdatePromise:(id)a8
{
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HFUpdateLogger *v17;
  HFUpdateLogger *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  HFUpdateLogger *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v40;
  void *v41;
  void *v43;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  HFUpdateLogger *v51;
  id v52;
  id v53;
  id v54[2];
  BOOL v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  os_activity_scope_state_s state;
  uint8_t v61[128];
  uint8_t buf[4];
  HFItemManager *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v47 = a4;
  v45 = a7;
  v46 = a8;
  -[HFItemManager home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else if (!-[HFItemManager _shouldBuildItemProvidersAndModulesForNilHome](self, "_shouldBuildItemProvidersAndModulesForNilHome"))
  {
    NSLog(CFSTR("Request to reload item providers before they have been created"));
  }
  -[HFItemManager home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13
    && !-[HFItemManager _shouldBuildItemProvidersAndModulesForNilHome](self, "_shouldBuildItemProvidersAndModulesForNilHome"))
  {
    goto LABEL_28;
  }
  if (!objc_msgSend(v48, "count"))
  {
    v14 = objc_msgSend(v47, "count");

    if (v14)
      goto LABEL_10;
LABEL_28:
    v35 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "futureWithError:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }

LABEL_10:
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest")
    && (objc_msgSend((id)objc_opt_class(), "_canReloadDuringUnitTests") & 1) == 0)
  {
    v37 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "futureWithResult:", v38);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("[%@ %@]"), self, v16);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[HFUpdateLogger initWithTimeout:description:]([HFUpdateLogger alloc], "initWithTimeout:description:", v43, 15.0);
    v18 = v17;
    if (v17)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      -[HFUpdateLogger loggerActivity](v17, "loggerActivity");
      v19 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v19, &state);

      HFLogForCategory(0x29uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v63 = self;
        v64 = 2112;
        v65 = v21;
        v66 = 2112;
        v67 = v48;
        _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "%@: Starting reload for sender: \"%@\". Item providers: %@", buf, 0x20u);

      }
      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a6);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v63 = self;
        v64 = 2112;
        v65 = v41;
        v66 = 2112;
        v67 = v48;
        _os_log_impl(&dword_1DD34E000, v40, OS_LOG_TYPE_DEFAULT, "%@: Starting reload for sender: \"%@\". Item providers: %@", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v57 = 0u;
    v58 = 0u;
    v56 = 0u;
    v23 = v48;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v57 != v25)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "reloadItems");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "recover:", &__block_literal_global_218_0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            objc_msgSend(v22, "addObject:", v28);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v24);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v30 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "combineAllFutures:ignoringErrors:scheduler:", v22, 0, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v32;
    }
    objc_initWeak((id *)buf, self);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_2;
    v49[3] = &unk_1EA7349E0;
    objc_copyWeak(v54, (id *)buf);
    v50 = v47;
    v55 = a5;
    v33 = v18;
    v51 = v33;
    v54[1] = (id)a6;
    v52 = v46;
    v53 = v45;
    objc_msgSend(v29, "flatMap:", v49);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v54);
    objc_destroyWeak((id *)buf);

  }
LABEL_30:

  return v34;
}

- (NAFuture)firstFullUpdateFuture
{
  return self->_firstFullUpdateFuture;
}

- (id)updateResultsForItems:(id)a3 senderSelector:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setSenderSelector:", a4);
  -[HFItemManager readPolicy](self, "readPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReadPolicy:", v8);

  v12 = HFItemUpdateOptionFullUpdateIndicated;
  v13[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpdateOptions:", v9);

  -[HFItemManager _updateResultsForItems:context:](self, "_updateResultsForItems:context:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HFCharacteristicReadPolicy)readPolicy
{
  return self->_readPolicy;
}

uint64_t __59__HFItemManager__reloadAllItemProvidersFromSenderSelector___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHasRequestedFirstUpdate:", 1);
}

- (void)setHasRequestedFirstUpdate:(BOOL)a3
{
  self->_hasRequestedFirstUpdate = a3;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HFItemManager itemModules](self, "itemModules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v14[3] = &unk_1EA734BE0;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v6, "na_flatMap:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v9);

  if (!-[HFItemManager _isUsingOnlyItemModules](self, "_isUsingOnlyItemModules"))
  {
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
    v13[3] = &unk_1EA7295B8;
    v13[4] = self;
    objc_msgSend(v8, "na_filter:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _legacy_buildSectionsWithDisplayedItems:](self, "_legacy_buildSectionsWithDisplayedItems:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v11);

  }
  return v5;
}

- (unint64_t)_numberOfSections
{
  return -[HFItemManager _isUsingOnlyItemModules](self, "_isUsingOnlyItemModules") ^ 1;
}

- (BOOL)_isUsingOnlyItemModules
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HFItemManager subclassItemProviderSet](self, "subclassItemProviderSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[HFItemManager moduleItemProviderSet](self, "moduleItemProviderSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)resetItemProvidersAndModules
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;

  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!-[HFItemManager _shouldBuildItemProvidersAndModulesForNilHome](self, "_shouldBuildItemProvidersAndModulesForNilHome"))
  {
    v29 = MEMORY[0x1E0C9AA60];
    -[HFItemManager setItemModules:](self, "setItemModules:", MEMORY[0x1E0C9AA60]);
    -[HFItemManager setItemProviders:](self, "setItemProviders:", v29);
    return;
  }
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _buildItemModulesForHome:](self, "_buildItemModulesForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager setItemModules:](self, "setItemModules:", v5);

  -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[HFItemManager itemModules](self, "itemModules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_each:", &__block_literal_global_253);

  }
  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HFItemManager itemModules](self, "itemModules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_flatMap:", &__block_literal_global_255);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager setModuleItemProviderSet:](self, "setModuleItemProviderSet:", v12);

  -[HFItemManager home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[HFItemManager _buildItemProvidersWithoutHome](self, "_buildItemProvidersWithoutHome");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_9;
    goto LABEL_8;
  }
  -[HFItemManager home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _buildItemProvidersForHome:](self, "_buildItemProvidersForHome:", v14);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  v15 = (uint64_t)v30;
  if (!v30)
  {
LABEL_8:
    NSLog(CFSTR("HFItemManager asked its subclass (%@) to build item providers, but it returned nil. Defaulting to an empty array instead."), self);
    v15 = MEMORY[0x1E0C9AA60];
  }
LABEL_9:
  v31 = (id)v15;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager setSubclassItemProviderSet:](self, "setSubclassItemProviderSet:", v16);

  -[HFItemManager subclassItemProviderSet](self, "subclassItemProviderSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v19 = objc_msgSend(v31, "count");

  if (v18 != v19)
    NSLog(CFSTR("Duplicate item providers provided by _buildItemProvidersForHome from subclass %@! Item providers: %@"), self, v31);
  -[HFItemManager moduleItemProviderSet](self, "moduleItemProviderSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager subclassItemProviderSet](self, "subclassItemProviderSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "intersectsSet:", v21);

  if (v22)
  {
    -[HFItemManager moduleItemProviderSet](self, "moduleItemProviderSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager subclassItemProviderSet](self, "subclassItemProviderSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Subclass %@ is returning item providers in _buildItemProvidersForHome that are owned by an item module! This is not permitted. Module item providers: %@, subclass item providers: %@"), self, v23, v24);

  }
  -[HFItemManager subclassItemProviderSet](self, "subclassItemProviderSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager moduleItemProviderSet](self, "moduleItemProviderSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setByAddingObjectsFromSet:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager setItemProviders:](self, "setItemProviders:", v28);

}

- (NSSet)subclassItemProviderSet
{
  return self->_subclassItemProviderSet;
}

- (NSSet)moduleItemProviderSet
{
  return self->_moduleItemProviderSet;
}

- (void)setSubclassItemProviderSet:(id)a3
{
  objc_storeStrong((id *)&self->_subclassItemProviderSet, a3);
}

- (void)setModuleItemProviderSet:(id)a3
{
  objc_storeStrong((id *)&self->_moduleItemProviderSet, a3);
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (void)setItemModules:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_itemModules, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_itemModules, a3);
    -[HFItemManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[HFItemManager delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemManager:didUpdateItemModules:", self, v8);

    }
  }

}

- (id)_legacy_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  HFMutableItemSection *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  HFItemManager *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFItemManager _willUpdateSections](self, "_willUpdateSections");
  -[HFItemManager currentSectionIdentifiersSnapshot](self, "currentSectionIdentifiersSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (!v6)
    v6 = -[HFItemManager _numberOfSections](self, "_numberOfSections");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      if (v5)
        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      else
        -[HFItemManager _identifierForSection:](self, "_identifierForSection:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HFItemSection initWithIdentifier:]([HFMutableItemSection alloc], "initWithIdentifier:", v9);
      -[HFItemManager _titleForSectionWithIdentifier:](self, "_titleForSectionWithIdentifier:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemSection setHeaderTitle:](v10, "setHeaderTitle:", v11);

      -[HFItemManager _footerTitleForSectionWithIdentifier:](self, "_footerTitleForSectionWithIdentifier:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemSection setFooterTitle:](v10, "setFooterTitle:", v12);

      objc_msgSend(v7, "addObject:", v10);
    }
  }
  v26 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        -[HFItemManager _sectionIdentifierForItem:](self, "_sectionIdentifierForItem:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "na_objectForKey:withDefaultValue:", v20, &__block_literal_global_329);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __57__HFItemManager__legacy_buildSectionsWithDisplayedItems___block_invoke_2;
  v27[3] = &unk_1EA734C98;
  v22 = v25;
  v28 = v22;
  v29 = self;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v27);
  v23 = v22;

  return v23;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lu"), CFSTR("HFItemManagerDefaultSectionIdentifier"), a3);
}

- (id)currentSectionIdentifiersSnapshot
{
  return 0;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  return 0;
}

- (id)_footerTitleForSectionWithIdentifier:(id)a3
{
  return 0;
}

- (id)_buildItemModulesForHome:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)disableExternalUpdatesWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  HFItemManager *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x29uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = self;
    v20 = 2112;
    v21 = v4;
    v22 = 2048;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@:(DU-D1) Adding reason (%@) to disable updates - all reasons BEFORE (%p): %@", (uint8_t *)&v18, 0x2Au);

  }
  -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
  {
    HFLogForCategory(0x29uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "%@:(DU-D1.1) Duplicate request to disable updates for reason \"%@\", (uint8_t *)&v18, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v11 = v13 == 0;

    if (!v13)
      -[HFItemManager _updateExternalUpdatesEnabled:reloadItems:](self, "_updateExternalUpdatesEnabled:reloadItems:", 0, 1);
    -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v4);

    HFLogForCategory(0x29uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = self;
      v20 = 2048;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "%@:(DU-D2) Added reason to disable updates - all reasons AFTER (%p): %@", (uint8_t *)&v18, 0x20u);

    }
  }

  return v11;
}

- (BOOL)endDisableExternalUpdatesWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  HFItemManager *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x29uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138413058;
    v22 = self;
    v23 = 2112;
    v24 = v4;
    v25 = 2048;
    v26 = v6;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%@:(DU-R1) Removing reason (%@) to disable updates - all reasons BEFORE (%p): %@", (uint8_t *)&v21, 0x2Au);

  }
  -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if ((v9 & 1) == 0)
  {
    HFLogForCategory(0x29uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413058;
      v22 = self;
      v23 = 2112;
      v24 = v4;
      v25 = 2048;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "%@:(DU-R1.1) Removing reason (%@) to disable updates NOT FOUND in all reasons BEFORE (%p): %@. Are multiple items being removed? Is a bridge being removed?", (uint8_t *)&v21, 0x2Au);

    }
    goto LABEL_11;
  }
  -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v4);

  HFLogForCategory(0x29uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = self;
    v23 = 2048;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%@:(DU-R2) Removed reason to disable updates - all reasons AFTER (%p): %@", (uint8_t *)&v21, 0x20u);

  }
  -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v16 = 1;
  -[HFItemManager _updateExternalUpdatesEnabled:reloadItems:](self, "_updateExternalUpdatesEnabled:reloadItems:", 1, 1);
LABEL_12:

  return v16;
}

- (NSMutableSet)disableUpdateReasons
{
  return self->_disableUpdateReasons;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  return -[HFItemManager _identifierForSection:](self, "_identifierForSection:", 0);
}

- (HFItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v6;
  id v7;
  HFItemManager *v8;
  HFItemManager *v9;
  NSArray *itemModules;
  NSArray *v11;
  NSArray *itemProviders;
  NSString *identifier;
  uint64_t v14;
  NSMapTable *childItemsByParentItem;
  HFStandardReadPolicy *v16;
  HFCharacteristicReadPolicy *readPolicy;
  uint64_t v18;
  NSMutableSet *disableUpdateReasons;
  uint64_t v20;
  NSMutableDictionary *suppressedCharacteristicUpdatesByReason;
  NAFuture *v22;
  NAFuture *firstFastUpdateFuture;
  NAFuture *v24;
  NAFuture *firstFullUpdateFuture;
  NAFuture *v26;
  NAFuture *UIDiffableDataInitializationFuture;
  uint64_t v28;
  NAFuture *latestSnapshotGenerationFuture;
  NSObject *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *diffableDataSourceQueue;
  uint64_t v33;
  NAScheduler *diffableDataSourceScheduler;
  HFItemManagerBatchedDelegateAdapter *v35;
  void *v36;
  uint64_t v37;
  HFItemManagerBatchedDelegateAdapter *batchedDelegateAdapterAllowingReads;
  HFItemManagerBatchedDelegateAdapter *v39;
  void *v40;
  uint64_t v41;
  HFItemManagerBatchedDelegateAdapter *batchedDelegateAdapterDisallowingReads;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  id location;
  objc_super v50;

  v6 = a3;
  v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)HFItemManager;
  v8 = -[HFItemManager init](&v50, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_sourceItem, a4);
    itemModules = v9->_itemModules;
    v11 = (NSArray *)MEMORY[0x1E0C9AA60];
    v9->_itemModules = (NSArray *)MEMORY[0x1E0C9AA60];

    itemProviders = v9->_itemProviders;
    v9->_itemProviders = v11;

    identifier = v9->_identifier;
    v9->_identifier = (NSString *)CFSTR("--");

    v9->_diffableDataSourceDisabled = _os_feature_enabled_impl() ^ 1;
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    childItemsByParentItem = v9->_childItemsByParentItem;
    v9->_childItemsByParentItem = (NSMapTable *)v14;

    v16 = objc_alloc_init(HFStandardReadPolicy);
    readPolicy = v9->_readPolicy;
    v9->_readPolicy = (HFCharacteristicReadPolicy *)v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    disableUpdateReasons = v9->_disableUpdateReasons;
    v9->_disableUpdateReasons = (NSMutableSet *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    suppressedCharacteristicUpdatesByReason = v9->_suppressedCharacteristicUpdatesByReason;
    v9->_suppressedCharacteristicUpdatesByReason = (NSMutableDictionary *)v20;

    v22 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    firstFastUpdateFuture = v9->_firstFastUpdateFuture;
    v9->_firstFastUpdateFuture = v22;

    v24 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    firstFullUpdateFuture = v9->_firstFullUpdateFuture;
    v9->_firstFullUpdateFuture = v24;

    v26 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    UIDiffableDataInitializationFuture = v9->_UIDiffableDataInitializationFuture;
    v9->_UIDiffableDataInitializationFuture = v26;

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v28 = objc_claimAutoreleasedReturnValue();
    latestSnapshotGenerationFuture = v9->_latestSnapshotGenerationFuture;
    v9->_latestSnapshotGenerationFuture = (NAFuture *)v28;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = dispatch_queue_create("com.apple.Home.DiffableDataSourceItemManager", v30);
    diffableDataSourceQueue = v9->_diffableDataSourceQueue;
    v9->_diffableDataSourceQueue = (OS_dispatch_queue *)v31;

    objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", v9->_diffableDataSourceQueue);
    v33 = objc_claimAutoreleasedReturnValue();
    diffableDataSourceScheduler = v9->_diffableDataSourceScheduler;
    v9->_diffableDataSourceScheduler = (NAScheduler *)v33;

    v35 = [HFItemManagerBatchedDelegateAdapter alloc];
    -[HFItemManager readPolicy](v9, "readPolicy");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[HFItemManagerBatchedDelegateAdapter initWithItemManager:readPolicy:](v35, "initWithItemManager:readPolicy:", v9, v36);
    batchedDelegateAdapterAllowingReads = v9->_batchedDelegateAdapterAllowingReads;
    v9->_batchedDelegateAdapterAllowingReads = (HFItemManagerBatchedDelegateAdapter *)v37;

    v39 = [HFItemManagerBatchedDelegateAdapter alloc];
    +[HFStaticReadPolicy policyWithDecision:](HFStaticReadPolicy, "policyWithDecision:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[HFItemManagerBatchedDelegateAdapter initWithItemManager:readPolicy:](v39, "initWithItemManager:readPolicy:", v9, v40);
    batchedDelegateAdapterDisallowingReads = v9->_batchedDelegateAdapterDisallowingReads;
    v9->_batchedDelegateAdapterDisallowingReads = (HFItemManagerBatchedDelegateAdapter *)v41;

    -[HFItemManager _updateExternalUpdatesEnabled:reloadItems:](v9, "_updateExternalUpdatesEnabled:reloadItems:", 1, 0);
    objc_initWeak(&location, v9);
    v44 = MEMORY[0x1E0C809B0];
    v45 = 3221225472;
    v46 = __45__HFItemManager_initWithDelegate_sourceItem___block_invoke;
    v47 = &unk_1EA728AE8;
    objc_copyWeak(&v48, &location);
    dispatch_async(MEMORY[0x1E0C80D38], &v44);
    -[HFItemManager _debug_registerForStateDump](v9, "_debug_registerForStateDump", v44, v45, v46, v47);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)_updateExternalUpdatesEnabled:(BOOL)a3 reloadItems:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE location[12];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    -[HFItemManager UIDiffableDataInitializationFuture](self, "UIDiffableDataInitializationFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFinished");

    if ((v9 & 1) == 0)
    {
      objc_initWeak((id *)location, self);
      -[HFItemManager UIDiffableDataInitializationFuture](self, "UIDiffableDataInitializationFuture");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__HFItemManager__updateExternalUpdatesEnabled_reloadItems___block_invoke;
      v15[3] = &unk_1EA735210;
      objc_copyWeak(&v16, (id *)location);
      v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);
    }
  }
  HFLogForCategory(0x29uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "Disabling";
    if (v5)
      v13 = "Enabling";
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = self;
    v18 = 2080;
    v19 = v13;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "%@: %s updates", location, 0x16u);
  }

  if (v5)
  {
    -[HFItemManager _registerForExternalUpdates](self, "_registerForExternalUpdates");
    if (v4)
      v14 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
  }
  else
  {
    -[HFItemManager _unregisterForExternalUpdates](self, "_unregisterForExternalUpdates");
  }
}

- (NAFuture)UIDiffableDataInitializationFuture
{
  return self->_UIDiffableDataInitializationFuture;
}

- (void)_debug_registerForStateDump
{
  id v3;

  +[_HFItemManagerDebugStateDumpController sharedInstance](_HFItemManagerDebugStateDumpController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerItemManager:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeHomeManagerObserver:", self);
  objc_msgSend(v6, "removeHomeObserver:", self);
  objc_msgSend(v6, "removeAccessoryObserver:", self);
  objc_msgSend(v6, "removeResidentDeviceObserver:", self);
  objc_msgSend(v6, "removeCameraObserver:", self);
  -[HFItemManager _removeDelegateNotifications](self, "_removeDelegateNotifications");
  +[HFTemperatureUnitCoordinator sharedCoordinator](HFTemperatureUnitCoordinator, "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  +[HFUserNotificationCenter sharedInstance](HFUserNotificationCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(v6, "removeMediaSessionObserver:", self);
  objc_msgSend(v6, "removeAudioControlObserver:", self);
  objc_msgSend(v6, "removeMediaObjectObserver:", self);
  objc_msgSend(v6, "removeHomeKitSettingsObserver:", self);
  objc_msgSend(v6, "removeNetworkConfigurationObserver:", self);
  objc_msgSend(v6, "removeSoftwareUpdateObserver:", self);
  objc_msgSend(v6, "removeSoftwareUpdateControllerObserver:", self);
  objc_msgSend(v6, "removeSymptomsHandlerObserver:", self);
  objc_msgSend(v6, "removeTelevisionObserver:", self);
  objc_msgSend(v6, "removeUserObserver:", self);
  objc_msgSend(v6, "removeMediaDestinationControllerObserver:", self);
  objc_msgSend(v6, "removeSiriEndpointProfileObserver:", self);
  objc_msgSend(v6, "removeSymptomFixSessionObserver:", self);
  objc_msgSend(v6, "removeHomePersonManagerObserver:", self);
  objc_msgSend(v6, "removeLightObserver:", self);
  objc_msgSend(v6, "removeWalletKeyDeviceStateObserver:", self);
  -[HFItemManager itemModules](self, "itemModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_each:", &__block_literal_global_202);

}

- (void)_removeDelegateNotifications
{
  id v3;

  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

uint64_t __126__HFItemManager__updateRepresentationWithCustomDiffableDataSourceForExternalItemsWithUpdatedOrAddedItems_removedItems_logger___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfChangesFromDiff:logger:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyDelegateOfChangesFromDiff:(id)a3 logger:(id)a4
{
  HFUpdateLogger *v6;
  HFUpdateLogger *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (HFUpdateLogger *)a4;
  v7 = v6;
  if (!v6)
    v7 = -[HFUpdateLogger initWithTimeout:description:]([HFUpdateLogger alloc], "initWithTimeout:description:", CFSTR("HFItemManager diff update"), 1.0);
  objc_msgSend(v10, "groupOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _notifyDelegateOfSectionOperations:logger:](self, "_notifyDelegateOfSectionOperations:logger:", v8, v7);

  objc_msgSend(v10, "itemOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _notifyDelegateOfItemOperations:logger:](self, "_notifyDelegateOfItemOperations:logger:", v9, v7);

  if (!v6)
    -[HFUpdateLogger finish](v7, "finish");

}

- (void)_notifyDelegateOfSectionOperations:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  os_activity_scope_state_s state;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    v11 = &dword_1DD34E000;
    v41 = v7;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
        if (v7)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(v7, "loggerActivity");
          v14 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v14, &state);

          HFLogForCategory(0x29uLL);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "operationDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v16;
            _os_log_impl(v11, v15, OS_LOG_TYPE_DEFAULT, "Issuing section update: %@", buf, 0xCu);

          }
          os_activity_scope_leave(&state);
        }
        else
        {
          HFLogForCategory(0x29uLL);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "operationDescription");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v39;
            _os_log_impl(v11, v38, OS_LOG_TYPE_DEFAULT, "Issuing section update: %@", (uint8_t *)&state, 0xCu);

          }
        }
        switch(objc_msgSend(v13, "type", v41))
        {
          case 0:
            NSLog(CFSTR("Section reloads are not supported!"));
            break;
          case 1:
            -[HFItemManager delegate](self, "delegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_opt_respondsToSelector();

            if ((v24 & 1) != 0)
            {
              v25 = (void *)MEMORY[0x1E0CB36B8];
              objc_msgSend(v13, "toIndex");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "indexSetWithIndex:", objc_msgSend(v26, "unsignedIntegerValue"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              -[HFItemManager delegate](self, "delegate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "itemManager:didInsertSections:", self, v21);
              goto LABEL_16;
            }
            break;
          case 2:
            -[HFItemManager delegate](self, "delegate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_opt_respondsToSelector();

            if ((v18 & 1) != 0)
            {
              v19 = (void *)MEMORY[0x1E0CB36B8];
              objc_msgSend(v13, "fromIndex");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "indexSetWithIndex:", objc_msgSend(v20, "unsignedIntegerValue"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              -[HFItemManager delegate](self, "delegate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "itemManager:didRemoveSections:", self, v21);
LABEL_16:

              goto LABEL_19;
            }
            break;
          case 3:
            -[HFItemManager delegate](self, "delegate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_opt_respondsToSelector();

            if ((v28 & 1) != 0)
            {
              -[HFItemManager delegate](self, "delegate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "fromIndex");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v9;
              v31 = v10;
              v32 = v6;
              v33 = v11;
              v34 = objc_msgSend(v29, "integerValue");
              objc_msgSend(v13, "toIndex");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "integerValue");
              v37 = v34;
              v11 = v33;
              v6 = v32;
              v10 = v31;
              v9 = v30;
              v7 = v41;
              objc_msgSend(v21, "itemManager:didMoveSection:toSection:", self, v37, v36);

LABEL_19:
            }
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v9 != v12);
      v40 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      v9 = v40;
    }
    while (v40);
  }

}

- (void)_notifyDelegateOfItemOperations:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  char *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  os_activity_scope_state_s state;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      v31 = sel_itemManager_didRemoveItem_atIndexPath_;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        if (v7)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          objc_msgSend(v7, "loggerActivity");
          v13 = objc_claimAutoreleasedReturnValue();
          os_activity_scope_enter(v13, &state);

          HFLogForCategory(0x29uLL);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "operationDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v37 = v15;
            _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Issuing item update: %@", buf, 0xCu);

          }
          os_activity_scope_leave(&state);
        }
        else
        {
          HFLogForCategory(0x29uLL);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "operationDescription");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(state.opaque[0]) = 138412290;
            *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v29;
            _os_log_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_DEFAULT, "Issuing item update: %@", (uint8_t *)&state, 0xCu);

          }
        }
        switch(objc_msgSend(v12, "type", v31))
        {
          case 0:
            -[HFItemManager delegate](self, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_opt_respondsToSelector();

            if ((v17 & 1) != 0)
            {
              -[HFItemManager delegate](self, "delegate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "item");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "toIndexPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "itemManager:didUpdateResultsForItem:atIndexPath:", self, v19, v20);
              goto LABEL_19;
            }
            break;
          case 1:
            -[HFItemManager delegate](self, "delegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_opt_respondsToSelector();

            if ((v24 & 1) != 0)
            {
              -[HFItemManager delegate](self, "delegate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "item");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "toIndexPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "itemManager:didInsertItem:atIndexPath:", self, v19, v20);
              goto LABEL_19;
            }
            break;
          case 2:
            -[HFItemManager delegate](self, "delegate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_opt_respondsToSelector();

            if ((v22 & 1) != 0)
            {
              -[HFItemManager delegate](self, "delegate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "item");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "fromIndexPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "itemManager:didRemoveItem:atIndexPath:", self, v19, v20);
              goto LABEL_19;
            }
            break;
          case 3:
            -[HFItemManager delegate](self, "delegate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_opt_respondsToSelector();

            if ((v26 & 1) != 0)
            {
              -[HFItemManager delegate](self, "delegate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "item");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "fromIndexPath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "toIndexPath");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "itemManager:didMoveItem:fromIndexPath:toIndexPath:", self, v19, v20, v27);

LABEL_19:
            }
            break;
          default:
            break;
        }
        ++v11;
      }
      while (v9 != v11);
      v30 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      v9 = v30;
    }
    while (v30);
  }

}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  HFItemManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x24uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%@) executionEnvironmentDidBecomeActive", (uint8_t *)&v8, 0xCu);
  }

  -[HFItemManager _itemsToUpdateWhenApplicationDidBecomeActive](self, "_itemsToUpdateWhenApplicationDidBecomeActive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v6, a2);

}

- (id)_itemsToUpdateWhenApplicationDidBecomeActive
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

uint64_t __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemModules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke_3;
  v8[3] = &unk_1EA734C08;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

void __71__HFItemManager__updateRepresentationForInternalItemsWithUpdatedItems___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemManager:didUpdateResultsForSourceItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setSourceItem:(id)a3
{
  HFItem *v5;
  void *v6;
  char v7;
  void *v8;
  HFItem *v9;

  v5 = (HFItem *)a3;
  if (self->_sourceItem != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_sourceItem, a3);
    -[HFItemManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    v5 = v9;
    if ((v7 & 1) != 0)
    {
      -[HFItemManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemManager:didChangeSourceItem:", self, self->_sourceItem);

      v5 = v9;
    }
  }

}

- (id)_debug_itemProviderDescriptions
{
  void *v2;
  void *v3;

  -[HFItemManager itemProviders](self, "itemProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __61__HFItemManager_HFDebugging___debug_itemProviderDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugDescription");
}

- (id)_debug_itemDescriptions
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v3 = (void *)objc_opt_new();
  if (-[HFItemManager numberOfSections](self, "numberOfSections"))
  {
    v4 = 0;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      -[HFItemManager displayedItemsInSection:](self, "displayedItemsInSection:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __53__HFItemManager_HFDebugging___debug_itemDescriptions__block_invoke;
      v8[3] = &unk_1EA727578;
      v10 = v4;
      v9 = v3;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

      ++v4;
    }
    while (v4 < -[HFItemManager numberOfSections](self, "numberOfSections"));
  }
  return v3;
}

void __53__HFItemManager_HFDebugging___debug_itemDescriptions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[%@,%@]"), v9, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v12);
}

- (id)hf_stateDumpBuilderWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _debug_itemManagerDescription](self, "_debug_itemManagerDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("itemManager"));

  v7 = objc_msgSend(v4, "detailLevel");
  if (v7 == 2)
  {
    -[HFItemManager _debug_itemProviderDescriptions](self, "_debug_itemProviderDescriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("itemProviders"));

    -[HFItemManager _debug_itemDescriptions](self, "_debug_itemDescriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("items"));

  }
  return v5;
}

- (void)executionEnvironmentWillEnterForeground:(id)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  HFLogForCategory(0x24uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "executionEnvironmentWillEnterForeground", v8, 2u);
  }

  -[HFItemManager allItems](self, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v6, a2);

}

- (void)executionEnvironmentDidEnterBackground:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  HFLogForCategory(0x24uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "executionEnvironmentDidEnterBackground", v7, 2u);
  }

  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateAllCachedErrors");

}

- (void)executionEnvironmentWillResignActive:(id)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  HFItemManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x24uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%@) executionEnvironmentWillResignActive", (uint8_t *)&v8, 0xCu);
  }

  -[HFItemManager _itemsToUpdateForApplicationResignActive](self, "_itemsToUpdateForApplicationResignActive");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v6, a2);

}

- (id)_cameraForCameraStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
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
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v7 = *(_QWORD *)v27;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "cameraProfiles", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v15, "streamControl");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "cameraStream");
              v17 = (id)objc_claimAutoreleasedReturnValue();

              if (v17 == v4)
              {
                v18 = v15;

                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v12)
              continue;
            break;
          }
        }

        v7 = v20;
      }
      v18 = 0;
      v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)_cameraForUserSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;
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
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v11, "cameraProfiles");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v17, "userSettings");
              v18 = (id)objc_claimAutoreleasedReturnValue();

              if (v18 == v4)
              {
                v19 = v17;

                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v14)
              continue;
            break;
          }
        }

        v9 = v21;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v19 = 0;
    }
    while (v8);
  }
  else
  {
    v19 = 0;
  }
LABEL_19:

  return v19;
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v7 = a4;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest")
    && (objc_msgSend(v7, "homes"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        !v9))
  {
    HFLogForCategory(0x24uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Skipping reload (for -homeKitDispatcher:manager:didChangeHome:) as this is an internal unit test -tearDown", v12, 2u);
    }

  }
  else
  {
    v10 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
  }

}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  void *v4;
  id v5;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager setHome:](self, "setHome:", v4);

}

- (void)homeManagerDidFinishUnknownChange:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a3;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest")
    && (objc_msgSend(v5, "homes"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        !v7))
  {
    HFLogForCategory(0x24uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Skipping reload (for -homeManagerDidFinishUnknownChange:) as this is an internal unit test -tearDown", v10, 2u);
    }

  }
  else
  {
    v8 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](self, "reloadAndUpdateAllItemsFromSenderSelector:", a2);
  }

}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, 0, a2);

}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t v16[16];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest")
    && (objc_msgSend(v7, "homes"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        !v10))
  {
    HFLogForCategory(0x24uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Skipping reload (for -homeManager:didRemoveHome:) as this is an internal unit test -tearDown", v16, 2u);
    }
  }
  else
  {
    -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("home");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[NSObject requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:](v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, v14, 0, a2);

  }
}

- (void)homeManager:(id)a3 residentProvisioningStatusChanged:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForRemoteAccessChange](self, "_itemsToUpdateForRemoteAccessChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v6, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)homeManager:(id)a3 didUpdateAccessAllowedWhenLocked:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForAllowAccessWhileLockedSettingChange](self, "_itemsToUpdateForAllowAccessWhileLockedSettingChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v6, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "dataSyncState") == 1)
  {
    -[HFItemManager home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_characteristicValueManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateAllCachedErrors");

    -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "homes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("home");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v12, v13, 0, a2);

  }
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "homes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, 0, a2);

}

- (void)homeDidUpdateName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v5, a2);

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v7 = a4;
  objc_msgSend(v14, "hf_characteristicValueManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateCachedValuesForAccessory:", v7);

  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _invalidationReasonsForAddedOrRemovedAccessory:](self, "_invalidationReasonsForAddedOrRemovedAccessory:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v14, a2);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v7 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _invalidationReasonsForAddedOrRemovedAccessory:](self, "_invalidationReasonsForAddedOrRemovedAccessory:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, v11, v13, a2);
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)homeDidUpdateHomeLocationStatus:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, 0, a2);

}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_setWithSafeObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v12);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("home");
  v16[1] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v13, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v14, v5, a2);

}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a5;
  objc_msgSend(v10, "na_setWithSafeObject:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedRooms:](self, "_itemsToUpdateForModifiedRooms:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v16);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("room");
  v20[1] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v14, v18, v9, a2);

}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedRooms:](self, "_itemsToUpdateForModifiedRooms:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("room");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedRooms:](self, "_itemsToUpdateForModifiedRooms:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("room");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateNameForRoom:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedRooms:](self, "_itemsToUpdateForModifiedRooms:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("room");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didAddZone:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedZones:](self, "_itemsToUpdateForModifiedZones:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("zone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didRemoveZone:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedZones:](self, "_itemsToUpdateForModifiedZones:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("zone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateNameForZone:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedZones:](self, "_itemsToUpdateForModifiedZones:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("zone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a5;
  objc_msgSend(v10, "na_setWithSafeObject:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedRooms:](self, "_itemsToUpdateForModifiedRooms:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedZones:](self, "_itemsToUpdateForModifiedZones:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v16);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("room");
  v20[1] = CFSTR("zone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v14, v18, v9, a2);

}

- (void)home:(id)a3 didRemoveRoom:(id)a4 fromZone:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a5;
  objc_msgSend(v10, "na_setWithSafeObject:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedRooms:](self, "_itemsToUpdateForModifiedRooms:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedZones:](self, "_itemsToUpdateForModifiedZones:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v16);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("room");
  v20[1] = CFSTR("zone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v14, v18, v9, a2);

}

- (void)home:(id)a3 didAddServiceGroup:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServiceGroups:](self, "_itemsToUpdateForModifiedServiceGroups:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("serviceGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServiceGroups:](self, "_itemsToUpdateForModifiedServiceGroups:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("serviceGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateNameForServiceGroup:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServiceGroups:](self, "_itemsToUpdateForModifiedServiceGroups:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("serviceGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didAddService:(id)a4 toServiceGroup:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a5;
  objc_msgSend(v10, "na_setWithSafeObject:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServiceGroups:](self, "_itemsToUpdateForModifiedServiceGroups:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v16);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("service");
  v20[1] = CFSTR("serviceGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v14, v18, v9, a2);

}

- (void)home:(id)a3 didRemoveService:(id)a4 fromServiceGroup:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a5;
  objc_msgSend(v10, "na_setWithSafeObject:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServiceGroups:](self, "_itemsToUpdateForModifiedServiceGroups:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v16);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("service");
  v20[1] = CFSTR("serviceGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v14, v18, v9, a2);

}

- (void)home:(id)a3 didUnblockAccessory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "hf_characteristicValueManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateCachedValuesForAccessory:", v8);

  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v12, v13, v7, a2);

}

- (void)home:(id)a3 didEncounterError:(id)a4 forAccessory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a5;
  -[HFItemManager home](self, "home");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v14)
  {
    -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v12, MEMORY[0x1E0C9AA60], v14, a2);

  }
}

- (void)home:(id)a3 didAddActionSet:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedActionSets:](self, "_itemsToUpdateForModifiedActionSets:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("actionSet");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didRemoveActionSet:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_characteristicValueManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateCachedErrorForExecutionOfActionSet:", v8);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedActionSets:](self, "_itemsToUpdateForModifiedActionSets:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("actionSet");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, v14, v7, a2);

}

- (void)home:(id)a3 didUpdateNameForActionSet:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedActionSets:](self, "_itemsToUpdateForModifiedActionSets:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("actionSet");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateActionsForActionSet:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_characteristicValueManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateCachedErrorForExecutionOfActionSet:", v8);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedActionSets:](self, "_itemsToUpdateForModifiedActionSets:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("actionSet");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, v14, v7, a2);

}

- (void)home:(id)a3 didAddTrigger:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedTriggers:](self, "_itemsToUpdateForModifiedTriggers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("trigger");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didRemoveTrigger:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedTriggers:](self, "_itemsToUpdateForModifiedTriggers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("trigger");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateNameForTrigger:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedTriggers:](self, "_itemsToUpdateForModifiedTriggers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("trigger");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateTrigger:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedTriggers:](self, "_itemsToUpdateForModifiedTriggers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("trigger");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)homeDidUpdateApplicationData:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v5, a2);

}

- (void)home:(id)a3 didUpdateApplicationDataForRoom:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedRooms:](self, "_itemsToUpdateForModifiedRooms:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("room");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateApplicationDataForActionSet:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedActionSets:](self, "_itemsToUpdateForModifiedActionSets:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("actionSet");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServiceGroups:](self, "_itemsToUpdateForModifiedServiceGroups:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("serviceGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateStateForOutgoingInvitations:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForOutgoingInvitation:](self, "_itemsToUpdateForOutgoingInvitation:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("outgoinginvitations");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)home:(id)a3 didUpdateAccesoryInvitationsForUser:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("pendingAccessories");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v7, a2);

}

- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForIncomingInvitation:](self, "_itemsToUpdateForIncomingInvitation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("incominginvitations");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, 0, a2);

}

- (void)home:(id)a3 didUpdateAccessControlForUser:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setByAddingObjectsFromSet:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v15;
  }
  objc_msgSend(v7, "currentUser");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 == v8)
  {
    objc_msgSend(v7, "homeAccessControlForUser:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isRemoteAccessAllowed");

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v8, "announceUserSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "deviceNotificationMode") == 3)
      {
        HFLogForCategory(0x24uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "homeAccessControlForUser:", v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "isRemoteAccessAllowed"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v32 = v21;
          v33 = 2112;
          v34 = v24;
          _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "Now Updating Announce notification setting to HMAnnounceDeviceNotificationModeAtHome -  currentNotificationMode = [%@] isRemoteAccessAllowed = [%@]", buf, 0x16u);

        }
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA350]), "initWithDeviceNotificationMode:", 2);
        objc_msgSend(v7, "currentUser");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "updateAnnounceUserSettings:forHome:completionHandler:", v25, v7, &__block_literal_global_56);

      }
    }
  }
  else
  {

  }
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v27, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, v28, v7, a2);

}

void __70__HFItemManager_HomeKitDelegates__home_didUpdateAccessControlForUser___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    HFLogForCategory(0x24uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Error updating Announce notification setting - [%@]", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)home:(id)a3 didAddResidentDevice:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedResidentDevices:](self, "_itemsToUpdateForModifiedResidentDevices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("residentDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v11, v7, a2);

}

- (void)home:(id)a3 didRemoveResidentDevice:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedResidentDevices:](self, "_itemsToUpdateForModifiedResidentDevices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("residentDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v11, v7, a2);

}

- (void)home:(id)a3 remoteAccessStateDidChange:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForRemoteAccessChange](self, "_itemsToUpdateForRemoteAccessChange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)homeDidUpdateProtectionMode:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)homeDidUpdateNetworkRouterSupport:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)home:(id)a3 didAddAccessoryNetworkProtectionGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v6, a2);

}

- (void)home:(id)a3 didRemoveAccessoryNetworkProtectionGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v6, a2);

}

- (void)home:(id)a3 didUpdateAccessoryNetworkProtectionGroup:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a4;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedNetworkProtectionGroups:](self, "_itemsToUpdateForModifiedNetworkProtectionGroups:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, MEMORY[0x1E0C9AA60], v12, a2);

}

- (void)home:(id)a3 didUpdatePersonManagerSettings:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedHomePersonManagerSettings:](self, "_itemsToUpdateForModifiedHomePersonManagerSettings:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)homeDidAddWalletKey:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id)objc_msgSend(v5, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v5, a2);

}

- (void)homeDidRemoveWalletKey:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id)objc_msgSend(v5, "hf_fetchWalletKeyDeviceStateForCurrentDevice");
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v5, a2);

}

- (void)homeDidUpdateToROAR:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v5, a2);

}

- (void)homeDidUpdateSoundCheck:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)home:(id)a3 didUpdateAudioAnalysisClassifierOptions:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)home:(id)a3 didUpdateOnboardAudioAnalysis:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)home:(id)a3 didUpdateAreBulletinNotificationsSupported:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)home:(id)a3 didUpdateSiriTriggerPhraseOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v6, a2);

}

- (void)home:(id)a3 didUpdateSiriPhraseOptions:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedMetadataForHomes:](self, "_itemsToUpdateForModifiedMetadataForHomes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)accessoryDidUpdateName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessory:(id)a3 didUpdateNameForService:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);
}

- (void)accessory:(id)a3 didUpdateAssociatedServiceTypeForService:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);
}

- (void)accessoryDidUpdateServices:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_characteristicValueManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateCachedValuesForAccessory:", v5);

  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("service");
  v14[1] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, v11, v12, a2);
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    if (!objc_msgSend(v14, "hf_supportsSuspendedState") || (objc_msgSend(v14, "isReachable") & 1) == 0)
    {
      objc_msgSend(v14, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hf_characteristicValueManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidateCachedValuesForAccessory:", v14);

    }
    -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, MEMORY[0x1E0C9AA60], v12, a2);

  }
}

- (void)accessoryDidUpdateReachableTransports:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], v10, a2);

  }
}

- (void)accessory:(id)a3 service:(id)a4 didUpdateValueForCharacteristic:(id)a5
{
  id v9;
  id v10;
  id v11;
  void (**v12)(void *, HFMessageBatcher *);
  void *v13;
  int v14;
  HFMessageBatcher *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[4];
  id v22[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__HFItemManager_HomeKitDelegates__accessory_service_didUpdateValueForCharacteristic___block_invoke;
  aBlock[3] = &unk_1EA72D8B8;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a2;
  v12 = (void (**)(void *, HFMessageBatcher *))_Block_copy(aBlock);
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasUncommittedBatchingReasons");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
    v15 = (HFMessageBatcher *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v15);
  }
  else
  {
    objc_getAssociatedObject(self, "accessory:service:didUpdateValueForCharacteristic:-batcher");
    v15 = (HFMessageBatcher *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@.%@"), v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[HFMessageBatcher initWithIdentifier:batchingInterval:block:]([HFMessageBatcher alloc], "initWithIdentifier:batchingInterval:block:", v20, v12, 0.05);
      objc_setAssociatedObject(self, "accessory:service:didUpdateValueForCharacteristic:-batcher", v15, (void *)1);

    }
    -[HFMessageBatcher batchObject:](v15, "batchObject:", v11);
  }

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

void __85__HFItemManager_HomeKitDelegates__accessory_service_didUpdateValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_itemsToUpdateForModifiedCharacteristics:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_9_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 1)
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@: Expected exactly 1 home for characteristics: %@"), v7, v3);

  }
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics"))
  {
    HFLogForCategory(0x29uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "hf_prettyDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v14 = WeakRetained;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v3;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Requesting %@ to update items %@ for characteristic updates %@ for home: %@", buf, 0x2Au);

    }
  }
  objc_msgSend(WeakRetained, "batchedDelegateAdapterDisallowingReads");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v5, MEMORY[0x1E0C9AA60], v8, *(_QWORD *)(a1 + 40));

}

id __85__HFItemManager_HomeKitDelegates__accessory_service_didUpdateValueForCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessoryDidUpdateApplicationData:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessoryDidUpdateCalibrationStatus:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);
}

- (void)accessoryDidUpdateAdditionalSetupRequired:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_characteristicValueManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateCachedValuesForAccessory:", v5);

  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, v11, v12, a2);
}

- (void)accessory:(id)a3 didUpdateHasAuthorizationDataForCharacteristic:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_characteristicValueManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidateCachedValuesForAccessory:", v8);

  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedCharacteristics:](self, "_itemsToUpdateForModifiedCharacteristics:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, v14, v15, a2);
}

- (void)accessory:(id)a3 didUpdateBundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didUpdateStoreID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didUpdateFirmwareUpdateAvailable:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didUpdateFirmwareVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didUpdateSoftwareVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didUpdateLoggedInAccount:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didAddProfile:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didRemoveProfile:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v5;
  HFMessageBatcher *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  HFMessageBatcher *v12;
  _QWORD v13[4];
  id v14[2];
  id location;

  v5 = a3;
  objc_getAssociatedObject(self, "accessoryDidUpdateControllable-batcher");
  v6 = (HFMessageBatcher *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [HFMessageBatcher alloc];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__HFItemManager_HomeKitDelegates__accessoryDidUpdateControllable___block_invoke;
    v13[3] = &unk_1EA72D8B8;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a2;
    v6 = -[HFMessageBatcher initWithIdentifier:batchingInterval:block:](v12, "initWithIdentifier:batchingInterval:block:", v11, v13, 0.05);
    objc_setAssociatedObject(self, "accessoryDidUpdateControllable-batcher", v6, (void *)1);
    objc_destroyWeak(v14);

    objc_destroyWeak(&location);
  }
  -[HFMessageBatcher batchObject:](v6, "batchObject:", v5);

}

void __66__HFItemManager_HomeKitDelegates__accessoryDidUpdateControllable___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "batchedDelegateAdapterDisallowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_itemsToUpdateForModifiedAccessories:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v6, MEMORY[0x1E0C9AA60], v8, *(_QWORD *)(a1 + 40));

}

- (void)accessory:(id)a3 didUpdateConfiguredNameForService:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);
}

- (void)accessory:(id)a3 didUpdateDefaultNameForService:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);
}

- (void)accessory:(id)a3 didUpdateServiceSubtypeForService:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);
}

- (void)accessory:(id)a3 didUpdateConfigurationStateForService:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);
}

- (void)accessory:(id)a3 didAddSymptomsHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessoryDidRemoveSymptomsHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessoryDidUpdateTargetControlSupport:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessory:(id)a3 didAddControlTarget:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didRemoveControlTarget:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)home:(id)a3 didUpdateReprovisionStateForAccessory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("accessory");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v12, v13, v14, a2);

  }
}

- (void)accessory:(id)a3 didUpdateLastKnownSleepDiscoveryModeForService:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);
}

- (void)accessoryDidUpdateAudioDestinationController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessoryDidUpdateAudioDestination:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessory:(id)a3 didUpdateLastKnownOperatingStateResponseForService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessoryDidUpdatePreferredMediaUser:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessory:(id)a3 didUpdateUserNotifiedOfSoftwareUpdate:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)accessory:(id)a3 didUpdateSupportsWalletKey:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v9, a2);
}

- (void)accessoryDidUpdatePendingConfigurationIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v9, v10, a2);
}

- (void)accessoryDidUpdateDiagnosticsTransferSupport:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v8, a2);
}

- (void)residentDevice:(id)a3 didUpdateName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedResidentDevices:](self, "_itemsToUpdateForModifiedResidentDevices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("residentDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)residentDevice:(id)a3 didUpdateCapabilities:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedResidentDevices:](self, "_itemsToUpdateForModifiedResidentDevices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("residentDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)residentDevice:(id)a3 didUpdateEnabled:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedResidentDevices:](self, "_itemsToUpdateForModifiedResidentDevices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("residentDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)residentDevice:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedResidentDevices:](self, "_itemsToUpdateForModifiedResidentDevices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("residentDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, v11, a2);
}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[HFItemManager _cameraForCameraControl:](self, "_cameraForCameraControl:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCameras:](self, "_itemsToUpdateForModifiedCameras:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[HFItemManager _cameraForCameraControl:](self, "_cameraForCameraControl:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCameras:](self, "_itemsToUpdateForModifiedCameras:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  -[HFItemManager _cameraForCameraControl:](self, "_cameraForCameraControl:", a3, a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCameras:](self, "_itemsToUpdateForModifiedCameras:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)cameraStreamControlDidUpdateStreamState:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[HFItemManager _cameraForCameraControl:](self, "_cameraForCameraControl:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCameras:](self, "_itemsToUpdateForModifiedCameras:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)cameraStreamControlDidUpdateManagerState:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[HFItemManager _cameraForCameraControl:](self, "_cameraForCameraControl:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCameras:](self, "_itemsToUpdateForModifiedCameras:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)cameraStream:(id)a3 didUpdateAudioStreamSettingWithError:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  -[HFItemManager _cameraForCameraStream:](self, "_cameraForCameraStream:", a3, a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCameras:](self, "_itemsToUpdateForModifiedCameras:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)cameraUserSettingsDidUpdate:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[HFItemManager _cameraForUserSettings:](self, "_cameraForUserSettings:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCameras:](self, "_itemsToUpdateForModifiedCameras:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)clipManager:(id)a3 didUpdateSignificantEvents:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedSignificantEvents:](self, "_itemsToUpdateForModifiedSignificantEvents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], 0, a2);
}

- (void)clipManager:(id)a3 didRemoveSignificantEventsWithUUIDs:(id)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForModifiedUUIDs:](self, "_itemsToUpdateForModifiedUUIDs:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)softwareUpdateController:(id)a3 didUpdateAvailableUpdate:(id)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = a4;
  objc_msgSend(v7, "na_setWithSafeObject:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedSoftwareUpdateControllers:](self, "_itemsToUpdateForModifiedSoftwareUpdateControllers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedSoftwareUpdates:](self, "_itemsToUpdateForModifiedSoftwareUpdates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v13);

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("softwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v15, 0, a2);

}

- (void)softwareUpdate:(id)a3 didUpdateState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedSoftwareUpdates:](self, "_itemsToUpdateForModifiedSoftwareUpdates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("softwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, 0, a2);

}

- (void)softwareUpdate:(id)a3 didUpdateDocumentation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedSoftwareUpdates:](self, "_itemsToUpdateForModifiedSoftwareUpdates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("softwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, 0, a2);

}

- (void)softwareUpdate:(id)a3 didUpdateDocumentationAvailable:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedSoftwareUpdates:](self, "_itemsToUpdateForModifiedSoftwareUpdates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("softwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, 0, a2);

}

- (void)softwareUpdate:(id)a3 didUpdateNeedsAttentionReasons:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedSoftwareUpdates:](self, "_itemsToUpdateForModifiedSoftwareUpdates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("softwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, v10, 0, a2);

}

- (void)softwareUpdateV2DidUpdateForAccessory:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[HFItemManager _itemsToUpdateForSoftwareUpdateV2ChangeToAccessory:](self, "_itemsToUpdateForSoftwareUpdateV2ChangeToAccessory:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("softwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v5, v7, 0, a2);

}

- (void)softwareUpdateV2DidUpdateProgressForAccessory:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[HFItemManager _itemsToUpdateForSoftwareUpdateV2ProgressChangeToAccessory:](self, "_itemsToUpdateForSoftwareUpdateV2ProgressChangeToAccessory:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("softwareUpdate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v5, v7, 0, a2);

}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v12, v13, v8, a2);

}

- (void)user:(id)a3 didUpdateMediaContentProfileAccessControl:(id)a4 forHome:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v12, v13, v8, a2);

}

- (void)user:(id)a3 didUpdatePersonManagerSettings:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, v9, 0, a2);

}

- (void)restrictedGuestAllowedPeriodStarted:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  uint8_t buf[4];
  HFItemManager *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x24uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Restricted Guest allowed period started for user: %@.", buf, 0x20u);

  }
  if (_os_feature_enabled_impl())
  {
    -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("user");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, 0, a2);

  }
}

- (void)restrictedGuestAllowedPeriodEnded:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  uint8_t buf[4];
  HFItemManager *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0x24uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Restricted Guest allowed period ended for user: %@.", buf, 0x20u);

  }
  if (_os_feature_enabled_impl())
  {
    -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager _itemsToUpdateForModifiedUsers:](self, "_itemsToUpdateForModifiedUsers:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("user");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, 0, a2);

  }
}

- (void)settings:(id)a3 willWriteValueForSettings:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForAccessorySettingChanges:](self, "_itemsToUpdateForAccessorySettingChanges:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], 0, a2);
}

- (void)settings:(id)a3 didWriteValueForSettings:(id)a4 failedSettings:(id)a5 homeKitObjectIdentifiers:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v18 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;
  objc_msgSend(v12, "setByAddingObjectsFromSet:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_map:", &__block_literal_global_22_2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForHomeKitKeyPaths:forHomeKitObjectIdentifiers:](self, "_itemsToUpdateForHomeKitKeyPaths:forHomeKitObjectIdentifiers:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v15, MEMORY[0x1E0C9AA60], 0, a2);

}

uint64_t __109__HFItemManager_HomeKitDelegates__settings_didWriteValueForSettings_failedSettings_homeKitObjectIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keyPath");
}

- (void)symptomsHandler:(id)a3 didUpdateSymptoms:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_accessoryForSymptomsHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("mediaSystem");
  v15[1] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v11, v12, v13, a2);

}

- (void)fixSessionDidChangeForAccessory:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "HFItemManager accessory: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)profileDidUpdateNetworkProtectionMode:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedNetworkConfigurationProfiles:](self, "_itemsToUpdateForModifiedNetworkConfigurationProfiles:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)profileDidUpdateAllowedHosts:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedNetworkConfigurationProfiles:](self, "_itemsToUpdateForModifiedNetworkConfigurationProfiles:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)profileDidUpdateAccessViolation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedNetworkConfigurationProfiles:](self, "_itemsToUpdateForModifiedNetworkConfigurationProfiles:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)profileDidUpdateWiFiReconfigurationSupport:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedNetworkConfigurationProfiles:](self, "_itemsToUpdateForModifiedNetworkConfigurationProfiles:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)profileDidUpdateWiFiCredentialType:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedNetworkConfigurationProfiles:](self, "_itemsToUpdateForModifiedNetworkConfigurationProfiles:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)profileDidUpdateMediaSourceDisplayOrder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v5 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForTelevisionProfiles:](self, "_itemsToUpdateForTelevisionProfiles:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v9, a2);

}

- (void)mediaDestinationController:(id)a3 didUpdateDestination:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedMetadataForMediaDestinationController:](self, "_itemsToUpdateForModifiedMetadataForMediaDestinationController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)mediaDestinationControllerDidUpdateAvailableDestinations:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedMetadataForMediaDestinationController:](self, "_itemsToUpdateForModifiedMetadataForMediaDestinationController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)lightProfile:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = a3;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForLightProfiles:](self, "_itemsToUpdateForLightProfiles:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v12, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)home:(id)a3 willWriteValuesForCharacteristics:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCharacteristics:](self, "_itemsToUpdateForModifiedCharacteristics:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], v11, a2);
}

- (void)home:(id)a3 willExecuteActionSets:(id)a4
{
  id v5;

  -[HFItemManager _itemsToUpdateForModifiedActionSets:](self, "_itemsToUpdateForModifiedActionSets:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _updateLoadingStateAndNotifyDelegateForItems:canFinishTransaction:](self, "_updateLoadingStateAndNotifyDelegateForItems:canFinishTransaction:", v5, 1);

}

- (void)home:(id)a3 didWriteValuesForCharacteristics:(id)a4 failedCharacteristics:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedCharacteristics:](self, "_itemsToUpdateForModifiedCharacteristics:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, MEMORY[0x1E0C9AA60], v15, a2);

}

- (void)home:(id)a3 didExecuteActionSets:(id)a4 failedActionSets:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedActionSets:](self, "_itemsToUpdateForModifiedActionSets:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, MEMORY[0x1E0C9AA60], v15, a2);

}

- (void)mediaSession:(id)a3 willUpdatePlaybackState:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)mediaSession:(id)a3 didUpdatePlaybackState:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)mediaSession:(id)a3 failedToUpdatePlaybackStateWithError:(id)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)mediaSessionDidUpdate:(id)a3
{
  void *v5;
  id v6;
  id v7;

  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)mediaObject:(id)a3 didUpdateMediaSession:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = a3;
  -[HFItemManager _itemsToUpdateForMediaObjectChange:](self, "_itemsToUpdateForMediaObjectChange:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v11, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v14, MEMORY[0x1E0C9AA60], v12, a2);
}

- (void)mediaObject:(id)a3 didUpdateSettings:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v7 = a3;
  -[HFItemManager _itemsToUpdateForHomeKitSettingsChange:](self, "_itemsToUpdateForHomeKitSettingsChange:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForMediaObjectChange:](self, "_itemsToUpdateForMediaObjectChange:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, MEMORY[0x1E0C9AA60], v11, a2);
}

- (void)settings:(id)a3 didUpdateForIdentifier:(id)a4 keyPath:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  if (a4)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = a4;
    objc_msgSend(v8, "setWithObject:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFItemManager _itemsToUpdateForHomeKitKeyPaths:forHomeKitObjectIdentifiers:](self, "_itemsToUpdateForHomeKitKeyPaths:forHomeKitObjectIdentifiers:", v10, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v14, MEMORY[0x1E0C9AA60], 0, a2);

  }
}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_initWeak(&location, self);
  -[HFItemManager firstFastUpdateFuture](self, "firstFastUpdateFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke;
  v13[3] = &unk_1EA72D988;
  objc_copyWeak(v16, &location);
  v10 = v8;
  v14 = v10;
  v11 = v7;
  v15 = v11;
  v16[1] = (id)a2;
  v12 = (id)objc_msgSend(v9, "addCompletionBlock:", v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_24_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  objc_msgSend(WeakRetained, "itemProviders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke_3;
  v21[3] = &unk_1EA72D960;
  v10 = v8;
  v22 = v10;
  v24 = &v25;
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v9, "na_each:", v21);

  if (*((_BYTE *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_itemsToUpdateForHomeKitKeyPaths:forHomeKitObjectIdentifiers:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0x25uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v13;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "didReceiveSettingsUpdatesForAccessoryWithIdentifier = [%@] settings = [%@] keyPaths = [%@]. Now reloading items: %@", buf, 0x2Au);
    }

    if (-[NSObject count](v13, "count"))
    {
      objc_msgSend(WeakRetained, "batchedDelegateAdapterDisallowingReads");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v17, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v13, MEMORY[0x1E0C9AA60], 0, *(_QWORD *)(a1 + 56));

    }
  }
  else
  {
    HFLogForCategory(0x25uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "didReceiveSettingsUpdatesForAccessoryWithIdentifier = [%@] settings = [%@] keyPaths = [%@]. Not reloading items since no new data", buf, 0x20u);
    }
  }

  _Block_object_dispose(&v25, 8);
}

uint64_t __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keyPath");
}

void __96__HFItemManager_HomeKitDelegates__didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F54B0))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "shouldUpdateForKeyPaths:", a1[4]))
  {
    HFLogForCategory(0x25uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Calling HFHomeKitSettingItemProviderProtocol to check if a update is needed for [%@]", (uint8_t *)&v9, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "updateSettings:", a1[5]);
  }

}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = a5;
  objc_msgSend(v11, "setWithObject:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForHomeKitKeyPaths:forHomeKitObjectIdentifiers:](self, "_itemsToUpdateForHomeKitKeyPaths:forHomeKitObjectIdentifiers:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    -[HFItemManager itemProviders](self, "itemProviders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __85__HFItemManager_HomeKitDelegates__updateSettingValue_forKeyPath_accessoryIdentifier___block_invoke;
    v23[3] = &unk_1EA72D9B0;
    v18 = v15;
    v24 = v18;
    v25 = v9;
    v26 = v10;
    objc_msgSend(v16, "na_each:", v23);

    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __85__HFItemManager_HomeKitDelegates__updateSettingValue_forKeyPath_accessoryIdentifier___block_invoke_2;
    v20[3] = &unk_1EA727778;
    v20[4] = self;
    v21 = v18;
    v22 = a2;
    objc_msgSend(v19, "performBlock:", v20);

  }
}

void __85__HFItemManager_HomeKitDelegates__updateSettingValue_forKeyPath_accessoryIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F03F54B0))
  {
    objc_msgSend(v5, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intersectsSet:", a1[4]);

    if (v4)
      objc_msgSend(v5, "updateSettingValue:forKeyPath:", a1[5], a1[6]);
  }

}

void __85__HFItemManager_HomeKitDelegates__updateSettingValue_forKeyPath_accessoryIdentifier___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "batchedDelegateAdapterDisallowingReads");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], 0, *(_QWORD *)(a1 + 48));

}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a4;
  -[HFItemManager _itemsToUpdateForMediaSystemChange:](self, "_itemsToUpdateForMediaSystemChange:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _invalidationReasonsForAddedOrRemovedMediaSystem:](self, "_invalidationReasonsForAddedOrRemovedMediaSystem:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v10, v12, a2);
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a4;
  -[HFItemManager _itemsToUpdateForMediaSystemChange:](self, "_itemsToUpdateForMediaSystemChange:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _invalidationReasonsForAddedOrRemovedMediaSystem:](self, "_invalidationReasonsForAddedOrRemovedMediaSystem:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v9, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, v10, v12, a2);
}

- (void)home:(id)a3 didUpdateMediaSystem:(id)a4
{
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[HFItemManager _itemsToUpdateForMediaSystemChange:](self, "_itemsToUpdateForMediaSystemChange:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, MEMORY[0x1E0C9AA60], v10, a2);

}

- (void)mediaSystem:(id)a3 didUpdateComponents:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  -[HFItemManager _itemsToUpdateForMediaSystemChange:](self, "_itemsToUpdateForMediaSystemChange:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, MEMORY[0x1E0C9AA60], v8, a2);
}

- (void)mediaSystem:(id)a3 didUpdateName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  -[HFItemManager _itemsToUpdateForMediaSystemChange:](self, "_itemsToUpdateForMediaSystemChange:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, MEMORY[0x1E0C9AA60], v8, a2);
}

- (void)mediaSystem:(id)a3 didUpdateConfiguredName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  -[HFItemManager _itemsToUpdateForMediaSystemChange:](self, "_itemsToUpdateForMediaSystemChange:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v10, MEMORY[0x1E0C9AA60], v8, a2);
}

- (void)audioControl:(id)a3 didUpdateVolume:(float)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a3, "mediaSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)audioControl:(id)a3 didUpdateMuted:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a3, "mediaSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForMediaSessionChange:](self, "_itemsToUpdateForMediaSessionChange:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateSessionState:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateSessionHubIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateSiriEngineVersion:(id)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateNeedsOnboarding:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateSupportsOnboarding:(BOOL)a4
{
  id v5;
  id v6;

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", 0, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateManuallyDisabled:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateMultifunctionButton:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateCurrentAssistant:(id)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)siriEndpointProfile:(id)a3 didUpdateAssistants:(id)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForSiriEndpointProfileObjectChange:](self, "_itemsToUpdateForSiriEndpointProfileObjectChange:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)personManager:(id)a3 didUpdatePersons:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[HFItemManager _itemsToUpdateForModifiedPersons:](self, "_itemsToUpdateForModifiedPersons:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("person");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v6, v8, 0, a2);

}

- (void)personManager:(id)a3 didRemovePersonsWithUUIDs:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[HFItemManager _itemsToUpdateForModifiedUUIDs:](self, "_itemsToUpdateForModifiedUUIDs:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("person");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v6, v8, 0, a2);

}

- (void)personManager:(id)a3 didUpdatePersonFaceCrops:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = a4;
  objc_msgSend(v6, "na_map:", &__block_literal_global_35_0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedUUIDs:](self, "_itemsToUpdateForModifiedUUIDs:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v9, MEMORY[0x1E0C9AA60], 0, a2);

}

uint64_t __74__HFItemManager_HomeKitDelegates__personManager_didUpdatePersonFaceCrops___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personUUID");
}

uint64_t __74__HFItemManager_HomeKitDelegates__personManager_didUpdatePersonFaceCrops___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (void)personManager:(id)a3 didRemoveFaceCropsWithUUIDs:(id)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _itemsToUpdateForModifiedUUIDs:](self, "_itemsToUpdateForModifiedUUIDs:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v8, MEMORY[0x1E0C9AA60], 0, a2);

}

- (void)didUpdateDemoModeStateForAccessory:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, v9, 0, a2);

}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[HFItemManager _itemsToUpdateForModifiedAccessCodes:](self, "_itemsToUpdateForModifiedAccessCodes:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[HFItemManager batchedDelegateAdapterDisallowingReads](self, "batchedDelegateAdapterDisallowingReads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "requestUpdateForItems:itemProviderInvalidationReasons:modifiedHome:senderSelector:", v7, v9, 0, a2);

}

- (HFItemManager)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_sourceItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemManager.m"), 199, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFItemManager init]",
    v5);

  return 0;
}

- (void)dealloc
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  -[HFItemManager firstFastUpdateFuture](self, "firstFastUpdateFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFinished");

  if ((v4 & 1) == 0)
  {
    -[HFItemManager firstFastUpdateFuture](self, "firstFastUpdateFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
  -[HFItemManager firstFullUpdateFuture](self, "firstFullUpdateFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFinished");

  if ((v7 & 1) == 0)
  {
    -[HFItemManager firstFullUpdateFuture](self, "firstFullUpdateFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

  }
  -[HFItemManager _removeDelegateNotifications](self, "_removeDelegateNotifications");
  v9.receiver = self;
  v9.super_class = (Class)HFItemManager;
  -[HFItemManager dealloc](&v9, sel_dealloc);
}

- (id)childItemsForItem:(id)a3 ofClass:(Class)a4 conformingToProtocol:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  Class v15;

  v8 = a5;
  -[HFItemManager childItemsForItem:](self, "childItemsForItem:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HFItemManager_childItemsForItem_ofClass_conformingToProtocol___block_invoke;
  v13[3] = &unk_1EA734788;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  objc_msgSend(v9, "na_filter:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __64__HFItemManager_childItemsForItem_ofClass_conformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40) && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = 0;
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    v4 = objc_msgSend(v3, "conformsToProtocol:");
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__HFItemManager_matchingItemForHomeKitObject___block_invoke;
  v9[3] = &unk_1EA7295B8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __46__HFItemManager_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F0850))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)beginSuppressingUpdatesForCharacteristics:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  HFItemManager *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory(0x29uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412802;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Suppressing updates in %@ for characteristics %@ with reason %@", (uint8_t *)&v11, 0x20u);
  }

  -[HFItemManager suppressedCharacteristicUpdatesByReason](self, "suppressedCharacteristicUpdatesByReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_179_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "unionSet:", v6);
}

uint64_t __70__HFItemManager_beginSuppressingUpdatesForCharacteristics_withReason___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

- (void)endSuppressingUpdatesForCharacteristicsWithReason:(id)a3 updateAffectedItems:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  HFItemManager *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[HFItemManager suppressedCharacteristicUpdatesByReason](self, "suppressedCharacteristicUpdatesByReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[HFItemManager suppressedCharacteristicUpdatesByReason](self, "suppressedCharacteristicUpdatesByReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Request to end suppressing updates for: %@ without a matching request to begin suppressing characteristic updates. Reason: %@. Existing reasons: %@"), self, v7, v11);

  }
  HFLogForCategory(0x29uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "End suppressing updates in %@ for characteristics with reason %@", buf, 0x16u);
  }

  -[HFItemManager suppressedCharacteristicUpdatesByReason](self, "suppressedCharacteristicUpdatesByReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  -[HFItemManager suppressedCharacteristicUpdatesByReason](self, "suppressedCharacteristicUpdatesByReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", v7);

  if (v4)
  {
    -[HFItemManager _allSuppressedCharacteristics](self, "_allSuppressedCharacteristics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minusSet:", v17);

    if (objc_msgSend(v15, "count"))
    {
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "setSenderSelector:", a2);
      +[HFStaticReadPolicy policyWithDecision:](HFStaticReadPolicy, "policyWithDecision:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setReadPolicy:", v19);

      -[HFItemManager _itemsToUpdateForModifiedCharacteristics:](self, "_itemsToUpdateForModifiedCharacteristics:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HFItemManager _updateResultsForItems:context:](self, "_updateResultsForItems:context:", v20, v18);

    }
  }

}

- (void)setReadPolicy:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_readPolicy, a3);
  v5 = a3;
  -[HFItemManager batchedDelegateAdapterAllowingReads](self, "batchedDelegateAdapterAllowingReads");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReadPolicy:", v5);

}

+ (BOOL)_canReloadDuringUnitTests
{
  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[HFItemManager itemModules](self, "itemModules", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemManager.m"), 499, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFItemManager _buildItemProvidersForHome:]", objc_opt_class());

  }
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_buildItemProvidersWithoutHome
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  return +[HFItemSection defaultItemComparator](HFItemSection, "defaultItemComparator", a3);
}

- (id)_itemForSorting
{
  return 0;
}

- (BOOL)_requiresNotificationsForCharacteristic:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8928]);

  if ((v5 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v3, "characteristicType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8920]);

  if ((v7 & 1) != 0
    || (objc_msgSend(v3, "service"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "serviceType"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB99A0]),
        v9,
        v8,
        (v10 & 1) != 0))
  {
LABEL_4:
    v11 = 0;
  }
  else
  {
    v13 = *MEMORY[0x1E0CB8808];
    v17[0] = *MEMORY[0x1E0CB87B8];
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "characteristicType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    v11 = v16 ^ 1;
  }

  return v11;
}

uint64_t __44__HFItemManager__registerForExternalUpdates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "registerForExternalUpdates");
}

uint64_t __46__HFItemManager__unregisterForExternalUpdates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unregisterForExternalUpdates");
}

- (BOOL)itemIsBeingDisplayed:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

id __59__HFItemManager_reloadAndUpdateAllItemsFromSenderSelector___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_updateRepresentationForExternalItemsWithUpdatedOrAddedItems:removedItems:logger:", v2, v3, 0);

  objc_msgSend(WeakRetained, "setHome:", 0);
  objc_msgSend(WeakRetained, "setLastUpdatedHome:", 0);
  v4 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __59__HFItemManager__reloadAllItemProvidersFromSenderSelector___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "unionSet:", v9, (_QWORD)v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)reloadAndUpdateItemsForProviders:(id)a3 senderSelector:(SEL)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _reloadAndUpdateItemsForProviders:updateItems:senderSelector:](self, "_reloadAndUpdateItemsForProviders:updateItems:senderSelector:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke()
{
  void *v0;
  HFItemProviderReloadResults *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D519C0];
  v1 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", 0, 0, 0);
  objc_msgSend(v0, "futureWithResult:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_223(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "latestSnapshotGenerationFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_2_224;
  v9[3] = &unk_1EA726940;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_2_224(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_3_227(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v3 = (id *)(a1 + 80);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);

  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = *(id *)(a1 + 40);
  }
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0D519E8];
  if (*(_BYTE *)(a1 + 97))
  {
    dispatch_get_global_queue(0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "schedulerWithDispatchQueue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)MEMORY[0x1E0D519C0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __127__HFItemManager__reloadItemProviders_updateItems_shouldUpdateExistingItems_senderSelector_readPolicy_fastInitialUpdatePromise___block_invoke_4;
  v15[3] = &unk_1EA734970;
  v22 = *(_QWORD *)(a1 + 88);
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 64);
  v19 = WeakRetained;
  v20 = *(id *)(a1 + 72);
  v21 = v7;
  v12 = v7;
  objc_msgSend(v11, "futureWithBlock:scheduler:", v15, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __38__HFItemManager__loadingStateForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x29uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "updateOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Delegate for %@ has failed its future to update with options: %@ for items: %@; canceling update",
      buf,
      0x20u);

  }
  HFLogForCategory(0x31uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 72);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_signpost_emit_with_name_impl(&dword_1DD34E000, v9, OS_SIGNPOST_INTERVAL_END, v10, "HFFutureToUpdateItems", "Failed with error %@, canceling", buf, 0xCu);
  }

  v11 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_updateResultsForItems:removedItems:context:allowDelaying:", v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_274;
  v15[3] = &unk_1EA72A000;
  v16 = *(id *)(a1 + 64);
  v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v15);

}

uint64_t __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

uint64_t __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_276(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

id __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_280(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_performUpdateForItem:withContext:isInternal:isChild:", v4, v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HFItemUpdateFutureWrapper wrapperWithFuture:item:isInternal:](_HFItemUpdateFutureWrapper, "wrapperWithFuture:item:isInternal:", v5, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_2_283(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_performUpdateForItem:withContext:isInternal:isChild:", v4, v3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HFItemUpdateFutureWrapper wrapperWithFuture:item:isInternal:](_HFItemUpdateFutureWrapper, "wrapperWithFuture:item:isInternal:", v5, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __75__HFItemManager__updateResultsForItems_removedItems_context_allowDelaying___block_invoke_288(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint8_t v24[16];
  _BYTE buf[22];
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "unionSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "unionSet:", *(_QWORD *)(a1 + 48));
  HFLogForCategory(0x31uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 80);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    objc_msgSend(*(id *)(a1 + 56), "updateOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "BOOLValue"))
      v8 = CFSTR("Initial");
    else
      v8 = CFSTR("Normal");
    objc_msgSend(WeakRetained, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_class();
    v11 = *(void **)(a1 + 56);
    v22 = v10;
    NSStringFromSelector((SEL)objc_msgSend(v11, "senderSelector"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v12;
    _os_signpost_emit_with_name_impl(&dword_1DD34E000, v5, OS_SIGNPOST_INTERVAL_END, v6, "HFItemManagerUpdate", "%@ Item Update Finished %@:%@ for sender: %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 56), "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(*(id *)(a1 + 56), "logger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggerActivity");
    v15 = objc_claimAutoreleasedReturnValue();
    os_activity_scope_enter(v15, (os_activity_scope_state_t)buf);

    HFLogForCategory(0x29uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_DEFAULT, "All batch item updates complete.", v24, 2u);
    }

    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_DEFAULT, "All batch item updates complete.", buf, 2u);
    }

  }
  objc_msgSend(WeakRetained, "_didFinishUpdateTransactionWithAffectedItems:", v3);
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 56), "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "finish");

  }
  objc_msgSend(WeakRetained, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "itemManagerDidFinishUpdate:", WeakRetained);

  }
  objc_msgSend(*(id *)(a1 + 64), "finishWithResult:", v3);

}

id __70__HFItemManager__performUpdateForItem_withContext_isInternal_isChild___block_invoke_306(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v18;
  uint64_t v19;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "na_isCancelledError") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      objc_msgSend(*(id *)(a1 + 32), "logger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loggerActivity");
      v6 = objc_claimAutoreleasedReturnValue();
      os_activity_scope_enter(v6, &state);

      HFLogForCategory(0x29uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v22 = v8;
        v23 = 2112;
        v24 = v3;
        _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Update for item %@ failed with error %@. This is a programmer error, as item updates should never fail.", buf, 0x16u);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        v23 = 2112;
        v24 = v3;
        _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "Update for item %@ failed with error %@. This is a programmer error, as item updates should never fail.", buf, 0x16u);
      }

    }
    NSLog(CFSTR("Update for item %@ failed with error %@. This is a programmer error, as item updates should never fail."), *(_QWORD *)(a1 + 40), v3);
  }
  objc_msgSend(*(id *)(a1 + 40), "latestResults");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 40), "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToDictionary:", *(_QWORD *)(a1 + 48));

    if ((v12 & 1) == 0)
    {
      v13 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v13, "latestResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("An item's update was cancelled, but its results still changed. Item: %@, Old results: %@, New Results: %@"), v13, v14, v15);

    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "buildSectionsWithDisplayedItems:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__HFItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_shouldHideServiceItem:(id)a3 containedInServiceGroupItem:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  if (!a4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a4;
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToHideInSet:](self, "_itemsToHideInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v8, "containsObject:", v6);

  v9 = self ^ 1;
  return v9;
}

- (void)_setDisplayFilter:(id)a3 recalculateVisibility:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id displayFilter;

  v4 = a4;
  v6 = _Block_copy(a3);
  displayFilter = self->__displayFilter;
  self->__displayFilter = v6;

  if (v4)
    -[HFItemManager recalculateVisibilityAndSortAllItems](self, "recalculateVisibilityAndSortAllItems");
}

- (id)_serviceGroupItemForServiceGroup:(id)a3 inItems:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HFItemManager _itemsOfClass:inItems:allowTransformedItems:](self, "_itemsOfClass:inItems:allowTransformedItems:", objc_opt_class(), v6, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "homeKitObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v7);

        if ((v15 & 1) != 0)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (unint64_t)_sectionForItem:(id)a3
{
  return -[HFItemManager _sectionForItem:assertOnNotFound:](self, "_sectionForItem:assertOnNotFound:", a3, 1);
}

- (unint64_t)_sectionForItem:(id)a3 assertOnNotFound:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;

  v4 = a4;
  v7 = a3;
  -[HFItemManager sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __50__HFItemManager__sectionForItem_assertOnNotFound___block_invoke;
  v16 = &unk_1EA734D68;
  v9 = v7;
  v17 = v9;
  v10 = objc_msgSend(v8, "indexOfObjectPassingTest:", &v13);

  if (v4 && v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemManager.m"), 1836, CFSTR("Could not find section for item: %@"), v9, v13, v14, v15, v16);

  }
  return v10;
}

uint64_t __50__HFItemManager__sectionForItem_assertOnNotFound___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_itemsToUpdateForModifiedActionSets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "na_map:", &__block_literal_global_368);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedActions:](self, "_itemsToUpdateForModifiedActions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  return v6;
}

uint64_t __53__HFItemManager__itemsToUpdateForModifiedActionSets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actions");
}

- (id)_itemsToUpdateForModifiedActions:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedServiceGroups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "na_map:", &__block_literal_global_372);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  objc_msgSend(v8, "na_map:", &__block_literal_global_374_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v11);

  return v6;
}

id __56__HFItemManager__itemsToUpdateForModifiedServiceGroups___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __56__HFItemManager__itemsToUpdateForModifiedServiceGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

- (id)_itemsToUpdateForModifiedZones:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "na_map:", &__block_literal_global_377);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedRooms:](self, "_itemsToUpdateForModifiedRooms:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  return v6;
}

id __48__HFItemManager__itemsToUpdateForModifiedZones___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "rooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_itemsToUpdateForModifiedRooms:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "na_map:", &__block_literal_global_380);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  return v6;
}

id __48__HFItemManager__itemsToUpdateForModifiedRooms___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_itemsToUpdateForOutgoingInvitation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForIncomingInvitation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedUsers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedTriggers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "na_map:", &__block_literal_global_386);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedActionSets:](self, "_itemsToUpdateForModifiedActionSets:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  objc_msgSend(v4, "na_map:", &__block_literal_global_387);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "na_setByFlattening");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedEvents:](self, "_itemsToUpdateForModifiedEvents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v12);

  return v6;
}

id __51__HFItemManager__itemsToUpdateForModifiedTriggers___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "actionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __51__HFItemManager__itemsToUpdateForModifiedTriggers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v2, "events");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_itemsToUpdateForModifiedEvents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "na_map:", &__block_literal_global_392);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServices:](self, "_itemsToUpdateForModifiedServices:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  return v6;
}

id __54__HFItemManager__itemsToUpdateForModifiedAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_itemsToUpdateForModifiedServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "na_map:", &__block_literal_global_393);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setByFlattening");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedCharacteristics:](self, "_itemsToUpdateForModifiedCharacteristics:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v9);

  objc_msgSend(v4, "na_map:", &__block_literal_global_394);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedServiceTypes:](self, "_itemsToUpdateForModifiedServiceTypes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v11);

  return v6;
}

id __51__HFItemManager__itemsToUpdateForModifiedServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__HFItemManager__itemsToUpdateForModifiedServices___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceType");
}

- (id)_itemsToUpdateForModifiedServiceTypes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "latestResults");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dependentServiceTypes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "intersectsSet:", v4);

        if (v13)
          objc_msgSend(v15, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v15;
}

- (id)_itemsToUpdateForModifiedResidentDevices:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedSignificantEvents:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedSharingDevices:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForRemoteAccessChange
{
  void *v3;
  void *v4;

  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsWithDependenciesPassingTest:forItems:](self, "_itemsWithDependenciesPassingTest:forItems:", &__block_literal_global_399, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __52__HFItemManager__itemsToUpdateForRemoteAccessChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("remoteAccessDependency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_itemsToUpdateForCurrentHomeChange
{
  void *v3;
  void *v4;

  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsWithDependenciesPassingTest:forItems:](self, "_itemsWithDependenciesPassingTest:forItems:", &__block_literal_global_400, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__HFItemManager__itemsToUpdateForCurrentHomeChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentHomeDependency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_itemsToUpdateForAllowAccessWhileLockedSettingChange
{
  void *v2;
  void *v3;

  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_401);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __69__HFItemManager__itemsToUpdateForAllowAccessWhileLockedSettingChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("accessWhileLockedSettingDependency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_itemsToUpdateForMediaSessionChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HFItemManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_mediaAccessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v14, "mediaProfile");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mediaSession");
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16 == v4)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unionSet:", v18);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HFItemManager home](self, "home", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mediaSystems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v25, "mediaSession");
        v26 = (id)objc_claimAutoreleasedReturnValue();

        if (v26 == v4)
        {
          -[HFItemManager _itemsToUpdateForMediaSystemChange:](self, "_itemsToUpdateForMediaSystemChange:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unionSet:", v27);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v22);
  }

  return v7;
}

- (id)_itemsToUpdateForMediaObjectChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_itemsToUpdateForSiriEndpointProfileObjectChange:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForHomeKitSettingsChange:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForAccessorySettingChanges:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HFItemManager *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HFItemManager__itemsToUpdateForAccessorySettingChanges___block_invoke;
  v9[3] = &unk_1EA735040;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v4, "na_each:", v9);

  v7 = v6;
  return v7;
}

void __58__HFItemManager__itemsToUpdateForAccessorySettingChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_itemsToUpdateForAccessorySettingChange:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

- (id)_itemsToUpdateForAccessorySettingChange:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedSoftwareUpdateControllers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedSoftwareUpdates:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForSoftwareUpdateV2ChangeToAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_filter:", &__block_literal_global_411);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __68__HFItemManager__itemsToUpdateForSoftwareUpdateV2ChangeToAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hasSoftwareUpdateV2Dependency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_itemsToUpdateForSoftwareUpdateV2ProgressChangeToAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_filter:", &__block_literal_global_412);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __76__HFItemManager__itemsToUpdateForSoftwareUpdateV2ProgressChangeToAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hasSoftwareUpdateProgressV2Dependency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_itemsToUpdateForModifiedNetworkConfigurationProfiles:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForModifiedNetworkProtectionGroups:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_itemsToUpdateForTelevisionProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  HFItemManager *v12;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__HFItemManager__itemsToUpdateForTelevisionProfiles___block_invoke;
  v10[3] = &unk_1EA7350A8;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v4, "na_each:", v10);

  v8 = v7;
  return v8;
}

void __53__HFItemManager__itemsToUpdateForTelevisionProfiles___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "accessory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setWithSafeObject:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_itemsToUpdateForModifiedAccessories:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v6);

}

- (id)_itemsToUpdateForLightProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  return v6;
}

- (id)_itemsToUpdateForModifiedAccessCodes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  return v6;
}

- (id)_itemsToUpdateForModifiedMetadataForMediaDestinationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_filter:", &__block_literal_global_421);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __80__HFItemManager__itemsToUpdateForModifiedMetadataForMediaDestinationController___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("mediaDestinationIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_itemsToUpdateForModifiedPersonManagers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  return v6;
}

- (id)_itemsToUpdateForModifiedHomePersonManagerSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  return v6;
}

- (id)_itemsToUpdateForModifiedPersons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "na_map:", &__block_literal_global_426);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _itemsToUpdateForModifiedUUIDs:](self, "_itemsToUpdateForModifiedUUIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  return v6;
}

uint64_t __50__HFItemManager__itemsToUpdateForModifiedPersons___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (id)_itemsToUpdateForModifiedUUIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HFItemManager__itemsToUpdateForModifiedUUIDs___block_invoke;
  v9[3] = &unk_1EA7295B8;
  v10 = v4;
  v5 = v4;
  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsWithDependenciesPassingTest:forItems:](self, "_itemsWithDependenciesPassingTest:forItems:", v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __48__HFItemManager__itemsToUpdateForModifiedUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_map:", &__block_literal_global_428);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "intersectsSet:", v5);

  return v6;
}

id __48__HFItemManager__itemsToUpdateForModifiedUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  char v6;
  char isKindOfClass;
  void *v8;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v3 = v2;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v5, "hf_linkedAccessory");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(v2, "conformsToProtocol:", &unk_1F0408E78);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (((v6 & 1) != 0 || (isKindOfClass & 1) != 0) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(v2, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("object %@ is listed in HFResultDependentHomeKitObjectsKey but it does not actually implement HFHomeKitObject!"), v2);
    v8 = 0;
  }

  return v8;
}

- (id)_invalidationReasonsForAddedOrRemovedAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("accessory");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room", v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "roomForEntireHome");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(v6, "arrayByAddingObject:", CFSTR("room"));
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  return v6;
}

- (id)_invalidationReasonsForAddedOrRemovedMediaSystem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("mediaSystem");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_parentRoom", v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "roomForEntireHome");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(v6, "arrayByAddingObject:", CFSTR("room"));
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  return v6;
}

- (id)_itemsToUpdateForMediaSystemChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _directItemDependenciesForHomeKitObjects:class:](self, "_directItemDependenciesForHomeKitObjects:class:", v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_itemsToUpdateForMediaProfileContainer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HFItemManager _itemsToUpdateForMediaSystemChange:](self, "_itemsToUpdateForMediaSystemChange:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSLog(CFSTR("MediaProfileContainer is neither a media system or a media profile: %@"), v4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v4, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsToUpdateForModifiedAccessories:](self, "_itemsToUpdateForModifiedAccessories:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (id)_itemsToUpdateForHomeKitKeyPaths:(id)a3 forHomeKitObjectIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = v7;
  v15 = v6;
  v8 = v6;
  v9 = v7;
  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems", v13, 3221225472, __78__HFItemManager__itemsToUpdateForHomeKitKeyPaths_forHomeKitObjectIdentifiers___block_invoke, &unk_1EA735130);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsWithDependenciesPassingTest:forItems:](self, "_itemsWithDependenciesPassingTest:forItems:", &v13, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __78__HFItemManager__itemsToUpdateForHomeKitKeyPaths_forHomeKitObjectIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFResultSettingParentIdentifiersDependenciesKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intersectsSet:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    objc_opt_class();
    objc_msgSend(v3, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HFResultSettingKeyPathsDependenciesKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = objc_msgSend(*(id *)(a1 + 40), "intersectsSet:", v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_indexPathForItem:(id)a3 inDisplayedItemsArray:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v7
    && (v8 = -[HFItemManager _sectionForItem:](self, "_sectionForItem:", v6),
        v9 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v6),
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_itemsToUpdateForApplicationResignActive
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnit:(BOOL)a4
{
  void *v6;
  id v7;
  id v8;

  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager _itemsWithDependenciesPassingTest:forItems:](self, "_itemsWithDependenciesPassingTest:forItems:", &__block_literal_global_442, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v8, a2);
}

uint64_t __66__HFItemManager_temperatureUnitObserver_didChangeTemperatureUnit___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("tempreatureUnitDependency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)settingsInvalidatedForNotificationCenter:(id)a3
{
  void *v5;
  id v6;
  id v7;

  -[HFItemManager _allItemsIncludingInternalItems](self, "_allItemsIncludingInternalItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_filter:", &__block_literal_global_443);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v7, a2);
}

uint64_t __58__HFItemManager_settingsInvalidatedForNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("userNotificationSettingsDependency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_debug_itemManagerDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_prettyDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager disableUpdateReasons](self, "disableUpdateReasons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> delegate: <%@:%p> home: %@ disableUpdateReasons: {%@}"), v5, self, v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)numberOfSections
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (id)attributedTitleForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedHeaderTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)footerTitleForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)attributedFooterTitleForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedFooterTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)itemSectionForSectionIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __86__HFItemManager__batchItemUpdateFutureWrappers_removedItems_batchingIntervals_logger___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

void __59__HFItemManager__updateExternalUpdatesEnabled_reloadItems___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "recalculateVisibilityAndSortAllItems");

}

- (void)reloadUIRepresentationForItems:(id)a3 withAnimation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "snapshot");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "reloadItemsWithIdentifiers:", v6);
  -[HFItemManager _applyReloadSnapshot:withAnimation:](self, "_applyReloadSnapshot:withAnimation:", v8, v4);

}

- (void)reconfigureUIRepresentationForItems:(id)a3 withAnimation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "snapshot");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "reconfigureItemsWithIdentifiers:", v6);
  -[HFItemManager _applyReloadSnapshot:withAnimation:](self, "_applyReloadSnapshot:withAnimation:", v8, v4);

}

- (void)reloadUIRepresentationForSections:(id)a3 withAnimation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "snapshot");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "reloadSectionsWithIdentifiers:", v6);
  -[HFItemManager _applyReloadSnapshot:withAnimation:](self, "_applyReloadSnapshot:withAnimation:", v8, v4);

}

- (void)reloadUIRepresentationWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[HFItemManager diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemManager _applyReloadSnapshot:withAnimation:](self, "_applyReloadSnapshot:withAnimation:", v6, v3);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setDiffableDataSourceDisabled:(BOOL)a3
{
  self->_diffableDataSourceDisabled = a3;
}

- (void)setChildItemsByParentItem:(id)a3
{
  objc_storeStrong((id *)&self->_childItemsByParentItem, a3);
}

- (void)set_displayFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setSuppressedCharacteristicUpdatesByReason:(id)a3
{
  objc_storeStrong((id *)&self->_suppressedCharacteristicUpdatesByReason, a3);
}

- (void)setBatchedDelegateAdapterAllowingReads:(id)a3
{
  objc_storeStrong((id *)&self->_batchedDelegateAdapterAllowingReads, a3);
}

- (void)setBatchedDelegateAdapterDisallowingReads:(id)a3
{
  objc_storeStrong((id *)&self->_batchedDelegateAdapterDisallowingReads, a3);
}

- (void)setUIDiffableDataInitializationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_UIDiffableDataInitializationFuture, a3);
}

- (OS_dispatch_queue)diffableDataSourceQueue
{
  return self->_diffableDataSourceQueue;
}

- (NAScheduler)diffableDataSourceScheduler
{
  return self->_diffableDataSourceScheduler;
}

- (OS_dispatch_group)mainThreadLoadGroup
{
  return self->_mainThreadLoadGroup;
}

- (void)setMainThreadLoadGroup:(id)a3
{
  objc_storeStrong((id *)&self->_mainThreadLoadGroup, a3);
}

- (id)matterSnapshotObserverCancelable
{
  return self->_matterSnapshotObserverCancelable;
}

- (void)setMatterSnapshotObserverCancelable:(id)a3
{
  objc_storeStrong(&self->_matterSnapshotObserverCancelable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_matterSnapshotObserverCancelable, 0);
  objc_storeStrong((id *)&self->_latestSnapshotGenerationFuture, 0);
  objc_storeStrong((id *)&self->_mainThreadLoadGroup, 0);
  objc_storeStrong((id *)&self->_diffableDataSourceScheduler, 0);
  objc_storeStrong((id *)&self->_diffableDataSourceQueue, 0);
  objc_storeStrong((id *)&self->_UIDiffableDataInitializationFuture, 0);
  objc_storeStrong((id *)&self->_firstFullUpdateFuture, 0);
  objc_storeStrong((id *)&self->_batchedDelegateAdapterDisallowingReads, 0);
  objc_storeStrong((id *)&self->_batchedDelegateAdapterAllowingReads, 0);
  objc_storeStrong((id *)&self->_disableUpdateReasons, 0);
  objc_storeStrong((id *)&self->_suppressedCharacteristicUpdatesByReason, 0);
  objc_storeStrong(&self->__displayFilter, 0);
  objc_storeStrong((id *)&self->_childItemsByParentItem, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_lastUpdatedHome, 0);
  objc_storeStrong((id *)&self->_moduleItemProviderSet, 0);
  objc_storeStrong((id *)&self->_subclassItemProviderSet, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_firstFastUpdateFuture, 0);
  objc_storeStrong((id *)&self->_readPolicy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_itemModules, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)moveItemFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "section");
  if (v8 == objc_msgSend(v7, "section"))
  {
    -[HFItemManager displayedItemAtIndexPath:](self, "displayedItemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager displayedItemAtIndexPath:](self, "displayedItemAtIndexPath:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "section");
    -[HFItemManager diffableDataSource](self, "diffableDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v6, "row");
    if (v14 < objc_msgSend(v7, "row"))
      objc_msgSend(v13, "moveItemWithIdentifier:afterItemWithIdentifier:", v9, v10);
    v15 = objc_msgSend(v6, "row");
    if (v15 > objc_msgSend(v7, "row"))
      objc_msgSend(v13, "moveItemWithIdentifier:beforeItemWithIdentifier:", v9, v10);
    v16 = (void *)MEMORY[0x1E0D519C0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__HFItemManager_DiffableDataSource__moveItemFromIndexPath_toIndexPath___block_invoke;
    v20[3] = &unk_1EA726388;
    v21 = v13;
    v22 = v11;
    v17 = v13;
    objc_msgSend(v16, "futureWithBlock:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __71__HFItemManager_DiffableDataSource__moveItemFromIndexPath_toIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "itemIdentifiersInSectionWithIdentifier:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v6);

}

- (void)_applyReloadSnapshot:(id)a3 withAnimation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  _QWORD aBlock[5];
  id v15;

  v4 = a4;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke;
  aBlock[3] = &unk_1EA727188;
  aBlock[4] = self;
  v8 = v6;
  v15 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = v9;
  if (v4)
  {
    v9[2](v9);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_4;
    v12[3] = &unk_1EA73AD88;
    v13 = v9;
    objc_msgSend(v11, "performWithoutAnimation:", v12);

  }
}

void __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_2;
  v3[3] = &unk_1EA732BD8;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "applyWithBlock:", v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(WeakRetained, "diffableDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_3;
  v8[3] = &unk_1EA727DD8;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v4, "applySnapshot:animatingDifferences:completion:", v5, 1, v8);

  return v6;
}

uint64_t __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

uint64_t __72__HFItemManager_DiffableDataSource___applyReloadSnapshot_withAnimation___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldPerformInitialLoadOnMainThread
{
  return 0;
}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  objc_msgSend(a3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_4;
  v6[3] = &unk_1EA73D868;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v4, "na_each:", v6);

}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_4(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  id *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a1[4], "diffableDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v9);

  if (!v6)
  {
    v7 = v9;
    v8 = a1 + 7;
    goto LABEL_5;
  }
  if (objc_msgSend(a1[5], "containsObject:", v9))
  {
    v7 = v9;
    v8 = a1 + 6;
LABEL_5:
    objc_msgSend(*v8, "addObject:", v7);
  }

}

void __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = (objc_class *)MEMORY[0x1E0D519C0];
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 40), "diffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_7;
  v12[3] = &unk_1EA727DD8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "applySnapshot:toSection:animatingDifferences:completion:", v6, v7, v10, v12);

}

uint64_t __94__HFItemManager_DiffableDataSource__applySnapshotForUpdatedExternalItems_removedItems_logger___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (BOOL)_shouldPerformUpdateOnMainThread
{
  BOOL v3;
  void *v4;
  NSObject *v5;
  BOOL v6;

  v3 = -[HFItemManager useCustomDiffableDataSource](self, "useCustomDiffableDataSource")
    || -[HFItemManager diffableDataSourceDisabled](self, "diffableDataSourceDisabled");
  -[HFItemManager mainThreadLoadGroup](self, "mainThreadLoadGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HFItemManager mainThreadLoadGroup](self, "mainThreadLoadGroup");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_group_wait(v5, 0) != 0;

  }
  else
  {
    v6 = 1;
  }

  return v3 | (-[HFItemManager shouldPerformInitialLoadOnMainThread](self, "shouldPerformInitialLoadOnMainThread") && v6);
}

@end
