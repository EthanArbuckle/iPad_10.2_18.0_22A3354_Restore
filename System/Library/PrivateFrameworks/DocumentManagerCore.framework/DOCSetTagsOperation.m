@implementation DOCSetTagsOperation

- (DOCSetTagsOperation)initWithItems:(id)a3 tagsLists:(id)a4 isUndoable:(BOOL)a5 shouldClearUndoStack:(BOOL)a6 undoManager:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v13;
  id v14;
  DOCSetTagsOperation *v15;
  DOCSetTagsOperation *v16;
  uint64_t v17;
  NSArray *oldTagsLists;
  objc_super v20;

  v8 = a6;
  v9 = a5;
  v13 = a4;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)DOCSetTagsOperation;
  v15 = -[FPSetTagsOperation initWithItems:tagsLists:](&v20, sel_initWithItems_tagsLists_, a3, v13);
  v16 = v15;
  if (v15)
  {
    -[DOCSetTagsOperation currentTagsLists](v15, "currentTagsLists");
    v17 = objc_claimAutoreleasedReturnValue();
    oldTagsLists = v16->_oldTagsLists;
    v16->_oldTagsLists = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_updatedTagsLists, a4);
    objc_storeStrong((id *)&v16->_undoManager, a7);
    if (v9)
    {
      -[DOCSetTagsOperation registerUndo](v16, "registerUndo");
    }
    else if (v8)
    {
      -[DOCSetTagsOperation clearUndoStack](v16, "clearUndoStack");
    }
  }

  return v16;
}

- (NSString)actionNameForUndoing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _DocumentManagerBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Edit Tags of “%@” [undo / redo command]"), CFSTR("Edit Tags of “%@”"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _DocumentManagerBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Edit Tags of %lu Items [undo / redo command]"), CFSTR("Edit Tags of %lu Items [undo / redo command]"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPTransformOperation items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[FPTransformOperation items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == 1)
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v4, v11);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v6, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)operationForRedoing
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  DOCSetTagsOperation *v7;
  void *v8;
  void *v9;
  DOCSetTagsOperation *v10;

  -[DOCSetTagsOperation currentItems](self, "currentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count")
    && (v4 = objc_msgSend(v3, "count"),
        -[FPTransformOperation items](self, "items"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4 == v6))
  {
    v7 = [DOCSetTagsOperation alloc];
    -[DOCSetTagsOperation updatedTagsLists](self, "updatedTagsLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCSetTagsOperation undoManager](self, "undoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[DOCSetTagsOperation initWithItems:tagsLists:isUndoable:shouldClearUndoStack:undoManager:](v7, "initWithItems:tagsLists:isUndoable:shouldClearUndoStack:undoManager:", v3, v8, 1, 0, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)operationForUndoing
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  DOCSetTagsOperation *v7;
  void *v8;
  void *v9;
  DOCSetTagsOperation *v10;

  -[DOCSetTagsOperation currentItems](self, "currentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count")
    && (v4 = objc_msgSend(v3, "count"),
        -[FPTransformOperation items](self, "items"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4 == v6))
  {
    v7 = [DOCSetTagsOperation alloc];
    -[DOCSetTagsOperation oldTagsLists](self, "oldTagsLists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCSetTagsOperation undoManager](self, "undoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[DOCSetTagsOperation initWithItems:tagsLists:isUndoable:shouldClearUndoStack:undoManager:](v7, "initWithItems:tagsLists:isUndoable:shouldClearUndoStack:undoManager:", v3, v8, 1, 0, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)registerUndo
{
  id v3;

  -[DOCSetTagsOperation undoManager](self, "undoManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerUndoOperationForSender:", self);

}

- (void)clearUndoStack
{
  id v2;

  -[DOCSetTagsOperation undoManager](self, "undoManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllActions");

}

- (id)currentItems
{
  void *v3;
  void *v4;

  -[DOCSetTagsOperation operationItemIDs](self, "operationItemIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCSetTagsOperation itemsFromItemIDs:](self, "itemsFromItemIDs:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)operationItemIDs
{
  void *v3;
  void *v4;

  -[FPTransformOperation items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCSetTagsOperation itemIDsFromItems:](self, "itemIDsFromItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)itemIDsFromItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "itemID", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)itemsFromItemIDs:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  id obj;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = dispatch_semaphore_create(0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        -[FPActionOperation itemManager](self, "itemManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __40__DOCSetTagsOperation_itemsFromItemIDs___block_invoke;
        v16[3] = &unk_24C0FE928;
        v18 = &v23;
        v11 = v5;
        v17 = v11;
        objc_msgSend(v10, "fetchItemForItemID:completionHandler:", v9, v16);

        v12 = dispatch_time(0, 1000000000);
        dispatch_semaphore_wait(v11, v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v6);
  }

  v13 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v13;
}

intptr_t __40__DOCSetTagsOperation_itemsFromItemIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)currentTagsLists
{
  void *v3;
  void *v4;

  -[FPTransformOperation items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCSetTagsOperation tagsListsFromItems:](self, "tagsListsFromItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tagsListsFromItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "tags", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "tags");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        else
        {
          objc_msgSend(v4, "addObject:", v9);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSArray)oldTagsLists
{
  return self->_oldTagsLists;
}

- (NSArray)updatedTagsLists
{
  return self->_updatedTagsLists;
}

- (DOCUndoManager)undoManager
{
  return self->_undoManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_updatedTagsLists, 0);
  objc_storeStrong((id *)&self->_oldTagsLists, 0);
}

@end
