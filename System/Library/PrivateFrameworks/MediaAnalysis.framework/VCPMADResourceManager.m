@implementation VCPMADResourceManager

- (VCPMADResourceManager)init
{
  VCPMADResourceManager *v2;
  VCPMADResourceManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableArray *resources;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VCPMADResourceManager;
  v2 = -[VCPMADResourceManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_budget = 100;
    v4 = dispatch_queue_create("VCPMADResourceManager", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    resources = v3->_resources;
    v3->_resources = (NSMutableArray *)v6;

  }
  return v3;
}

+ (id)sharedManager
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedInstanceWithIdentifier:andCreationBlock:", v4, &__block_literal_global_96);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

VCPMADResourceManager *__38__VCPMADResourceManager_sharedManager__block_invoke()
{
  return objc_alloc_init(VCPMADResourceManager);
}

- (void)dealloc
{
  objc_super v3;

  -[VCPMADResourceManager purgeAllResources](self, "purgeAllResources");
  v3.receiver = self;
  v3.super_class = (Class)VCPMADResourceManager;
  -[VCPMADResourceManager dealloc](&v3, sel_dealloc);
}

- (int64_t)validateCost:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;

  v3 = 100;
  if (a3 < 100)
    v3 = a3;
  v4 = v3 & ~(v3 >> 63);
  if (v4 != a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[VCPMADResourceManager validateCost:].cold.1(a3, v4);
  return v4;
}

- (int64_t)currentBudget
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__VCPMADResourceManager_currentBudget__block_invoke;
  v5[3] = &unk_1E6B1B820;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__VCPMADResourceManager_currentBudget__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)_setBudget:(int64_t)a3
{
  int64_t budget;
  int v6;
  int64_t v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    budget = self->_budget;
    v6 = 134218240;
    v7 = budget;
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Updating budget (%ld --> %ld)", (uint8_t *)&v6, 0x16u);
  }
  self->_budget = a3;
}

- (void)checkTimeout
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCPMADResourceManager_checkTimeout__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__VCPMADResourceManager_checkTimeout__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  uint8_t v5[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v4 = v3;

    if (v4 > 30.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[ResourceManager] Hit usage timeout; purging resources",
          v5,
          2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_purgeAllResources");
    }
  }
}

- (id)entryForResource:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_resources;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "resource", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_reserveBudget:(int64_t)a3
{
  int64_t budget;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  int64_t v36;
  __int16 v37;
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    budget = self->_budget;
    *(_DWORD *)buf = 134218240;
    v36 = budget;
    v37 = 2048;
    v38 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Request to reserve budget [Budget: %ld][Target: %ld]", buf, 0x16u);
  }
  if (self->_budget < a3)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Pruning inactive resources", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = self->_resources;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (!objc_msgSend(v12, "activeCount"))
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_42);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v26;
      *(_QWORD *)&v16 = 138412290;
      v24 = v16;
LABEL_19:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v20, "resource");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v24;
          v36 = (int64_t)v21;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Purging inactive resource (%@)", buf, 0xCu);

        }
        objc_msgSend(v20, "resource", v24, (_QWORD)v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "purge");

        objc_msgSend(v13, "addObject:", v20);
        -[VCPMADResourceManager _setBudget:](self, "_setBudget:", objc_msgSend(v20, "currentCost") + self->_budget);
        if (self->_budget >= a3)
          break;
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v17)
            goto LABEL_19;
          break;
        }
      }
    }

    -[NSMutableArray removeObjectsInArray:](self->_resources, "removeObjectsInArray:", v13);
    if (self->_budget < a3
      && (int)MediaAnalysisLogLevel() >= 3
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v23 = self->_budget;
      *(_DWORD *)buf = 134218240;
      v36 = v23;
      v37 = 2048;
      v38 = a3;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ResourceManager] Failed to reserve budget [Budget: %ld][Target: %ld]", buf, 0x16u);
    }

  }
}

uint64_t __40__VCPMADResourceManager__reserveBudget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "currentCost");
  if (v6 >= objc_msgSend(v5, "currentCost"))
  {
    v8 = objc_msgSend(v5, "currentCost");
    if (v8 >= objc_msgSend(v4, "currentCost"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)activateResource:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  VCPMADResourceLock *v7;
  VCPMADResourceLock *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  VCPMADResourceManager *v15;

  v4 = a3;
  queue = self->_queue;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __42__VCPMADResourceManager_activateResource___block_invoke;
  v13 = &unk_1E6B16E20;
  v14 = v4;
  v15 = self;
  v6 = v4;
  dispatch_sync(queue, &v10);
  v7 = [VCPMADResourceLock alloc];
  v8 = -[VCPMADResourceLock initWithResourceManager:andResource:](v7, "initWithResourceManager:andResource:", self, v6, v10, v11, v12, v13);

  return v8;
}

void __42__VCPMADResourceManager_activateResource___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  VCPMADResourceEntry *v11;
  uint64_t v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v27 = v2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Request to activate %@", buf, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v3 + 48))
  {
    v4 = os_transaction_create();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v4;

    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __42__VCPMADResourceManager_activateResource___block_invoke_45;
    v24[3] = &unk_1E6B1A6D8;
    objc_copyWeak(&v25, (id *)buf);
    +[VCPTimer timerWithIntervalSeconds:isOneShot:andBlock:](VCPTimer, "timerWithIntervalSeconds:isOneShot:andBlock:", 10, 0, v24);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
    v3 = *(_QWORD *)(a1 + 40);
  }
  v10 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 40), "entryForResource:", *(_QWORD *)(a1 + 32));
  v11 = (VCPMADResourceEntry *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(*(id *)(a1 + 40), "validateCost:", objc_msgSend(*(id *)(a1 + 32), "activeCost"));
  if (v11)
  {
    v13 = -[VCPMADResourceEntry activeCount](v11, "activeCount") == 0;
    v14 = MediaAnalysisLogLevel();
    if (v13)
    {
      if (v14 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Resource cached but not active (%@)", buf, 0xCu);
      }
      -[VCPMADResourceEntry setActiveCount:](v11, "setActiveCount:", -[VCPMADResourceEntry activeCount](v11, "activeCount") + 1);
      v21 = v12 - -[VCPMADResourceEntry currentCost](v11, "currentCost");
      objc_msgSend(*(id *)(a1 + 40), "_reserveBudget:", v21);
      -[VCPMADResourceEntry setCurrentCost:](v11, "setCurrentCost:", v12);
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v27 = v22;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Activating resource (%@)", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 40), "_setBudget:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - v21);
    }
    else
    {
      if (v14 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v27 = v15;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Resource cached and active (%@)", buf, 0xCu);
      }
      if (v12 > -[VCPMADResourceEntry currentCost](v11, "currentCost"))
      {
        v16 = v12 - -[VCPMADResourceEntry currentCost](v11, "currentCost");
        objc_msgSend(*(id *)(a1 + 40), "_reserveBudget:", v16);
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v17 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v27 = v17;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Active resource cost has increased (%@)", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 40), "_setBudget:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - v16);
        -[VCPMADResourceEntry setCurrentCost:](v11, "setCurrentCost:", v12);
      }
      -[VCPMADResourceEntry setActiveCount:](v11, "setActiveCount:", -[VCPMADResourceEntry activeCount](v11, "activeCount") + 1);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Resource not cached (%@)", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_reserveBudget:", v12);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v27 = v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Activating resource (%@)", buf, 0xCu);
    }
    v11 = -[VCPMADResourceEntry initWithResource:]([VCPMADResourceEntry alloc], "initWithResource:", *(_QWORD *)(a1 + 32));
    -[VCPMADResourceEntry setActiveCount:](v11, "setActiveCount:", -[VCPMADResourceEntry activeCount](v11, "activeCount") + 1);
    -[VCPMADResourceEntry setCurrentCost:](v11, "setCurrentCost:", v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 40), "_setBudget:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - v12);
  }
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) & 0x8000000000000000) != 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    __42__VCPMADResourceManager_activateResource___block_invoke_cold_1();
  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v23 = -[VCPMADResourceEntry activeCount](v11, "activeCount");
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v23;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Active count %d", buf, 8u);
  }

}

void __42__VCPMADResourceManager_activateResource___block_invoke_45(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "checkTimeout");
    WeakRetained = v2;
  }

}

- (void)deactivateResource:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  VCPMADResourceManager *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCPMADResourceManager_deactivateResource___block_invoke;
  block[3] = &unk_1E6B16E20;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __44__VCPMADResourceManager_deactivateResource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v2 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v24 = v2;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Request to deactivate %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "entryForResource:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setActiveCount:", objc_msgSend(v3, "activeCount") - 1);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(v4, "activeCount");
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Active count %d", buf, 8u);
    }
    if (!objc_msgSend(v4, "activeCount"))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "resource");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v6;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ResourceManager] Resource transition active --> inactive (%@)", buf, 0xCu);

      }
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v4, "resource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "validateCost:", objc_msgSend(v8, "inactiveCost"));

      objc_msgSend(*(id *)(a1 + 40), "_setBudget:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - v9 + objc_msgSend(v4, "currentCost"));
      objc_msgSend(v4, "setCurrentCost:", v9);
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = *(id *)(*(_QWORD *)(a1 + 40) + 24);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "activeCount", (_QWORD)v18) > 0)
            {

              goto LABEL_24;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    __44__VCPMADResourceManager_deactivateResource___block_invoke_cold_1((uint64_t *)(a1 + 32));
  }
LABEL_24:

}

- (void)reserveBudget:(int64_t)a3
{
  int64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = -[VCPMADResourceManager validateCost:](self, "validateCost:", a3);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__VCPMADResourceManager_reserveBudget___block_invoke;
  v6[3] = &unk_1E6B199E8;
  v6[4] = self;
  v6[5] = v4;
  dispatch_sync(queue, v6);
}

uint64_t __39__VCPMADResourceManager_reserveBudget___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reserveBudget:", *(_QWORD *)(a1 + 40));
}

- (void)reserveBudgetNormalized:(double)a3
{
  -[VCPMADResourceManager reserveBudget:](self, "reserveBudget:", llround(a3 * 100.0));
}

- (void)purgeInactiveResources
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCPMADResourceManager_purgeInactiveResources__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __47__VCPMADResourceManager_purgeInactiveResources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[ResourceManager] Request to purge inactive resources", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)v2;
  v5 = *(id *)(v3 + 24);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v31;
    v10 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v7 = 138412290;
    v28 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "activeCount", v28);
        v14 = MediaAnalysisLogLevel();
        if (v13 < 1)
        {
          if (v14 >= 7 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "resource");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v28;
            v35 = v16;
            _os_log_impl(&dword_1B6C4A000, v10, OS_LOG_TYPE_DEBUG, "[ResourceManager] Purging %@", buf, 0xCu);

          }
          objc_msgSend(v12, "resource");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "purge");

          objc_msgSend(v4, "addObject:", v12);
          v18 = *(_QWORD **)(v29 + 32);
          v19 = v4;
          v20 = v18[1];
          v21 = objc_msgSend(v12, "currentCost") + v20;
          v4 = v19;
          objc_msgSend(v18, "_setBudget:", v21);
        }
        else if (v14 >= 7 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "resource");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v28;
          v35 = v15;
          _os_log_impl(&dword_1B6C4A000, v10, OS_LOG_TYPE_DEBUG, "[ResourceManager] Skipping active resource (%@)", buf, 0xCu);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v29 + 32) + 24), "removeObjectsInArray:", v4);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(v29 + 32) + 24), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v29 + 32) + 32), "destroy");
    v22 = *(_QWORD *)(v29 + 32);
    v23 = *(void **)(v22 + 32);
    *(_QWORD *)(v22 + 32) = 0;

    v24 = *(_QWORD *)(v29 + 32);
    v25 = *(void **)(v24 + 48);
    *(_QWORD *)(v24 + 48) = 0;

    v26 = *(_QWORD *)(v29 + 32);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = 0;

  }
}

- (void)_purgeAllResources
{
  void *v5;

  objc_msgSend(a2, "resource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[ResourceManager] Purging active resource (%@)", a1, 0xCu);

}

- (void)purgeAllResources
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCPMADResourceManager_purgeAllResources__block_invoke;
  block[3] = &unk_1E6B15440;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __42__VCPMADResourceManager_purgeAllResources__block_invoke(uint64_t a1)
{
  uint8_t v3[16];

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[ResourceManager] Request to purge all resources", v3, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_purgeAllResources");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_inactiveDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)validateCost:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[ResourceManager] Invalid cost detected (%ld); clipped to %ld",
    (uint8_t *)&v2,
    0x16u);
}

void __42__VCPMADResourceManager_activateResource___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[ResourceManager] Active resources exceed budget", v0, 2u);
}

void __44__VCPMADResourceManager_deactivateResource___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[ResourceManager] Received request to deactivate un-tracked resource (%@)", (uint8_t *)&v2, 0xCu);
}

@end
