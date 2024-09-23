@implementation HRERecommendationItemProvider

- (HRERecommendationItemProvider)initWithHome:(id)a3 andServiceLikeItems:(id)a4
{
  id v7;
  id v8;
  HRERecommendationItemProvider *v9;
  HRERecommendationItemProvider *v10;
  HFAccessoryTypeGroup *accessoryTypeGroup;
  uint64_t v12;
  NSMutableSet *recommendationItems;
  HRERecommendationEngine *v14;
  HRERecommendationEngine *recommendationEngine;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HRERecommendationItemProvider;
  v9 = -[HFItemProvider init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_serviceLikeItems, a4);
    accessoryTypeGroup = v10->_accessoryTypeGroup;
    v10->_accessoryTypeGroup = 0;

    v12 = objc_opt_new();
    recommendationItems = v10->_recommendationItems;
    v10->_recommendationItems = (NSMutableSet *)v12;

    v14 = objc_alloc_init(HRERecommendationEngine);
    recommendationEngine = v10->_recommendationEngine;
    v10->_recommendationEngine = v14;

    v10->_updatesDisabled = 0;
    v10->_engineOptions = 83;
    v10->_firstUpdateComplete = 0;
  }

  return v10;
}

- (HRERecommendationItemProvider)initWithHome:(id)a3 andAccessoryTypeGroup:(id)a4
{
  id v7;
  HRERecommendationItemProvider *v8;
  HRERecommendationItemProvider *v9;

  v7 = a4;
  v8 = -[HRERecommendationItemProvider initWithHome:andServiceLikeItems:](self, "initWithHome:andServiceLikeItems:", a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_accessoryTypeGroup, a4);

  return v9;
}

- (HRERecommendationItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HRERecommendationItemProvider.m"), 52, CFSTR("%s is unavailable; use %@ instead"),
    "-[HRERecommendationItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HRERecommendationItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRERecommendationItemProvider serviceLikeItems](self, "serviceLikeItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:andServiceLikeItems:", v5, v6);

  objc_msgSend(v7, "setEngineOptions:", -[HRERecommendationItemProvider engineOptions](self, "engineOptions"));
  -[HRERecommendationItemProvider filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilter:", v8);

  return v7;
}

- (id)reloadItems
{
  void *v3;
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
  _QWORD v15[5];
  _QWORD v16[5];

  if (-[HRERecommendationItemProvider updatesDisabled](self, "updatesDisabled"))
  {
    v3 = (void *)MEMORY[0x24BE6B608];
    v4 = objc_alloc(MEMORY[0x24BE4D0D0]);
    -[HRERecommendationItemProvider items](self, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithAddedItems:removedItems:existingItems:", 0, 0, v5);
    objc_msgSend(v3, "futureWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HRERecommendationItemProvider accessoryTypeGroup](self, "accessoryTypeGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRERecommendationItemProvider recommendationEngine](self, "recommendationEngine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HRERecommendationItemProvider accessoryTypeGroup](self, "accessoryTypeGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRERecommendationItemProvider home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recommendationsForAccessoryTypeGroup:inHome:options:", v10, v11, -[HRERecommendationItemProvider engineOptions](self, "engineOptions"));
    }
    else
    {
      -[HRERecommendationItemProvider serviceLikeItems](self, "serviceLikeItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRERecommendationItemProvider home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "generateRecommendationsForServiceLikeItems:inHome:options:", v10, v11, -[HRERecommendationItemProvider engineOptions](self, "engineOptions"));
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __44__HRERecommendationItemProvider_reloadItems__block_invoke;
    v16[3] = &unk_24F218728;
    v16[4] = self;
    objc_msgSend(v5, "flatMap:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __44__HRERecommendationItemProvider_reloadItems__block_invoke_7;
    v15[3] = &unk_24F218750;
    v15[4] = self;
    objc_msgSend(v13, "flatMap:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __44__HRERecommendationItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[5];

  v3 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __44__HRERecommendationItemProvider_reloadItems__block_invoke_2;
  v17[3] = &unk_24F217A28;
  v17[4] = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "na_filter:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "filterRecommendations:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "recommendationItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  v13 = 3221225472;
  v14 = __44__HRERecommendationItemProvider_reloadItems__block_invoke_4;
  v15 = &unk_24F2186A0;
  v16 = v7;
  v9 = v7;
  objc_msgSend(v8, "na_each:", &v12);

  objc_msgSend(*(id *)(a1 + 32), "reloadItemsWithRecommendations:filter:itemMap:", v6, &__block_literal_global_12_2, &__block_literal_global_14_1, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __44__HRERecommendationItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "filter");
    v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v3);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __44__HRERecommendationItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

void __44__HRERecommendationItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "recommendation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v8, "setRecommendation:", v7);

}

uint64_t __44__HRERecommendationItemProvider_reloadItems__block_invoke_5()
{
  return 1;
}

HRERecommendationItem *__44__HRERecommendationItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  HRERecommendationItem *v3;

  v2 = a2;
  v3 = -[HRERecommendationItem initWithRecommendation:]([HRERecommendationItem alloc], "initWithRecommendation:", v2);

  return v3;
}

id __44__HRERecommendationItemProvider_reloadItems__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recommendationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  objc_msgSend(*(id *)(a1 + 32), "recommendationItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v7);

  objc_msgSend(*(id *)(a1 + 32), "setFirstUpdateComplete:", 1);
  objc_msgSend(*(id *)(a1 + 32), "configureBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "addedItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __44__HRERecommendationItemProvider_reloadItems__block_invoke_8;
    v12[3] = &unk_24F2186A0;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "na_each:", v12);

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __44__HRERecommendationItemProvider_reloadItems__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void (**v4)(id, id);

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "configureBlock");
  v4 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (id)reloadItemsWithRecommendations:(id)a3 filter:(id)a4 itemMap:(id)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__HRERecommendationItemProvider_reloadItemsWithRecommendations_filter_itemMap___block_invoke_2;
  v6[3] = &unk_24F218798;
  v6[4] = self;
  v6[5] = a2;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", a3, &__block_literal_global_18, v6, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __79__HRERecommendationItemProvider_reloadItemsWithRecommendations_filter_itemMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

id __79__HRERecommendationItemProvider_reloadItemsWithRecommendations_filter_itemMap___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HRERecommendationItemProvider.m"), 115, CFSTR("HRERecommendationItemProvider expects all existing items to be recommendation items"));

  }
  objc_msgSend(v3, "recommendation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)items
{
  void *v2;
  void *v3;

  -[HRERecommendationItemProvider recommendationItems](self, "recommendationItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)invalidationReasons
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HRERecommendationItemProvider;
  -[HFItemProvider invalidationReasons](&v10, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE4CEE8];
  v11[0] = *MEMORY[0x24BE4CF08];
  v11[1] = v3;
  v4 = *MEMORY[0x24BE4CF00];
  v11[2] = *MEMORY[0x24BE4CEF8];
  v11[3] = v4;
  v5 = *MEMORY[0x24BE4CEE0];
  v11[4] = *MEMORY[0x24BE4CF18];
  v11[5] = v5;
  v6 = *MEMORY[0x24BE4CF10];
  v11[6] = *MEMORY[0x24BE4CEF0];
  v11[7] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)filterRecommendations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "na_filter:", &__block_literal_global_25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_highestRankRecommendations:forKeyGenerator:", v5, &__block_literal_global_28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_highestRankRecommendations:forKeyGenerator:", v6, &__block_literal_global_29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_highestRankRecommendations:forKeyGenerator:", v7, &__block_literal_global_31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    v4 = v9;
  }
  else
  {
    v9 = (id)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

uint64_t __55__HRERecommendationItemProvider_filterRecommendations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hf_hasEnabledResident");

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

id __55__HRERecommendationItemProvider_filterRecommendations___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "selectedTriggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __55__HRERecommendationItemProvider_filterRecommendations___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "selectedActionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __55__HRERecommendationItemProvider_filterRecommendations___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "selectedActionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "selectedActionSetBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)_highestRankRecommendations:(id)a3 forKeyGenerator:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__HRERecommendationItemProvider__highestRankRecommendations_forKeyGenerator___block_invoke;
  v15[3] = &unk_24F218860;
  v16 = v5;
  v7 = v5;
  objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __77__HRERecommendationItemProvider__highestRankRecommendations_forKeyGenerator___block_invoke_2;
  v13[3] = &unk_24F218888;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "na_flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

__CFString *__77__HRERecommendationItemProvider__highestRankRecommendations_forKeyGenerator___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  __CFString *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = CFSTR("(null)");

  return v3;
}

id __77__HRERecommendationItemProvider__highestRankRecommendations_forKeyGenerator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "isEqual:", CFSTR("(null)")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRERecommendation highestRankInRecommendations:](HRERecommendation, "highestRankInRecommendations:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)serviceLikeItems
{
  return self->_serviceLikeItems;
}

- (HFAccessoryTypeGroup)accessoryTypeGroup
{
  return self->_accessoryTypeGroup;
}

- (unint64_t)engineOptions
{
  return self->_engineOptions;
}

- (void)setEngineOptions:(unint64_t)a3
{
  self->_engineOptions = a3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)configureBlock
{
  return self->_configureBlock;
}

- (void)setConfigureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)firstUpdateComplete
{
  return self->_firstUpdateComplete;
}

- (void)setFirstUpdateComplete:(BOOL)a3
{
  self->_firstUpdateComplete = a3;
}

- (BOOL)updatesDisabled
{
  return self->_updatesDisabled;
}

- (void)setUpdatesDisabled:(BOOL)a3
{
  self->_updatesDisabled = a3;
}

- (HRERecommendationEngine)recommendationEngine
{
  return self->_recommendationEngine;
}

- (void)setRecommendationEngine:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationEngine, a3);
}

- (NSMutableSet)recommendationItems
{
  return self->_recommendationItems;
}

- (void)setRecommendationItems:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationItems, 0);
  objc_storeStrong((id *)&self->_recommendationEngine, 0);
  objc_storeStrong(&self->_configureBlock, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_accessoryTypeGroup, 0);
  objc_storeStrong((id *)&self->_serviceLikeItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
