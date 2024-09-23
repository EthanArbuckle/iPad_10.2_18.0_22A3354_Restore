@implementation HFTargetControlItemProvider

- (HFTargetControlItemProvider)initWithHome:(id)a3
{
  id v5;
  HFTargetControlItemProvider *v6;
  HFTargetControlItemProvider *v7;
  uint64_t v8;
  NSMutableSet *remoteControlAccessoryItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFTargetControlItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = objc_opt_new();
    remoteControlAccessoryItems = v7->_remoteControlAccessoryItems;
    v7->_remoteControlAccessoryItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (HFTargetControlItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTargetControlItemProvider.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTargetControlItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFTargetControlItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD aBlock[5];

  -[HFTargetControlItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allTargetControlAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HFTargetControlItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72ABE0;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  -[HFTargetControlItemProvider filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v4, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __42__HFTargetControlItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1EA726E30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v9;
}

HFTargetControlAccessoryItem *__42__HFTargetControlItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HFTargetControlAccessoryItem *v4;
  void *v5;
  void *v6;
  HFTargetControlAccessoryItem *v7;

  v3 = a2;
  v4 = [HFTargetControlAccessoryItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFTargetControlAccessoryItem initWithAccessory:valueSource:](v4, "initWithAccessory:valueSource:", v3, v6);

  return v7;
}

id __42__HFTargetControlItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "remoteControlAccessoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "remoteControlAccessoryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)items
{
  void *v2;
  void *v3;

  -[HFTargetControlItemProvider remoteControlAccessoryItems](self, "remoteControlAccessoryItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFTargetControlItemProvider;
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

- (NSMutableSet)remoteControlAccessoryItems
{
  return self->_remoteControlAccessoryItems;
}

- (void)setRemoteControlAccessoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_remoteControlAccessoryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteControlAccessoryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
