@implementation HUMatterConnectedHomeItemProvider

- (HUMatterConnectedHomeItemProvider)initWithAccessory:(id)a3
{
  id v5;
  HUMatterConnectedHomeItemProvider *v6;
  HUMatterConnectedHomeItemProvider *v7;
  uint64_t v8;
  NSMutableSet *connectedHomeItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMatterConnectedHomeItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    connectedHomeItems = v7->_connectedHomeItems;
    v7->_connectedHomeItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (NAFuture)accessoryConnectedHomeToCHIPAccessoryPairingFuture
{
  NAFuture *accessoryConnectedHomeToCHIPAccessoryPairingFuture;
  void *v4;
  NAFuture *v5;
  NAFuture *v6;

  accessoryConnectedHomeToCHIPAccessoryPairingFuture = self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture;
  if (!accessoryConnectedHomeToCHIPAccessoryPairingFuture)
  {
    -[HUMatterConnectedHomeItemProvider accessory](self, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_allConnectedHomeToCHIPAccessoryPairingFuture");
    v5 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    v6 = self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture;
    self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture = v5;

    accessoryConnectedHomeToCHIPAccessoryPairingFuture = self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture;
  }
  return accessoryConnectedHomeToCHIPAccessoryPairingFuture;
}

- (NAFuture)connectedHomesFuture
{
  void *v2;
  void *v3;

  -[HUMatterConnectedHomeItemProvider accessoryConnectedHomeToCHIPAccessoryPairingFuture](self, "accessoryConnectedHomeToCHIPAccessoryPairingFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_299);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v3;
}

id __57__HUMatterConnectedHomeItemProvider_connectedHomesFuture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NAFuture)connectedCHIPAccessoryPairingsFuture
{
  void *v2;
  void *v3;

  -[HUMatterConnectedHomeItemProvider accessoryConnectedHomeToCHIPAccessoryPairingFuture](self, "accessoryConnectedHomeToCHIPAccessoryPairingFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_2_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v3;
}

id __73__HUMatterConnectedHomeItemProvider_connectedCHIPAccessoryPairingsFuture__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[HUMatterConnectedHomeItemProvider accessoryConnectedHomeToCHIPAccessoryPairingFuture](self, "accessoryConnectedHomeToCHIPAccessoryPairingFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_1E6F51E78;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
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
  aBlock[2] = __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke_2;
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
  v12[2] = __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1E6F4D2A0;
  v12[4] = WeakRetained;
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

HUMatterConnectedHomeItem *__48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  HUMatterConnectedHomeItem *v8;

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
  v8 = -[HUMatterConnectedHomeItem initWithConnectedHome:accessoryPairing:]([HUMatterConnectedHomeItem alloc], "initWithConnectedHome:accessoryPairing:", v6, v7);

  return v8;
}

id __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "connectedHomeItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "connectedHomeItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (NSMutableSet)connectedHomeItems
{
  return self->_connectedHomeItems;
}

- (void)setConnectedHomeItems:(id)a3
{
  objc_storeStrong((id *)&self->_connectedHomeItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedHomeItems, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture, 0);
}

@end
