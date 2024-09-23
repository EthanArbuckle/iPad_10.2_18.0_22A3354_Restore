@implementation HUNetworkConfigurationItemListModule

- (HUNetworkConfigurationItemListModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HUNetworkConfigurationItemListModule *v8;
  HUNetworkConfigurationItemListModule *v9;
  uint64_t v10;
  HFNetworkConfigurationGroupItemProvider *networkConfigurationGroupItemProvider;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUNetworkConfigurationItemListModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v13, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D315A8]), "initWithHome:", v7);
    networkConfigurationGroupItemProvider = v9->_networkConfigurationGroupItemProvider;
    v9->_networkConfigurationGroupItemProvider = (HFNetworkConfigurationGroupItemProvider *)v10;

  }
  return v9;
}

- (HUNetworkConfigurationItemListModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkConfigurationItemListModule.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkConfigurationItemListModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemNetworkConfigurationGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUNetworkConfigurationItemListModule networkConfigurationGroupItemProvider](self, "networkConfigurationGroupItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (id)networkConfigurationGroupItemForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUNetworkConfigurationItemListModule networkConfigurationGroupItemProvider](self, "networkConfigurationGroupItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HUNetworkConfigurationItemListModule_networkConfigurationGroupItemForProfile___block_invoke;
  v10[3] = &unk_1E6F4DAD8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __80__HUNetworkConfigurationItemListModule_networkConfigurationGroupItemForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "profiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HUNetworkConfigurationItemListModule_networkConfigurationGroupItemForProfile___block_invoke_2;
  v10[3] = &unk_1E6F53A20;
  v11 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "na_any:", v10);

  return v8;
}

uint64_t __80__HUNetworkConfigurationItemListModule_networkConfigurationGroupItemForProfile___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUNetworkConfigurationItemListModule networkConfigurationGroupItemProvider](self, "networkConfigurationGroupItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUNetworkConfigurationItemListModuleSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkConfigurationItemListModuleSectionTitle"), CFSTR("HUNetworkConfigurationItemListModuleSectionTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderTitle:", v6);

  -[HUNetworkConfigurationItemListModule networkConfigurationGroupItemProvider](self, "networkConfigurationGroupItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUNetworkConfigurationItemListModule home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_isNetworkProtectionEnabled");

  if (v10)
  {
    objc_msgSend(v8, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItems:", v13);

  }
  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __72__HUNetworkConfigurationItemListModule_buildSectionsWithDisplayedItems___block_invoke;
  v22 = &unk_1E6F5ECB8;
  objc_copyWeak(&v23, &location);
  if (objc_msgSend(v8, "na_any:", &v19))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkConfigurationItemListModuleSectionFooterIncompatibleVersion"), CFSTR("HUNetworkConfigurationItemListModuleSectionFooterIncompatibleVersion"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFooterTitle:", v14, v19, v20, v21, v22);

  }
  v15 = (void *)MEMORY[0x1E0D314B0];
  v25[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filterSections:toDisplayedItems:", v16, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v17;
}

unint64_t __72__HUNetworkConfigurationItemListModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "BOOLValue"))
    {
      objc_msgSend(WeakRetained, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = ((unint64_t)objc_msgSend(v10, "networkRouterSupportDisableReason") >> 4) & 1;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (HMHome)home
{
  return self->_home;
}

- (HFNetworkConfigurationGroupItemProvider)networkConfigurationGroupItemProvider
{
  return self->_networkConfigurationGroupItemProvider;
}

- (void)setNetworkConfigurationGroupItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkConfigurationGroupItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationGroupItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
