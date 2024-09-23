@implementation HFServiceGroupItemProvider

- (HFServiceGroupItemProvider)initWithHome:(id)a3
{
  id v5;
  HFServiceGroupItemProvider *v6;
  HFServiceGroupItemProvider *v7;
  uint64_t v8;
  NSMutableSet *serviceGroupItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFServiceGroupItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    serviceGroupItems = v7->_serviceGroupItems;
    v7->_serviceGroupItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (HFServiceGroupItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceGroupItemProvider.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFServiceGroupItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFServiceGroupItemProvider home](self, "home");
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
  aBlock[2] = __41__HFServiceGroupItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72A340;
  objc_copyWeak(&v14, &location);
  v4 = _Block_copy(aBlock);
  -[HFServiceGroupItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceGroupItemProvider filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __41__HFServiceGroupItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1EA726E30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

HFServiceGroupItem *__41__HFServiceGroupItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  HFServiceGroupItem *v5;
  void *v6;
  HFServiceGroupItem *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = [HFServiceGroupItem alloc];
  objc_msgSend(WeakRetained, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFServiceGroupItem initWithValueSource:serviceGroup:](v5, "initWithValueSource:serviceGroup:", v6, v3);

  return v7;
}

id __41__HFServiceGroupItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "serviceGroupItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "serviceGroupItems");
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
  v5.super_class = (Class)HFServiceGroupItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("serviceGroup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v3;
  void *v4;
  void *v5;

  -[HFServiceGroupItemProvider overrideValueSource](self, "overrideValueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFServiceGroupItemProvider overrideValueSource](self, "overrideValueSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFServiceGroupItemProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_characteristicValueManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (HFCharacteristicValueSource *)v4;
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

- (NSMutableSet)serviceGroupItems
{
  return self->_serviceGroupItems;
}

- (void)setServiceGroupItems:(id)a3
{
  objc_storeStrong((id *)&self->_serviceGroupItems, a3);
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (void)setOverrideValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_overrideValueSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_serviceGroupItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
