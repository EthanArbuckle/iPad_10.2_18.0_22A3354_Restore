@implementation HUMatterHomeConnectedEcosystemItemProvider

- (HUMatterHomeConnectedEcosystemItemProvider)initWithHome:(id)a3
{
  id v5;
  HUMatterHomeConnectedEcosystemItemProvider *v6;
  HUMatterHomeConnectedEcosystemItemProvider *v7;
  uint64_t v8;
  NSMutableSet *connectedEcosystemItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMatterHomeConnectedEcosystemItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    connectedEcosystemItems = v7->_connectedEcosystemItems;
    v7->_connectedEcosystemItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (NAFuture)ecosystemAccessoryUUIDMapFuture
{
  NAFuture *ecosystemAccessoryUUIDMapFuture;
  void *v4;
  NAFuture *v5;
  NAFuture *v6;

  ecosystemAccessoryUUIDMapFuture = self->_ecosystemAccessoryUUIDMapFuture;
  if (!ecosystemAccessoryUUIDMapFuture)
  {
    -[HUMatterHomeConnectedEcosystemItemProvider home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_ecosystemAccessoryUUIDMapFuture");
    v5 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    v6 = self->_ecosystemAccessoryUUIDMapFuture;
    self->_ecosystemAccessoryUUIDMapFuture = v5;

    ecosystemAccessoryUUIDMapFuture = self->_ecosystemAccessoryUUIDMapFuture;
  }
  return ecosystemAccessoryUUIDMapFuture;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[HUMatterHomeConnectedEcosystemItemProvider ecosystemAccessoryUUIDMapFuture](self, "ecosystemAccessoryUUIDMapFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMatterConnectedEcosystemItemProvider futureFilteringOutSystemCommissionerEcosystem:](self, "futureFilteringOutSystemCommissionerEcosystem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_1E6F51E78;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

id __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD aBlock[4];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_1E6F53E48;
  v14 = v3;
  v6 = v3;
  v7 = _Block_copy(aBlock);
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadItemsWithHomeKitObjects:filter:itemMap:", v8, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1E6F4D2A0;
  v12[4] = WeakRetained;
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

HUMatterHomeConnectedEcosystemItem *__57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  HUMatterHomeConnectedEcosystemItem *v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUMatterHomeConnectedEcosystemItem initWithConnectedEcosystem:accessoryUUIDs:]([HUMatterHomeConnectedEcosystemItem alloc], "initWithConnectedEcosystem:accessoryUUIDs:", v6, v7);

  return v8;
}

id __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "connectedEcosystemItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "connectedEcosystemItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)connectedEcosystemItems
{
  return self->_connectedEcosystemItems;
}

- (void)setConnectedEcosystemItems:(id)a3
{
  objc_storeStrong((id *)&self->_connectedEcosystemItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedEcosystemItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_ecosystemAccessoryUUIDMapFuture, 0);
}

@end
