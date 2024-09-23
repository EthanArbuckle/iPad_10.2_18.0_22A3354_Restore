@implementation NPKPassesManager

- (NPKPassesManager)init
{
  return -[NPKPassesManager initWithOptions:](self, "initWithOptions:", 0);
}

- (NPKPassesManager)initWithOptions:(unint64_t)a3
{
  NPKPassesManager *v4;
  NPKPassesManager *v5;
  uint64_t v6;
  NSHashTable *observers;
  NPKStandaloneFirstUnlockCoordinator *v8;
  uint64_t v9;
  NPKStandaloneFirstUnlockCoordinator *firstUnlockCoordinator;
  dispatch_queue_t v11;
  OS_dispatch_queue *loadImageQueue;
  NPKStandaloneFirstUnlockCoordinator *v13;
  uint64_t v14;
  int *v15;
  const char *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  int *v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NPKPassesManager;
  v4 = -[NPKPassesManager init](&v24, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    objc_msgSend(MEMORY[0x24BDD15C0], "pk_weakObjectsHashTableUsingPointerPersonality");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    v8 = [NPKStandaloneFirstUnlockCoordinator alloc];
    v9 = -[NPKStandaloneFirstUnlockCoordinator initWithQueue:](v8, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    firstUnlockCoordinator = v5->_firstUnlockCoordinator;
    v5->_firstUnlockCoordinator = (NPKStandaloneFirstUnlockCoordinator *)v9;

    v11 = dispatch_queue_create("com.apple.nanoPassKit.NPKPassesManager.imageProcessing", 0);
    loadImageQueue = v5->_loadImageQueue;
    v5->_loadImageQueue = (OS_dispatch_queue *)v11;

    objc_initWeak(&location, v5);
    v13 = v5->_firstUnlockCoordinator;
    v14 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __36__NPKPassesManager_initWithOptions___block_invoke;
    v20[3] = &unk_24CFE7BA8;
    objc_copyWeak(&v22, &location);
    v15 = v5;
    v21 = v15;
    -[NPKStandaloneFirstUnlockCoordinator performSubjectToFirstUnlock:](v13, "performSubjectToFirstUnlock:", v20);
    v15[4] = -1;
    v16 = (const char *)objc_msgSend((id)*MEMORY[0x24BE6F260], "UTF8String");
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __36__NPKPassesManager_initWithOptions___block_invoke_38;
    v18[3] = &unk_24CFE78F0;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch(v16, v15 + 4, MEMORY[0x24BDAC9B8], v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __36__NPKPassesManager_initWithOptions___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__NPKPassesManager_initWithOptions___block_invoke_2;
  v2[3] = &unk_24CFE7BA8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __36__NPKPassesManager_initWithOptions___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKObservePassSettingsChanged();
    v2 = objc_alloc_init(MEMORY[0x24BE6EC00]);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EB30]), "initWithPassLibrary:", v2);
    objc_msgSend(v3, "setDelegate:", WeakRetained);
    v4 = (void *)WeakRetained[4];
    WeakRetained[4] = v3;

    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Passes manager: Loading passes following first unlock", v8, 2u);
      }

    }
    objc_msgSend(WeakRetained, "_loadPasses");

  }
}

void __36__NPKPassesManager_initWithOptions___block_invoke_38(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Passes manager: Reloading passes because default payment pass is changed", v5, 2u);
      }

    }
    objc_msgSend(WeakRetained, "_reloadPasses");
  }

}

- (void)dealloc
{
  objc_super v3;

  PKUnregisterPassSettingsChangedObserver();
  if (notify_is_valid_token(self->_notifyToken))
    notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)NPKPassesManager;
  -[NPKPassesManager dealloc](&v3, sel_dealloc);
}

- (void)registerObserver:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (!v5)
    {
      -[NSHashTable addObject:](self->_observers, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (v5)
    {
      -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
      v4 = v6;
    }
  }

}

- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2048;
      v17 = a5;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Groups controller inserted group %@ at index %lu", buf, 0x16u);
    }

  }
  objc_msgSend(v7, "addGroupObserver:", self);
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__NPKPassesManager_groupsController_didInsertGroup_atIndex___block_invoke;
  v12[3] = &unk_24CFE7BD0;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v12);

}

void __60__NPKPassesManager_groupsController_didInsertGroup_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "passes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passesDataSource:didAddPasses:", v2, v5);

}

- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      v16 = 2048;
      v17 = a5;
      v18 = 2048;
      v19 = a6;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Groups controller moved group %@ from index %lu to index %lu", buf, 0x20u);
    }

  }
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__NPKPassesManager_groupsController_didMoveGroup_fromIndex_toIndex___block_invoke;
  v13[3] = &unk_24CFE7BF8;
  v13[4] = self;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v13);

}

uint64_t __68__NPKPassesManager_groupsController_didMoveGroup_fromIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passesDataSourceDidReorderPasses:", *(_QWORD *)(a1 + 32));
}

- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2048;
      v17 = a5;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Groups controller removed group %@ at index %lu", buf, 0x16u);
    }

  }
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__NPKPassesManager_groupsController_didRemoveGroup_atIndex___block_invoke;
  v12[3] = &unk_24CFE7BD0;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v12);

}

void __60__NPKPassesManager_groupsController_didRemoveGroup_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "passes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passesDataSource:didRemovePasses:", v2, v5);

}

- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  pk_General_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "uniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v23 = v10;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      v28 = 2112;
      v29 = v12;
      v30 = 2048;
      v31 = a6;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ inserted pass %@ (%@) with state (%@) at index %lu", buf, 0x34u);

    }
  }
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __58__NPKPassesManager_group_didInsertPass_withState_atIndex___block_invoke;
  v20[3] = &unk_24CFE7BD0;
  v20[4] = self;
  v21 = v11;
  v18 = v11;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v20);
  v19 = NPKIsTruthOnCard(v18);
  NPKTrackTruthOnCard(v19);

}

void __58__NPKPassesManager_group_didInsertPass_withState_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passesDataSource:didAddPasses:", v2, v5, v6, v7);

}

- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v8;
      v15 = 2048;
      v16 = a4;
      v17 = 2048;
      v18 = a5;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ moved pass from index %lu to index %lu", buf, 0x20u);
    }

  }
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__NPKPassesManager_group_didMovePassFromIndex_toIndex___block_invoke;
  v12[3] = &unk_24CFE7BF8;
  v12[4] = self;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v12);

}

uint64_t __55__NPKPassesManager_group_didMovePassFromIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passesDataSourceDidReorderPasses:", *(_QWORD *)(a1 + 32));
}

- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v19 = v8;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2048;
      v25 = a5;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ removed pass %@ (%@) at index %lu", buf, 0x2Au);

    }
  }
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __48__NPKPassesManager_group_didRemovePass_atIndex___block_invoke;
  v16[3] = &unk_24CFE7BD0;
  v16[4] = self;
  v17 = v9;
  v15 = v9;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v16);

}

void __48__NPKPassesManager_group_didRemovePass_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passesDataSource:didRemovePasses:", v2, v5, v6, v7);

}

- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  NPKPassesManager *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  pk_General_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "uniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v23 = v10;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      v28 = 2112;
      v29 = v12;
      v30 = 2048;
      v31 = a6;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ updated pass %@ (%@) with state (%@) at index %lu", buf, 0x34u);

    }
  }
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__NPKPassesManager_group_didUpdatePass_withState_atIndex___block_invoke;
  v19[3] = &unk_24CFE7BD0;
  v20 = v11;
  v21 = self;
  v18 = v11;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v19);

}

void __58__NPKPassesManager_group_didUpdatePass_withState_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v5[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(v3, "passesDataSource:didUpdatePasses:", *(_QWORD *)(a1 + 40), v4);

}

- (void)group:(id)a3 didUpdatePassState:(id)a4 forPass:(id)a5 atIndex:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  NPKPassesManager *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  pk_General_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "uniqueID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 2048;
      v33 = a6;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Group %@ updated state (%@) for pass %@ (%@) at index %lu", buf, 0x34u);

    }
  }
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __61__NPKPassesManager_group_didUpdatePassState_forPass_atIndex___block_invoke;
  v20[3] = &unk_24CFE7C20;
  v21 = v12;
  v22 = v11;
  v23 = self;
  v18 = v11;
  v19 = v12;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v20);

}

void __61__NPKPassesManager_group_didUpdatePassState_forPass_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v11[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (void *)MEMORY[0x24BDBD1A8];
    }
    objc_msgSend(*(id *)(a1 + 32), "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v9 = v6;
      v10 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (void *)MEMORY[0x24BDBD1B8];
    }

    objc_msgSend(v3, "passesDataSource:didUpdateStates:forPasses:", *(_QWORD *)(a1 + 48), v8, v4);
  }

}

- (id)passForUniqueID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[NPKPassesManager passes](self, "passes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__NPKPassesManager_passForUniqueID___block_invoke;
  v9[3] = &unk_24CFE7C48;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __36__NPKPassesManager_passForUniqueID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)shouldAllowMovingItemAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  PKGroupsController *groupsController;
  void *v11;
  uint64_t v12;
  PKGroupsController *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  PKGroupsController *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v32;
  void *v33;

  -[NPKPassesManager passes](self, "passes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= a3 || objc_msgSend(v7, "count") <= a4)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    groupsController = self->_groupsController;
    objc_msgSend(v8, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKGroupsController groupIndexForPassUniqueID:](groupsController, "groupIndexForPassUniqueID:", v11);
    v13 = self->_groupsController;
    objc_msgSend(v9, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKGroupsController groupIndexForPassUniqueID:](v13, "groupIndexForPassUniqueID:", v14);

    if (v12 == v15)
      goto LABEL_4;
    v17 = self->_groupsController;
    objc_msgSend(v9, "uniqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKGroupsController groupIndexForPassUniqueID:](v17, "groupIndexForPassUniqueID:", v18);

    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "passAtIndex:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "passAtIndex:", objc_msgSend(v20, "passCount") - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "uniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v22, "isEqualToString:", v23);

      objc_msgSend(v21, "uniqueID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      v27 = a4 <= a3 ? v32 : v26;
      if (v27 != 1)
        goto LABEL_4;
    }
    if (objc_msgSend(v8, "passType") == 1
      && objc_msgSend(v9, "passType") == 1
      && objc_msgSend(v8, "style") != 7
      && objc_msgSend(v9, "style") == 7)
    {
LABEL_4:
      v16 = 0;
    }
    else
    {
      v28 = objc_msgSend(v8, "passType");
      if ((a4 > a3 || v28 != 1) && ((v29 = objc_msgSend(v8, "passType"), a4 <= a3) || v29 == 1))
      {
        v30 = objc_msgSend(v9, "passType");
        v16 = v30 == objc_msgSend(v8, "passType");
      }
      else
      {
        v16 = 1;
      }
    }

  }
  return v16;
}

- (void)movePassAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[NPKPassesManager passes](self, "passes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassesManager passes](self, "passes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassesManager groupsController](self, "groupsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "groupIndexForPassUniqueID:", v12);

  -[NPKPassesManager groupsController](self, "groupsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "groupIndexForPassUniqueID:", v15);

  pk_Payment_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v16 == 0x7FFFFFFFFFFFFFFFLL || v13 == v16)
  {
    if (v18)
    {
      pk_Payment_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "uniqueID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v26 = v23;
        v27 = 2048;
        v28 = a3;
        v29 = 2048;
        v30 = a4;
        v31 = 2048;
        v32 = v13;
        v33 = 2048;
        v34 = v16;
        _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Warning: Not supported pass move. Pass %@ at index %lu to %lu (from group index %lu, to group index %lu)", buf, 0x34u);

      }
    }
  }
  else
  {
    if (v18)
    {
      pk_Payment_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "uniqueID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v26 = v20;
        v27 = 2048;
        v28 = a3;
        v29 = 2048;
        v30 = a4;
        v31 = 2048;
        v32 = v13;
        v33 = 2048;
        v34 = v16;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Warning: Moving pass %@ at index %lu to %lu (from group index %lu, to group index %lu)", buf, 0x34u);

      }
    }
    -[NPKPassesManager groupsController](self, "groupsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "moveGroupAtIndex:toIndex:", v13, v16);

    -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __44__NPKPassesManager_movePassAtIndex_toIndex___block_invoke;
    v24[3] = &unk_24CFE7BF8;
    v24[4] = self;
    -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v24);
  }

}

uint64_t __44__NPKPassesManager_movePassAtIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passesDataSourceDidReorderPasses:", *(_QWORD *)(a1 + 32));
}

- (void)unarchivePass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__NPKPassesManager_unarchivePass___block_invoke;
  v8[3] = &unk_24CFE7C70;
  v7 = v4;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "setSortingState:forObjectWithUniqueID:withCompletion:", 2, v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __34__NPKPassesManager_unarchivePass___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  NSObject *WeakRetained;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (a2)
  {
    if (v5)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "uniqueID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Pass with unique id:%@ was manually recovered successfully", (uint8_t *)&v10, 0xCu);

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _reloadPasses](WeakRetained, "_reloadPasses");
  }
  else
  {
    if (!v5)
      return;
    pk_General_log();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_213518000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Warning: Pass with unique id:%@ failed to be manually recovered", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)removePass:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NPKPassesManager groupsController](self, "groupsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "handleUserPassDelete:", v5);
}

- (void)setDefaultPaymentPass:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BE6ED30];
  v4 = a3;
  v6 = objc_alloc_init(v3);
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDefaultPaymentPassUniqueIdentifier:", v5);
}

- (id)defaultPaymentPass
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[NPKPassesManager currentPasses](self, "currentPasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "npkIsDefaultPassEligible"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)enableRemoteUpdates
{
  -[PKGroupsController enableRemoteUpdates](self->_groupsController, "enableRemoteUpdates");
}

- (void)suppressRemoteUpdates
{
  -[PKGroupsController suppressRemoteUpdates:](self->_groupsController, "suppressRemoteUpdates:", 1);
}

- (void)reloadPassesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__NPKPassesManager_reloadPassesWithCompletion___block_invoke;
  v6[3] = &unk_24CFE7C98;
  v7 = v4;
  v5 = v4;
  -[NPKPassesManager _reloadPassesWithCompletion:](self, "_reloadPassesWithCompletion:", v6);

}

uint64_t __47__NPKPassesManager_reloadPassesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)dynamicStateForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NPKPassesManager passDynamicStates](self, "passDynamicStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateCurrentPasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  BOOL v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[NPKPassesManager setCurrentPasses:](self, "setCurrentPasses:", 0);
  -[NPKPassesManager setCurrentPaymentPasses:](self, "setCurrentPaymentPasses:", 0);
  -[NPKPassesManager setCurrentSecureElementPasses:](self, "setCurrentSecureElementPasses:", 0);
  -[NPKPassesManager setCurrentExpiredPasses:](self, "setCurrentExpiredPasses:", 0);
  -[NPKPassesManager setCurrentPassDynamicStates:](self, "setCurrentPassDynamicStates:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (NPKIsRunningInStoreDemoMode())
    v8 = NPKIsPaymentSetupSupportedInRegion() != 2;
  else
    v8 = 1;
  -[NPKPassesManager groupsController](self, "groupsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __40__NPKPassesManager__updateCurrentPasses__block_invoke;
  v34[3] = &unk_24CFE7D10;
  v40 = v8;
  v11 = v5;
  v35 = v11;
  v12 = v4;
  v36 = v12;
  v13 = v3;
  v37 = v13;
  v14 = v7;
  v38 = v14;
  v15 = v6;
  v39 = v15;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v34);

  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassesManager setCurrentPasses:](self, "setCurrentPasses:", v17);

  v18 = (void *)objc_msgSend(v12, "copy");
  -[NPKPassesManager setCurrentPaymentPasses:](self, "setCurrentPaymentPasses:", v18);

  v19 = (void *)objc_msgSend(v11, "copy");
  -[NPKPassesManager setCurrentSecureElementPasses:](self, "setCurrentSecureElementPasses:", v19);

  -[NPKPassesManager groupsController](self, "groupsController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "expiredSectionPasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassesManager setCurrentExpiredPasses:](self, "setCurrentExpiredPasses:", v22);

  v23 = (void *)objc_msgSend(v14, "copy");
  -[NPKPassesManager setCurrentPassDynamicStates:](self, "setCurrentPassDynamicStates:", v23);

  pk_General_log();
  v24 = objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v21)
  {
    pk_General_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassesManager currentPasses](self, "currentPasses");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v33, "count");
      -[NPKPassesManager currentPaymentPasses](self, "currentPaymentPasses");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v32, "count");
      -[NPKPassesManager currentSecureElementPasses](self, "currentSecureElementPasses");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");
      -[NPKPassesManager currentExpiredPasses](self, "currentExpiredPasses");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");
      *(_DWORD *)buf = 134218752;
      v42 = v31;
      v43 = 2048;
      v44 = v26;
      v45 = 2048;
      v46 = v28;
      v47 = 2048;
      v48 = v30;
      _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Updated passes with %lu passes, %lu payment styled passes, %lu se passes and %lu expired passes.", buf, 0x2Au);

    }
  }

}

void __40__NPKPassesManager__updateCurrentPasses__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id *v8;
  id *v9;
  id *v10;
  id v11;
  BOOL v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;

  v3 = a2;
  objc_msgSend(v3, "passes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v15, "style") == 6 && *(_BYTE *)(a1 + 72) != 0;
  objc_msgSend(v15, "secureElementPass", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 || v6)
  {
    v12 = v6 != 0;
    objc_msgSend(v3, "passes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __40__NPKPassesManager__updateCurrentPasses__block_invoke_2;
    v21[3] = &unk_24CFE7CC0;
    v8 = &v22;
    v22 = v3;
    v27 = v12;
    v9 = &v23;
    v23 = *(id *)(a1 + 32);
    v28 = v5;
    v10 = &v24;
    v24 = *(id *)(a1 + 40);
    v25 = *(id *)(a1 + 48);
    v26 = *(id *)(a1 + 56);
    v14 = v3;
    objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 2, v21);

    v7 = v25;
  }
  else
  {
    objc_msgSend(v3, "passes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __40__NPKPassesManager__updateCurrentPasses__block_invoke_3;
    v17[3] = &unk_24CFE7CE8;
    v8 = &v18;
    v18 = v3;
    v9 = &v19;
    v19 = *(id *)(a1 + 64);
    v10 = &v20;
    v20 = *(id *)(a1 + 56);
    v11 = v3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);
  }

}

void __40__NPKPassesManager__updateCurrentPasses__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "passAtIndex:");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v15, 0);
    objc_msgSend(v15, "secureElementPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "npkIsBankConnectEligible"))
    {
      objc_msgSend(*(id *)(a1 + 32), "stateAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "liveRender");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "liveRender");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "enabled");

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v6, "npkSetLiveRenderEnabled:", v11);

    }
  }
  if (!*(_BYTE *)(a1 + 73) || (objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v15, 0), !*(_BYTE *)(a1 + 73)))
  {
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 56), "insertObject:atIndex:", v15, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "stateAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 64);
  objc_msgSend(v15, "uniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

}

void __40__NPKPassesManager__updateCurrentPasses__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "passAtIndex:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "safelyAddObject:", v8);
  objc_msgSend(*(id *)(a1 + 32), "stateAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  objc_msgSend(v8, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

}

uint64_t __40__NPKPassesManager__updateCurrentPasses__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "comparePassDatesToPass:searchOption:", a2, 3);
}

- (void)_registerGroupControllerGroupObserver
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[NPKPassesManager groupsController](self, "groupsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addGroupObserver:", self, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_loadPasses
{
  PKGroupsController *groupsController;
  _QWORD v3[5];

  groupsController = self->_groupsController;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __31__NPKPassesManager__loadPasses__block_invoke;
  v3[3] = &unk_24CFE7998;
  v3[4] = self;
  -[PKGroupsController loadGroupsWithCompletion:](groupsController, "loadGroupsWithCompletion:", v3);
}

uint64_t __31__NPKPassesManager__loadPasses__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = *(_BYTE **)(a1 + 32);
  if ((v2[88] & 1) != 0)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __31__NPKPassesManager__loadPasses__block_invoke_2;
    v5[3] = &unk_24CFE7998;
    v5[4] = v2;
    objc_msgSend(v2, "_loadImageSetFromPasses:", v5);
  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __31__NPKPassesManager__loadPasses__block_invoke_3;
    v4[3] = &unk_24CFE7998;
    v4[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_registerGroupControllerGroupObserver");
}

uint64_t __31__NPKPassesManager__loadPasses__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishLoadPasses");
}

uint64_t __31__NPKPassesManager__loadPasses__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishLoadPasses");
}

- (void)_loadImageSetFromPasses:(id)a3
{
  id v4;
  dispatch_group_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  dispatch_group_t v14;
  NPKPassesManager *v15;
  char v16;

  v4 = a3;
  v5 = dispatch_group_create();
  v6 = (LOBYTE(self->_options) >> 2) & 1;
  -[PKGroupsController groups](self->_groupsController, "groups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__NPKPassesManager__loadImageSetFromPasses___block_invoke;
  v13[3] = &unk_24CFE7DC8;
  v16 = v6;
  v14 = v5;
  v15 = self;
  v9 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_4;
  v11[3] = &unk_24CFE7B00;
  v12 = v4;
  v10 = v4;
  dispatch_group_notify(v9, MEMORY[0x24BDAC9B8], v11);

}

void __44__NPKPassesManager__loadImageSetFromPasses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  objc_msgSend(a2, "passes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_2;
  v6[3] = &unk_24CFE7DA0;
  v9 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

}

void __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v3 = a2;
  v4 = *(_BYTE *)(a1 + 48);
  if (v4)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v4 = *(_BYTE *)(a1 + 48);
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_3;
  v6[3] = &unk_24CFE7D78;
  v8 = v4;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "_loadContentAndImageSetsForPass:completion:", v3, v6);

}

void __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __44__NPKPassesManager__loadImageSetFromPasses___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_didFinishLoadPasses
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Passes manager: All passes loaded.", buf, 2u);
    }

  }
  -[NPKPassesManager _updateCurrentPasses](self, "_updateCurrentPasses");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__NPKPassesManager__didFinishLoadPasses__block_invoke;
  v6[3] = &unk_24CFE7BF8;
  v6[4] = self;
  -[NPKPassesManager _notifyObservers:](self, "_notifyObservers:", v6);
}

uint64_t __40__NPKPassesManager__didFinishLoadPasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passesDataSourceDidReloadPasses:", *(_QWORD *)(a1 + 32));
}

- (void)_reloadPasses
{
  -[PKGroupsController reloadGroupsWithCompletion:](self->_groupsController, "reloadGroupsWithCompletion:", 0);
}

- (void)_reloadPassesWithCompletion:(id)a3
{
  id v4;
  PKGroupsController *groupsController;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  groupsController = self->_groupsController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__NPKPassesManager__reloadPassesWithCompletion___block_invoke;
  v7[3] = &unk_24CFE7DF0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[PKGroupsController reloadGroupsWithCompletion:](groupsController, "reloadGroupsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __48__NPKPassesManager__reloadPassesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateCurrentPasses");
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v5, "currentPasses");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    }
    objc_msgSend(v5, "_registerGroupControllerGroupObserver");
    WeakRetained = v5;
  }

}

- (void)_loadContentAndImageSetsForPass:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  id v35;
  id v36;
  id obj;
  void *v38;
  _QWORD block[4];
  id v40;
  _QWORD v41[4];
  id v42;
  NSObject *v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36 = a4;
  objc_msgSend(v6, "uniqueID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "style") == 6
    || (objc_msgSend(v6, "displayProfile"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasBackgroundImage"),
        v8,
        v9))
  {
    objc_msgSend(v7, "addObject:", &unk_24D0564B8);
  }
  if (objc_msgSend(v6, "style") != 6)
    objc_msgSend(v7, "addObject:", &unk_24D0564D0);
  v10 = dispatch_group_create();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        v15 = v6;
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "integerValue");
        pk_Payment_log();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
          pk_Payment_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v57 = v17;
            v58 = 2112;
            v59 = v38;
            _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Loading image set type %ld for pass with unique ID %@", buf, 0x16u);
          }

        }
        dispatch_group_enter(v10);
        v21 = objc_msgSend(v16, "integerValue");
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke;
        v47[3] = &unk_24CFE7E18;
        v47[4] = self;
        v6 = v15;
        v22 = v15;
        v48 = v22;
        v51 = v17;
        v49 = v38;
        v50 = v10;
        objc_msgSend(v22, "loadImageSetAsync:preheat:withCompletion:", v21, 1, v47);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v12);
  }

  if (NPKIsValidVASPass(v6))
  {
    pk_Payment_log();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

    if (v24)
    {
      pk_Payment_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (uint64_t)v38;
        _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Loading preview image set for pass with unique ID %@", buf, 0xCu);
      }

    }
    dispatch_group_enter(v10);
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_58;
    v44[3] = &unk_24CFE7E40;
    v45 = v38;
    v46 = v10;
    objc_msgSend(v6, "loadImageSetAsync:preheat:withCompletion:", 1, 1, v44);

  }
  pk_Payment_log();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

  if (v27)
  {
    pk_Payment_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = (uint64_t)v38;
      _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Loading content for pass with unique ID %@", buf, 0xCu);
    }

  }
  dispatch_group_enter(v10);
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_59;
  v41[3] = &unk_24CFE7E40;
  v29 = v38;
  v42 = v29;
  v30 = v10;
  v43 = v30;
  objc_msgSend(v6, "loadContentAsyncWithCompletion:", v41);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "colorProfile");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    pk_General_log();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

    if (v33)
    {
      pk_General_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v57 = (uint64_t)v31;
        v58 = 2112;
        v59 = v29;
        _os_log_impl(&dword_213518000, v34, OS_LOG_TYPE_DEFAULT, "Notice: Loaded color profile %@ for pass with unique ID %@", buf, 0x16u);
      }

    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_62;
  block[3] = &unk_24CFE7B00;
  v40 = v36;
  v35 = v36;
  dispatch_group_notify(v30, MEMORY[0x24BDAC9B8], block);

}

void __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_2;
  block[3] = &unk_24CFE7E18;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 64);
  v9 = v4;
  v13 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v7;
  v12 = *(id *)(a1 + 56);
  dispatch_async(v3, block);

}

void __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isImageSetLoaded:", *(_QWORD *)(a1 + 64));
  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2)
  {
    if (v4)
    {
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 64);
        v7 = *(_QWORD *)(a1 + 40);
        v22 = 134218242;
        v23 = v6;
        v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Finished loading image set %ld for pass with unique ID %@", (uint8_t *)&v22, 0x16u);
      }

    }
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 48) + 88) & 2) != 0)
    {
      v8 = *(_QWORD *)(a1 + 64);
      if (!v8)
      {
        pk_Payment_log();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
          pk_Payment_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(_QWORD *)(a1 + 40);
            v22 = 138412290;
            v23 = v21;
            _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Memory-mapping front face image set for pass with unique ID %@", (uint8_t *)&v22, 0xCu);
          }

        }
        v13 = *(void **)(a1 + 32);
        v14 = 0;
        goto LABEL_22;
      }
      if (v8 == 4)
      {
        pk_Payment_log();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

        if (v10)
        {
          pk_Payment_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = *(_QWORD *)(a1 + 40);
            v22 = 138412290;
            v23 = v12;
            _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Memory-mapping logo image set for pass with unique ID %@", (uint8_t *)&v22, 0xCu);
          }

        }
        v13 = *(void **)(a1 + 32);
        v14 = 4;
LABEL_22:
        objc_msgSend(v13, "imageSetLoadedIfNeeded:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject memoryMapImageData](v15, "memoryMapImageData");
LABEL_23:

      }
    }
  }
  else if (v4)
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 64);
      v17 = *(_QWORD *)(a1 + 40);
      v22 = 134218242;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Attempt to load image set %ld for pass with unique ID %@ was unsuccessful!", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_23;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_58(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finished loading preview image set for pass with unique ID %@", (uint8_t *)&v6, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_59(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finished loading content for pass with unique ID %@", (uint8_t *)&v6, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __63__NPKPassesManager__loadContentAndImageSetsForPass_completion___block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_notifyObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_handleObjectSettingsChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  NPKPassesManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__NPKPassesManager__handleObjectSettingsChanged___block_invoke;
  v6[3] = &unk_24CFE7E40;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __49__NPKPassesManager__handleObjectSettingsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE6F5D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE6F5C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 40), "passForUniqueID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Got object settings changed to %u for pass (%@) with unique ID %@", buf, 0x1Cu);
    }

  }
  if (v6)
  {
    objc_msgSend(v6, "setSettingsWithoutUpdatingDataAccessor:", v5);
    v10 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__NPKPassesManager__handleObjectSettingsChanged___block_invoke_63;
    v11[3] = &unk_24CFE7BD0;
    v11[4] = v10;
    v12 = v6;
    objc_msgSend(v10, "_notifyObservers:", v11);

  }
}

void __49__NPKPassesManager__handleObjectSettingsChanged___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passesDataSource:didUpdateSettingsForPass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (void)setGroupsController:(id)a3
{
  objc_storeStrong((id *)&self->_groupsController, a3);
}

- (NSArray)currentPasses
{
  return self->_currentPasses;
}

- (void)setCurrentPasses:(id)a3
{
  objc_storeStrong((id *)&self->_currentPasses, a3);
}

- (NSArray)currentPaymentPasses
{
  return self->_currentPaymentPasses;
}

- (void)setCurrentPaymentPasses:(id)a3
{
  objc_storeStrong((id *)&self->_currentPaymentPasses, a3);
}

- (NSArray)currentSecureElementPasses
{
  return self->_currentSecureElementPasses;
}

- (void)setCurrentSecureElementPasses:(id)a3
{
  objc_storeStrong((id *)&self->_currentSecureElementPasses, a3);
}

- (NSArray)currentExpiredPasses
{
  return self->_currentExpiredPasses;
}

- (void)setCurrentExpiredPasses:(id)a3
{
  objc_storeStrong((id *)&self->_currentExpiredPasses, a3);
}

- (NSDictionary)currentPassDynamicStates
{
  return self->_currentPassDynamicStates;
}

- (void)setCurrentPassDynamicStates:(id)a3
{
  objc_storeStrong((id *)&self->_currentPassDynamicStates, a3);
}

- (NPKStandaloneFirstUnlockCoordinator)firstUnlockCoordinator
{
  return self->_firstUnlockCoordinator;
}

- (void)setFirstUnlockCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlockCoordinator, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnlockCoordinator, 0);
  objc_storeStrong((id *)&self->_currentPassDynamicStates, 0);
  objc_storeStrong((id *)&self->_currentExpiredPasses, 0);
  objc_storeStrong((id *)&self->_currentSecureElementPasses, 0);
  objc_storeStrong((id *)&self->_currentPaymentPasses, 0);
  objc_storeStrong((id *)&self->_currentPasses, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_loadImageQueue, 0);
}

@end
