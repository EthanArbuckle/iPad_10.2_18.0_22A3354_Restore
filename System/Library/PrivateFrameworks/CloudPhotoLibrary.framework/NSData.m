@implementation NSData

void __67__NSData_CPLSyncAnchorDescription__cplQueryCursorSimpleDescription__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v2 = (void *)cplQueryCursorSimpleDescription_queryCursorDescriptions;
  if (!cplQueryCursorSimpleDescription_queryCursorDescriptions)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 100);
    v4 = (void *)cplQueryCursorSimpleDescription_queryCursorDescriptions;
    cplQueryCursorSimpleDescription_queryCursorDescriptions = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
    v6 = (void *)cplQueryCursorSimpleDescription_cachedQueryCursors;
    cplQueryCursorSimpleDescription_cachedQueryCursors = v5;

    v2 = (void *)cplQueryCursorSimpleDescription_queryCursorDescriptions;
  }
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    ++cplQueryCursorSimpleDescription_syncAnchorIndex;
    if (objc_msgSend((id)cplQueryCursorSimpleDescription_cachedQueryCursors, "count") == 100)
    {
      objc_msgSend((id)cplQueryCursorSimpleDescription_cachedQueryCursors, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)cplQueryCursorSimpleDescription_cachedQueryCursors, "removeObjectAtIndex:", 0);
      objc_msgSend((id)cplQueryCursorSimpleDescription_queryCursorDescriptions, "removeObjectForKey:", v10);

    }
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("QueryCursor-%lu"), cplQueryCursorSimpleDescription_syncAnchorIndex);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend((id)cplQueryCursorSimpleDescription_queryCursorDescriptions, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
    objc_msgSend((id)cplQueryCursorSimpleDescription_cachedQueryCursors, "addObject:", *(_QWORD *)(a1 + 32));
  }
}

void __66__NSData_CPLSyncAnchorDescription__cplSyncAnchorSimpleDescription__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v2 = (void *)cplSyncAnchorSimpleDescription_syncAnchorDescriptions;
  if (!cplSyncAnchorSimpleDescription_syncAnchorDescriptions)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 100);
    v4 = (void *)cplSyncAnchorSimpleDescription_syncAnchorDescriptions;
    cplSyncAnchorSimpleDescription_syncAnchorDescriptions = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
    v6 = (void *)cplSyncAnchorSimpleDescription_cachedSyncAnchors;
    cplSyncAnchorSimpleDescription_cachedSyncAnchors = v5;

    v2 = (void *)cplSyncAnchorSimpleDescription_syncAnchorDescriptions;
  }
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    ++cplSyncAnchorSimpleDescription_syncAnchorIndex;
    if (objc_msgSend((id)cplSyncAnchorSimpleDescription_cachedSyncAnchors, "count") == 100)
    {
      objc_msgSend((id)cplSyncAnchorSimpleDescription_cachedSyncAnchors, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)cplSyncAnchorSimpleDescription_cachedSyncAnchors, "removeObjectAtIndex:", 0);
      objc_msgSend((id)cplSyncAnchorSimpleDescription_syncAnchorDescriptions, "removeObjectForKey:", v10);

    }
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    v12 = objc_msgSend(v11, "initWithFormat:", CFSTR("SyncAnchor-%lu"), cplSyncAnchorSimpleDescription_syncAnchorIndex);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    objc_msgSend((id)cplSyncAnchorSimpleDescription_syncAnchorDescriptions, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
    objc_msgSend((id)cplSyncAnchorSimpleDescription_cachedSyncAnchors, "addObject:", *(_QWORD *)(a1 + 32));
  }
}

@end
