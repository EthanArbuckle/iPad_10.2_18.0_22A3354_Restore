@implementation HFResidentDeviceStatusDetailsItemProvider

- (HFResidentDeviceStatusDetailsItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFResidentDeviceStatusDetailsItemProvider.m"), 24, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFResidentDeviceStatusDetailsItemProvider init]",
    v5);

  return 0;
}

- (HFResidentDeviceStatusDetailsItemProvider)initWithHome:(id)a3
{
  id v5;
  HFResidentDeviceStatusDetailsItemProvider *v6;
  uint64_t v7;
  NSMutableSet *residentDeviceItems;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFResidentDeviceStatusDetailsItemProvider;
  v6 = -[HFItemProvider init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    residentDeviceItems = v6->_residentDeviceItems;
    v6->_residentDeviceItems = (NSMutableSet *)v7;

    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFResidentDeviceStatusDetailsItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id location;

  objc_initWeak(&location, self);
  -[HFResidentDeviceStatusDetailsItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "residentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFResidentDeviceStatusDetailsItemProvider filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__HFResidentDeviceStatusDetailsItemProvider_reloadItems__block_invoke;
  v12[3] = &unk_1EA726E08;
  v12[4] = self;
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v4, v5, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __56__HFResidentDeviceStatusDetailsItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_1EA726E30;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v8;
}

HFResidentDeviceStatusDetailsItem *__56__HFResidentDeviceStatusDetailsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HFResidentDeviceStatusDetailsItem *v4;
  void *v5;
  HFResidentDeviceStatusDetailsItem *v6;

  v3 = a2;
  v4 = [HFResidentDeviceStatusDetailsItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFResidentDeviceStatusDetailsItem initWithHome:residentDevice:](v4, "initWithHome:residentDevice:", v5, v3);

  return v6;
}

id __56__HFResidentDeviceStatusDetailsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(WeakRetained, "residentDeviceItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

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
  v5.super_class = (Class)HFResidentDeviceStatusDetailsItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("residentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
