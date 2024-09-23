@implementation ML3ContainerQueryResultSet

- (ML3ContainerQueryResultSet)initWithQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  ML3ContainerQueryResultSet *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", CFSTR("smart_is_limited"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(v5, "valueForProperty:", CFSTR("smart_limit_kind"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue") == 2;

  }
  else
  {
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)ML3ContainerQueryResultSet;
  v10 = -[ML3QueryResultSet _initWithQuery:supportsIncrementalUpdate:](&v13, sel__initWithQuery_supportsIncrementalUpdate_, v4, v9 | v7 ^ 1u);
  if (v10)
  {
    v10->_containerPID = objc_msgSend(v5, "persistentID");
    if (v9)
    {
      objc_msgSend(v5, "valueForProperty:", CFSTR("smart_limit_value"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_entityLimit = objc_msgSend(v11, "unsignedIntegerValue");

    }
    else
    {
      v10->_entityLimit = -1;
    }
  }

  return v10;
}

- (void)_loadCurrentFullResults
{
  ML3Query *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ML3QueryResultSet_BackingStore *sortedBackingStore;
  objc_super v9;

  v3 = self->super._query;
  -[ML3Query container](v3, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[ML3Query requiresSmartLimiting](v3, "requiresSmartLimiting"))
  {
    self->_needsSorting = 0;
LABEL_6:
    self->_needsReversing = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "displayOrderingTerms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "limitOrderingTerms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_needsSorting = objc_msgSend(v5, "isEqualToArray:", v6) ^ 1;

  if (!self->_needsSorting || !-[ML3Query requiresSmartLimiting](v3, "requiresSmartLimiting"))
    goto LABEL_6;
  objc_msgSend(v4, "valueForProperty:", CFSTR("is_reversed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_needsReversing = objc_msgSend(v7, "BOOLValue");

LABEL_7:
  sortedBackingStore = self->_sortedBackingStore;
  self->_sortedBackingStore = 0;

  v9.receiver = self;
  v9.super_class = (Class)ML3ContainerQueryResultSet;
  -[ML3QueryResultSet _loadCurrentFullResults](&v9, sel__loadCurrentFullResults);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3ContainerQueryResultSet;
  v4 = -[ML3QueryResultSet copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_BYTE *)v4 + 72) = self->_needsSorting;
  *((_BYTE *)v4 + 73) = self->_needsReversing;
  objc_storeStrong((id *)v4 + 10, self->_sortedBackingStore);
  *((_QWORD *)v4 + 11) = self->_containerPID;
  *((_QWORD *)v4 + 12) = self->_entityLimit;
  return v4;
}

- (id)sortedBackingStoreForDisplayOrdering
{
  ML3QueryResultSet_BackingStore **p_backingStore;
  ML3QueryResultSet_BackingStore **p_sortedBackingStore;
  ML3QueryResultSet_BackingStore *sortedBackingStore;
  void *v6;
  ML3QueryResultSet_MutableBackingStore *v7;
  void *v8;
  ML3QueryResultSet_BackingStore *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  ML3QueryResultSet_BackingStore *v22;
  ML3QueryResultSet_MutableBackingStore *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  p_backingStore = &self->super._backingStore;
  if (!-[ML3QueryResultSet_BackingStore count](self->super._backingStore, "count"))
  {
    p_sortedBackingStore = p_backingStore;
LABEL_17:
    sortedBackingStore = *p_sortedBackingStore;
    return sortedBackingStore;
  }
  p_sortedBackingStore = &self->_sortedBackingStore;
  sortedBackingStore = self->_sortedBackingStore;
  if (!sortedBackingStore)
  {
    -[ML3Query container](self->super._query, "container");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayOrderingTerms");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(ML3QueryResultSet_MutableBackingStore);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[ML3QueryResultSet_BackingStore count](*p_backingStore, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *p_backingStore;
    v10 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke;
    v32[3] = &unk_1E5B65960;
    v11 = v8;
    v33 = v11;
    -[ML3QueryResultSet_BackingStore enumeratePersistentIDsUsingBlock:](v9, "enumeratePersistentIDsUsingBlock:", v32);
    -[ML3Query library](self->super._query, "library");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3ContainmentPredicate predicateWithProperty:values:](ML3ContainmentPredicate, "predicateWithProperty:values:", CFSTR("ROWID"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:orderingTerms:usingSections:options:](ML3Track, "queryWithLibrary:predicate:orderingTerms:usingSections:options:", v12, v13, v25, -[ML3Query usingSections](self->super._query, "usingSections"), -[ML3Query options](self->super._query, "options"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[ML3Query sectionProperty](self->super._query, "sectionProperty");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v31[0] = v10;
      v31[1] = 3221225472;
      v31[2] = __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke_2;
      v31[3] = &unk_1E5B63838;
      v16 = v31;
      v31[4] = v7;
      v31[5] = v11;
      objc_msgSend(v14, "enumeratePersistentIDsAndSectionsWithProperty:usingBlock:", v15, v31);
    }
    else
    {
      v30[0] = v10;
      v30[1] = 3221225472;
      v30[2] = __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke_3;
      v30[3] = &unk_1E5B63860;
      v16 = v30;
      v30[4] = v7;
      v30[5] = v11;
      objc_msgSend(v14, "enumeratePersistentIDsUsingBlock:", v30);
    }

    v17 = -[ML3QueryResultSet_BackingStore count](v7, "count");
    if (v17 < -[ML3QueryResultSet_BackingStore count](*p_backingStore, "count"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v18);
            FastAppendPersistentID(v7, objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "longLongValue"), 0);
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v19);
      }

    }
    v22 = *p_sortedBackingStore;
    *p_sortedBackingStore = &v7->super;
    v23 = v7;

    goto LABEL_17;
  }
  return sortedBackingStore;
}

- (int64_t)persistentIDAtIndex:(unint64_t)a3
{
  NSObject *fixedPriorityQueue;
  int64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  fixedPriorityQueue = self->super._fixedPriorityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ML3ContainerQueryResultSet_persistentIDAtIndex___block_invoke;
  block[3] = &unk_1E5B655D8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(fixedPriorityQueue, block);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4;
  NSObject *fixedPriorityQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  fixedPriorityQueue = self->super._fixedPriorityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ML3ContainerQueryResultSet_enumeratePersistentIDsUsingBlock___block_invoke;
  block[3] = &unk_1E5B64758;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(fixedPriorityQueue, block);

}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4;
  NSObject *fixedPriorityQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  fixedPriorityQueue = self->super._fixedPriorityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ML3ContainerQueryResultSet_enumerateSectionsUsingBlock___block_invoke;
  block[3] = &unk_1E5B64758;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(fixedPriorityQueue, block);

}

- (unint64_t)entityLimit
{
  return self->_entityLimit;
}

- (BOOL)_updateToLibraryCurrentRevision
{
  ML3Query *v3;
  void *v4;
  uint64_t v5;
  int64_t revision;
  BOOL v7;
  objc_super v9;

  v3 = self->super._query;
  -[ML3Query library](v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ML3Query filtersOnDynamicProperties](v3, "filtersOnDynamicProperties"))
    v5 = objc_msgSend(v4, "currentRevision");
  else
    v5 = objc_msgSend(v4, "currentContentRevision");
  revision = self->super._revision;
  if (self->super._backingStore && revision == v5)
  {
    v7 = 0;
  }
  else if (revision
         && revision + 100 >= v5
         && revision <= v5
         && !objc_msgSend(v4, "persistentID:changedAfterRevision:revisionTrackingCode:", self->_containerPID, revision, +[ML3Container revisionTrackingCode](ML3Container, "revisionTrackingCode")))
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3ContainerQueryResultSet;
    v7 = -[ML3QueryResultSet _updateToLibraryCurrentRevision](&v9, sel__updateToLibraryCurrentRevision);
  }
  else
  {
    -[ML3ContainerQueryResultSet _loadCurrentFullResults](self, "_loadCurrentFullResults");
    ++self->super._localRevision;
    v7 = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedBackingStore, 0);
}

void __58__ML3ContainerQueryResultSet_enumerateSectionsUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v13, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", CFSTR("is_reversed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (!objc_msgSend(v13, "requiresSmartLimiting")
    || (objc_msgSend(v2, "displayOrderingTerms"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "limitOrderingTerms"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqualToArray:", v7),
        v7,
        v6,
        !v8))
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v11 + 72))
    {
      objc_msgSend((id)v11, "sortedBackingStoreForDisplayOrdering");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "enumerateSectionsUsingBlock:", *(_QWORD *)(a1 + 40));

      goto LABEL_9;
    }
    v10 = *(void **)(v11 + 8);
    v9 = *(_QWORD *)(a1 + 40);
LABEL_8:
    objc_msgSend(v10, "enumerateSectionsUsingBlock:", v9);
    goto LABEL_9;
  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v10, "reverseEnumerateSectionsUsingBlock:", v9);
LABEL_9:

}

void __63__ML3ContainerQueryResultSet_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v11, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "requiresSmartLimiting")
    || (objc_msgSend(v2, "displayOrderingTerms"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "limitOrderingTerms"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "isEqualToArray:", v4),
        v4,
        v3,
        !v5))
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v9 + 72))
    {
      objc_msgSend((id)v9, "sortedBackingStoreForDisplayOrdering");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "enumeratePersistentIDsUsingBlock:", *(_QWORD *)(a1 + 40));

      goto LABEL_9;
    }
    v8 = *(void **)(v9 + 8);
    v6 = *(_QWORD *)(a1 + 40);
LABEL_8:
    objc_msgSend(v8, "enumeratePersistentIDsUsingBlock:", v6);
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(v7 + 8);
  if (!*(_BYTE *)(v7 + 73))
    goto LABEL_8;
  objc_msgSend(v8, "reverseEnumeratePersistentIDsUsingBlock:", v6);
LABEL_9:

}

void __50__ML3ContainerQueryResultSet_persistentIDAtIndex___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  objc_super v6;

  v2 = a1[4];
  if (*(_BYTE *)(v2 + 72))
  {
    objc_msgSend((id)v2, "sortedBackingStoreForDisplayOrdering");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v5, "persistentIDAtIndex:", a1[6]);

  }
  else
  {
    if (*(_BYTE *)(v2 + 73))
    {
      v3 = (id)objc_msgSend(*(id *)(v2 + 8), "persistentIDAtIndex:", objc_msgSend(*(id *)(v2 + 8), "count") + ~a1[6]);
    }
    else
    {
      v4 = a1[6];
      v6.receiver = (id)v2;
      v6.super_class = (Class)ML3ContainerQueryResultSet;
      v3 = objc_msgSendSuper2(&v6, sel_persistentIDAtIndex_, v4);
    }
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  }
}

void __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke_2(uint64_t a1, int64_t a2, char a3)
{
  void *v5;
  id v6;

  FastAppendPersistentID(*(ML3QueryResultSet_MutableBackingStore **)(a1 + 32), a2, a3);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:");

}

void __66__ML3ContainerQueryResultSet_sortedBackingStoreForDisplayOrdering__block_invoke_3(uint64_t a1, int64_t a2)
{
  void *v4;
  id v5;

  FastAppendPersistentID(*(ML3QueryResultSet_MutableBackingStore **)(a1 + 32), a2, 0);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:");

}

@end
