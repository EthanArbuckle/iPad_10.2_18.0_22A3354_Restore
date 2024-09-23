@implementation HUMatterConnectedServicesItemManager

- (HUMatterConnectedServicesItemManager)initWithConnectedServicesItemProvider:(id)a3 delegate:(id)a4
{
  id v7;
  HUMatterConnectedServicesItemManager *v8;
  HUMatterConnectedServicesItemManager *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUMatterConnectedServicesItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v13, sel_initWithDelegate_sourceItem_, a4, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connectedServicesItemProvider, a3);
    -[HUMatterConnectedServicesItemManager connectedHomeEcosystemItemProvider](v9, "connectedHomeEcosystemItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager setHome:](v9, "setHome:", v11);

  }
  return v9;
}

- (id)fetchSystemCommissionerPairingUUID
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  -[HUMatterConnectedServicesItemManager connectedAccessoryEcosystemItemProvider](self, "connectedAccessoryEcosystemItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0 || !v3)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_initWeak(&location, self);
    -[HUMatterConnectedServicesItemManager accessory](self, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__HUMatterConnectedServicesItemManager_fetchSystemCommissionerPairingUUID__block_invoke;
    v8[3] = &unk_1E6F588C0;
    objc_copyWeak(&v10, &location);
    v6 = v4;
    v9 = v6;
    objc_msgSend(v5, "fetchCHIPPairingsWithCompletion:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    return v6;
  }
}

void __74__HUMatterConnectedServicesItemManager_fetchSystemCommissionerPairingUUID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch CHIP pairings: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(WeakRetained, "setAccessorySystemCommisionerUUID:", 0);
  }
  else
  {
    objc_msgSend(v5, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemCommissionerPairingUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setAccessorySystemCommisionerUUID:", v11);

    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "accessorySystemCommisionerUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Establishing accessorySystemCommisionerUUID : %@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(WeakRetained, "recalculateVisibilityAndSortAllItems");
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");

}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  HUInstructionsItem *v5;
  __CFString *v6;
  void *v7;
  HUInstructionsItem *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[HUMatterConnectedServicesItemManager connectedHomeEcosystemItemProvider](self, "connectedHomeEcosystemItemProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [HUInstructionsItem alloc];
  if (v4)
    v6 = CFSTR("HUMatterHomeConnectedEcosystemsInfoTitle");
  else
    v6 = CFSTR("HUMatterAccessoryConnectedEcosystemsInfoTitle");
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUInstructionsItem initWithStyle:title:description:](v5, "initWithStyle:title:description:", 4, v7, 0);
  -[HUMatterConnectedServicesItemManager setInstructionsItem:](self, "setInstructionsItem:", v8);

  v9 = objc_alloc(MEMORY[0x1E0D31848]);
  v10 = (void *)MEMORY[0x1E0C99E60];
  -[HUMatterConnectedServicesItemManager instructionsItem](self, "instructionsItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithItems:", v13);

  -[HUMatterConnectedServicesItemManager connectedServicesItemProvider](self, "connectedServicesItemProvider", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)connectedServicesSectionFooterLink:(id)a3 isForAccessory:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject **v16;
  uint64_t *v17;
  void *v18;
  void *v19;
  uint8_t buf[8];
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[2];

  v4 = a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUMatterConnectedEcosystemsFooterLink"), CFSTR("HUMatterConnectedEcosystemsFooterLink"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v6, "appendAttributedString:", v8);

    if (v4)
    {
      -[HUMatterConnectedServicesItemManager accessorySystemCommisionerUUID](self, "accessorySystemCommisionerUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        HFLogForCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch CHIP pairings", buf, 2u);
        }
        v12 = CFSTR("prefs:root=General&path=MATTER_ACCESSORIES");
        goto LABEL_7;
      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[HUMatterConnectedServicesItemManager accessorySystemCommisionerUUID](self, "accessorySystemCommisionerUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("prefs:root=General&path=MATTER_ACCESSORIES"), v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x1E0CB3498]);
      v23 = *MEMORY[0x1E0CEA0C0];
      v24[0] = v13;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = (NSObject **)v24;
      v17 = &v23;
    }
    else
    {
      v12 = CFSTR("prefs:root=General&path=MATTER_ACCESSORIES");
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=MATTER_ACCESSORIES"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x1E0CB3498]);
      v21 = *MEMORY[0x1E0CEA0C0];
      v22 = v13;
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = &v22;
      v17 = &v21;
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v14, "initWithString:attributes:", v7, v18);
    objc_msgSend(v6, "appendAttributedString:", v19);

LABEL_7:
  }

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
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("ConnectedEcosystemsInstructions"));
  -[HUMatterConnectedServicesItemManager instructionsItem](self, "instructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("ConnectedEcosystems"));
  -[HUMatterConnectedServicesItemManager connectedServicesItemProvider](self, "connectedServicesItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "connectedServicesItemComparator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:filteringToDisplayedItems:", v13, v4);

  -[HUMatterConnectedServicesItemManager connectedServicesItemProvider](self, "connectedServicesItemProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v14, "hasSystemCommissionerEcosystem");

  if ((_DWORD)v10)
  {
    -[HUMatterConnectedServicesItemManager connectedAccessoryEcosystemItemProvider](self, "connectedAccessoryEcosystemItemProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v15 != 0;
    if (v15)
      v17 = CFSTR("HUMatterAccessoryConnectedEcosystemsFooter");
    else
      v17 = CFSTR("HUMatterHomeConnectedEcosystemsFooter");
    _HULocalizedStringWithDefaultValue(v17, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v18);
    -[HUMatterConnectedServicesItemManager connectedServicesSectionFooterLink:isForAccessory:](self, "connectedServicesSectionFooterLink:isForAccessory:", v19, v16);
    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "Matter Connected Services completed footer: %@", buf, 0xCu);
    }

    objc_msgSend(v8, "setAttributedFooterTitle:", v19);
  }
  v21 = (void *)MEMORY[0x1E0D314B0];
  v25[0] = v5;
  v25[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filterSections:toDisplayedItems:", v22, v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)connectedServicesItemComparator
{
  return &__block_literal_global_163;
}

uint64_t __71__HUMatterConnectedServicesItemManager_connectedServicesItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t (**v21)(_QWORD, _QWORD, _QWORD);
  uint64_t v22;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v8, "connectedEcosystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connectedEcosystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_opt_class();
    v14 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_opt_class();
    v17 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    objc_msgSend(v16, "connectedEcosystem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "connectedEcosystem");
    v20 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v20;
  }
  objc_msgSend(MEMORY[0x1E0CBA390], "hf_ecosystemComparator");
  v21 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v22 = ((uint64_t (**)(_QWORD, void *, void *))v21)[2](v21, v12, v13);

  return v22;
}

- (HMAccessory)accessory
{
  void *v2;
  void *v3;

  -[HUMatterConnectedServicesItemManager connectedAccessoryEcosystemItemProvider](self, "connectedAccessoryEcosystemItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAccessory *)v3;
}

- (id)connectedAccessoryEcosystemItemProvider
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUMatterConnectedServicesItemManager connectedServicesItemProvider](self, "connectedServicesItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (HUMatterHomeConnectedEcosystemItemProvider)connectedHomeEcosystemItemProvider
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUMatterConnectedServicesItemManager connectedServicesItemProvider](self, "connectedServicesItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (HUMatterHomeConnectedEcosystemItemProvider *)v5;
}

- (HUMatterConnectedEcosystemItemProvider)connectedServicesItemProvider
{
  return self->_connectedServicesItemProvider;
}

- (void)setConnectedServicesItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_connectedServicesItemProvider, a3);
}

- (HFItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsItem, a3);
}

- (NSString)accessorySystemCommisionerUUID
{
  return self->_accessorySystemCommisionerUUID;
}

- (void)setAccessorySystemCommisionerUUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySystemCommisionerUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySystemCommisionerUUID, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_connectedServicesItemProvider, 0);
}

@end
