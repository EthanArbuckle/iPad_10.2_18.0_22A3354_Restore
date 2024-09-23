@implementation HFResidentDeviceItemProvider

- (HFResidentDeviceItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFResidentDeviceItemProvider.m"), 24, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFResidentDeviceItemProvider init]",
    v5);

  return 0;
}

- (HFResidentDeviceItemProvider)initWithHome:(id)a3
{
  id v5;
  HFResidentDeviceItemProvider *v6;
  HFResidentDeviceItemProvider *v7;
  uint64_t v8;
  NSMutableSet *residentDeviceItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFResidentDeviceItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    residentDeviceItems = v7->_residentDeviceItems;
    v7->_residentDeviceItems = (NSMutableSet *)v8;

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
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  -[HFResidentDeviceItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFResidentDeviceItemProvider filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v4, v5, &__block_literal_global_176);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HFResidentDeviceItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_1EA726E30;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

HFResidentDeviceItem *__43__HFResidentDeviceItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HFResidentDeviceItem *v3;

  v2 = a2;
  v3 = -[HFResidentDeviceItem initWithResidentDevice:]([HFResidentDeviceItem alloc], "initWithResidentDevice:", v2);

  return v3;
}

id __43__HFResidentDeviceItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "residentDeviceItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "residentDeviceItems");
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
  v5.super_class = (Class)HFResidentDeviceItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("residentDevice"));
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

- (NSMutableSet)residentDeviceItems
{
  return self->_residentDeviceItems;
}

- (void)setResidentDeviceItems:(id)a3
{
  objc_storeStrong((id *)&self->_residentDeviceItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentDeviceItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
