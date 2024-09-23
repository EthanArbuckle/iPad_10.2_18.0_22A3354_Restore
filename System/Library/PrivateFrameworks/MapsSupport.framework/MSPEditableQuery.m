@implementation MSPEditableQuery

- (id)_initWithSource:(id)a3
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSPEditableQuery;
  v3 = -[MSPQuery _initWithSource:](&v10, sel__initWithSource_, a3);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.MapsSupport.MSPEditableQuery.context-"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v3[8];
    v3[8] = v7;

  }
  return v3;
}

- (id)_visibleState
{
  MSPEditableQuery *v2;
  _MSPQueryState *editedState;
  _MSPQueryState *v4;
  _MSPQueryState *v5;
  objc_super v7;

  v2 = self;
  objc_sync_enter(v2);
  editedState = v2->_editedState;
  if (editedState)
  {
    v4 = editedState;
  }
  else
  {
    v7.receiver = v2;
    v7.super_class = (Class)MSPEditableQuery;
    -[MSPQuery _visibleState](&v7, sel__visibleState);
    v4 = (_MSPQueryState *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_sync_exit(v2);

  return v5;
}

- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSPEditableQuery *v11;
  _MSPQueryState *editedState;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isEqual:", self->_context) & 1) == 0)
  {
    v11 = self;
    objc_sync_enter(v11);
    editedState = v11->_editedState;
    v11->_editedState = 0;

    objc_storeStrong((id *)&v11->_container, a5);
    objc_sync_exit(v11);

    v13.receiver = v11;
    v13.super_class = (Class)MSPEditableQuery;
    -[MSPQuery _didChangeSourceWithNewState:context:inContainer:](&v13, sel__didChangeSourceWithNewState_context_inContainer_, v8, v9, v10);
  }

}

- (void)_performEditWithStateTransformation:(id)a3 containerEdit:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  MSPEditableQuery *v8;
  void *v9;
  uint64_t v10;
  _MSPQueryState *editedState;
  MSPContainer *container;
  uint64_t v13;
  id v14;
  NSString *context;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  id location;
  _QWORD v23[3];
  char v24;

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[MSPEditableQuery _visibleState](v8, "_visibleState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  editedState = v8->_editedState;
  v8->_editedState = (_MSPQueryState *)v10;

  objc_sync_exit(v8);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  objc_initWeak(&location, v8);
  container = v8->_container;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__MSPEditableQuery__performEditWithStateTransformation_containerEdit___block_invoke;
  v19[3] = &unk_1E6653878;
  v21 = v23;
  v14 = v7;
  v20 = v14;
  context = v8->_context;
  -[MSPQuery changeHandlerQueue](v8, "changeHandlerQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __70__MSPEditableQuery__performEditWithStateTransformation_containerEdit___block_invoke_2;
  v17[3] = &unk_1E66538A0;
  objc_copyWeak(&v18, &location);
  v17[4] = v23;
  -[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:](container, "editContentsUsingBarrierBlock:context:completionQueue:completion:", v19, context, v16, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(v23, 8);

}

uint64_t __70__MSPEditableQuery__performEditWithStateTransformation_containerEdit___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __70__MSPEditableQuery__performEditWithStateTransformation_containerEdit___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v6 = WeakRetained;
      objc_sync_enter(v6);
      v7 = (void *)v6[6];
      v6[6] = 0;

      objc_msgSend(v6, "_lastState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_didChangeSourceWithNewState:context:inContainer:", v8, 0, v6[7]);

      objc_sync_exit(v6);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[MSPEditableQuery _performEditWithStateTransformation:containerEdit:]_block_invoke_2";
      v12 = 1024;
      v13 = 370;
      _os_log_impl(&dword_1B39C0000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v10, 0x12u);
    }

  }
}

- (void)deleteContentsObjectAtIndexes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke;
  v8[3] = &unk_1E66538F0;
  v6 = v4;
  v9 = v6;
  v10 = v11;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_3;
  v7[3] = &unk_1E6653940;
  v7[4] = v11;
  -[MSPEditableQuery _performEditWithStateTransformation:containerEdit:](self, "_performEditWithStateTransformation:containerEdit:", v8, v7);

  _Block_object_dispose(v11, 8);
}

id __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_2;
  v12 = &unk_1E66538C8;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v13 = v3;
  v14 = v4;
  v6 = v3;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v9);
  objc_msgSend(v6, "stateByDeletingObjectsAtIndexes:", *(_QWORD *)(a1 + 32), v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);
}

BOOL __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_4;
  v7[3] = &unk_1E6653918;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
    objc_msgSend(v3, "removeObjectsAtIndexes:", v4);

  return v5 != 0;
}

uint64_t __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "storageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)deleteContentsObjectAtIndex:(unint64_t)a3
{
  _QWORD v3[5];
  _QWORD v4[6];
  _QWORD v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__2;
  v5[4] = __Block_byref_object_dispose__2;
  v6 = 0;
  v3[4] = v5;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke;
  v4[3] = &unk_1E6653968;
  v4[4] = v5;
  v4[5] = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke_2;
  v3[3] = &unk_1E6653940;
  -[MSPEditableQuery _performEditWithStateTransformation:containerEdit:](self, "_performEditWithStateTransformation:containerEdit:", v4, v3);
  _Block_object_dispose(v5, 8);

}

id __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v3, "stateByDeletingObjectAtIndex:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke_3;
  v7[3] = &unk_1E6653918;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
    objc_msgSend(v3, "removeObjectsAtIndexes:", v4);

  return v5 != 0;
}

uint64_t __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "storageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v4;
}

- (void)moveContentsObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  _QWORD v4[6];
  _QWORD v5[8];
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__2;
  v8[4] = __Block_byref_object_dispose__2;
  v9 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__2;
  v6[4] = __Block_byref_object_dispose__2;
  v7 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MSPEditableQuery_moveContentsObjectAtIndex_toIndex___block_invoke;
  v5[3] = &unk_1E6653990;
  v5[4] = v8;
  v5[5] = v6;
  v5[6] = a3;
  v5[7] = a4;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__MSPEditableQuery_moveContentsObjectAtIndex_toIndex___block_invoke_2;
  v4[3] = &unk_1E66539B8;
  v4[4] = v8;
  v4[5] = v6;
  -[MSPEditableQuery _performEditWithStateTransformation:containerEdit:](self, "_performEditWithStateTransformation:containerEdit:", v5, v4);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(v8, 8);
}

id __54__MSPEditableQuery_moveContentsObjectAtIndex_toIndex___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a1[6]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v3, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a1[7]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(v3, "stateByMovingObjectAtIndex:toIndex:", a1[6], a1[7]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __54__MSPEditableQuery_moveContentsObjectAtIndex_toIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    obj = v3;
    v20 = *(_QWORD *)v22;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      v9 = 0;
      v18 = v5 + v6;
      do
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_msgSend(v10, "storageIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

        if ((v12 & 1) != 0)
        {
          v8 = v6 + v9;
        }
        else
        {
          objc_msgSend(v10, "storageIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

          if (v14)
            v7 = v6 + v9;
        }
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v3 = obj;

          objc_msgSend(obj, "objectAtIndexedSubscript:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "removeObjectAtIndex:", v8);
          objc_msgSend(obj, "insertObject:atIndex:", v16, v7);
          v15 = 1;
          goto LABEL_16;
        }
        ++v9;
      }
      while (v5 != v9);
      v3 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v6 = v18;
      if (v5)
        continue;
      break;
    }
  }
  v15 = 0;
  v16 = v3;
LABEL_16:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_editedState, 0);
}

@end
