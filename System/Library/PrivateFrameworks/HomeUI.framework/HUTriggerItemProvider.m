@implementation HUTriggerItemProvider

- (HUTriggerItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerItemProvider.m"), 28, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTriggerItemProvider init]",
    v5);

  return 0;
}

- (HUTriggerItemProvider)initWithHome:(id)a3
{
  id v5;
  HUTriggerItemProvider *v6;
  HUTriggerItemProvider *v7;
  uint64_t v8;
  NSMutableSet *triggerItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v7->_usesRichIconDescriptors = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    triggerItems = v7->_triggerItems;
    v7->_triggerItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUTriggerItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__HUTriggerItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6F4D228;
  objc_copyWeak(&v14, &location);
  v4 = _Block_copy(aBlock);
  -[HUTriggerItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerItemProvider filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __36__HUTriggerItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

HUTriggerItem *__36__HUTriggerItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  HUTriggerItem *v5;
  void *v6;
  HUTriggerItem *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = [HUTriggerItem alloc];
  objc_msgSend(WeakRetained, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUTriggerItem initWithHome:trigger:](v5, "initWithHome:trigger:", v6, v3);

  return v7;
}

id __36__HUTriggerItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  _QWORD v12[5];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "addedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__HUTriggerItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1E6F5B438;
  v12[4] = WeakRetained;
  objc_msgSend(v5, "na_each:", v12);

  objc_msgSend(WeakRetained, "triggerItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

  objc_msgSend(WeakRetained, "triggerItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v9);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __36__HUTriggerItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setUsesRichIconDescriptors:", objc_msgSend(v2, "usesRichIconDescriptors"));

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
  v7.super_class = (Class)HUTriggerItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308A8];
  v8[0] = *MEMORY[0x1E0D308E8];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)usesRichIconDescriptors
{
  return self->_usesRichIconDescriptors;
}

- (void)setUsesRichIconDescriptors:(BOOL)a3
{
  self->_usesRichIconDescriptors = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)triggerItems
{
  return self->_triggerItems;
}

- (void)setTriggerItems:(id)a3
{
  objc_storeStrong((id *)&self->_triggerItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
