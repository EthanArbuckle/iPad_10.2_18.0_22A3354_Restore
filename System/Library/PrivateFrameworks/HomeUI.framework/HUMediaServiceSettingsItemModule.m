@implementation HUMediaServiceSettingsItemModule

- (HUMediaServiceSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUMediaServiceSettingsItemModule *v9;
  HUMediaServiceSettingsItemModule *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaServiceSettingsItemModule.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HUMediaServiceSettingsItemModule;
  v9 = -[HFItemModule initWithItemUpdater:](&v13, sel_initWithItemUpdater_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    -[HUMediaServiceSettingsItemModule _createItemProviders](v10, "_createItemProviders");
  }

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUMediaServiceSettingsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUMediaServiceSettingsItemModule_MediaServicesSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaServiceSettingsHeaderTitle_Updated"), CFSTR("HUMediaServiceSettingsHeaderTitle_Updated"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHeaderTitle:", v10);

    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaServiceSettingsFooterTitle"), CFSTR("HUMediaServiceSettingsFooterTitle"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFooterTitle:", v11);

    -[HFItemModule allItems](self, "allItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    -[HUMediaServiceSettingsItemModule defaultAccountsItem](self, "defaultAccountsItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_setByRemovingObjectsFromSet:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItems:", v18);

    objc_msgSend(v9, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUMediaServiceItemProvider itemComparator](HUMediaServiceItemProvider, "itemComparator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sortedArrayUsingComparator:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItems:", v21);

    objc_msgSend(v5, "addObject:", v9);
  }
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)registerForExternalUpdates
{
  id v2;

  -[HUMediaServiceSettingsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerForExternalUpdates");

}

- (void)unregisterForExternalUpdates
{
  id v2;

  -[HUMediaServiceSettingsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterForExternalUpdates");

}

- (void)_createItemProviders
{
  HUMediaServiceItemProvider *v3;
  void *v4;
  HUMediaServiceItemProvider *v5;
  HUMediaServiceItemProvider *mediaServiceItemProvider;
  void *v7;
  id v8;
  HFStaticItem *v9;
  HFStaticItem *defaultAccountsItem;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSSet *v17;
  NSSet *itemProviders;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  if (self->_itemProviders)
  {
    NSLog(CFSTR("_createItemProviders has been called already"), a2);
  }
  else
  {
    v3 = [HUMediaServiceItemProvider alloc];
    -[HUMediaServiceSettingsItemModule home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HUMediaServiceItemProvider initWithHome:delegate:](v3, "initWithHome:delegate:", v4, self);
    mediaServiceItemProvider = self->_mediaServiceItemProvider;
    self->_mediaServiceItemProvider = v5;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x1E0D31840]);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __56__HUMediaServiceSettingsItemModule__createItemProviders__block_invoke;
    v22 = &unk_1E6F4C4E8;
    objc_copyWeak(&v23, &location);
    v9 = (HFStaticItem *)objc_msgSend(v8, "initWithResultsBlock:", &v19);
    defaultAccountsItem = self->_defaultAccountsItem;
    self->_defaultAccountsItem = v9;

    -[HUMediaServiceSettingsItemModule defaultAccountsItem](self, "defaultAccountsItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

    v12 = objc_alloc(MEMORY[0x1E0D31848]);
    objc_msgSend(v7, "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithItems:", v13);

    v15 = (void *)MEMORY[0x1E0C99E60];
    -[HUMediaServiceSettingsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithObjects:", v16, v14, 0, v19, v20, v21, v22);
    v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v17;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

id __56__HUMediaServiceSettingsItemModule__createItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaServiceDefaultAccounts"), CFSTR("HUMediaServiceDefaultAccounts"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D30BF8];
  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultMediaServiceForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E6F60E80;
  if (v7)
    v9 = (const __CFString *)v7;
  v13[2] = *MEMORY[0x1E0D30CE8];
  v14[1] = v9;
  v14[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)mediaServiceItemProviderDidUpdateServices:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[HFItemModule itemUpdater](self, "itemUpdater", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D314C0];
  -[HUMediaServiceSettingsItemModule itemProviders](self, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v7);

}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFStaticItem)defaultAccountsItem
{
  return self->_defaultAccountsItem;
}

- (void)setDefaultAccountsItem:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAccountsItem, a3);
}

- (HUMediaServiceItemProvider)mediaServiceItemProvider
{
  return self->_mediaServiceItemProvider;
}

- (void)setMediaServiceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaServiceItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_defaultAccountsItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
