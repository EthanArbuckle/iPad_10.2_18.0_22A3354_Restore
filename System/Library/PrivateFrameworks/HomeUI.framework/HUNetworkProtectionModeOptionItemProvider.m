@implementation HUNetworkProtectionModeOptionItemProvider

- (HUNetworkProtectionModeOptionItemProvider)initWithGroup:(id)a3
{
  id v5;
  HUNetworkProtectionModeOptionItemProvider *v6;
  HUNetworkProtectionModeOptionItemProvider *v7;
  uint64_t v8;
  NSMutableSet *networkProtectionModeOptionItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNetworkProtectionModeOptionItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_group, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    networkProtectionModeOptionItems = v7->_networkProtectionModeOptionItems;
    v7->_networkProtectionModeOptionItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (HUNetworkProtectionModeOptionItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithGroup_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkProtectionModeOptionItemProvider.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkProtectionModeOptionItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUNetworkProtectionModeOptionItemProvider group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithGroup:", v5);

  return v6;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_1E6F53CE8;
  objc_copyWeak(&v10, &location);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", &unk_1E7042CA8, &__block_literal_global_103, &__block_literal_global_11_0, 0, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_4;
  v7[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v5;
}

id __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "targetProtectionModeOption"));
}

HUNetworkProtectionModeOptionItem *__56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  HUNetworkProtectionModeOptionItem *v5;
  void *v6;
  uint64_t v7;
  HUNetworkProtectionModeOptionItem *v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = [HUNetworkProtectionModeOptionItem alloc];
  objc_msgSend(WeakRetained, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "unsignedIntegerValue");

  v8 = -[HUNetworkProtectionModeOptionItem initWithGroup:targetProtectionModeOption:](v5, "initWithGroup:targetProtectionModeOption:", v6, v7);
  return v8;
}

id __56__HUNetworkProtectionModeOptionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "networkProtectionModeOptionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "networkProtectionModeOptionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMAccessoryNetworkProtectionGroup)group
{
  return self->_group;
}

- (NSMutableSet)networkProtectionModeOptionItems
{
  return self->_networkProtectionModeOptionItems;
}

- (void)setNetworkProtectionModeOptionItems:(id)a3
{
  objc_storeStrong((id *)&self->_networkProtectionModeOptionItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkProtectionModeOptionItems, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
