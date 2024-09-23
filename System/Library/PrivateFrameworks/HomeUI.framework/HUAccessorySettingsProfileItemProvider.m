@implementation HUAccessorySettingsProfileItemProvider

- (HUAccessorySettingsProfileItemProvider)initWithAdapter:(id)a3 settingGroup:(id)a4
{
  id v8;
  id v9;
  HUAccessorySettingsProfileItemProvider *v10;
  HUAccessorySettingsProfileItemProvider *v11;
  uint64_t v12;
  NSMutableSet *accessorySettingsProfileItems;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsProfileItemProvider.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settingGroup"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsProfileItemProvider.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("adapter"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsProfileItemProvider;
  v10 = -[HFItemProvider init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_settingGroup, a4);
    v12 = objc_opt_new();
    accessorySettingsProfileItems = v11->_accessorySettingsProfileItems;
    v11->_accessorySettingsProfileItems = (NSMutableSet *)v12;

    objc_storeStrong((id *)&v11->_adapter, a3);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUAccessorySettingsProfileItemProvider adapter](self, "adapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsProfileItemProvider settingGroup](self, "settingGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithAdapter:settingGroup:", v5, v6);

  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  HUAccessorySettingsProfileItemProvider *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[HUAccessorySettingsProfileItemProvider adapter](self, "adapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profilesSettingFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke;
  v8[3] = &unk_1E6F54880;
  v5 = v3;
  v9 = v5;
  objc_copyWeak(&v11, &location);
  v10 = self;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v6;
}

id __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_1E6F54858;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  objc_msgSend(v4, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  return v7;
}

id __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_2(id *a1, void *a2)
{
  id *v2;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, "HUAccessorySettingsProfileItemProvider: Unfiltered profiles: %@", buf, 0xCu);
  }

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_8;
  aBlock[3] = &unk_1E6F54788;
  objc_copyWeak(&v20, a1 + 6);
  v19 = a1[4];
  v7 = _Block_copy(aBlock);
  objc_msgSend(a1[5], "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_5;
    v16[3] = &unk_1E6F54830;
    v2 = &v17;
    objc_copyWeak(&v17, a1 + 6);
    v9 = v16;
  }
  else
  {
    v9 = 0;
  }
  v10 = _Block_copy(v9);

  objc_msgSend(a1[5], "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v4, &__block_literal_global_114, &__block_literal_global_15_1, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_6;
  v14[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v15, a1 + 6);
  objc_msgSend(v11, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v15);

  if (v8)
    objc_destroyWeak(v2);

  objc_destroyWeak(&v20);
  return v12;
}

HUAccessorySettingsProfileItem *__53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  HUAccessorySettingsProfileItem *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "accessorySettingsProfileItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_2_9;
  v9[3] = &unk_1E6F54760;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (HUAccessorySettingsProfileItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = -[HUAccessorySettingsProfileItem initWithProfile:setting:]([HUAccessorySettingsProfileItem alloc], "initWithProfile:setting:", v6, *(_QWORD *)(a1 + 32));

  return v7;
}

uint64_t __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_2_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

uint64_t __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

id __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "filter");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = ((uint64_t (**)(_QWORD, void *))v5)[2](v5, v6);
  return v7;
}

id __53__HUAccessorySettingsProfileItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "allItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, "HUAccessorySettingsProfileItemProvider: Filtered profile items: %@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(WeakRetained, "accessorySettingsProfileItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

  objc_msgSend(WeakRetained, "accessorySettingsProfileItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v9);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)items
{
  void *v2;
  void *v3;

  -[HUAccessorySettingsProfileItemProvider accessorySettingsProfileItems](self, "accessorySettingsProfileItems");
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
  v5.super_class = (Class)HUAccessorySettingsProfileItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D308A0]);
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

- (HMSettingGroup)settingGroup
{
  return self->_settingGroup;
}

- (void)setSettingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_settingGroup, a3);
}

- (NSMutableSet)accessorySettingsProfileItems
{
  return self->_accessorySettingsProfileItems;
}

- (void)setAccessorySettingsProfileItems:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySettingsProfileItems, a3);
}

- (HFAccessorySettingManagedConfigurationAdapter)adapter
{
  return self->_adapter;
}

- (void)setAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_adapter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_accessorySettingsProfileItems, 0);
  objc_storeStrong((id *)&self->_settingGroup, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
