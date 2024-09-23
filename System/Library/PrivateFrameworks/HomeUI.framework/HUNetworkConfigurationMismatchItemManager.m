@implementation HUNetworkConfigurationMismatchItemManager

- (HUNetworkConfigurationMismatchItemManager)initWithProfiles:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  HUNetworkConfigurationMismatchItemManager *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMHome *overrideHome;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkConfigurationMismatchItemManager.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profiles.count"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HUNetworkConfigurationMismatchItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v17, sel_initWithDelegate_sourceItem_, v9, 0);
  if (v10)
  {
    objc_msgSend(v8, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = objc_claimAutoreleasedReturnValue();
    overrideHome = v10->_overrideHome;
    v10->_overrideHome = (HMHome *)v13;

    objc_storeStrong((id *)&v10->_profiles, a3);
  }

  return v10;
}

- (HUNetworkConfigurationMismatchItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithProfiles_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkConfigurationMismatchItemManager.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkConfigurationMismatchItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (BOOL)isItemNetworkConfigurationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUNetworkConfigurationMismatchItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (id)networkConfigurationItemForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUNetworkConfigurationMismatchItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HUNetworkConfigurationMismatchItemManager_networkConfigurationItemForProfile___block_invoke;
  v10[3] = &unk_1E6F4DAD8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __80__HUNetworkConfigurationMismatchItemManager_networkConfigurationItemForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  return v10;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D315B8]), "initWithHome:", v4);
  -[HUNetworkConfigurationMismatchItemManager setNetworkConfigurationItemProvider:](self, "setNetworkConfigurationItemProvider:", v5);

  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v12, &location);
  -[HUNetworkConfigurationMismatchItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider", v11, 3221225472, __72__HUNetworkConfigurationMismatchItemManager__buildItemProvidersForHome___block_invoke, &unk_1E6F5AC10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByFilter:", &v11);

  -[HUNetworkConfigurationMismatchItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

uint64_t __72__HUNetworkConfigurationMismatchItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v3))
    v6 = objc_msgSend(v3, "hf_hasProtectionModeMismatch");
  else
    v6 = 0;

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUNetworkRouterMismatchSectionIdentifier"));
  -[HUNetworkConfigurationMismatchItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D315B0], "defaultItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:filteringToDisplayedItems:", v11, v4);

  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUNetworkConfigurationMismatchItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)profiles
{
  return self->_profiles;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFNetworkConfigurationItemProvider)networkConfigurationItemProvider
{
  return self->_networkConfigurationItemProvider;
}

- (void)setNetworkConfigurationItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfigurationItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

@end
