@implementation HUMediaServiceDefaultAccountsItemModule

- (HUMediaServiceDefaultAccountsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HUMediaServiceDefaultAccountsItemModule *v8;
  HUMediaServiceDefaultAccountsItemModule *v9;
  HUMediaServiceItemProvider *v10;
  HUMediaServiceItemProvider *mediaServiceItemProvider;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUMediaServiceDefaultAccountsItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v13, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v10 = -[HUMediaServiceItemProvider initWithHome:delegate:]([HUMediaServiceItemProvider alloc], "initWithHome:delegate:", v7, v9);
    mediaServiceItemProvider = v9->_mediaServiceItemProvider;
    v9->_mediaServiceItemProvider = v10;

  }
  return v9;
}

- (NSSet)itemProviders
{
  NSSet *itemProviders;
  NSSet *v3;
  NSSet *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    v5 = (NSSet *)objc_opt_new();
    -[HUMediaServiceDefaultAccountsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSet na_safeAddObject:](v5, "na_safeAddObject:", v6);

    v7 = self->_itemProviders;
    self->_itemProviders = v5;
    v8 = v5;

    v3 = self->_itemProviders;
  }
  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
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
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUMediaServiceDefaultAccountsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "intersectsSet:", v4))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HomeMediaServicesDefaultAccountsSection"));
    -[HUMediaServiceDefaultAccountsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__HUMediaServiceDefaultAccountsItemModule_buildSectionsWithDisplayedItems___block_invoke;
    v17[3] = &unk_1E6F4DAD8;
    v18 = v4;
    objc_msgSend(v11, "na_filter:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v12);

    objc_msgSend(v8, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUMediaServiceItemProvider itemComparator](HUMediaServiceItemProvider, "itemComparator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v15);

    objc_msgSend(v5, "addObject:", v8);
  }

  return v5;
}

uint64_t __75__HUMediaServiceDefaultAccountsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (BOOL)containsItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUMediaServiceDefaultAccountsItemModule itemProviders](self, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HUMediaServiceDefaultAccountsItemModule_containsItem___block_invoke;
  v9[3] = &unk_1E6F536F0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __56__HUMediaServiceDefaultAccountsItemModule_containsItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)updateDefaultAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D31540];
  v5 = a3;
  objc_msgSend(v4, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceDefaultAccountsItemModule home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateDefaultMediaService:forHome:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)registerForExternalUpdates
{
  id v2;

  -[HUMediaServiceDefaultAccountsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerForExternalUpdates");

}

- (void)unregisterForExternalUpdates
{
  id v2;

  -[HUMediaServiceDefaultAccountsItemModule mediaServiceItemProvider](self, "mediaServiceItemProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterForExternalUpdates");

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
  -[HUMediaServiceDefaultAccountsItemModule itemProviders](self, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v7);

}

- (HMHome)home
{
  return self->_home;
}

- (HUMediaServiceItemProvider)mediaServiceItemProvider
{
  return self->_mediaServiceItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
