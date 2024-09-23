@implementation HUMatterConnectedServicesItemModule

- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 accessory:(id)a4 home:(id)a5 itemProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HUMatterConnectedServicesItemModule *v14;
  HUMatterConnectedServicesItemModule *v15;
  HUMatterConnectedServicesListItem *v16;
  HFItem *connectedServicesListItem;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((v11 != 0) == (v12 != 0))
    NSLog(CFSTR("Exactly one should be non-nil."));
  v19.receiver = self;
  v19.super_class = (Class)HUMatterConnectedServicesItemModule;
  v14 = -[HFItemModule initWithItemUpdater:](&v19, sel_initWithItemUpdater_, v10);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a4);
    objc_storeStrong((id *)&v15->_home, a5);
    objc_storeStrong((id *)&v15->_connectedServicesItemProvider, a6);
    v16 = -[HUMatterConnectedServicesListItem initWithAccessory:home:itemProvider:]([HUMatterConnectedServicesListItem alloc], "initWithAccessory:home:itemProvider:", v11, v12, v13);
    connectedServicesListItem = v15->_connectedServicesListItem;
    v15->_connectedServicesListItem = &v16->super;

  }
  return v15;
}

- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  HUMatterAccessoryConnectedEcosystemItemProvider *v8;
  HUMatterConnectedServicesItemModule *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[HUMatterAccessoryConnectedEcosystemItemProvider initWithAccessory:]([HUMatterAccessoryConnectedEcosystemItemProvider alloc], "initWithAccessory:", v6);
  v9 = -[HUMatterConnectedServicesItemModule initWithItemUpdater:accessory:home:itemProvider:](self, "initWithItemUpdater:accessory:home:itemProvider:", v7, v6, 0, v8);

  return v9;
}

- (HUMatterConnectedServicesItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUMatterHomeConnectedEcosystemItemProvider *v8;
  HUMatterConnectedServicesItemModule *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[HUMatterHomeConnectedEcosystemItemProvider initWithHome:]([HUMatterHomeConnectedEcosystemItemProvider alloc], "initWithHome:", v6);
  v9 = -[HUMatterConnectedServicesItemModule initWithItemUpdater:accessory:home:itemProvider:](self, "initWithItemUpdater:accessory:home:itemProvider:", v7, 0, v6, v8);

  return v9;
}

- (id)buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D31848]);
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[HUMatterConnectedServicesItemModule connectedServicesListItem](self, "connectedServicesListItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithItems:", v6);

  v8 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUMatterConnectedServicesIdentifier"));
  -[HUMatterConnectedServicesItemModule connectedServicesListItem](self, "connectedServicesListItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v8);

  v9 = (void *)MEMORY[0x1E0D314B0];
  v13 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterSections:toDisplayedItems:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMHome)home
{
  return self->_home;
}

- (HUMatterConnectedEcosystemItemProvider)connectedServicesItemProvider
{
  return self->_connectedServicesItemProvider;
}

- (HFItem)connectedServicesListItem
{
  return self->_connectedServicesListItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedServicesListItem, 0);
  objc_storeStrong((id *)&self->_connectedServicesItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
