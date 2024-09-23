@implementation PHFetchResultChangeDetails

- (NSIndexSet)movedIndexes
{
  return self->_movedIndexes;
}

- (__CFArray)movedFromIndexes
{
  return self->_movedFromIndexes;
}

- (NSIndexSet)changedIndexes
{
  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  return self->_changedIndexes;
}

+ (PHFetchResultChangeDetails)changeDetailsFromFetchResult:(PHFetchResult *)fromResult toFetchResult:(PHFetchResult *)toResult changedObjects:(NSArray *)changedObjects
{
  PHFetchResultChangeDetails *v5;
  PHFetchResult *v8;
  PHFetchResult *v9;
  void *v10;

  v5 = 0;
  if (fromResult && toResult)
  {
    v8 = toResult;
    v9 = fromResult;
    +[PHFetchResultChangeDetails _identifiersForPHObjects:](PHFetchResultChangeDetails, "_identifiersForPHObjects:", changedObjects);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PHFetchResultChangeDetails initWithFetchResult:currentFetchResult:changedIdentifiers:unknownMergeEvent:]([PHFetchResultChangeDetails alloc], "initWithFetchResult:currentFetchResult:changedIdentifiers:unknownMergeEvent:", v9, v8, v10, 0);

    -[PHFetchResultChangeDetails calculateDiffs](v5, "calculateDiffs");
  }
  return v5;
}

- (PHFetchResultChangeDetails)initWithFetchResult:(id)a3 currentFetchResult:(id)a4 changedIdentifiers:(id)a5 unknownMergeEvent:(BOOL)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PHFetchResultChangeDetails *v15;

  v6 = a6;
  v10 = (objc_class *)MEMORY[0x1E0D71B40];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithChangedObjects:", v11);

  v15 = -[PHFetchResultChangeDetails initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:](self, "initWithFetchResult:currentFetchResult:sortedChangedIdentifiers:unknownMergeEvent:", v13, v12, v14, v6);
  return v15;
}

- (PHFetchResultChangeDetails)initWithFetchResult:(id)a3 currentFetchResult:(id)a4 sortedChangedIdentifiers:(id)a5 unknownMergeEvent:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  PHFetchResultChangeDetails *v14;
  PHFetchResultChangeDetails *v15;
  uint64_t v16;
  NSArray *previousObjects;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHFetchResultChangeDetails;
  v14 = -[PHFetchResultChangeDetails init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fetchResultBeforeChanges, a3);
    objc_storeStrong((id *)&v15->_fetchResultAfterChanges, a4);
    objc_msgSend(v11, "fetchedObjects");
    v16 = objc_claimAutoreleasedReturnValue();
    previousObjects = v15->_previousObjects;
    v15->_previousObjects = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_sortedChangedIdentifiers, a5);
    v15->_skipIncrementalChanges = a6;
  }

  return v15;
}

- (BOOL)hasAnyChanges
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (!-[PHFetchResultChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
    return 1;
  -[PHFetchResultChangeDetails removedIndexes](self, "removedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  -[PHFetchResultChangeDetails insertedIndexes](self, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 1;
  -[PHFetchResultChangeDetails changedIndexes](self, "changedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8 || -[PHFetchResultChangeDetails hasMoves](self, "hasMoves");
}

- (NSIndexSet)removedIndexes
{
  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  return self->_removedIndexes;
}

- (NSIndexSet)insertedIndexes
{
  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  return self->_insertedIndexes;
}

- (void)calculateDiffs
{
  NSArray *v3;
  NSArray *currentObjects;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSIndexSet *v12;
  NSIndexSet *changedIndexes;
  id v14;

  if (!self->_skipIncrementalChanges && !self->_currentObjects)
  {
    -[PHFetchResult fetchedObjects](self->_fetchResultAfterChanges, "fetchedObjects");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    currentObjects = self->_currentObjects;
    self->_currentObjects = v3;

    +[PHFetchResultChangeDetails _identifiersForPHObjects:](PHFetchResultChangeDetails, "_identifiersForPHObjects:", self->_previousObjects);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHFetchResultChangeDetails _identifiersForPHObjects:](PHFetchResultChangeDetails, "_identifiersForPHObjects:", self->_currentObjects);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "pointerComparableIdentifiersFromIdentifiers:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "pointerComparableIdentifiersFromIdentifiers:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLDiffArrays();
    v14 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    objc_storeStrong((id *)&self->_removedIndexes, 0);
    objc_storeStrong((id *)&self->_insertedIndexes, 0);
    objc_storeStrong((id *)&self->_movedIndexes, 0);
    self->_movedFromIndexes = 0;
    -[PHFetchResultChangeDetails _addAdditionalIndexesToChanges:withPreviousIdentifiers:currentIdentifiers:](self, "_addAdditionalIndexesToChanges:withPreviousIdentifiers:currentIdentifiers:", v11, v5, v6);
    v12 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    changedIndexes = self->_changedIndexes;
    self->_changedIndexes = v12;

  }
}

+ (id)_identifiersForPHObjects:(id)a3
{
  id v3;
  void *v4;
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

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "oids");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "identifier", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (BOOL)hasIncrementalChanges
{
  return !-[PHFetchResultChangeDetails shouldReload](self, "shouldReload");
}

- (BOOL)shouldReload
{
  return self->_skipIncrementalChanges;
}

- (id)_addAdditionalIndexesToChanges:(id)a3 withPreviousIdentifiers:(id)a4 currentIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
    v11 = (void *)objc_msgSend(v8, "mutableCopy");
  else
    v11 = 0;
  -[PHFetchResult additionalChangedIdentifiersFromPreviousIdentifiers:currentIdentifiers:inFetchResultBeforeChanges:](self->_fetchResultAfterChanges, "additionalChangedIdentifiersFromPreviousIdentifiers:currentIdentifiers:inFetchResultBeforeChanges:", v9, v10, self->_fetchResultBeforeChanges);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_msgSend(v10, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17), (_QWORD)v20);
          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v11, "addIndex:", v18);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

  }
  return v11;
}

- (void)dealloc
{
  __CFArray *movedFromIndexes;
  objc_super v4;

  movedFromIndexes = self->_movedFromIndexes;
  if (movedFromIndexes)
  {
    CFRelease(movedFromIndexes);
    self->_movedFromIndexes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PHFetchResultChangeDetails;
  -[PHFetchResultChangeDetails dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedIndexes, 0);
  objc_storeStrong((id *)&self->_sortedChangedIdentifiers, 0);
  objc_storeStrong((id *)&self->_movedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_removedIndexes, 0);
  objc_storeStrong((id *)&self->_currentObjects, 0);
  objc_storeStrong((id *)&self->_previousObjects, 0);
  objc_storeStrong((id *)&self->_fetchResultAfterChanges, 0);
  objc_storeStrong((id *)&self->_fetchResultBeforeChanges, 0);
}

- (PHFetchResultChangeDetails)initWithManualFetchResultAfterChanges:(id)a3
{
  id v5;
  PHFetchResultChangeDetails *v6;
  PHFetchResultChangeDetails *v7;
  uint64_t v8;
  NSArray *previousObjects;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHFetchResultChangeDetails;
  v6 = -[PHFetchResultChangeDetails init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchResultAfterChanges, a3);
    objc_msgSend(v5, "fetchedObjects");
    v8 = objc_claimAutoreleasedReturnValue();
    previousObjects = v7->_previousObjects;
    v7->_previousObjects = (NSArray *)v8;

    v7->_skipIncrementalChanges = 1;
  }

  return v7;
}

- (PHFetchResult)fetchResultBeforeChanges
{
  return self->_fetchResultBeforeChanges;
}

- (PHFetchResult)fetchResultAfterChanges
{
  PHFetchResult *fetchResultAfterChanges;
  PHFetchResult *v4;
  PHFetchResult *v5;

  fetchResultAfterChanges = self->_fetchResultAfterChanges;
  if (!fetchResultAfterChanges)
  {
    -[PHFetchResult fetchResultWithChangeHandlingValue:](self->_fetchResultBeforeChanges, "fetchResultWithChangeHandlingValue:", 0);
    v4 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fetchResultAfterChanges;
    self->_fetchResultAfterChanges = v4;

    fetchResultAfterChanges = self->_fetchResultAfterChanges;
  }
  -[PHFetchResult updateRegistrationForChangeNotificationDeltas](fetchResultAfterChanges, "updateRegistrationForChangeNotificationDeltas");
  return self->_fetchResultAfterChanges;
}

- (NSArray)removedObjects
{
  void *v3;

  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  if (self->_removedIndexes)
  {
    -[NSArray objectsAtIndexes:](self->_previousObjects, "objectsAtIndexes:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (NSArray)insertedObjects
{
  void *v3;

  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  if (self->_insertedIndexes)
  {
    -[NSArray objectsAtIndexes:](self->_currentObjects, "objectsAtIndexes:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (NSArray)changedObjects
{
  void *v3;

  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  if (self->_changedIndexes)
  {
    -[NSArray objectsAtIndexes:](self->_currentObjects, "objectsAtIndexes:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (void)enumerateMovesWithBlock:(void *)handler
{
  void *v4;
  NSIndexSet *movedIndexes;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[4];

  v4 = handler;
  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  movedIndexes = self->_movedIndexes;
  if (movedIndexes)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__PHFetchResultChangeDetails_enumerateMovesWithBlock___block_invoke;
    v6[3] = &unk_1E35DEDA0;
    v6[4] = self;
    v8 = v9;
    v7 = v4;
    -[NSIndexSet enumerateIndexesUsingBlock:](movedIndexes, "enumerateIndexesUsingBlock:", v6);

    _Block_object_dispose(v9, 8);
  }

}

- (BOOL)hasMoves
{
  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  return -[NSIndexSet count](self->_movedIndexes, "count") != 0;
}

- (unint64_t)snapshotIndexForContainedObject:(id)a3
{
  PHFetchResult *fetchResultBeforeChanges;

  fetchResultBeforeChanges = self->_fetchResultBeforeChanges;
  if (fetchResultBeforeChanges)
    return -[PHFetchResult indexOfObject:](fetchResultBeforeChanges, "indexOfObject:", a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)calculateDiffsAndAccumulateInsertedCount:(unint64_t *)a3 updatedCount:(unint64_t *)a4 deletedCount:(unint64_t *)a5
{
  -[PHFetchResultChangeDetails calculateDiffs](self, "calculateDiffs");
  *a3 += -[NSIndexSet count](self->_insertedIndexes, "count");
  *a4 += -[NSIndexSet count](self->_changedIndexes, "count");
  *a5 += -[NSIndexSet count](self->_removedIndexes, "count");
}

- (PLSortedChangedObjects)sortedChangedIdentifiers
{
  return self->_sortedChangedIdentifiers;
}

- (BOOL)hasDiffs
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[PHFetchResultChangeDetails shouldReload](self, "shouldReload")
    || -[PHFetchResultChangeDetails hasMoves](self, "hasMoves"))
  {
    return 1;
  }
  -[PHFetchResultChangeDetails insertedIndexes](self, "insertedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[PHFetchResultChangeDetails removedIndexes](self, "removedIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = 1;
    }
    else
    {
      -[PHFetchResultChangeDetails changedIndexes](self, "changedIndexes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6 != 0;

    }
  }

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHFetchResultChangeDetails;
  -[PHFetchResultChangeDetails description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResultChangeDetails fetchResultBeforeChanges](self, "fetchResultBeforeChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResultChangeDetails fetchResultAfterChanges](self, "fetchResultAfterChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHFetchResultChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges");
  -[PHFetchResultChangeDetails removedIndexes](self, "removedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResultChangeDetails insertedIndexes](self, "insertedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResultChangeDetails changedIndexes](self, "changedIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" before=%@, after=%@, hasIncremental=%d deleted=%@, inserted=%@, changed=%@, hasMoves=%d"), v4, v5, v6, v7, v8, v9, -[PHFetchResultChangeDetails hasMoves](self, "hasMoves"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __54__PHFetchResultChangeDetails_enumerateMovesWithBlock___block_invoke(_QWORD *a1)
{
  const __CFArray *v2;
  uint64_t v3;
  CFIndex v4;

  v2 = *(const __CFArray **)(a1[4] + 64);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  CFArrayGetValueAtIndex(v2, v4);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

@end
