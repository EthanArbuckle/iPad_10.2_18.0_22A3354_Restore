@implementation HFBridgeItemProvider

- (HFBridgeItemProvider)initWithHome:(id)a3
{
  id v5;
  HFBridgeItemProvider *v6;
  HFBridgeItemProvider *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFBridgeItemProvider;
  v6 = -[HFItemProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (void *)objc_opt_new();
    -[HFBridgeItemProvider setAccessoryItems:](v7, "setAccessoryItems:", v8);

  }
  return v7;
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

  -[HFBridgeItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allBridgeAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_144);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HFBridgeItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_1EA72ABE0;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  -[HFBridgeItemProvider filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v5, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __35__HFBridgeItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1EA726E30;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return v10;
}

uint64_t __35__HFBridgeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleAsBridge");
}

HFAccessoryItem *__35__HFBridgeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HFAccessoryItem *v4;
  void *v5;
  void *v6;
  HFAccessoryItem *v7;

  v3 = a2;
  v4 = [HFAccessoryItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFAccessoryItem initWithAccessory:valueSource:](v4, "initWithAccessory:valueSource:", v3, v6);

  return v7;
}

id __35__HFBridgeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "accessoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "accessoryItems");
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
  v5.super_class = (Class)HFBridgeItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("accessory"));
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

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)accessoryItems
{
  return self->_accessoryItems;
}

- (void)setAccessoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
