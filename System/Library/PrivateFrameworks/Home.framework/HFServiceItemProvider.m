@implementation HFServiceItemProvider

- (HFServiceItemProvider)initWithHome:(id)a3
{
  return -[HFServiceItemProvider initWithHome:serviceTypes:](self, "initWithHome:serviceTypes:", a3, 0);
}

- (HFServiceItemProvider)initWithHome:(id)a3 serviceTypes:(id)a4
{
  id v7;
  id v8;
  HFServiceItemProvider *v9;
  HFServiceItemProvider *v10;
  int *v11;
  uint64_t v12;
  NSMutableSet *serviceItems;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HFServiceItemProvider;
  v9 = -[HFItemProvider init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = &OBJC_IVAR___HFServiceItemProvider__home;
    objc_storeStrong((id *)&v9->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    serviceItems = v10->_serviceItems;
    v10->_serviceItems = (NSMutableSet *)v12;

    v14 = (void *)objc_msgSend(v8, "copy");
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_standardServiceTypes");
      v11 = (int *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_serviceTypes, v15);
    if (!v14)
    {

    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFServiceItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceItemProvider serviceTypes](self, "serviceTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:serviceTypes:", v5, v6);

  return v7;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD aBlock[4];
  id v12;
  id location;
  _QWORD v14[5];

  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__HFServiceItemProvider_reloadItems__block_invoke;
  v14[3] = &unk_1EA72E208;
  v14[4] = self;
  __36__HFServiceItemProvider_reloadItems__block_invoke((uint64_t)v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = v3;
  aBlock[1] = 3221225472;
  aBlock[2] = __36__HFServiceItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_1EA72A340;
  objc_copyWeak(&v12, &location);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __36__HFServiceItemProvider_reloadItems__block_invoke_4;
  v8[3] = &unk_1EA730D70;
  v8[4] = self;
  v5 = _Block_copy(aBlock);
  v9 = v5;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

id __36__HFServiceItemProvider_reloadItems__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "sourceServiceGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceServiceGenerator");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_allVisibleServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "futureWithResult:", v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __36__HFServiceItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  objc_class *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = v3;
  v6 = +[HFServiceItem itemClassForService:](HFServiceItem, "itemClassForService:", v5);
  objc_msgSend(WeakRetained, "serviceTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __36__HFServiceItemProvider_reloadItems__block_invoke_3;
  v18 = &unk_1EA726EA8;
  v8 = v5;
  v19 = v8;
  v9 = objc_msgSend(v7, "na_any:", &v15);

  if (!v6)
  {
    objc_msgSend(v8, "serviceType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("No HFServiceItem subclass for service: %@"), v13, v15, v16, v17, v18);

    if (v9)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v10 = [v6 alloc];
  objc_msgSend(WeakRetained, "valueSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithValueSource:service:", v11, v8);

LABEL_6:
  return v12;
}

uint64_t __36__HFServiceItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v3);

  return v5;
}

id __36__HFServiceItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadItemsWithHomeKitObjects:filter:itemMap:", v5, v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__HFServiceItemProvider_reloadItems__block_invoke_5;
  v10[3] = &unk_1EA726E30;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  return v8;
}

id __36__HFServiceItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "serviceItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "serviceItems");
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
  void *v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFServiceItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("service");
  v7[1] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v3;
  void *v4;
  void *v5;

  -[HFServiceItemProvider overrideValueSource](self, "overrideValueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFServiceItemProvider overrideValueSource](self, "overrideValueSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFServiceItemProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_characteristicValueManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (HFCharacteristicValueSource *)v4;
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

- (id)sourceServiceGenerator
{
  return self->_sourceServiceGenerator;
}

- (void)setSourceServiceGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableSet)serviceItems
{
  return self->_serviceItems;
}

- (void)setServiceItems:(id)a3
{
  objc_storeStrong((id *)&self->_serviceItems, a3);
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_serviceTypes, a3);
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
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_serviceItems, 0);
  objc_storeStrong(&self->_sourceServiceGenerator, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
