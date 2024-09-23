@implementation HUSoftwareUpdateRecentUpdatesItemManager

- (HUSoftwareUpdateRecentUpdatesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateRecentUpdatesItemManager.m"), 25, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateRecentUpdatesItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUSoftwareUpdateRecentUpdatesItemManager)initWithDelegate:(id)a3 home:(id)a4
{
  id v7;
  HUSoftwareUpdateRecentUpdatesItemManager *v8;
  HUSoftwareUpdateRecentUpdatesItemManager *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUSoftwareUpdateRecentUpdatesItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_overrideHome, a4);

  return v9;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUSoftwareUpdateRecentUpdatesItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  HUSoftwareUpdateItemModule *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUSoftwareUpdateItemModule initWithItemUpdater:home:sourceItem:]([HUSoftwareUpdateItemModule alloc], "initWithItemUpdater:home:sourceItem:", self, v4, 0);

  -[HUSoftwareUpdateRecentUpdatesItemManager setSoftwareUpdateModule:](self, "setSoftwareUpdateModule:", v5);
  -[HUSoftwareUpdateRecentUpdatesItemManager softwareUpdateModule](self, "softwareUpdateModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUSoftwareUpdateRecentUpdatesItemManager;
  v3 = a3;
  -[HFItemManager _itemsToHideInSet:](&v10, sel__itemsToHideInSet_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__HUSoftwareUpdateRecentUpdatesItemManager__itemsToHideInSet___block_invoke;
  v8[3] = &unk_1E6F51390;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v3, "na_each:", v8);

  return v6;
}

void __62__HUSoftwareUpdateRecentUpdatesItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "latestResults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EB8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

- (HUSoftwareUpdateItemModule)softwareUpdateModule
{
  return self->_softwareUpdateModule;
}

- (void)setSoftwareUpdateModule:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateModule, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void)setOverrideHome:(id)a3
{
  objc_storeStrong((id *)&self->_overrideHome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_softwareUpdateModule, 0);
}

@end
