@implementation HUAccessoryDiagnosticsItemProvider

- (HUAccessoryDiagnosticsItemProvider)initWithItemManager:(id)a3
{
  id v4;
  HUAccessoryDiagnosticsItemProvider *v5;
  HUAccessoryDiagnosticsItemProvider *v6;
  NSMutableSet *v7;
  NSMutableSet *diagnosticItems;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUAccessoryDiagnosticsItemProvider;
  v5 = -[HFItemProvider init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_itemManager, v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    diagnosticItems = v6->_diagnosticItems;
    v6->_diagnosticItems = v7;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HUAccessoryDiagnosticsItemProvider *v4;
  void *v5;

  v4 = objc_alloc_init(HUAccessoryDiagnosticsItemProvider);
  -[HUAccessoryDiagnosticsItemProvider diagnosticItems](self, "diagnosticItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessoryDiagnosticsItemProvider setDiagnosticItems:](v4, "setDiagnosticItems:", v5);

  return v4;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD aBlock[5];

  -[HUAccessoryDiagnosticsItemProvider itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableLogs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6F4FEE0;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v4, &__block_literal_global_49, &__block_literal_global_5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke_4;
  v10[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v8;
}

id __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0D31078];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithLogMetadata:accessory:", v4, v7);

  return v8;
}

uint64_t __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotPath");
}

uint64_t __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "path");
}

id __49__HUAccessoryDiagnosticsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "diagnosticItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "diagnosticItems");
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
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUAccessoryDiagnosticsItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308D0];
  v8[0] = *MEMORY[0x1E0D308A0];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMutableSet)diagnosticItems
{
  return self->_diagnosticItems;
}

- (void)setDiagnosticItems:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticItems, a3);
}

- (HUAccessoryDiagnosticsItemManager)itemManager
{
  return (HUAccessoryDiagnosticsItemManager *)objc_loadWeakRetained((id *)&self->_itemManager);
}

- (void)setItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_itemManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemManager);
  objc_storeStrong((id *)&self->_diagnosticItems, 0);
}

@end
