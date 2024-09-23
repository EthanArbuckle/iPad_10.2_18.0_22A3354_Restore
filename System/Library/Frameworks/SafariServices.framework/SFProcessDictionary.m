@implementation SFProcessDictionary

- (SFProcessDictionary)initWithCacheCapacity:(unint64_t)a3
{
  SFProcessDictionary *result;

  result = -[SFProcessDictionary init](self, "init");
  result->_cacheCapacity = a3;
  return result;
}

- (SFProcessDictionary)init
{
  SFProcessDictionary *v2;
  uint64_t v3;
  NSMutableDictionary *values;
  uint64_t v5;
  NSCountedSet *references;
  uint64_t v7;
  NSMutableSet *pidsPendingTermination;
  uint64_t v9;
  NSMutableArray *recentlyReferencedPIDs;
  void *v11;
  uint64_t v12;
  RBSProcessMonitor *processMonitor;
  SFProcessDictionary *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SFProcessDictionary;
  v2 = -[SFProcessDictionary init](&v19, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    values = v2->_values;
    v2->_values = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    references = v2->_references;
    v2->_references = (NSCountedSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    pidsPendingTermination = v2->_pidsPendingTermination;
    v2->_pidsPendingTermination = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    recentlyReferencedPIDs = v2->_recentlyReferencedPIDs;
    v2->_recentlyReferencedPIDs = (NSMutableArray *)v9;

    v2->_cacheCapacity = 3;
    v11 = (void *)MEMORY[0x1E0D87D90];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __27__SFProcessDictionary_init__block_invoke;
    v16[3] = &unk_1E4AC5718;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v11, "monitorWithConfiguration:", v16);
    v12 = objc_claimAutoreleasedReturnValue();
    processMonitor = v2->_processMonitor;
    v2->_processMonitor = (RBSProcessMonitor *)v12;

    v14 = v2;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __27__SFProcessDictionary_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__SFProcessDictionary_init__block_invoke_2;
  v5[3] = &unk_1E4AC56F0;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  objc_msgSend(v3, "setUpdateHandler:", v5);
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStateDescriptor:", v4);

  objc_destroyWeak(&v6);
}

void __27__SFProcessDictionary_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__SFProcessDictionary_init__block_invoke_3;
  v7[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v9);
}

void __27__SFProcessDictionary_init__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "process");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "pid");
    objc_msgSend(*(id *)(a1 + 32), "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_handleProcessStateUpdate:state:", v3, objc_msgSend(v4, "taskState"));

  }
}

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFProcessDictionary;
  -[SFProcessDictionary dealloc](&v3, sel_dealloc);
}

- (void)_updateInterestedApplications
{
  void *v3;
  RBSProcessMonitor *processMonitor;
  id v5;
  _QWORD v6[4];
  id v7;

  -[NSMutableDictionary allKeys](self->_values, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  processMonitor = self->_processMonitor;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SFProcessDictionary__updateInterestedApplications__block_invoke;
  v6[3] = &unk_1E4AC5780;
  v7 = v3;
  v5 = v3;
  -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v6);

}

void __52__SFProcessDictionary__updateInterestedApplications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_45);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v6);

}

uint64_t __52__SFProcessDictionary__updateInterestedApplications__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D87D70], "identifierForIdentifier:", a2);
}

- (void)_handleProcessStateUpdate:(int)a3 state:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSCountedSet *references;
  NSObject *v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    v4 = *(_QWORD *)&a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSCountedSet countForObject:](self->_references, "countForObject:", v6))
    {
      v7 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        references = self->_references;
        v18 = v7;
        v19[0] = 67109376;
        v19[1] = v4;
        v20 = 1024;
        v21 = -[NSCountedSet countForObject:](references, "countForObject:", v6);
        _os_log_debug_impl(&dword_1A3B2D000, v18, OS_LOG_TYPE_DEBUG, "process %d has been terminated, but still has a refcount of %d", (uint8_t *)v19, 0xEu);

      }
      -[NSMutableSet addObject:](self->_pidsPendingTermination, "addObject:", v6);
    }
    else
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[SFProcessDictionary _handleProcessStateUpdate:state:].cold.1(v4, v10, v11, v12, v13, v14, v15, v16);
        -[SFProcessDictionary _removeValuesForPID:](self, "_removeValuesForPID:", v6);
      }
    }

  }
}

- (void)_removeValuesForPID:(id)a3
{
  NSMutableDictionary *values;
  id v5;

  values = self->_values;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](values, "removeObjectForKey:", v5);
  -[NSMutableArray removeObject:](self->_recentlyReferencedPIDs, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_pidsPendingTermination, "removeObject:", v5);

  -[SFProcessDictionary _updateInterestedApplications](self, "_updateInterestedApplications");
}

- (void)decrementReferenceForPID:(int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSCountedSet countForObject:](self->_references, "countForObject:", v5))
  {
    v6 = -[NSMutableSet containsObject:](self->_pidsPendingTermination, "containsObject:", v5);
    -[NSCountedSet removeObject:](self->_references, "removeObject:", v5);
    if (v6)
    {
      if ((-[NSCountedSet containsObject:](self->_references, "containsObject:", v5) & 1) == 0)
      {
        v7 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[SFProcessDictionary decrementReferenceForPID:].cold.2(v3, v7, v8, v9, v10, v11, v12, v13);
        -[SFProcessDictionary _removeValuesForPID:](self, "_removeValuesForPID:", v5);
      }
    }
    else
    {
      -[SFProcessDictionary _removeUnreferencedObjectsIfNeeded](self, "_removeUnreferencedObjectsIfNeeded");
    }
  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SFProcessDictionary decrementReferenceForPID:].cold.1(v3, v14);
  }

}

- (void)_removeUnreferencedObjectsIfNeeded
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_DEBUG, "removing resources for pids %{public}@", (uint8_t *)&v2, 0xCu);
}

uint64_t __57__SFProcessDictionary__removeUnreferencedObjectsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v3;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", a2) ^ 1;
  if (a2)
    return v3;
  else
    return 0;
}

uint64_t __57__SFProcessDictionary__removeUnreferencedObjectsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

- (id)incrementReferenceForPID:(int)a3 valueCreationBlock:(id)a4
{
  return -[SFProcessDictionary incrementReferenceForPID:additionalKey:valueCreationBlock:](self, "incrementReferenceForPID:additionalKey:valueCreationBlock:", *(_QWORD *)&a3, 0, a4);
}

- (id)incrementReferenceForPID:(int)a3 additionalKey:(id)a4 valueCreationBlock:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _DWORD v22[2];
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = objc_msgSend(v8, "copyWithZone:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  -[NSCountedSet addObject:](self->_references, "addObject:", v10);
  -[NSMutableArray removeObject:](self->_recentlyReferencedPIDs, "removeObject:", v10);
  -[NSMutableArray insertObject:atIndex:](self->_recentlyReferencedPIDs, "insertObject:atIndex:", v10, 0);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SFProcessDictionary incrementReferenceForPID:additionalKey:valueCreationBlock:].cold.1((uint64_t)v14, v6, v15);
  }
  else
  {
    v9[2](v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", v16, v10);
    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", v17, v10);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, v12);

    -[SFProcessDictionary _updateInterestedApplications](self, "_updateInterestedApplications");
    v19 = WBS_LOG_CHANNEL_PREFIXProcessDictionary();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v22[0] = 67109635;
      v22[1] = v6;
      v23 = 2113;
      v24 = v8;
      v25 = 2113;
      v26 = v14;
      _os_log_debug_impl(&dword_1A3B2D000, v19, OS_LOG_TYPE_DEBUG, "created resource for pid %d, %{private}@: %{private}@", (uint8_t *)v22, 0x1Cu);
    }
  }
  v20 = v14;

  return v20;
}

- (unint64_t)cacheCapacity
{
  return self->_cacheCapacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_references, 0);
  objc_storeStrong((id *)&self->_recentlyReferencedPIDs, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_pidsPendingTermination, 0);
}

- (void)_handleProcessStateUpdate:(uint64_t)a3 state:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1A3B2D000, a2, a3, "removing resources for process %d because it has been terminated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)decrementReferenceForPID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "resource for pid %d has no references to remove", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)decrementReferenceForPID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1A3B2D000, a2, a3, "last reference to resource for terminated pid %d has been removed. removing the resource", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)incrementReferenceForPID:(uint64_t)a1 additionalKey:(int)a2 valueCreationBlock:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109379;
  v3[1] = a2;
  v4 = 2113;
  v5 = a1;
  _os_log_debug_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_DEBUG, "pid %d has existing resource %{private}@", (uint8_t *)v3, 0x12u);
}

@end
