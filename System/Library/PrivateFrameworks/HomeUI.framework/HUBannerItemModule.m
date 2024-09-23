@implementation HUBannerItemModule

+ (Class)_statusBannerItemClassForStatusItemClass:(Class)a3
{
  void *v4;

  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) == 0
    && ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0
     || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class()) & 1) != 0
     || -[objc_class isEqual:](a3, "isEqual:", objc_opt_class())))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldHideBanners"))
  {
    -[HFItemModule allItems](self, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "intersectSet:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
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
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HUBannerItemModule *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("bannersSection"));
  v25 = self;
  -[HFItemModule allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v4;
  objc_msgSend(v5, "na_setByIntersectingWithSet:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v6;
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUBannerItemProvider bannerItemComparator](HUBannerItemProvider, "bannerItemComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v16, "latestResults");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("bannerItemCategory"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "unsignedIntegerValue");

        if (v19)
        {
          if ((v13 & 1) == 0)
            objc_msgSend(v10, "addObject:", v16);
          goto LABEL_12;
        }
        objc_msgSend(v10, "addObject:", v16);
        v13 = 1;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_12:

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "na_setByRemovingObjectsFromSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerItemModule setHiddenBanners:](v25, "setHiddenBanners:", v21);

  objc_msgSend(v27, "setItems:", v10);
  objc_msgSend(v27, "items");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    v34 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

- (void)setHiddenBanners:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenBanners, a3);
}

id __40__HUBannerItemModule_buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_opt_class();
  v6 = (objc_class *)objc_msgSend(v5, "_statusBannerItemClassForStatusItemClass:", objc_opt_class());

  if (v6)
    v7 = objc_msgSend([v6 alloc], "initWithSourceItem:", v3);
  else
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31920]), "initWithSourceItem:transformationBlock:", v3, &__block_literal_global_76_1);
  v8 = (void *)v7;

  return v8;
}

BOOL __40__HUBannerItemModule_buildItemProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  _BOOL8 v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend((id)objc_opt_class(), "_statusBannerItemClassForStatusItemClass:", a2) != 0;

  return v4;
}

- (id)buildItemProviders
{
  void *v3;
  HUBannerItemProvider *v4;
  void *v5;
  void *v6;
  HUBannerItemProvider *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HUDropInBannerItemProvider *v13;
  void *v14;
  void *v15;
  HUDropInBannerItemProvider *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[4];
  id v33;
  id location;

  v3 = (void *)objc_opt_new();
  v4 = [HUBannerItemProvider alloc];
  -[HUBannerItemModule context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUBannerItemProvider initWithHome:](v4, "initWithHome:", v6);
  -[HUBannerItemModule setBannerItemProvider:](self, "setBannerItemProvider:", v7);

  if (-[HUBannerItemModule forceShowBanners](self, "forceShowBanners"))
  {
    -[HUBannerItemModule bannerItemProvider](self, "bannerItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "reloadItems");

    -[HUBannerItemModule bannerItemProvider](self, "bannerItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_each:", &__block_literal_global_144);

  }
  -[HUBannerItemModule bannerItemProvider](self, "bannerItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v12);

  v13 = [HUDropInBannerItemProvider alloc];
  -[HUBannerItemModule context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HUDropInBannerItemProvider initWithHome:delegate:](v13, "initWithHome:delegate:", v15, self);
  -[HUBannerItemModule setDropInBannerItemProvider:](self, "setDropInBannerItemProvider:", v16);

  -[HUBannerItemModule dropInBannerItemProvider](self, "dropInBannerItemProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v17);

  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HUBannerItemModule_buildItemProviders__block_invoke_2;
  aBlock[3] = &unk_1E6F577F8;
  objc_copyWeak(&v33, &location);
  v19 = _Block_copy(aBlock);
  v20 = objc_alloc(MEMORY[0x1E0D31868]);
  -[HUBannerItemModule context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUBannerItemModule context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "room");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v20, "initWithHome:room:filter:", v22, v24, v19);

  v26 = objc_alloc(MEMORY[0x1E0D31928]);
  v30[0] = v18;
  v30[1] = 3221225472;
  v30[2] = __40__HUBannerItemModule_buildItemProviders__block_invoke_3;
  v30[3] = &unk_1E6F57840;
  objc_copyWeak(&v31, &location);
  v27 = (void *)objc_msgSend(v26, "initWithSourceProvider:transformationBlock:", v25, v30);
  -[HUBannerItemModule setStatusBannerItemProvider:](self, "setStatusBannerItemProvider:", v27);

  -[HUBannerItemModule statusBannerItemProvider](self, "statusBannerItemProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  return v3;
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (HUBannerItemProvider)bannerItemProvider
{
  return self->_bannerItemProvider;
}

- (HFTransformItemProvider)statusBannerItemProvider
{
  return self->_statusBannerItemProvider;
}

- (void)setStatusBannerItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_statusBannerItemProvider, a3);
}

- (void)setDropInBannerItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dropInBannerItemProvider, a3);
}

- (void)setBannerItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bannerItemProvider, a3);
}

- (BOOL)forceShowBanners
{
  return self->_forceShowBanners;
}

- (HUDropInBannerItemProvider)dropInBannerItemProvider
{
  return self->_dropInBannerItemProvider;
}

- (HUBannerItemModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v7;
  HUBannerItemModule *v8;
  HUBannerItemModule *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUBannerItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_context, a3);

  return v9;
}

void __40__HUBannerItemModule_buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v5 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v5;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "setForceShowBanner:", 1);
}

id __40__HUBannerItemModule_buildItemProviders__block_invoke_4()
{
  uint64_t v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0D30D70];
  v2[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didUpdateDropInAvailability:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  HUBannerItemModule *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v20, 0x16u);

  }
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D314C0];
  v10 = (void *)MEMORY[0x1E0C99E60];
  -[HUBannerItemModule dropInBannerItemProvider](self, "dropInBannerItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestToReloadItemProviders:senderSelector:", v12, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v8, "performItemUpdateRequest:", v13);

  objc_msgSend(v5, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "na_any:", &__block_literal_global_86);
  if (v16)
  {
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@: %@ Posting banner size has updated notification...", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("HUBannerSizeHasUpdatedNotification"), self);

  }
}

uint64_t __50__HUBannerItemModule_didUpdateDropInAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue") ^ 1;

  return v8;
}

- (NSSet)hiddenBanners
{
  return self->_hiddenBanners;
}

- (void)setForceShowBanners:(BOOL)a3
{
  self->_forceShowBanners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBannerItemProvider, 0);
  objc_storeStrong((id *)&self->_dropInBannerItemProvider, 0);
  objc_storeStrong((id *)&self->_hiddenBanners, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bannerItemProvider, 0);
}

@end
