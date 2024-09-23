@implementation HUMatterConnectedEcosystemDetailItemProvider

- (HUMatterConnectedEcosystemDetailItemProvider)initWithConnectedEcosystem:(id)a3 connectedEcosystemItemProvider:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUMatterConnectedEcosystemDetailItemProvider *v12;
  HUMatterConnectedEcosystemDetailItemProvider *v13;
  uint64_t v14;
  NSMutableSet *allItems;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HUMatterConnectedEcosystemDetailItemProvider;
  v12 = -[HFItemProvider init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_home, a5);
    objc_storeStrong((id *)&v13->_connectedEcosystem, a3);
    objc_storeStrong((id *)&v13->_connectedEcosystemItemProvider, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    allItems = v13->_allItems;
    v13->_allItems = (NSMutableSet *)v14;

  }
  return v13;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD aBlock[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6F4D228;
  objc_copyWeak(&v16, &location);
  v4 = _Block_copy(aBlock);
  -[HUMatterConnectedEcosystemDetailItemProvider connectedEcosystemItemProvider](self, "connectedEcosystemItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_2;
  v14[3] = &unk_1E6F4D2A0;
  v14[4] = self;
  objc_msgSend(v6, "flatMap:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_5;
  v11[3] = &unk_1E6F4D2F0;
  v11[4] = self;
  v8 = v4;
  v12 = v8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v9;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D310A8]), "initWithAccessory:valueSource:", v3, v6);
  return v7;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  objc_msgSend(a2, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_1E6F4D250;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessoryUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_4;
  v10[3] = &unk_1E6F4D278;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "na_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "connectedEcosystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedEcosystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 == v5;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_accessoryWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadItemsWithHomeKitObjects:filter:itemMap:", v5, 0, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_6;
  v9[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  return v7;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "allItems");
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
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUMatterConnectedEcosystemDetailItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308B0];
  v8[0] = *MEMORY[0x1E0D308A0];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (HMCHIPEcosystem)connectedEcosystem
{
  return self->_connectedEcosystem;
}

- (void)setConnectedEcosystem:(id)a3
{
  objc_storeStrong((id *)&self->_connectedEcosystem, a3);
}

- (HUMatterHomeConnectedEcosystemItemProvider)connectedEcosystemItemProvider
{
  return self->_connectedEcosystemItemProvider;
}

- (void)setConnectedEcosystemItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_connectedEcosystemItemProvider, a3);
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
  objc_storeStrong((id *)&self->_allItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_connectedEcosystemItemProvider, 0);
  objc_storeStrong((id *)&self->_connectedEcosystem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
