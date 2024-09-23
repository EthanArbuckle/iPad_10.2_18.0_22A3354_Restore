@implementation HUNetworkRouterManualReconfigurationItemManager

- (HUNetworkRouterManualReconfigurationItemManager)initWithHome:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  HUNetworkRouterManualReconfigurationItemManager *v10;
  HUNetworkRouterManualReconfigurationItemManager *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterManualReconfigurationItemManager.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HUNetworkRouterManualReconfigurationItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v14, sel_initWithDelegate_sourceItem_, v9, 0);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_overrideHome, a3);

  return v11;
}

- (HUNetworkRouterManualReconfigurationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkRouterManualReconfigurationItemManager.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkRouterManualReconfigurationItemManager initWithDelegate:sourceItem:]",
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
  -[HUNetworkRouterManualReconfigurationItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
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
  -[HUNetworkRouterManualReconfigurationItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__HUNetworkRouterManualReconfigurationItemManager_networkConfigurationItemForProfile___block_invoke;
  v10[3] = &unk_1E6F4DAD8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __86__HUNetworkRouterManualReconfigurationItemManager_networkConfigurationItemForProfile___block_invoke(uint64_t a1, void *a2)
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
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D315B8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithHome:", v5);

  -[HUNetworkRouterManualReconfigurationItemManager setNetworkConfigurationItemProvider:](self, "setNetworkConfigurationItemProvider:", v6);
  -[HUNetworkRouterManualReconfigurationItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByFilter:", &__block_literal_global_298);

  -[HUNetworkRouterManualReconfigurationItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __78__HUNetworkRouterManualReconfigurationItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresManualWiFiReconfiguration");
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
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUNetworkRouterManualReconfigurationSectionIdentifier"));
  -[HUNetworkRouterManualReconfigurationItemManager networkConfigurationItemProvider](self, "networkConfigurationItemProvider");
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
  -[HUNetworkRouterManualReconfigurationItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
}

@end
