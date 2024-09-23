@implementation HUDashboardCameraItemModule

- (id)_reorderableHomeKitItemListKey
{
  return (id)*MEMORY[0x1E0D30CB0];
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("camerasSection"));
  -[HUDashboardCameraItemModule cameraItemProvider](self, "cameraItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemModule _itemComparator](self, "_itemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardCamerasSectionTitle"), CFSTR("HUDashboardCamerasSectionTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v12);

  objc_msgSend(v6, "setItems:", v11);
  v13 = (void *)MEMORY[0x1E0D314B0];
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filterSections:toDisplayedItems:", v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (HFCameraItemProvider)cameraItemProvider
{
  return self->_cameraItemProvider;
}

uint64_t __49__HUDashboardCameraItemModule_buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  int v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideHomeKitObject:", v3);

  return v6 ^ 1u;
}

- (id)buildItemProviders
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;
  id location;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D31230]);
  -[HUDashboardCameraItemModule context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:", v6);
  -[HUDashboardCameraItemModule setCameraItemProvider:](self, "setCameraItemProvider:", v7);

  -[HUDashboardCameraItemModule context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardCameraItemModule cameraItemProvider](self, "cameraItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRoom:", v9);

  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v15, &location);
  -[HUDashboardCameraItemModule cameraItemProvider](self, "cameraItemProvider", v14, 3221225472, __49__HUDashboardCameraItemModule_buildItemProviders__block_invoke, &unk_1E6F4DD60);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFilter:", &v14);

  -[HUDashboardCameraItemModule cameraItemProvider](self, "cameraItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v3;
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (void)setCameraItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cameraItemProvider, a3);
}

- (HUDashboardCameraItemModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v7;
  HUDashboardCameraItemModule *v8;
  HUDashboardCameraItemModule *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardCameraItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_context, a3);

  return v9;
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HUDashboardCameraItemModule context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (HMRoom)room
{
  void *v2;
  void *v3;

  -[HUDashboardCameraItemModule context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMRoom *)v3;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraItemProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
