@implementation HUQuickControlSimpleItemUpdater

- (HUQuickControlSimpleItemUpdater)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemHost_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlItemUpdating.m"), 19, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUQuickControlSimpleItemUpdater init]",
    v5);

  return 0;
}

- (HUQuickControlSimpleItemUpdater)initWithItemHost:(id)a3
{
  id v4;
  HUQuickControlSimpleItemUpdater *v5;
  HUQuickControlSimpleItemUpdater *v6;
  id v7;
  uint64_t v8;
  HFSimpleItemManager *itemManager;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUQuickControlSimpleItemUpdater;
  v5 = -[HUQuickControlSimpleItemUpdater init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_itemHost, v4);
    objc_initWeak(&location, v6);
    v7 = objc_alloc(MEMORY[0x1E0D31810]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __52__HUQuickControlSimpleItemUpdater_initWithItemHost___block_invoke;
    v14 = &unk_1E6F60678;
    objc_copyWeak(&v15, &location);
    v8 = objc_msgSend(v7, "initWithDelegate:itemProvidersCreator:", v6, &v11);
    itemManager = v6->_itemManager;
    v6->_itemManager = (HFSimpleItemManager *)v8;

    -[HFSimpleItemManager setShouldDisableOptionalDataDuringFastInitialUpdate:](v6->_itemManager, "setShouldDisableOptionalDataDuringFastInitialUpdate:", 0, v11, v12, v13, v14);
    -[HUQuickControlSimpleItemUpdater _setExternalItemManagerUpdatesDisabled:](v6, "_setExternalItemManagerUpdatesDisabled:", 1);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __52__HUQuickControlSimpleItemUpdater_initWithItemHost___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D31848]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "itemHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controlItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithItems:", v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setExternalItemManagerUpdatesDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[HUQuickControlSimpleItemUpdater itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "disableExternalUpdatesWithReason:", CFSTR("HUQuickControlSimpleItemUpdater_NotVisible"));
  else
    objc_msgSend(v4, "endDisableExternalUpdatesWithReason:", CFSTR("HUQuickControlSimpleItemUpdater_NotVisible"));

}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "changes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemOperations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_295);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlSimpleItemUpdater itemHost](self, "itemHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quickControlItemUpdater:didUpdateResultsForControlItems:", self, v9);

  objc_msgSend(v5, "performWithOptions:", 1);
}

id __68__HUQuickControlSimpleItemUpdater_itemManager_performUpdateRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((unint64_t)objc_msgSend(v2, "type") > 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)quickControlItemHost:(id)a3 didUpdateVisibility:(BOOL)a4
{
  -[HUQuickControlSimpleItemUpdater _setExternalItemManagerUpdatesDisabled:](self, "_setExternalItemManagerUpdatesDisabled:", !a4);
}

- (HUQuickControlItemHosting)itemHost
{
  return (HUQuickControlItemHosting *)objc_loadWeakRetained((id *)&self->_itemHost);
}

- (HFSimpleItemManager)itemManager
{
  return self->_itemManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_destroyWeak((id *)&self->_itemHost);
}

@end
