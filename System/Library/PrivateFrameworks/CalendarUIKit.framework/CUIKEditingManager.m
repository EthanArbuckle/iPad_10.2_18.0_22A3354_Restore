@implementation CUIKEditingManager

- (CUIKEditingManager)initWithEventStore:(id)a3
{
  id v4;
  CUIKEditingManager *v5;
  CUIKEditingManager *v6;
  uint64_t v7;
  EKChangeListener *changeListener;
  uint64_t v9;
  NSMutableDictionary *changeHistory;
  uint64_t v11;
  NSMutableDictionary *changedObjectMap;
  uint64_t v13;
  NSMutableSet *hiddenObjects;
  CUIKEditingManager *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CUIKEditingManager;
  v5 = -[CUIKEditingManager init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_eventStore, v4);
    v7 = objc_opt_new();
    changeListener = v6->_changeListener;
    v6->_changeListener = (EKChangeListener *)v7;

    v9 = objc_opt_new();
    changeHistory = v6->_changeHistory;
    v6->_changeHistory = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    changedObjectMap = v6->_changedObjectMap;
    v6->_changedObjectMap = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    hiddenObjects = v6->_hiddenObjects;
    v6->_hiddenObjects = (NSMutableSet *)v13;

    v15 = v6;
  }

  return v6;
}

- (id)openEditingContextWithObject:(id)a3 interfaceType:(unint64_t)a4
{
  return -[CUIKEditingManager openEditingContextWithObject:interfaceType:observer:](self, "openEditingContextWithObject:interfaceType:observer:", a3, a4, 0);
}

- (id)openEditingContextWithObject:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v14 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKEditingManager openEditingContextWithObjects:interfaceType:observer:](self, "openEditingContextWithObjects:interfaceType:observer:", v11, a4, v9, v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4
{
  return -[CUIKEditingManager openEditingContextWithObjects:interfaceType:observer:](self, "openEditingContextWithObjects:interfaceType:observer:", a3, a4, 0);
}

- (id)openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!-[CUIKEditingManager _objectsSupportEditingContexts:](self, "_objectsSupportEditingContexts:", v8))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("Objects");
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, CFSTR("Editing Contexts not supported for all objects."), v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  -[CUIKEditingManager _openEditingContextWithObjects:interfaceType:observer:](self, "_openEditingContextWithObjects:interfaceType:observer:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_objectsSupportEditingContexts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v8, "sourceType", (_QWORD)v11))
            {
              v9 = 0;
              goto LABEL_14;
            }
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_14:

  return v9;
}

- (id)_openEditingContextWithObjects:(id)a3 interfaceType:(unint64_t)a4 observer:(id)a5
{
  id v8;
  id v9;
  CUIKEditingContext *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  CUIKEditingContext *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v10 = -[CUIKEditingContext initWithObjects:interfaceType:observer:]([CUIKEditingContext alloc], "initWithObjects:interfaceType:observer:", v8, a4, v9);
    -[CUIKEditingContext setEditingManager:](v10, "setEditingManager:", self);
    -[CUIKEditingManager changeListener](self, "changeListener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerDelegate:", v10);

    -[CUIKEditingManager _addContextToNewOrExistingGroup:](self, "_addContextToNewOrExistingGroup:", v10);
  }
  else
  {
    v10 = 0;
  }
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "valueForKey:", CFSTR("specificIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = v10;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_1B8A6A000, v12, OS_LOG_TYPE_DEFAULT, "Opened editing context %p with objects: %@", (uint8_t *)&v15, 0x16u);

  }
  return v10;
}

- (void)_addContextToNewOrExistingGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CUIKObjectGroup *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CUIKEditingContextGroup *v13;
  void *v14;
  int v15;
  CUIKObjectGroup *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CUIKEditingManager editingContextGroups](self, "editingContextGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKEditingManager setEditingContextGroups:](self, "setEditingContextGroups:", v6);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CUIKEditingManager editingContextGroups](self, "editingContextGroups", 0);
  v7 = (CUIKObjectGroup *)objc_claimAutoreleasedReturnValue();
  v8 = -[CUIKObjectGroup countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "objectGroup");
        v13 = (CUIKEditingContextGroup *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectsBeingEdited");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[CUIKEditingContextGroup objectsBelongInGroup:](v13, "objectsBelongInGroup:", v14);

        if (v15)
        {
          objc_msgSend(v12, "addContext:", v4);
          goto LABEL_13;
        }

      }
      v9 = -[CUIKObjectGroup countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = [CUIKObjectGroup alloc];
  objc_msgSend(v4, "objectsBeingEdited");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CUIKObjectGroup initWithObjects:](v16, "initWithObjects:", v17);

  v13 = -[CUIKEditingContextGroup initWithObjectGroup:]([CUIKEditingContextGroup alloc], "initWithObjectGroup:", v7);
  -[CUIKEditingManager eventStore](self, "eventStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingContextGroup setEventStore:](v13, "setEventStore:", v18);

  -[CUIKEditingContextGroup addContext:](v13, "addContext:", v4);
  -[CUIKEditingManager editingContextGroups](self, "editingContextGroups");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v13);

LABEL_13:
}

- (void)partialSaveObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingManager partialSaveObject:].cold.2(v4);

  objc_msgSend(v4, "specificIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "changeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__CUIKEditingManager_partialSaveObject___block_invoke;
    v9[3] = &unk_1E6EB5F18;
    v9[4] = self;
    v10 = v6;
    v11 = v4;
    v12 = v7;
    v8 = v7;
    -[CUIKEditingManager performWithLock:](self, "performWithLock:", v9);

  }
  else
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CUIKEditingManager partialSaveObject:].cold.1(v8);
  }

}

void __40__CUIKEditingManager_partialSaveObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "changeHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v11;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 48), "changeSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addChanges:shouldCopyKeyCallback:", v4, &__block_literal_global_34);

    objc_msgSend(*(id *)(a1 + 32), "changedObjectMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addChangesFromObject:copyingBackingObjects:", *(_QWORD *)(a1 + 48), 0);
LABEL_5:

    v3 = v11;
    goto LABEL_6;
  }
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(*(id *)(a1 + 32), "changeHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));

    v6 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(*(id *)(a1 + 32), "changedObjectMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __40__CUIKEditingManager_partialSaveObject___block_invoke_2()
{
  return 0;
}

- (void)applyLiveChangesToObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingManager applyLiveChangesToObject:].cold.1(v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CUIKEditingManager_applyLiveChangesToObject___block_invoke;
  v7[3] = &unk_1E6EB6170;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CUIKEditingManager performWithLock:](self, "performWithLock:", v7);

}

void __47__CUIKEditingManager_applyLiveChangesToObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "changeHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "specificIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "applyChanges:", v5);
    v4 = v5;
  }

}

- (void)applyLiveChangesToObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CUIKEditingManager applyLiveChangesToObject:](self, "applyLiveChangesToObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)clearLiveChangesForObjects:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  CUIKEditingManager *v9;

  v4 = a3;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CUIKEditingManager clearLiveChangesForObjects:].cold.1(v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CUIKEditingManager_clearLiveChangesForObjects___block_invoke;
  v7[3] = &unk_1E6EB6170;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[CUIKEditingManager performWithLock:](self, "performWithLock:", v7);

}

void __49__CUIKEditingManager_clearLiveChangesForObjects___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "specificIdentifier", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "changeHistory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v8);

        objc_msgSend(*(id *)(a1 + 40), "changedObjectMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObjectForKey:", v8);

        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
        objc_msgSend(v7, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObject:", v12);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (void)clearAllLiveChanges
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_DEBUG, "Clearing all live changes", v1, 2u);
}

void __41__CUIKEditingManager_clearAllLiveChanges__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setChangeHistory:", v2);

  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setChangedObjectMap:", v3);

  v4 = objc_opt_new();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

}

- (id)changedObjectsCopy
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__14;
  v9 = __Block_byref_object_dispose__14;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__CUIKEditingManager_changedObjectsCopy__block_invoke;
  v4[3] = &unk_1E6EB7928;
  v4[4] = self;
  v4[5] = &v5;
  -[CUIKEditingManager performWithLock:](self, "performWithLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__CUIKEditingManager_changedObjectsCopy__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "changedObjectMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        objc_msgSend(v10, "uniqueIdentifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v11, "containsObject:", v12);

        if ((v11 & 1) == 0)
        {
          v13 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v4;

}

- (id)_objectsWithLiveEdits:(id)a3 matchingPredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[CUIKEditingManager _changesExistForObject:](self, "_changesExistForObject:", v15, (_QWORD)v19))
        {
          -[CUIKEditingManager applyLiveChangesToObject:](self, "applyLiveChangesToObject:", v15);
          objc_msgSend(v15, "specificIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

          if ((objc_msgSend(v15, "isDeleted") & 1) != 0
            || -[CUIKEditingManager isHidden:](self, "isHidden:", v15)
            || v7 && !objc_msgSend(v7, "evaluateWithObject:", v15))
          {
            continue;
          }
        }
        objc_msgSend(v8, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  if (v7)
  {
    -[CUIKEditingManager _liveEditedObjectsMatchingPredicate:notInSet:](self, "_liveEditedObjectsMatchingPredicate:notInSet:", v7, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
      objc_msgSend(v8, "addObjectsFromArray:", v17);

  }
  return v8;
}

- (id)_liveEditedObjectsMatchingPredicate:(id)a3 notInSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(void *, _QWORD);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CUIKEditingManager__liveEditedObjectsMatchingPredicate_notInSet___block_invoke;
  aBlock[3] = &unk_1E6EB7950;
  v9 = v7;
  v26 = v9;
  v10 = v6;
  v27 = v10;
  v11 = v8;
  v28 = v11;
  v12 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CUIKEditingManager changedObjectsCopy](self, "changedObjectsCopy", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12[2](v12, v18);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  v19 = v11;
  return v19;
}

void __67__CUIKEditingManager__liveEditedObjectsMatchingPredicate_notInSet___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v12, "isDeleted") & 1) == 0)
  {
    v3 = a1[4];
    objc_msgSend(v12, "specificIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

    if ((v3 & 1) == 0)
    {
      v5 = v12;
      objc_msgSend(v5, "recurrenceDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_12;
      v7 = (void *)MEMORY[0x1E0CAA118];
      objc_msgSend(v5, "localUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recurrenceIdentifierWithLocalUID:recurrenceDate:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "identifierString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v10) = objc_msgSend(a1[4], "containsObject:", v11);
      if ((v10 & 1) == 0)
      {
LABEL_12:
        if (objc_msgSend(a1[5], "evaluateWithObject:", v5))
          objc_msgSend(a1[6], "addObject:", v5);
      }

    }
  }

}

- (BOOL)_changesExistForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  objc_msgSend(v4, "specificIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__CUIKEditingManager__changesExistForObject___block_invoke;
  v10[3] = &unk_1E6EB6080;
  v13 = &v14;
  v10[4] = self;
  v7 = v5;
  v11 = v7;
  v8 = v6;
  v12 = v8;
  -[CUIKEditingManager performWithLock:](self, "performWithLock:", v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __45__CUIKEditingManager__changesExistForObject___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "changeHistory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 1;
  else
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;

}

- (id)eventsMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CUIKEditingManager eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventsMatchingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKEditingManager _objectsWithLiveEdits:matchingPredicate:](self, "_objectsWithLiveEdits:matchingPredicate:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchEventsMatchingPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CUIKEditingManager eventStore](self, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__CUIKEditingManager_fetchEventsMatchingPredicate_completion___block_invoke;
  v12[3] = &unk_1E6EB7978;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "fetchEventsMatchingPredicate:resultHandler:", v10, v12);

}

void __62__CUIKEditingManager_fetchEventsMatchingPredicate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_objectsWithLiveEdits:matchingPredicate:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (id)eventWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CUIKEditingManager eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKEditingManager applyLiveChangesToObject:](self, "applyLiveChangesToObject:", v6);
  return v6;
}

- (id)eventsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CUIKEditingManager eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventsWithIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKEditingManager applyLiveChangesToObjects:](self, "applyLiveChangesToObjects:", v6);
  return v6;
}

- (id)eventsWithExternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CUIKEditingManager eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarItemsWithExternalIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v15);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[CUIKEditingManager applyLiveChangesToObjects:](self, "applyLiveChangesToObjects:", v7);
  return v7;
}

- (void)hide:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a3, "valueForKey:", CFSTR("uniqueIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__CUIKEditingManager_hide___block_invoke;
  v6[3] = &unk_1E6EB6170;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CUIKEditingManager performWithLock:](self, "performWithLock:", v6);

}

uint64_t __27__CUIKEditingManager_hide___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

- (void)unhide:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CUIKEditingManager *v8;

  objc_msgSend(a3, "valueForKey:", CFSTR("uniqueIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__CUIKEditingManager_unhide___block_invoke;
  v6[3] = &unk_1E6EB6170;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CUIKEditingManager performWithLock:](self, "performWithLock:", v6);

}

void __29__CUIKEditingManager_unhide___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)isHidden:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__CUIKEditingManager_isHidden___block_invoke;
    v9[3] = &unk_1E6EB71D0;
    v11 = &v12;
    v9[4] = self;
    v10 = v5;
    -[CUIKEditingManager performWithLock:](self, "performWithLock:", v9);

  }
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __31__CUIKEditingManager_isHidden___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)remindersMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CUIKEditingManager eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remindersMatchingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKEditingManager _objectsWithLiveEdits:matchingPredicate:](self, "_objectsWithLiveEdits:matchingPredicate:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchRemindersMatchingPredicate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CUIKEditingManager eventStore](self, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CUIKEditingManager_fetchRemindersMatchingPredicate_completion___block_invoke;
  v12[3] = &unk_1E6EB7978;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "fetchRemindersMatchingPredicate:completion:", v10, v12);

}

void __65__CUIKEditingManager_fetchRemindersMatchingPredicate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_objectsWithLiveEdits:matchingPredicate:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

- (id)remindersWithExternalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CUIKEditingManager eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarItemsWithExternalIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v15);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[CUIKEditingManager applyLiveChangesToObjects:](self, "applyLiveChangesToObjects:", v7);
  return v7;
}

- (BOOL)closeEditingContext:(id)a3
{
  return -[CUIKEditingManager _closeEditingContext:action:condition:shouldClose:](self, "_closeEditingContext:action:condition:shouldClose:", a3, 1, 1, 0);
}

- (BOOL)closeEditingContext:(id)a3 shouldClose:(BOOL *)a4
{
  return -[CUIKEditingManager _closeEditingContext:action:condition:shouldClose:](self, "_closeEditingContext:action:condition:shouldClose:", a3, 1, 1, a4);
}

- (BOOL)closeEditingContextAndCommitChanges:(id)a3
{
  return -[CUIKEditingManager _closeEditingContext:action:condition:shouldClose:](self, "_closeEditingContext:action:condition:shouldClose:", a3, 1, 0, 0);
}

- (BOOL)closeEditingContextWithoutCommittingChanges:(id)a3
{
  return -[CUIKEditingManager _closeEditingContext:action:condition:shouldClose:](self, "_closeEditingContext:action:condition:shouldClose:", a3, 0, 0, 0);
}

- (BOOL)closeEditingContextAndRevertIfLast:(id)a3
{
  return -[CUIKEditingManager _closeEditingContext:action:condition:shouldClose:](self, "_closeEditingContext:action:condition:shouldClose:", a3, 2, 1, 0);
}

- (BOOL)_closeEditingContext:(id)a3 action:(unint64_t)a4 condition:(unint64_t)a5 shouldClose:(BOOL *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  __CFString *v16;
  const __CFString *v17;
  __CFString *v18;
  BOOL v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned __int8 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("editing context is nil"));
    v19 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v10, "group");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 1;
  objc_msgSend(v12, "activeEditingContextsExcludingContext:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CFSTR("unknown");
    v17 = CFSTR("unknown");
    if (a4 <= 2)
      v17 = off_1E6EB7998[a4];
    if (a5 == 1)
      v16 = CFSTR("lastOnly");
    if (!a5)
      v16 = CFSTR("always");
    v18 = v16;
    *(_DWORD *)buf = 134218754;
    v27 = v11;
    v28 = 2114;
    v29 = v17;
    v30 = 2114;
    v31 = v18;
    v32 = 2048;
    v33 = v14;
    _os_log_impl(&dword_1B8A6A000, v15, OS_LOG_TYPE_DEFAULT, "Closing context %p.  action=%{public}@; condition = %{public}@; Other active contexts? %lu",
      buf,
      0x2Au);

  }
  if (!a5 || !v14)
  {
    if (a4 == 2)
    {
      objc_msgSend(v11, "revert:", 0);
    }
    else if (a4 == 1)
    {
      v19 = -[CUIKEditingManager _commitChangesForContext:forceCommit:shouldClose:](self, "_commitChangesForContext:forceCommit:shouldClose:", v11, a5 == 0, &v25);
      v20 = v25;
      if (!a6)
      {
LABEL_21:
        if (!v20)
          goto LABEL_23;
        goto LABEL_22;
      }
LABEL_20:
      *a6 = v20;
      goto LABEL_21;
    }
    v20 = 1;
    v19 = 1;
    if (!a6)
      goto LABEL_21;
    goto LABEL_20;
  }
  v19 = 1;
LABEL_22:
  objc_msgSend(v12, "removeContext:", v11);
LABEL_23:
  if (v12)
  {
    objc_msgSend(v12, "openContexts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
    {
      -[CUIKEditingManager editingContextGroups](self, "editingContextGroups");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObject:", v12);

    }
  }

LABEL_27:
  return v19;
}

- (BOOL)commitChangesFromEditingContextWithoutClosing:(id)a3
{
  return -[CUIKEditingManager _commitChangesForContext:forceCommit:shouldClose:](self, "_commitChangesForContext:forceCommit:shouldClose:", a3, 1, 0);
}

- (BOOL)_commitChangesForContext:(id)a3 forceCommit:(BOOL)a4 shouldClose:(BOOL *)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("editing context is nil"));
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218240;
    v20 = v8;
    v21 = 1024;
    v22 = v6;
    _os_log_impl(&dword_1B8A6A000, v9, OS_LOG_TYPE_DEFAULT, "Committing changes in context %p.  Force commit? %d", (uint8_t *)&v19, 0x12u);
  }

  if (!objc_msgSend(v8, "_prepareForCommitWithDecision:shouldClose:", v6, a5))
    goto LABEL_9;
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = v8;
    _os_log_impl(&dword_1B8A6A000, v10, OS_LOG_TYPE_DEFAULT, "Actually committing changes in context %p", (uint8_t *)&v19, 0xCu);
  }

  -[CUIKEditingManager eventStore](self, "eventStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "group");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectsToCommit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "commitObjects:error:", v13, 0);

  objc_msgSend(v8, "group");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectsToCommit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEditingManager clearLiveChangesForObjects:](self, "clearLiveChangesForObjects:", v17);

LABEL_10:
  return v14;
}

- (id)_allOpenEditingContexts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CUIKEditingManager editingContextGroups](self, "editingContextGroups", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "openContexts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)performWithLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_loadWeakRetained((id *)&self->_eventStore);
}

- (void)setEventStore:(id)a3
{
  objc_storeWeak((id *)&self->_eventStore, a3);
}

- (NSMutableSet)editingContextGroups
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEditingContextGroups:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (EKChangeListener)changeListener
{
  return (EKChangeListener *)objc_getProperty(self, a2, 40, 1);
}

- (void)setChangeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)changeHistory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setChangeHistory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)changedObjectMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChangedObjectMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedObjectMap, 0);
  objc_storeStrong((id *)&self->_changeHistory, 0);
  objc_storeStrong((id *)&self->_changeListener, 0);
  objc_storeStrong((id *)&self->_editingContextGroups, 0);
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_hiddenObjects, 0);
}

- (void)partialSaveObject:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_ERROR, "Attempting to partial save an object with a nil identifier", v1, 2u);
}

- (void)partialSaveObject:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "specificIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B8A6A000, v2, v3, "Partial saving object: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)applyLiveChangesToObject:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "specificIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B8A6A000, v2, v3, "Applying live changes to object: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)clearLiveChangesForObjects:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "valueForKey:", CFSTR("specificIdentifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B8A6A000, v2, v3, "Clearing live changes for objects: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

@end
