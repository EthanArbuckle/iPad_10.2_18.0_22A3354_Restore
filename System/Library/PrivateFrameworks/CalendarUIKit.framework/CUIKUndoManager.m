@implementation CUIKUndoManager

- (void)setUndoableEditor:(id)a3
{
  objc_storeStrong((id *)&self->_undoableEditor, a3);
}

- (void)setEditingManagerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setDisableUndoForOrganizerScheduling:(BOOL)a3
{
  self->_disableUndoForOrganizerScheduling = a3;
}

- (CUIKUndoManager)init
{
  CUIKUndoManager *v2;
  CUIKUndoManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIKUndoManager;
  v2 = -[CUIKUndoManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CUIKUndoManager setGroupsByEvent:](v2, "setGroupsByEvent:", 0);
  return v3;
}

- (void)handleUndoForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "inverseOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CUIKUndoManager beginUndoGrouping](self, "beginUndoGrouping");
    -[CUIKUndoManager registerUndoWithTarget:selector:object:](self, "registerUndoWithTarget:selector:object:", self, sel_undoOperation_, v5);
    v18 = v5;
    if ((-[CUIKUndoManager isUndoing](self, "isUndoing") & 1) != 0)
      v6 = v5;
    else
      v6 = v4;
    objc_msgSend(v6, "actionName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUndoManager setActionName:](self, "setActionName:", v17);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "objects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v4, "originalObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", v10 + i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "isUndeleted"))
          {
            objc_msgSend(v15, "objectID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[CUIKUndoManager _registerUndeletedObject:withOriginalObjectID:](self, "_registerUndeletedObject:withOriginalObjectID:", v13, v16);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v10 += i;
      }
      while (v9);
    }

    -[CUIKUndoManager endUndoGrouping](self, "endUndoGrouping");
    v5 = v18;
  }
  else
  {
    -[CUIKUndoManager clearUndoOperations](self, "clearUndoOperations");
  }

}

- (void)undoOperation:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CUIKUndoManager editingManagerProvider](self, "editingManagerProvider");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        -[CUIKUndoManager objectToSaveForUndoingChangeToObject:](self, "objectToSaveForUndoingChangeToObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v14), (_QWORD)v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "openEditingContextWithObjects:interfaceType:", v9, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUndoDelegate:", self);
  -[CUIKUndoManager decisionDelegate](self, "decisionDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDecisionDelegate:", v17);

  -[CUIKUndoManager commitDelegate](self, "commitDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCommitDelegate:", v18);

  v19 = -[CUIKUndoManager isUndoing](self, "isUndoing");
  +[CUIKLogSubsystem undo](CUIKLogSubsystem, "undo");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21)
      -[CUIKUndoManager undoOperation:].cold.1((uint64_t)v4, v20, v22, v23, v24, v25, v26, v27);
  }
  else if (v21)
  {
    -[CUIKUndoManager undoOperation:].cold.2((uint64_t)v4, v20, v22, v23, v24, v25, v26, v27);
  }

  objc_msgSend(v16, "performUndoableOperation:", v4);
  objc_msgSend(v4, "error");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKUndoManager setLastError:](self, "setLastError:", v28);

  objc_msgSend(v7, "closeEditingContext:", v16);
}

- (void)clearUndoOperations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CUIKUndoManager_clearUndoOperations__block_invoke;
  block[3] = &unk_1E6EB60F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __38__CUIKUndoManager_clearUndoOperations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllActions");
}

- (void)removeAllActions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIKUndoManager;
  -[CUIKUndoManager removeAllActions](&v3, sel_removeAllActions);
  -[CUIKUndoManager _clearUndeletedObjects](self, "_clearUndeletedObjects");
}

+ (id)operationForAction:(unint64_t)a3 context:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (a3 - 1 > 4)
  {
    v6 = 0;
  }
  else
  {
    -[__objc2_class operationForContext:](*off_1E6EB6E88[a3 - 1], "operationForContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)objectToSaveForRevertingChangeToObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    -[CUIKUndoManager specificIdentifierMapForRevert](self, "specificIdentifierMapForRevert");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specificIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v9, "copy");

      v6 = (id)v10;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)objectToSaveForUndoingChangeToObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    -[CUIKUndoManager specificIdentifierMapForUndo](self, "specificIdentifierMapForUndo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specificIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v9, "copy");

      v6 = (id)v10;
    }
    -[CUIKUndoManager undeletedObjectMap](self, "undeletedObjectMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "undeletedObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_msgSend(v14, "copy");

      v6 = (id)v15;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setUndoObject:(id)a3 forSpecificIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[CUIKUndoManager specificIdentifierMapForUndo](self, "specificIdentifierMapForUndo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUndoManager setSpecificIdentifierMapForUndo:](self, "setSpecificIdentifierMapForUndo:", v9);

  }
  -[CUIKUndoManager specificIdentifierMapForUndo](self, "specificIdentifierMapForUndo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setRevertObject:(id)a3 forSpecificIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[CUIKUndoManager specificIdentifierMapForRevert](self, "specificIdentifierMapForRevert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUndoManager setSpecificIdentifierMapForRevert:](self, "setSpecificIdentifierMapForRevert:", v9);

  }
  -[CUIKUndoManager specificIdentifierMapForRevert](self, "specificIdentifierMapForRevert");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)objectWithSpecificIdentifierWasReverted:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CUIKUndoManager specificIdentifierMapForUndo](self, "specificIdentifierMapForUndo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[CUIKUndoManager specificIdentifierMapForRevert](self, "specificIdentifierMapForRevert");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

}

- (void)_registerUndeletedObject:(id)a3 withOriginalObjectID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = a3;
  -[CUIKUndoManager undeletedObjectMap](self, "undeletedObjectMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUndoManager setUndeletedObjectMap:](self, "setUndeletedObjectMap:", v13);

    goto LABEL_5;
  }
  -[CUIKUndoManager undeletedObjectMap](self, "undeletedObjectMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_5:
    v9 = (void *)objc_opt_new();
    -[CUIKUndoManager undeletedObjectMap](self, "undeletedObjectMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v14);
    goto LABEL_6;
  }
  objc_msgSend(v9, "undeletedObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUIKUndoManager undeletedObjectMap](self, "undeletedObjectMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v11);

LABEL_6:
  objc_msgSend(v9, "setUndeletedObject:", v6);

}

- (void)_clearUndeletedObjects
{
  -[CUIKUndoManager setUndeletedObjectMap:](self, "setUndeletedObjectMap:", 0);
  -[CUIKUndoManager setSpecificIdentifierMapForUndo:](self, "setSpecificIdentifierMapForUndo:", 0);
  -[CUIKUndoManager setSpecificIdentifierMapForRevert:](self, "setSpecificIdentifierMapForRevert:", 0);
}

- (BOOL)disableUndoForOrganizerScheduling
{
  return self->_disableUndoForOrganizerScheduling;
}

- (CUIKCommitDelegate)commitDelegate
{
  return self->_commitDelegate;
}

- (void)setCommitDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_commitDelegate, a3);
}

- (CUIKDecisionDelegate)decisionDelegate
{
  return self->_decisionDelegate;
}

- (void)setDecisionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_decisionDelegate, a3);
}

- (id)editingManagerProvider
{
  return self->_editingManagerProvider;
}

- (CUIKEditorExtended)undoableEditor
{
  return self->_undoableEditor;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (NSMutableDictionary)undeletedObjectMap
{
  return self->_undeletedObjectMap;
}

- (void)setUndeletedObjectMap:(id)a3
{
  objc_storeStrong((id *)&self->_undeletedObjectMap, a3);
}

- (NSMutableDictionary)specificIdentifierMapForUndo
{
  return self->_specificIdentifierMapForUndo;
}

- (void)setSpecificIdentifierMapForUndo:(id)a3
{
  objc_storeStrong((id *)&self->_specificIdentifierMapForUndo, a3);
}

- (NSMutableDictionary)specificIdentifierMapForRevert
{
  return self->_specificIdentifierMapForRevert;
}

- (void)setSpecificIdentifierMapForRevert:(id)a3
{
  objc_storeStrong((id *)&self->_specificIdentifierMapForRevert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificIdentifierMapForRevert, 0);
  objc_storeStrong((id *)&self->_specificIdentifierMapForUndo, 0);
  objc_storeStrong((id *)&self->_undeletedObjectMap, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_undoableEditor, 0);
  objc_storeStrong(&self->_editingManagerProvider, 0);
  objc_storeStrong((id *)&self->_decisionDelegate, 0);
  objc_storeStrong((id *)&self->_commitDelegate, 0);
}

- (void)undoOperation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, a2, a3, "Undo occurred.  Performing operation %@", a5, a6, a7, a8, 2u);
}

- (void)undoOperation:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B8A6A000, a2, a3, "Redo occurred.  Performing operation %@", a5, a6, a7, a8, 2u);
}

@end
