@implementation HFAccessoryControlItemProvider

- (HFAccessoryControlItemProvider)initWithAccessoryItem:(id)a3
{
  id v5;
  HFAccessoryControlItemProvider *v6;
  HFAccessoryControlItemProvider *v7;
  uint64_t v8;
  NSSet *previousControlItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryControlItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryItem, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    previousControlItems = v7->_previousControlItems;
    v7->_previousControlItems = (NSSet *)v8;

  }
  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  -[HFAccessoryControlItemProvider valueSource](self, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFStaticReadPolicy policyWithDecision:](HFStaticReadPolicy, "policyWithDecision:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginTransactionWithReason:readPolicy:logger:", CFSTR("HFAccessoryControlItemProviderDisableReads"), v4, 0);

  objc_initWeak(&location, self);
  -[HFAccessoryControlItemProvider accessoryItem](self, "accessoryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __45__HFAccessoryControlItemProvider_reloadItems__block_invoke;
  v13 = &unk_1EA72AF60;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v6, "flatMap:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessoryControlItemProvider valueSource](self, "valueSource", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commitTransactionWithReason:", CFSTR("HFAccessoryControlItemProviderDisableReads"));

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v7;
}

id __45__HFAccessoryControlItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFItemProviderReloadResults *v12;
  void *v13;
  void *v14;
  void *v15;
  HFItemProviderReloadResults *v16;
  void *v17;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("collatedChildItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_filter:", &__block_literal_global_220);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "previousControlItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_setByDiffingWithSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "previousControlItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [HFItemProviderReloadResults alloc];
  objc_msgSend(v11, "additions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deletions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:](v12, "initWithAddedItems:removedItems:existingItems:", v13, v14, v15);

  objc_msgSend(WeakRetained, "setPreviousControlItems:", v9);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __45__HFAccessoryControlItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryControlItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("service");
  v7[1] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (HFAccessoryItem)accessoryItem
{
  return self->_accessoryItem;
}

- (void)setAccessoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryItem, a3);
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (NSSet)previousControlItems
{
  return self->_previousControlItems;
}

- (void)setPreviousControlItems:(id)a3
{
  objc_storeStrong((id *)&self->_previousControlItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousControlItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessoryItem, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
