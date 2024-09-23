@implementation HFGenericAccessoryItemProvider

- (HFGenericAccessoryItemProvider)initWithHome:(id)a3
{
  id v5;
  HFGenericAccessoryItemProvider *v6;
  HFGenericAccessoryItemProvider *v7;
  uint64_t v8;
  NSMutableSet *genericItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFGenericAccessoryItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = objc_opt_new();
    genericItems = v7->_genericItems;
    v7->_genericItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (HFGenericAccessoryItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFGenericAccessoryItemProvider.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFGenericAccessoryItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFGenericAccessoryItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id location;

  -[HFGenericAccessoryItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_237);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HFGenericAccessoryItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_1EA72ABE0;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  -[HFGenericAccessoryItemProvider filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v5, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __45__HFGenericAccessoryItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1EA726E30;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v10;
}

uint64_t __45__HFGenericAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSupportedAccessory") ^ 1;
}

HFGenericAccessoryItem *__45__HFGenericAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HFGenericAccessoryItem *v4;
  void *v5;
  void *v6;
  HFGenericAccessoryItem *v7;

  v3 = a2;
  v4 = [HFGenericAccessoryItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFGenericAccessoryItem initWithAccessory:valueSource:](v4, "initWithAccessory:valueSource:", v3, v6);

  return v7;
}

id __45__HFGenericAccessoryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "genericItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "genericItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  v6.super_class = (Class)HFGenericAccessoryItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("accessory");
  v7[1] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)genericItems
{
  return self->_genericItems;
}

- (void)setGenericItems:(id)a3
{
  objc_storeStrong((id *)&self->_genericItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
