@implementation HFProgrammableSwitchItemProvider

- (id)items
{
  void *v2;
  void *v3;

  -[HFProgrammableSwitchItemProvider programmableSwitchAccessoryItems](self, "programmableSwitchAccessoryItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSMutableSet)programmableSwitchAccessoryItems
{
  return self->_programmableSwitchAccessoryItems;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFProgrammableSwitchItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("accessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

  -[HFProgrammableSwitchItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allProgrammableSwitchAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HFProgrammableSwitchItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72ABE0;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  -[HFProgrammableSwitchItemProvider filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v4, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __47__HFProgrammableSwitchItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1EA726E30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HFProgrammableSwitchItemProvider)initWithHome:(id)a3
{
  id v5;
  HFProgrammableSwitchItemProvider *v6;
  HFProgrammableSwitchItemProvider *v7;
  uint64_t v8;
  NSMutableSet *programmableSwitchAccessoryItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFProgrammableSwitchItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = objc_opt_new();
    programmableSwitchAccessoryItems = v7->_programmableSwitchAccessoryItems;
    v7->_programmableSwitchAccessoryItems = (NSMutableSet *)v8;

  }
  return v7;
}

id __47__HFProgrammableSwitchItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "programmableSwitchAccessoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "programmableSwitchAccessoryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HFProgrammableSwitchItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFProgrammableSwitchItemProvider.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFProgrammableSwitchItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFProgrammableSwitchItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

HFProgrammableSwitchAccessoryItem *__47__HFProgrammableSwitchItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HFProgrammableSwitchAccessoryItem *v4;
  void *v5;
  void *v6;
  HFProgrammableSwitchAccessoryItem *v7;

  v3 = a2;
  v4 = [HFProgrammableSwitchAccessoryItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFProgrammableSwitchAccessoryItem initWithAccessory:valueSource:](v4, "initWithAccessory:valueSource:", v3, v6);

  return v7;
}

- (void)setProgrammableSwitchAccessoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_programmableSwitchAccessoryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programmableSwitchAccessoryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
