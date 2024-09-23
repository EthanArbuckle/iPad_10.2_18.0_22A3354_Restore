@implementation HUTVViewingProfilesDevicesItemModule

- (HUTVViewingProfilesDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4
{
  id v7;
  HUTVViewingProfilesDevicesItemModule *v8;
  HUTVViewingProfilesDevicesItemModule *v9;
  void *v10;
  uint64_t v11;
  HMHome *home;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTVViewingProfilesDevicesItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v14, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sourceItem, a4);
    -[HUTVViewingProfilesDevicesItemModule sourceItem](v9, "sourceItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = objc_claimAutoreleasedReturnValue();
    home = v9->_home;
    v9->_home = (HMHome *)v11;

    -[HUTVViewingProfilesDevicesItemModule _createItemProviders](v9, "_createItemProviders");
  }

  return v9;
}

- (BOOL)isTVViewingProfileDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUTVViewingProfilesDevicesItemModule viewingProfileItemProvider](self, "viewingProfileItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (HMMediaContentProfileAccessControl)accessControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUTVViewingProfilesDevicesItemModule sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesDevicesItemModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaContentProfileAccessControlForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMediaContentProfileAccessControl *)v6;
}

- (void)_createItemProviders
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *itemProviders;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id location;

  if (self->_itemProviders)
  {
    NSLog(CFSTR("_createItemProviders has been called twice"), a2);
  }
  else
  {
    objc_initWeak(&location, self);
    v3 = objc_alloc(MEMORY[0x1E0D31510]);
    -[HUTVViewingProfilesDevicesItemModule home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);

    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke;
    v15[3] = &unk_1E6F4D8E8;
    v15[4] = self;
    objc_msgSend(v5, "setFilter:", v15);
    v7 = objc_alloc(MEMORY[0x1E0D31928]);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_5;
    v13[3] = &unk_1E6F4FAE0;
    objc_copyWeak(&v14, &location);
    v8 = (void *)objc_msgSend(v7, "initWithSourceProvider:transformationBlock:", v5, v13);
    -[HUTVViewingProfilesDevicesItemModule setViewingProfileItemProvider:](self, "setViewingProfileItemProvider:", v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    -[HUTVViewingProfilesDevicesItemModule viewingProfileItemProvider](self, "viewingProfileItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithObject:", v10);
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ homeKitObject: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_opt_class();
  v6 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "hf_isAppleTV"))
    v10 = objc_msgSend(MEMORY[0x1E0CBA5F8], "isAccessorySupported:", v9);
  else
    v10 = 0;

  return v10;
}

id __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D31920]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_2;
  v8[3] = &unk_1E6F4FB50;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v5, v8);

  objc_destroyWeak(&v10);
  return v6;
}

id __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(WeakRetained, "accessControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_3;
  v22[3] = &unk_1E6F4E5D8;
  v12 = v10;
  v23 = v12;
  objc_msgSend(v11, "na_any:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30E20]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v14 = *MEMORY[0x1E0D30B80];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B80]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = (void *)objc_msgSend(v15, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v18, "mutableCopy");

  }
  objc_msgSend(WeakRetained, "sourceItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "user");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v20);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v14);
  return v8;
}

uint64_t __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_4;
  v8[3] = &unk_1E6F4E5D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __60__HUTVViewingProfilesDevicesItemModule__createItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
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

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HUTVViewingProfilesDevicesItemModule viewingProfileItemProvider](self, "viewingProfileItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      NSLog(CFSTR("buildSectionsWithDisplayedItems called with 0 TV Viewing Profile Devices"));
    -[HUTVViewingProfilesDevicesItemModule viewingProfileItemProvider](self, "viewingProfileItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_65);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_setByIntersectingWithSet:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("TV_VIEWING_PROFILES_DEVICES"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersTVViewingProfilesDevicesSectionTitle"), CFSTR("HUUsersTVViewingProfilesDevicesSectionTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHeaderTitle:", v16);

    HULocalizedModelString(CFSTR("HUUsersTVViewingProfilesDevicesFooterTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFooterTitle:", v17);

    objc_msgSend(v14, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D319D0], "comparatorWithSortedObjects:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sortedArrayUsingComparator:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setItems:", v20);

    objc_msgSend(v5, "addObject:", v15);
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

uint64_t __72__HUTVViewingProfilesDevicesItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "localizedStandardCompare:", v9);

  return v10;
}

- (NSArray)viewingProfilesDevices
{
  void *v2;
  void *v3;

  -[HUTVViewingProfilesDevicesItemModule accessControl](self, "accessControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setViewingProfilesDevices:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[6];

  v5 = a3;
  -[HUTVViewingProfilesDevicesItemModule accessControl](self, "accessControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    objc_msgSend(v7, "setAccessories:", v5);
    -[HUTVViewingProfilesDevicesItemModule _commitUpdateToAccessControl:](self, "_commitUpdateToAccessControl:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__HUTVViewingProfilesDevicesItemModule_setViewingProfilesDevices___block_invoke;
    v12[3] = &unk_1E6F4F960;
    v12[4] = self;
    v12[5] = a2;
    v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v12);

  }
  else
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Can't update to viewing profile access control because it is nil - presumably becuase we are waiting for it to sync.", v11, 2u);
    }

  }
}

void __66__HUTVViewingProfilesDevicesItemModule_setViewingProfilesDevices___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D314C0];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "viewingProfileItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToReloadItemProviders:senderSelector:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "performItemUpdateRequest:", v6);

}

- (void)turnOnTVViewingProfilesForAllDevices
{
  void *v3;
  id v4;

  -[HUTVViewingProfilesDevicesItemModule home](self, "home");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_tvViewingProfilesAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTVViewingProfilesDevicesItemModule setViewingProfilesDevices:](self, "setViewingProfilesDevices:", v3);

}

- (id)_commitUpdateToAccessControl:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  HUTVViewingProfilesDevicesItemModule *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  HUTVViewingProfilesDevicesItemModule *v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke;
  v19[3] = &unk_1E6F4FA10;
  v7 = v4;
  v20 = v7;
  v21 = self;
  objc_msgSend(v5, "futureWithErrorOnlyHandlerAdapterBlock:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = 3221225472;
  v15 = __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_29;
  v16 = &unk_1E6F4D188;
  v17 = self;
  v18 = v7;
  v9 = v7;
  v10 = (id)objc_msgSend(v8, "addSuccessBlock:", &v13);
  v11 = (id)objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_36_0, v13, v14, v15, v16, v17);

  return v8;
}

void __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Committing update to viewing profile access control: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateMediaContentProfileAccessControl:forHome:completionHandler:", v8, v9, v3);

}

void __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_2;
  v4[3] = &unk_1E6F4FA38;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "dispatchUserObserverMessage:sender:", v4, 0);

}

void __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "user:didUpdateMediaContentProfileAccessControl:forHome:", v4, v5, v6);

  }
}

void __69__HUTVViewingProfilesDevicesItemModule__commitUpdateToAccessControl___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserItem)sourceItem
{
  return self->_sourceItem;
}

- (HFItemProvider)viewingProfileItemProvider
{
  return self->_viewingProfileItemProvider;
}

- (void)setViewingProfileItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_viewingProfileItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewingProfileItemProvider, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
