@implementation EDSearchableIndexState

- (EDSearchableIndexState)initWithPendingIdentifierRemovals:(id)a3
{
  id v5;
  EDSearchableIndexState *v6;
  NSMutableSet *v7;
  NSMutableSet *removedIdentifiers;
  NSMutableArray *v9;
  NSMutableArray *preparingItems;
  NSMutableArray *v11;
  NSMutableArray *pendingItems;
  NSMutableArray *v13;
  NSMutableArray *preprocessingItems;
  NSMutableArray *v15;
  NSMutableArray *processingItems;
  NSMutableSet *v17;
  NSMutableSet *pendingDomainRemovals;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EDSearchableIndexState;
  v6 = -[EDSearchableIndexState init](&v20, sel_init);
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    removedIdentifiers = v6->_removedIdentifiers;
    v6->_removedIdentifiers = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    preparingItems = v6->_preparingItems;
    v6->_preparingItems = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingItems = v6->_pendingItems;
    v6->_pendingItems = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    preprocessingItems = v6->_preprocessingItems;
    v6->_preprocessingItems = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    processingItems = v6->_processingItems;
    v6->_processingItems = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingDomainRemovals = v6->_pendingDomainRemovals;
    v6->_pendingDomainRemovals = v17;

    objc_storeStrong((id *)&v6->_pendingIdentifierRemovals, a3);
  }

  return v6;
}

- (unint64_t)countOfItemsInPendingQueues
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[EDSearchableIndexState pendingItems](self, "pendingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[EDSearchableIndexState pendingIdentifierRemovals](self, "pendingIdentifierRemovals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[EDSearchableIndexState pendingDomainRemovals](self, "pendingDomainRemovals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + v4 + objc_msgSend(v7, "count");

  return v8;
}

- (NSArray)pendingIdentifiers
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[EDSearchableIndexState pendingItems](self, "pendingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v7), "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v5);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[EDSearchableIndexState preprocessingItems](self, "preprocessingItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[EDSearchableIndexState processingItems](self, "processingItems", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v15);
  }

  -[EDSearchableIndexState removedIdentifiers](self, "removedIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v19);

  objc_msgSend(v3, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v20;
}

- (BOOL)needsToScheduleRefresh
{
  _BOOL4 v3;

  v3 = -[EDSearchableIndexState needsRefresh](self, "needsRefresh");
  if (v3)
    LOBYTE(v3) = !-[EDSearchableIndexState scheduledRefresh](self, "scheduledRefresh");
  return v3;
}

- (BOOL)needsToScheduleVerification
{
  unint64_t v3;
  _BOOL4 v4;

  v3 = -[EDSearchableIndexState countOfItemsInPendingQueues](self, "countOfItemsInPendingQueues");
  if (-[EDSearchableIndexState needsVerification](self, "needsVerification"))
    v4 = !-[EDSearchableIndexState scheduledVerification](self, "scheduledVerification");
  else
    LOBYTE(v4) = 0;
  return !v3 && v4;
}

- (BOOL)needsImmediateProcessing
{
  unint64_t v3;
  void *v4;
  BOOL v5;
  BOOL v6;

  v3 = -[EDSearchableIndexState countOfItemsInPendingQueues](self, "countOfItemsInPendingQueues");
  -[EDSearchableIndexState pendingDomainRemovals](self, "pendingDomainRemovals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    v6 = -[EDSearchableIndexState indexImmediately](self, "indexImmediately");
    if (v3)
      v5 = v6;
    else
      v5 = 0;
  }

  return v5;
}

- (BOOL)queueContentsAllowsRefresh
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  -[EDSearchableIndexState preprocessingItems](self, "preprocessingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ef_countObjectsPassingTest:", &__block_literal_global_69);

  v5 = -[EDSearchableIndexState countOfItemsInPendingQueues](self, "countOfItemsInPendingQueues");
  -[EDSearchableIndexState preprocessingItems](self, "preprocessingItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v4 <= 0xC && v7 + v5 == 0;
}

BOOL __52__EDSearchableIndexState_queueContentsAllowsRefresh__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSearchableIndexAttachmentItem attachmentPersistentIDFromItemIdentifier:](EDSearchableIndexAttachmentItem, "attachmentPersistentIDFromItemIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)suspend
{
  int64_t v3;

  v3 = -[EDSearchableIndexState resumeCount](self, "resumeCount") - 1;
  -[EDSearchableIndexState setResumeCount:](self, "setResumeCount:", v3);
  return v3;
}

- (int64_t)resume
{
  int64_t v3;

  v3 = -[EDSearchableIndexState resumeCount](self, "resumeCount") + 1;
  -[EDSearchableIndexState setResumeCount:](self, "setResumeCount:", v3);
  return v3;
}

- (id)prepareToIndexItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  -[NSMutableArray addObjectsFromArray:](self->_preparingItems, "addObjectsFromArray:", v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__EDSearchableIndexState_prepareToIndexItems___block_invoke;
  v8[3] = &unk_1E94A1348;
  v8[4] = self;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "objectsAtIndexes:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsInArray:](self->_preparingItems, "removeObjectsInArray:", v6);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __46__EDSearchableIndexState_prepareToIndexItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removedIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (void)didPrepareItems:(id)a3
{
  -[NSMutableArray removeObjectsInArray:](self->_preparingItems, "removeObjectsInArray:", a3);
}

- (BOOL)didPreprocessItem:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_preprocessingItems, "indexOfObject:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_preprocessingItems, "removeObjectAtIndex:", v5);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)indexItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;

  v4 = a3;
  -[EDSearchableIndexState preprocessingItems](self, "preprocessingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EDSearchableIndexState preprocessingItems](self, "preprocessingItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addPendingItem:", v4);
    v7 = 1;
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v4, "requiresPreprocessing"))
  {
    -[NSMutableArray addObject:](self->_preprocessingItems, "addObject:", v4);
    v7 = 0;
    goto LABEL_6;
  }
  -[EDSearchableIndexState pendingItems](self, "pendingItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v4);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EDSearchableIndexState pendingItems](self, "pendingItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addPendingItem:", v4);
    v7 = 2;
    goto LABEL_5;
  }
  -[EDSearchableIndexState pendingItems](self, "pendingItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "ef_indexWhereObjectWouldBeInserted:usingComparator:", v4, &__block_literal_global_5_0);

  -[NSMutableArray insertObject:atIndex:](self->_pendingItems, "insertObject:atIndex:", v4, v14);
  -[EDSearchableIndexState pendingItems](self, "pendingItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 >= 0x800)
    -[NSMutableArray removeLastObject](self->_pendingItems, "removeLastObject");
  v7 = 3;
LABEL_6:

  return v7;
}

uint64_t __36__EDSearchableIndexState_indexItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)removeIdentifiersFromPendingQueues:(id)a3 reasons:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  if (objc_msgSend(v24, "count"))
  {
    -[NSMutableSet addObjectsFromArray:](self->_removedIdentifiers, "addObjectsFromArray:", v24);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexState pendingItems](self, "pendingItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __69__EDSearchableIndexState_removeIdentifiersFromPendingQueues_reasons___block_invoke;
    v31[3] = &unk_1E94A1390;
    v7 = v21;
    v32 = v7;
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", v31);
    v8 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v8;
    -[NSMutableArray removeObjectsAtIndexes:](self->_pendingItems, "removeObjectsAtIndexes:", v8);
    -[EDSearchableIndexState pendingIdentifierRemovals](self, "pendingIdentifierRemovals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addIdentifiers:withReasons:", v24, v23);

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[EDSearchableIndexState preprocessingItems](self, "preprocessingItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v7, "containsObject:", v16);

          if (v17)
            objc_msgSend(v10, "addObject:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v10, "count"))
      -[NSMutableArray removeObjectsInArray:](self->_preprocessingItems, "removeObjectsInArray:", v10);
    -[EDSearchableIndexState preparingItems](self, "preparingItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __69__EDSearchableIndexState_removeIdentifiersFromPendingQueues_reasons___block_invoke_2;
    v25[3] = &unk_1E94A1348;
    v19 = v7;
    v26 = v19;
    objc_msgSend(v18, "indexesOfObjectsPassingTest:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectsAtIndexes:](self->_preparingItems, "removeObjectsAtIndexes:", v20);
  }

}

uint64_t __69__EDSearchableIndexState_removeIdentifiersFromPendingQueues_reasons___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __69__EDSearchableIndexState_removeIdentifiersFromPendingQueues_reasons___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)removeItemsForDomainIdentifier:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  -[EDSearchableIndexState pendingItems](self, "pendingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __57__EDSearchableIndexState_removeItemsForDomainIdentifier___block_invoke;
  v22[3] = &unk_1E94A1390;
  v4 = v15;
  v23 = v4;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v22);
  v5 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)v5;
  -[NSMutableArray removeObjectsAtIndexes:](self->_pendingItems, "removeObjectsAtIndexes:", v5);
  -[NSMutableSet addObject:](self->_pendingDomainRemovals, "addObject:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EDSearchableIndexState preprocessingItems](self, "preprocessingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "referenceItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "domainIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasPrefix:", v4);

        if (v14)
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
    -[NSMutableArray removeObjectsInArray:](self->_preprocessingItems, "removeObjectsInArray:", v6);

}

uint64_t __57__EDSearchableIndexState_removeItemsForDomainIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "referenceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)processBatchOfSize:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[EDSearchableIndexState pendingItems](self, "pendingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  if (!v6)
    return MEMORY[0x1E0C9AA60];
  v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[EDSearchableIndexState pendingItems](self, "pendingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      v12 = 0;
      v21 = v10 + v8;
      v19 = v10;
      v13 = v10 + 1;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        v15 = objc_msgSend(v14, "estimatedSizeInBytes");
        if (v15 <= 0x2000000)
          v16 = v15;
        else
          v16 = 0;
        objc_msgSend(v14, "items");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObjectsFromArray:", v17);

        if (v13 + v12 >= v6 || (v9 += v16, v9 >= 0x2000000))
        {
          v21 = v19 + v12 + 1;
          v7 = obj;
          goto LABEL_21;
        }
        ++v12;
      }
      while (v8 != v12);
      v7 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v10 = v21;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v21 = 0;
  }
LABEL_21:

  -[NSMutableArray removeObjectsInRange:](self->_pendingItems, "removeObjectsInRange:", 0, v21);
  -[NSMutableArray addObjectsFromArray:](self->_processingItems, "addObjectsFromArray:", v23);
  return v23;
}

- (void)didIndexItems:(id)a3
{
  -[NSMutableArray removeObjectsInArray:](self->_processingItems, "removeObjectsInArray:", a3);
}

- (void)failedToIndexItems:(id)a3
{
  -[NSMutableArray removeObjectsInArray:](self->_processingItems, "removeObjectsInArray:", a3);
}

- (id)removePendingDomainRemovals
{
  void *v3;
  NSMutableSet *v4;
  NSMutableSet *pendingDomainRemovals;

  -[EDSearchableIndexState pendingDomainRemovals](self, "pendingDomainRemovals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  pendingDomainRemovals = self->_pendingDomainRemovals;
  self->_pendingDomainRemovals = v4;

  return v3;
}

- (void)startReindex
{
  id v3;

  -[EDSearchableIndexState setTransaction:](self, "setTransaction:", 0);
  -[EDSearchableIndexState setClientStateFetched:](self, "setClientStateFetched:", 0);
  -[NSMutableArray removeAllObjects](self->_processingItems, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pendingItems, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_preprocessingItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_pendingDomainRemovals, "removeAllObjects");
  -[EDSearchableIndexState pendingIdentifierRemovals](self, "pendingIdentifierRemovals");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllIdentifiers");

}

- (void)didCompleteBacklog
{
  -[NSMutableSet removeAllObjects](self->_removedIdentifiers, "removeAllObjects");
}

- (int64_t)resumeCount
{
  return self->_resumeCount;
}

- (void)setResumeCount:(int64_t)a3
{
  self->_resumeCount = a3;
}

- (int64_t)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(int64_t)a3
{
  self->_transaction = a3;
}

- (NSSet)removedIdentifiers
{
  return &self->_removedIdentifiers->super;
}

- (NSArray)preparingItems
{
  return &self->_preparingItems->super;
}

- (NSArray)pendingItems
{
  return &self->_pendingItems->super;
}

- (NSArray)preprocessingItems
{
  return &self->_preprocessingItems->super;
}

- (NSArray)processingItems
{
  return &self->_processingItems->super;
}

- (NSSet)pendingDomainRemovals
{
  return &self->_pendingDomainRemovals->super;
}

- (_EDSearchableIndexPendingRemovals)pendingIdentifierRemovals
{
  return self->_pendingIdentifierRemovals;
}

- (void)setPendingIdentifierRemovals:(id)a3
{
  objc_storeStrong((id *)&self->_pendingIdentifierRemovals, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (BOOL)needsVerification
{
  return self->_needsVerification;
}

- (void)setNeedsVerification:(BOOL)a3
{
  self->_needsVerification = a3;
}

- (BOOL)coalesceTimerFired
{
  return self->_coalesceTimerFired;
}

- (void)setCoalesceTimerFired:(BOOL)a3
{
  self->_coalesceTimerFired = a3;
}

- (BOOL)scheduledProcessing
{
  return self->_scheduledProcessing;
}

- (void)setScheduledProcessing:(BOOL)a3
{
  self->_scheduledProcessing = a3;
}

- (BOOL)scheduledRefresh
{
  return self->_scheduledRefresh;
}

- (void)setScheduledRefresh:(BOOL)a3
{
  self->_scheduledRefresh = a3;
}

- (BOOL)scheduledVerification
{
  return self->_scheduledVerification;
}

- (void)setScheduledVerification:(BOOL)a3
{
  self->_scheduledVerification = a3;
}

- (BOOL)indexImmediately
{
  return self->_indexImmediately;
}

- (void)setIndexImmediately:(BOOL)a3
{
  self->_indexImmediately = a3;
}

- (BOOL)clientStateFetched
{
  return self->_clientStateFetched;
}

- (void)setClientStateFetched:(BOOL)a3
{
  self->_clientStateFetched = a3;
}

- (BOOL)persistenceAvailable
{
  return self->_persistenceAvailable;
}

- (void)setPersistenceAvailable:(BOOL)a3
{
  self->_persistenceAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingIdentifierRemovals, 0);
  objc_storeStrong((id *)&self->_pendingDomainRemovals, 0);
  objc_storeStrong((id *)&self->_processingItems, 0);
  objc_storeStrong((id *)&self->_preprocessingItems, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_preparingItems, 0);
  objc_storeStrong((id *)&self->_removedIdentifiers, 0);
}

@end
