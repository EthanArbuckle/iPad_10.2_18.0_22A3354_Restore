@implementation HUMediaServiceDefaultAccountsItemManager

- (HUMediaServiceDefaultAccountsItemManager)initWithHome:(id)a3 sourceItem:(id)a4 delegate:(id)a5
{
  id v8;
  HUMediaServiceDefaultAccountsItemManager *v9;
  HUMediaServiceDefaultAccountsItemManager *v10;
  HUMediaServiceDefaultAccountsItemModule *v11;
  void *v12;
  HUMediaServiceDefaultAccountsItemModule *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUMediaServiceDefaultAccountsItemManager;
  v9 = -[HFItemManager initWithDelegate:sourceItem:](&v15, sel_initWithDelegate_sourceItem_, a5, a4);
  v10 = v9;
  if (v9)
  {
    -[HUMediaServiceDefaultAccountsItemManager setHomeForUser:](v9, "setHomeForUser:", v8);
    v11 = [HUMediaServiceDefaultAccountsItemModule alloc];
    -[HUMediaServiceDefaultAccountsItemManager homeForUser](v10, "homeForUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HUMediaServiceDefaultAccountsItemModule initWithItemUpdater:home:](v11, "initWithItemUpdater:home:", v10, v12);
    -[HUMediaServiceDefaultAccountsItemManager setDefaultAccountsItemModule:](v10, "setDefaultAccountsItemModule:", v13);

  }
  return v10;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUMediaServiceDefaultAccountsItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUMediaServiceDefaultAccountsItemManager defaultAccountsItemModule](self, "defaultAccountsItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForExternalUpdates");

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUMediaServiceDefaultAccountsItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUMediaServiceDefaultAccountsItemManager defaultAccountsItemModule](self, "defaultAccountsItemModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForExternalUpdates");

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v20 = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaServiceSettings_DefaultSectionFooterTitle"), CFSTR("HUMediaServiceSettings_DefaultSectionFooterTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithResults:", v6);
  -[HUMediaServiceDefaultAccountsItemManager setDefaultAccountsTitleItem:](self, "setDefaultAccountsTitleItem:", v7);

  v8 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUMediaServiceDefaultAccountsItemManager defaultAccountsTitleItem](self, "defaultAccountsTitleItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithArray:", v10);

  v12 = (void *)MEMORY[0x1E0C99E20];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v11);
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMediaServiceDefaultAccountsItemManager defaultAccountsItemModule](self, "defaultAccountsItemModule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemProviders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v16);

  objc_msgSend(v14, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUMediaServiceDefaultAccountsTitleSectionIdentifier"));
  -[HUMediaServiceDefaultAccountsItemManager defaultAccountsTitleItem](self, "defaultAccountsTitleItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v9);

  -[HUMediaServiceDefaultAccountsItemManager defaultAccountsItemModule](self, "defaultAccountsItemModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buildSectionsWithDisplayedItems:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(v6, "addObjectsFromArray:", v11);

  return v6;
}

- (HUMediaServiceDefaultAccountsItemModule)defaultAccountsItemModule
{
  return self->_defaultAccountsItemModule;
}

- (void)setDefaultAccountsItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAccountsItemModule, a3);
}

- (HFItem)defaultAccountsTitleItem
{
  return self->_defaultAccountsTitleItem;
}

- (void)setDefaultAccountsTitleItem:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAccountsTitleItem, a3);
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (void)setHomeForUser:(id)a3
{
  objc_storeStrong((id *)&self->_homeForUser, a3);
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_defaultAccountsTitleItem, 0);
  objc_storeStrong((id *)&self->_defaultAccountsItemModule, 0);
}

@end
