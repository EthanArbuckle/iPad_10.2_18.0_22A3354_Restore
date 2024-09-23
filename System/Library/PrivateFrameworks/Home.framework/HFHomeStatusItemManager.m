@implementation HFHomeStatusItemManager

- (HFHomeStatusItemManager)initWithRoom:(id)a3 delegate:(id)a4
{
  id v7;
  HFHomeStatusItemManager *v8;
  HFHomeStatusItemManager *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFHomeStatusItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a4, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_room, a3);

  return v9;
}

- (HFHomeStatusItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRoom_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomeStatusItemManager.m"), 40, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFHomeStatusItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (void)updateNeedsInvalidation:(BOOL)a3 forStatusItem:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  HFHomeStatusItemManager *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory(0x29uLL);
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
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%@ Asked to update needsInvalidation: %@ for status item: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(v6, "setNeedsInvalidation:", v4);
  -[HFHomeStatusItemManager _updateInvalidationTimer](self, "_updateInvalidationTimer");

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  HFStatusItemProvider *v5;
  void *v6;
  HFStatusItemProvider *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HFStatusItemProvider alloc];
  -[HFHomeStatusItemManager room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFStatusItemProvider initWithHome:room:](v5, "initWithHome:room:", v4, v6);

  -[HFHomeStatusItemManager setStatusItemProvider:](self, "setStatusItemProvider:", v7);
  -[HFHomeStatusItemManager statusItemProvider](self, "statusItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  return +[HFStatusItemProvider statusItemComparator](HFStatusItemProvider, "statusItemComparator", a3);
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  void *v16;
  objc_super v17;

  -[HFItemManager allItems](self, "allItems", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)HFHomeStatusItemManager;
  -[HFItemManager _itemsToHideInSet:](&v17, sel__itemsToHideInSet_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HFItemManager allItems](self, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_setByRemovingObjectsFromSet:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__HFHomeStatusItemManager__itemsToHideInSet___block_invoke;
  v14[3] = &unk_1EA733DD0;
  v9 = v6;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  objc_msgSend(v10, "na_each:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

void __45__HFHomeStatusItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
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
    v7[2] = __45__HFHomeStatusItemManager__itemsToHideInSet___block_invoke_2;
    v7[3] = &unk_1EA7295B8;
    v8 = v6;
    objc_msgSend(v3, "na_filter:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

  }
}

uint64_t __45__HFHomeStatusItemManager__itemsToHideInSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldEncapsulateItem:", a2);
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFHomeStatusItemManager;
  -[HFItemManager _didFinishUpdateTransactionWithAffectedItems:](&v4, sel__didFinishUpdateTransactionWithAffectedItems_, a3);
  -[HFHomeStatusItemManager _updateInvalidationTimer](self, "_updateInvalidationTimer");
}

- (BOOL)_requiresNotificationsForCharacteristic:(id)a3
{
  return 1;
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[HFItemManager allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__HFHomeStatusItemManager_matchingItemForHomeKitObject___block_invoke;
  v12[3] = &unk_1EA7295B8;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HFHomeStatusItemManager;
    -[HFItemManager matchingItemForHomeKitObject:](&v11, sel_matchingItemForHomeKitObject_, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

uint64_t __56__HFHomeStatusItemManager_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HFHomeStatusItemManager_matchingItemForHomeKitObject___block_invoke_2;
  v7[3] = &unk_1EA72E198;
  v8 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

uint64_t __56__HFHomeStatusItemManager_matchingItemForHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v3, "accessory");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_10;
      objc_msgSend(v3, "hf_linkedAccessory");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
    if (v5)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v5);

      goto LABEL_11;
    }
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  v4 = 1;
LABEL_11:

  return v4;
}

- (BOOL)shouldPerformInitialLoadOnMainThread
{
  return 1;
}

- (id)statusItems
{
  void *v2;
  void *v3;

  -[HFItemManager allItems](self, "allItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_163);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __38__HFHomeStatusItemManager_statusItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
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
  HFHomeStatusItemManager *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[HFHomeStatusItemManager statusItems](self, "statusItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_23_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_25_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFHomeStatusItemManager invalidationTimer](self, "invalidationTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      && (-[HFHomeStatusItemManager invalidationTimer](self, "invalidationTimer"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isValid"),
          v10,
          v9,
          v11))
    {
      -[HFHomeStatusItemManager invalidationTimer](self, "invalidationTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fireDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToDate:", v8);

      if ((v14 & 1) == 0)
      {
        HFLogForCategory(0x29uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = self;
          v29 = 2112;
          v30 = v8;
          _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "%@ Updating item invalidation timer to fire at date: %@", buf, 0x16u);
        }

        -[HFHomeStatusItemManager invalidationTimer](self, "invalidationTimer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFireDate:", v8);

      }
    }
    else
    {
      HFLogForCategory(0x29uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = self;
        v29 = 2112;
        v30 = v8;
        _os_log_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_DEFAULT, "%@ Scheduling item invalidation timer to fire at date: %@", buf, 0x16u);
      }

      objc_msgSend(v8, "timeIntervalSinceNow");
      v19 = v18;
      objc_initWeak((id *)buf, self);
      v20 = (void *)MEMORY[0x1E0C99E88];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __51__HFHomeStatusItemManager__updateInvalidationTimer__block_invoke_27;
      v25[3] = &unk_1EA7316A0;
      objc_copyWeak(&v26, (id *)buf);
      objc_msgSend(v20, "scheduledTimerWithTimeInterval:repeats:block:", 0, v25, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFHomeStatusItemManager setInvalidationTimer:](self, "setInvalidationTimer:", v21);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    -[HFHomeStatusItemManager invalidationTimer](self, "invalidationTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      HFLogForCategory(0x29uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = self;
        _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "%@ Clearing item invalidation timer due to reason: No items pending invalidation.", buf, 0xCu);
      }

      -[HFHomeStatusItemManager invalidationTimer](self, "invalidationTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "invalidate");

      -[HFHomeStatusItemManager setInvalidationTimer:](self, "setInvalidationTimer:", 0);
    }
  }

}

BOOL __51__HFHomeStatusItemManager__updateInvalidationTimer__block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v2, "latestResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("transitioningState"));
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

uint64_t __51__HFHomeStatusItemManager__updateInvalidationTimer__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __51__HFHomeStatusItemManager__updateInvalidationTimer__block_invoke_27(uint64_t a1)
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
  id v7;
  int v8;
  HFHomeStatusItemManager *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HFHomeStatusItemManager statusItems](self, "statusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_29_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_each:", &__block_literal_global_32_8);
  HFLogForCategory(0x29uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Invalidating status items: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v5, a2);
}

BOOL __54__HFHomeStatusItemManager__invalidateItemsIfNecessary__block_invoke(uint64_t a1, void *a2)
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

uint64_t __54__HFHomeStatusItemManager__invalidateItemsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsInvalidation:", 0);
}

- (HMRoom)room
{
  return self->_room;
}

- (void)setRoom:(id)a3
{
  objc_storeStrong((id *)&self->_room, a3);
}

- (HFStatusItemProvider)statusItemProvider
{
  return self->_statusItemProvider;
}

- (void)setStatusItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_statusItemProvider, a3);
}

- (NSTimer)invalidationTimer
{
  return self->_invalidationTimer;
}

- (void)setInvalidationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_statusItemProvider, 0);
  objc_storeStrong((id *)&self->_room, 0);
}

@end
