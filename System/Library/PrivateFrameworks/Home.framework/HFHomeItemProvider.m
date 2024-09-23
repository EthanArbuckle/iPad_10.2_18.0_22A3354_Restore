@implementation HFHomeItemProvider

- (HFHomeItemProvider)initWithHomeManager:(id)a3
{
  id v5;
  HFHomeItemProvider *v6;
  HFHomeItemProvider *v7;
  uint64_t v8;
  NSMutableSet *homeItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFHomeItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_homeManager, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    homeItems = v7->_homeItems;
    v7->_homeItems = (NSMutableSet *)v8;

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
  _QWORD v9[4];
  id v10;
  id location;

  -[HFHomeItemProvider homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HFHomeItemProvider filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v4, v5, &__block_literal_global_198);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__HFHomeItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_1EA726E30;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

HFHomeItem *__33__HFHomeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFHomeItem *v3;

  v2 = a2;
  v3 = -[HFHomeItem initWithHome:]([HFHomeItem alloc], "initWithHome:", v2);

  return v3;
}

id __33__HFHomeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "homeItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "homeItems");
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
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFHomeItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("home"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (NSMutableSet)homeItems
{
  return self->_homeItems;
}

- (void)setHomeItems:(id)a3
{
  objc_storeStrong((id *)&self->_homeItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeItems, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
