@implementation HFEventBuilderItemProvider

- (HFEventBuilderItemProvider)initWithTriggerBuilder:(id)a3
{
  id v5;
  HFEventBuilderItemProvider *v6;
  uint64_t v7;
  HMHome *home;
  uint64_t v9;
  NSMutableSet *eventBuilderItems;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFEventBuilderItemProvider;
  v6 = -[HFItemProvider init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "home");
    v7 = objc_claimAutoreleasedReturnValue();
    home = v6->_home;
    v6->_home = (HMHome *)v7;

    objc_storeStrong((id *)&v6->_triggerBuilder, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    eventBuilderItems = v6->_eventBuilderItems;
    v6->_eventBuilderItems = (NSMutableSet *)v9;

  }
  return v6;
}

- (HFEventBuilderItemProvider)initWithEventBuilders:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  HFEventBuilderItemProvider *v9;
  HFEventBuilderItemProvider *v10;
  uint64_t v11;
  NSMutableSet *eventBuilderItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFEventBuilderItemProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_storeStrong((id *)&v10->_eventBuilders, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    eventBuilderItems = v10->_eventBuilderItems;
    v10->_eventBuilderItems = (NSMutableSet *)v11;

  }
  return v10;
}

- (NSSet)eventBuilders
{
  NSSet *eventBuilders;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  eventBuilders = self->_eventBuilders;
  if (!eventBuilders)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[HFEventBuilderItemProvider triggerBuilder](self, "triggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventBuilders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_eventBuilders;
    self->_eventBuilders = v7;

    eventBuilders = self->_eventBuilders;
  }
  return eventBuilders;
}

- (HFTriggerNaturalLanguageOptions)naturalLanguageOptions
{
  HFTriggerNaturalLanguageOptions *naturalLanguageOptions;
  HFTriggerNaturalLanguageOptions *v4;
  void *v5;
  HFTriggerNaturalLanguageOptions *v6;
  HFTriggerNaturalLanguageOptions *v7;

  naturalLanguageOptions = self->_naturalLanguageOptions;
  if (!naturalLanguageOptions)
  {
    v4 = [HFTriggerNaturalLanguageOptions alloc];
    -[HFEventBuilderItemProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HFTriggerNaturalLanguageOptions initWithHome:nameType:](v4, "initWithHome:nameType:", v5, 2);
    v7 = self->_naturalLanguageOptions;
    self->_naturalLanguageOptions = v6;

    naturalLanguageOptions = self->_naturalLanguageOptions;
  }
  return naturalLanguageOptions;
}

- (unint64_t)nameType
{
  void *v2;
  unint64_t v3;

  -[HFEventBuilderItemProvider naturalLanguageOptions](self, "naturalLanguageOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nameType");

  return v3;
}

- (void)setNameType:(unint64_t)a3
{
  id v4;

  -[HFEventBuilderItemProvider naturalLanguageOptions](self, "naturalLanguageOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNameType:", a3);

}

- (id)reloadItems
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[HFEventBuilderItemProvider _reloadItems](self, "_reloadItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__HFEventBuilderItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_1EA726E30;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __41__HFEventBuilderItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "eventBuilderItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "eventBuilderItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFEventBuilderItemProvider reloadBuilderGroups](self, "reloadBuilderGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HFEventBuilderItemProvider__reloadItems__block_invoke_4;
  v7[3] = &unk_1EA731320;
  v7[4] = self;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v4, &__block_literal_global_77, &__block_literal_global_6_2, &__block_literal_global_8_1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __42__HFEventBuilderItemProvider__reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "comparisonKey");
}

uint64_t __42__HFEventBuilderItemProvider__reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "comparisonKey");
}

uint64_t __42__HFEventBuilderItemProvider__reloadItems__block_invoke_3()
{
  return 1;
}

id __42__HFEventBuilderItemProvider__reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "eventBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFEventBuilderItem eventBuilderItemForEventBuilders:](HFEventBuilderItem, "eventBuilderItemForEventBuilders:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "comparisonKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setComparisonKey:", v6);
  objc_msgSend(*(id *)(a1 + 32), "naturalLanguageOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setNaturalLanguageOptions:", v8);

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContainingTriggerBuilder:", v12);

  return v9;
}

- (id)reloadBuilderGroups
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;

  -[HFEventBuilderItemProvider lastUpdateEventBuilders](self, "lastUpdateEventBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[HFEventBuilderItemProvider eventBuilders](self, "eventBuilders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFEventBuilderItemProvider lastUpdateEventGroups](self, "lastUpdateEventGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __49__HFEventBuilderItemProvider_reloadBuilderGroups__block_invoke;
  v24[3] = &unk_1EA731348;
  v10 = v8;
  v25 = v10;
  objc_msgSend(v9, "na_filter:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v10, "additions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v10, "updates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unionSet:", v18);

  -[HFEventBuilderItemProvider eventBuilderGroupsForEventBuilders:](self, "eventBuilderGroupsForEventBuilders:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unionSet:", v19);

  v20 = (void *)objc_msgSend(v15, "copy");
  -[HFEventBuilderItemProvider setLastUpdateEventGroups:](self, "setLastUpdateEventGroups:", v20);

  -[HFEventBuilderItemProvider eventBuilders](self, "eventBuilders");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[HFEventBuilderItemProvider setLastUpdateEventBuilders:](self, "setLastUpdateEventBuilders:", v22);

  return v15;
}

uint64_t __49__HFEventBuilderItemProvider_reloadBuilderGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "eventBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "additions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "intersectsSet:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "eventBuilders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deletions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "intersectsSet:", v8) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "eventBuilders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "updates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "intersectsSet:", v10) ^ 1;

    }
  }

  return v6;
}

- (id)eventBuilderGroupsForEventBuilders:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke;
  v22[3] = &unk_1EA731398;
  v22[4] = self;
  v23 = v7;
  v9 = v7;
  objc_msgSend(v5, "na_each:", v22);
  v10 = (void *)objc_msgSend(v5, "mutableCopy");

  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_3;
  v19[3] = &unk_1EA731468;
  v19[4] = self;
  v20 = v10;
  v11 = v6;
  v21 = v11;
  v12 = v10;
  objc_msgSend(v9, "na_each:", v19);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_7;
  v17[3] = &unk_1EA729BE0;
  v13 = v11;
  v18 = v13;
  objc_msgSend(v12, "na_each:", v17);
  v14 = v18;
  v15 = v13;

  return v15;
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  objc_opt_class();
  v10 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v10;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "characteristic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_serviceGroupsForService:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_2;
    v11[3] = &unk_1EA731370;
    v12 = *(id *)(a1 + 40);
    v13 = v10;
    objc_msgSend(v9, "na_each:", v11);

  }
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;

  objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 40));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v4, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_serviceGroupWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    objc_msgSend(v10, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_19_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_5;
    v11[3] = &unk_1EA731440;
    v12 = v10;
    v13 = v8;
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
}

id __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "triggerValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      v10 = 0;
      v11 = 0;
      goto LABEL_9;
    }
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v2;
    objc_msgSend(v5, "thresholdRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thresholdRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v7, v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v2, "characteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v3 && v10)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = objc_opt_class();
    objc_msgSend(v10, "characteristicType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:%@:%@"), v13, v14, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v11;
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_27_3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 40), "services");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToSet:", v10);

    if (v11)
    {
      v12 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minusSet:", v13);

      +[HFEventBuilderItemProviderEventGroup eventGroupWithBuilders:](HFEventBuilderItemProviderEventGroup, "eventGroupWithBuilders:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setComparisonKey:", v15);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);

    }
  }

}

id __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __65__HFEventBuilderItemProvider_eventBuilderGroupsForEventBuilders___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a2;
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFEventBuilderItemProviderEventGroup eventGroupWithBuilders:](HFEventBuilderItemProviderEventGroup, "eventGroupWithBuilders:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "comparisonKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setComparisonKey:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (void)setEventBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_eventBuilders, a3);
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)lastUpdateEventBuilders
{
  return self->_lastUpdateEventBuilders;
}

- (void)setLastUpdateEventBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateEventBuilders, a3);
}

- (NSSet)lastUpdateEventGroups
{
  return self->_lastUpdateEventGroups;
}

- (void)setLastUpdateEventGroups:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateEventGroups, a3);
}

- (void)setNaturalLanguageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_naturalLanguageOptions, a3);
}

- (NSMutableSet)eventBuilderItems
{
  return self->_eventBuilderItems;
}

- (void)setEventBuilderItems:(id)a3
{
  objc_storeStrong((id *)&self->_eventBuilderItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBuilderItems, 0);
  objc_storeStrong((id *)&self->_naturalLanguageOptions, 0);
  objc_storeStrong((id *)&self->_lastUpdateEventGroups, 0);
  objc_storeStrong((id *)&self->_lastUpdateEventBuilders, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_eventBuilders, 0);
}

@end
