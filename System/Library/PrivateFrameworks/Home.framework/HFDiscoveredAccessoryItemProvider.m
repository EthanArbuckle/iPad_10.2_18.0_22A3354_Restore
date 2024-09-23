@implementation HFDiscoveredAccessoryItemProvider

- (HFDiscoveredAccessoryItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessoryBrowsingManager_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDiscoveredAccessoryItemProvider.m"), 25, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDiscoveredAccessoryItemProvider init]",
    v5);

  return 0;
}

- (HFDiscoveredAccessoryItemProvider)initWithAccessoryBrowsingManager:(id)a3
{
  id v5;
  HFDiscoveredAccessoryItemProvider *v6;
  HFDiscoveredAccessoryItemProvider *v7;
  uint64_t v8;
  NSMutableSet *discoveredAccessoryItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFDiscoveredAccessoryItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryBrowsingManager, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    discoveredAccessoryItems = v7->_discoveredAccessoryItems;
    v7->_discoveredAccessoryItems = (NSMutableSet *)v8;

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  -[HFDiscoveredAccessoryItemProvider accessoryBrowsingManager](self, "accessoryBrowsingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discoveredHMAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_10_14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFDiscoveredAccessoryItemProvider accessoryBrowsingManager](self, "accessoryBrowsingManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "discoveredSharingDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_12_12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HFDiscoveredAccessoryItemProvider filter](self, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v9, v10, &__block_literal_global_209);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke_13;
  v14[3] = &unk_1EA726E30;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v12;
}

HFDiscoveredAccessoryItem *__48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFDiscoveredAccessoryItem *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HFDiscoveredAccessoryItem *v10;

  v2 = a2;
  v3 = [HFDiscoveredAccessoryItem alloc];
  v4 = objc_opt_class();
  v5 = v2;
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  v10 = -[HFDiscoveredAccessoryItem initWithDiscoveredAccessory:](v3, "initWithDiscoveredAccessory:", v7);
  return v10;
}

HFDiscoveredAccessory *__48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HFDiscoveredAccessory *v3;

  v2 = a2;
  v3 = -[HFDiscoveredAccessory initWithAccessory:]([HFDiscoveredAccessory alloc], "initWithAccessory:", v2);

  return v3;
}

HFDiscoveredAccessory *__48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  BOOL v4;
  HFDiscoveredAccessory *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "deviceActionType");
  v4 = v3 == 33 || v3 == 11;
  if (v4 && (objc_msgSend(v2, "needsSetup") & 1) != 0)
  {
    v5 = -[HFDiscoveredAccessory initWithSharingDevice:]([HFDiscoveredAccessory alloc], "initWithSharingDevice:", v2);
  }
  else
  {
    HFLogForCategory(0x3AuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v2;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Not showing SFDevice because it doesn't have the right type, or it doesn't need setup: %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

id __48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke_13(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "discoveredAccessoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "discoveredAccessoryItems");
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
  v5.super_class = (Class)HFDiscoveredAccessoryItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("accessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HFAccessoryBrowsingManager)accessoryBrowsingManager
{
  return self->_accessoryBrowsingManager;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableSet)discoveredAccessoryItems
{
  return self->_discoveredAccessoryItems;
}

- (void)setDiscoveredAccessoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredAccessoryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAccessoryItems, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_accessoryBrowsingManager, 0);
}

@end
