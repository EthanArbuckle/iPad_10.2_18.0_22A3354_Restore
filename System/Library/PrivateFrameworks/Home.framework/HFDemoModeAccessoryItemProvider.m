@implementation HFDemoModeAccessoryItemProvider

- (HFDemoModeAccessoryItemProvider)initWithHome:(id)a3
{
  id v5;
  HFDemoModeAccessoryItemProvider *v6;
  HFDemoModeAccessoryItemProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFDemoModeAccessoryItemProvider;
  v6 = -[HFItemProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (HFDemoModeAccessoryItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDemoModeAccessoryItemProvider.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDemoModeAccessoryItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFDemoModeAccessoryItemProvider home](self, "home");
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
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  HFItemProviderReloadResults *v14;
  void *v15;
  HFItemProviderReloadResults *v16;
  NSSet *v17;
  NSSet *demoItems;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessoryItemProvider demoItems](self, "demoItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __46__HFDemoModeAccessoryItemProvider_reloadItems__block_invoke;
  v27[3] = &unk_1EA731898;
  v28 = v3;
  v7 = v4;
  v29 = v7;
  v8 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v27);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessoryItemProvider filter](self, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_filter:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v6;
  v22 = 3221225472;
  v23 = __46__HFDemoModeAccessoryItemProvider_reloadItems__block_invoke_2;
  v24 = &unk_1EA7318C0;
  v25 = v7;
  v26 = v9;
  v12 = v9;
  v13 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v21);
  v14 = [HFItemProviderReloadResults alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set", v21, v22, v23, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:](v14, "initWithAddedItems:removedItems:existingItems:", v12, v15, v12);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v12);
  v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
  demoItems = self->_demoItems;
  self->_demoItems = v17;

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __46__HFDemoModeAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "accessory");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v7);

}

void __46__HFDemoModeAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    v5 = v6;
  }

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
  v6.super_class = (Class)HFDemoModeAccessoryItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("accessory");
  v7[1] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)demoItems
{
  BOOL v3;
  NSSet *demoItems;
  NSSet *v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSSet *v11;
  NSSet *v12;
  NSSet *v13;
  _QWORD v14[4];
  id v15;

  v3 = +[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled");
  demoItems = self->_demoItems;
  if (!v3)
  {
    self->_demoItems = 0;

    v5 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    return v5;
  }
  if (demoItems)
  {
    v5 = demoItems;
    return v5;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFDemoModeAccessoryManager sharedManager](HFDemoModeAccessoryManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__HFDemoModeAccessoryItemProvider_demoItems__block_invoke;
  v14[3] = &unk_1EA7318E8;
  v15 = v7;
  v10 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
  v11 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v10);
  v12 = self->_demoItems;
  self->_demoItems = v11;

  v13 = self->_demoItems;
  return v13;
}

void __44__HFDemoModeAccessoryItemProvider_demoItems__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[HFDemoModeAccessoryItem accessoryItemForAccessory:](HFDemoModeAccessoryItem, "accessoryItemForAccessory:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

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

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void)setDemoItems:(id)a3
{
  objc_storeStrong((id *)&self->_demoItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
