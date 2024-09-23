@implementation HUStatusItemModule

uint64_t __33__HUStatusItemModule_statusItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __40__HUStatusItemModule__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__HUStatusItemModule__itemsToHideInSet___block_invoke_2;
    v7[3] = &unk_1E6F4DAD8;
    v8 = v6;
    objc_msgSend(v3, "na_filter:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

  }
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
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[4];
  id v23;
  id location;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HUStatusItemModule_buildItemProviders__block_invoke;
  aBlock[3] = &unk_1E6F577F8;
  objc_copyWeak(&v23, &location);
  v3 = _Block_copy(aBlock);
  v4 = objc_alloc(MEMORY[0x1E0D31868]);
  -[HUStatusItemModule context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUStatusItemModule context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithHome:room:filter:", v6, v8, v3);
  -[HUStatusItemModule setStatusItemProvider:](self, "setStatusItemProvider:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D31840]);
  v25 = *MEMORY[0x1E0D30C80];
  v26[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithResults:", v11);
  -[HUStatusItemModule setPlaceholderItem:](self, "setPlaceholderItem:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D31848]);
  v14 = (void *)MEMORY[0x1E0C99E60];
  -[HUStatusItemModule placeholderItem](self, "placeholderItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithItems:", v16);

  v18 = (void *)MEMORY[0x1E0C99E60];
  -[HUStatusItemModule statusItemProvider](self, "statusItemProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObjects:", v19, v17, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v20;
}

uint64_t __40__HUStatusItemModule_buildItemProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldHideStatusItemClass:", a2) ^ 1;

  return v5;
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (HFStatusItemProvider)statusItemProvider
{
  return self->_statusItemProvider;
}

- (void)setStatusItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_statusItemProvider, a3);
}

- (void)setPlaceholderItem:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderItem, a3);
}

- (HFItem)placeholderItem
{
  return self->_placeholderItem;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemModule allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__HUStatusItemModule__itemsToHideInSet___block_invoke;
  v11[3] = &unk_1E6F53050;
  v6 = v4;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v7, "na_each:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

BOOL __46__HUStatusItemModule__updateInvalidationTimer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v2 = a2;
  if (objc_msgSend(v2, "isInvalidationPending"))
  {
    objc_msgSend(v2, "invalidationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else if (objc_msgSend(v2, "canScheduleInvalidation"))
    {
      objc_msgSend(v2, "scheduleInvalidation");
    }
    objc_msgSend(v2, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v2, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E80]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v2, "invalidationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      if (v7 == 2 || v10 == 2)
        objc_msgSend(v2, "setNeedsInvalidation:", 0);
    }
    objc_msgSend(v2, "invalidationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v12 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateInvalidationTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  HUStatusItemModule *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[HUStatusItemModule statusItems](self, "statusItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_66_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUStatusItemModule invalidationTimer](self, "invalidationTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      && (-[HUStatusItemModule invalidationTimer](self, "invalidationTimer"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isValid"),
          v10,
          v9,
          v11))
    {
      -[HUStatusItemModule invalidationTimer](self, "invalidationTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fireDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToDate:", v8);

      if ((v14 & 1) == 0)
      {
        HFLogForCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = self;
          v29 = 2112;
          v30 = v8;
          _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@ Updating item invalidation timer to fire at date: %@", buf, 0x16u);
        }

        -[HUStatusItemModule invalidationTimer](self, "invalidationTimer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFireDate:", v8);

      }
    }
    else
    {
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = self;
        v29 = 2112;
        v30 = v8;
        _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@ Scheduling item invalidation timer to fire at date: %@", buf, 0x16u);
      }

      objc_msgSend(v8, "timeIntervalSinceNow");
      v19 = v18;
      objc_initWeak((id *)buf, self);
      v20 = (void *)MEMORY[0x1E0C99E88];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __46__HUStatusItemModule__updateInvalidationTimer__block_invoke_70;
      v25[3] = &unk_1E6F53298;
      objc_copyWeak(&v26, (id *)buf);
      objc_msgSend(v20, "scheduledTimerWithTimeInterval:repeats:block:", 0, v25, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUStatusItemModule setInvalidationTimer:](self, "setInvalidationTimer:", v21);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    -[HUStatusItemModule invalidationTimer](self, "invalidationTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = self;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@ Clearing item invalidation timer due to reason: No items pending invalidation.", buf, 0xCu);
      }

      -[HUStatusItemModule invalidationTimer](self, "invalidationTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "invalidate");

      -[HUStatusItemModule setInvalidationTimer:](self, "setInvalidationTimer:", 0);
    }
  }

}

- (id)statusItems
{
  void *v2;
  void *v3;

  -[HFItemModule allItems](self, "allItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_271);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSTimer)invalidationTimer
{
  return self->_invalidationTimer;
}

- (HUStatusItemModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v7;
  HUStatusItemModule *v8;
  HUStatusItemModule *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUStatusItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_context, a3);

  return v9;
}

uint64_t __40__HUStatusItemModule__itemsToHideInSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldEncapsulateItem:", a2);
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUStatusItemModule statusItemProvider](self, "statusItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("statusSection"));
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31868], "statusItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v11);

  objc_msgSend(v8, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {

  }
  else
  {
    -[HUStatusItemModule statusItemProvider](self, "statusItemProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      -[HUStatusItemModule placeholderItem](self, "placeholderItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setItems:", v17);

    }
  }
  v18 = (void *)MEMORY[0x1E0D314B0];
  v22 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filterSections:toDisplayedItems:", v19, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)updateNeedsInvalidation:(BOOL)a3 forStatusItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  HUStatusItemModule *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@ Asked to update needsInvalidation: %@ for status item: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(v6, "setNeedsInvalidation:", v4);
  -[HUStatusItemModule _updateInvalidationTimer](self, "_updateInvalidationTimer");

}

uint64_t __46__HUStatusItemModule__updateInvalidationTimer__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "invalidationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __46__HUStatusItemModule__updateInvalidationTimer__block_invoke_70(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setInvalidationTimer:", 0);
  objc_msgSend(WeakRetained, "_invalidateItemsIfNecessary");
  objc_msgSend(WeakRetained, "_updateInvalidationTimer");

}

- (void)_invalidateItemsIfNecessary
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  HUStatusItemModule *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HUStatusItemModule statusItems](self, "statusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_72_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_each:", &__block_literal_global_75_2);
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Invalidating status items: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D314C0], "requestToUpdateItems:senderSelector:", v5, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "performItemUpdateRequest:", v7);

}

BOOL __49__HUStatusItemModule__invalidateItemsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  if (objc_msgSend(v2, "supportsInvalidation"))
  {
    objc_msgSend(v2, "invalidationDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "invalidationDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "compare:", v5) != 1;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __49__HUStatusItemModule__invalidateItemsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsInvalidation:", 0);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setInvalidationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_statusItemProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_placeholderItem, 0);
}

@end
