@implementation HUAccessorySceneListContentItemManager

- (HUAccessorySceneListContentItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 shouldGroupByRoom:(BOOL)a5 shouldShowSectionHeaders:(BOOL)a6 itemProvidersCreator:(id)a7
{
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_contentSource_serviceLikeItem_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySceneListContentItemManager.m"), 23, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAccessorySceneListContentItemManager initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:item"
    "ProvidersCreator:]",
    v10);

  return 0;
}

- (HUAccessorySceneListContentItemManager)initWithDelegate:(id)a3 contentSource:(unint64_t)a4 serviceLikeItem:(id)a5
{
  id v9;
  HUAccessorySceneListContentItemManager *v10;
  HUAccessorySceneListContentItemManager *v11;
  uint64_t v12;
  NSMutableDictionary *committedActionBuildersByActionSetID;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HUAccessorySceneListContentItemManager;
  v10 = -[HUServiceGridItemManager initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:](&v15, sel_initWithDelegate_sourceItem_shouldGroupByRoom_shouldShowSectionHeaders_itemProvidersCreator_, a3, 0, 0, 0, &__block_literal_global_231);
  v11 = v10;
  if (v10)
  {
    v10->_contentSource = a4;
    objc_storeStrong((id *)&v10->_serviceLikeItem, a5);
    v12 = objc_opt_new();
    committedActionBuildersByActionSetID = v11->_committedActionBuildersByActionSetID;
    v11->_committedActionBuildersByActionSetID = (NSMutableDictionary *)v12;

  }
  return v11;
}

uint64_t __89__HUAccessorySceneListContentItemManager_initWithDelegate_contentSource_serviceLikeItem___block_invoke()
{
  return MEMORY[0x1E0C9AA60];
}

+ (id)createItemProviderForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5 persistAddedSuggestions:(BOOL)a6
{
  void *v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (a3 == 1)
  {
    v12 = objc_alloc(MEMORY[0x1E0D33520]);
    v18[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v12, "initWithHome:andServiceLikeItems:", v11, v13);

    objc_msgSend(v6, "setEngineOptions:", objc_msgSend(v6, "engineOptions") & 0xFFFFFFFFFFFFFFEFLL);
  }
  else if (!a3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31150]), "initWithHome:actionSetItemStyle:", v11, 0);
    objc_msgSend(v6, "setServiceLikeItem:", v10);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __122__HUAccessorySceneListContentItemManager_createItemProviderForContentSource_serviceLikeItem_home_persistAddedSuggestions___block_invoke;
    v15[3] = &unk_1E6F5C2D0;
    v17 = a1;
    v16 = v10;
    objc_msgSend(v6, "setFilter:", v15);

  }
  return v6;
}

uint64_t __122__HUAccessorySceneListContentItemManager_createItemProviderForContentSource_serviceLikeItem_home_persistAddedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __122__HUAccessorySceneListContentItemManager_createItemProviderForContentSource_serviceLikeItem_home_persistAddedSuggestions___block_invoke_2;
  v12[3] = &unk_1E6F5C2A8;
  v11 = *(_OWORD *)(a1 + 32);
  v8 = (id)v11;
  v13 = v11;
  v9 = objc_msgSend(v7, "na_any:", v12);

  return v9;
}

uint64_t __122__HUAccessorySceneListContentItemManager_createItemProviderForContentSource_serviceLikeItem_home_persistAddedSuggestions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_action:involvesServiceLikeItem:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)computeNumberOfItemsToDisplayForContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a4;
  v9 = a5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__28;
  v19 = __Block_byref_object_dispose__28;
  objc_msgSend(a1, "createItemProviderForContentSource:serviceLikeItem:home:persistAddedSuggestions:", a3, v8, v9, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16[5], "reloadItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMap:", &__block_literal_global_18_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke_3;
  v14[3] = &unk_1E6F5C3B8;
  v14[4] = &v15;
  objc_msgSend(v11, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v15, 8);
  return v12;
}

id __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_21_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "combineAllFutures:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
}

id __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "na_filter:", &__block_literal_global_23_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "count");
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v13 = 134218242;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Computed number of items to display: %lu with item provider: %@", (uint8_t *)&v13, 0x16u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __109__HUAccessorySceneListContentItemManager_computeNumberOfItemsToDisplayForContentSource_serviceLikeItem_home___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == (id)MEMORY[0x1E0C9AAB0])
  {
    v4 = 0;
  }
  else if (v2)
  {
    v4 = objc_msgSend(v2, "isEqual:", MEMORY[0x1E0C9AAB0]) ^ 1;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)actionSetBuilderForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D31140]);
    objc_msgSend(v7, "actionSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithExistingObject:inHome:", v9, v10);

  }
  else
  {
    objc_msgSend(v5, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D30B20];
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B20]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v5, "latestResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NSLog(CFSTR("Unexpected item %@"), v5);
      v11 = 0;
    }
  }

  return v11;
}

- (void)setPersistAddedSuggestions:(BOOL)a3
{
  self->_persistAddedSuggestions = a3;
}

- (id)commitSelectionChangesWithSelectedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  HUAccessorySceneListContentItemManager *v16;
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke;
  v15 = &unk_1E6F5C448;
  v16 = self;
  v17 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_map:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects", v12, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combineAllFutures:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionSetBuilderForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "committedActionBuildersByActionSetID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v7, &__block_literal_global_31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3))
    {
      objc_msgSend(v4, "actions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "na_filter:", &__block_literal_global_34_3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v10);

    }
    else
    {
      if (!objc_msgSend(v8, "count"))
      {
        v11 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v4, "actions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_4;
      v15[3] = &unk_1E6F5C420;
      v16 = v8;
      v17 = v4;
      objc_msgSend(v13, "na_each:", v15);

      v9 = v16;
    }

    objc_msgSend(v4, "commitItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

uint64_t __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

BOOL __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_5;
  v6[3] = &unk_1E6F4EFD8;
  v5 = v3;
  v7 = v5;
  if (objc_msgSend(v4, "na_any:", v6))
    objc_msgSend(*(id *)(a1 + 40), "removeAction:", v5);

}

uint64_t __82__HUAccessorySceneListContentItemManager_commitSelectionChangesWithSelectedItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "createNewAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasSameTargetAsAction:", v4);

  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUAccessorySceneListContentItemManager contentSource](self, "contentSource");
  -[HUAccessorySceneListContentItemManager serviceLikeItem](self, "serviceLikeItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessorySceneListContentItemManager createItemProviderForContentSource:serviceLikeItem:home:persistAddedSuggestions:](HUAccessorySceneListContentItemManager, "createItemProviderForContentSource:serviceLikeItem:home:persistAddedSuggestions:", v5, v6, v4, -[HUAccessorySceneListContentItemManager persistAddedSuggestions](self, "persistAddedSuggestions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E7041740, *MEMORY[0x1E0D30E20]);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HUAccessorySceneListContentItemManager;
    -[HFItemManager _transformedUpdateOutcomeForItem:proposedOutcome:](&v10, sel__transformedUpdateOutcomeForItem_proposedOutcome_, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)suggestionItemProvider
{
  void *v2;
  void *v3;

  -[HFItemManager itemProviders](self, "itemProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_42_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __64__HUAccessorySceneListContentItemManager_suggestionItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)_action:(id)a3 involvesServiceLikeItem:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "hf_affectedCharacteristic");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_4;
  v8 = (void *)v7;
  objc_msgSend(v6, "services");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_affectedCharacteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "containsObject:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
LABEL_4:
    v14 = v6;
    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF2AC770))
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v5, "hf_affectedAccessoryProfiles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v16, "profiles");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hf_affectedAccessoryProfiles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "intersectsSet:", v19);

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)contentSource
{
  return self->_contentSource;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (BOOL)persistAddedSuggestions
{
  return self->_persistAddedSuggestions;
}

- (NSMutableDictionary)committedActionBuildersByActionSetID
{
  return self->_committedActionBuildersByActionSetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_committedActionBuildersByActionSetID, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
}

@end
