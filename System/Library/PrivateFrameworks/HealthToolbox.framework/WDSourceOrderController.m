@implementation WDSourceOrderController

- (WDSourceOrderController)initWithHealthStore:(id)a3
{
  id v4;
  WDSourceOrderController *v5;
  uint64_t v6;
  HKSourceStore *sourceStore;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDSourceOrderController;
  v5 = -[WDSourceOrderController init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3FD8]), "initWithHealthStore:", v4);
    sourceStore = v5->_sourceStore;
    v5->_sourceStore = (HKSourceStore *)v6;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

  }
  return v5;
}

- (WDSourceOrderController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (void)getOrderedSourcesForDataType:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKSourceStore *sourceStore;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    sourceStore = self->_sourceStore;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__WDSourceOrderController_getOrderedSourcesForDataType_withCompletion___block_invoke;
    v10[3] = &unk_24D38E0F0;
    v12 = v7;
    v11 = v6;
    -[HKSourceStore fetchOrderedSourcesForObjectType:completion:](sourceStore, "fetchOrderedSourcesForObjectType:completion:", v11, v10);

  }
}

uint64_t __71__WDSourceOrderController_getOrderedSourcesForDataType_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

- (void)setOrderedSources:(id)a3 dataType:(id)a4
{
  id v6;
  id v7;
  HKSourceStore *sourceStore;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  sourceStore = self->_sourceStore;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke;
  v11[3] = &unk_24D38E118;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  -[HKSourceStore updateOrderedSources:forObjectType:completion:](sourceStore, "updateOrderedSources:forObjectType:completion:", v10, v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke_cold_1((uint64_t)v5, v6);
  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke_188;
    block[3] = &unk_24D38CEE8;
    block[4] = WeakRetained;
    v10 = a1[4];
    v11 = a1[5];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke_188(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForDataType:withProviders:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyObserversForDataType:(id)a3 withProviders:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "sourceOrderUpdatedWithOrder:dataType:", v7, v6);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sourceStore, 0);
}

void __54__WDSourceOrderController_setOrderedSources_dataType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215814000, a2, OS_LOG_TYPE_ERROR, "Error saving source order: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
