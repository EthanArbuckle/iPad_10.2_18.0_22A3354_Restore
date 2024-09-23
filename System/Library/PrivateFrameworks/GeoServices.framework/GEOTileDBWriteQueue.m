@implementation GEOTileDBWriteQueue

void __47___GEOTileDBWriteQueue__flushPendingOperations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

uint64_t __47___GEOTileDBWriteQueue_flushPendingOperations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushPendingOperations");
}

void __77___GEOTileDBWriteQueue_dataForKey_ETag_originalLoadReason_isKnownNotToExist___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1[4] + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
      v8 = a1[7];
      v9 = *(_QWORD *)(a1[6] + 8);
      obj = *(id *)(v9 + 40);
      objc_msgSend(v7, "dataForKey:ETag:originalLoadReason:isKnownNotToExist:", a1[8], &obj, a1[9], *(_QWORD *)(v8 + 8) + 24);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v9 + 40), obj);
      v11 = *(_QWORD *)(a1[5] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) || *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __85___GEOTileDBWriteQueue__prunePendingOperationsSupercededByOperationOnIsolationQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (objc_msgSend(a2, "isSupercededByOperation:", *(_QWORD *)(a1 + 32)))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "addIndex:", a3);
    }
    else
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", a3);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
}

uint64_t __37___GEOTileDBWriteQueue_addOperation___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t result;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_prunePendingOperationsSupercededByOperationOnIsolationQueue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  result = *(_QWORD *)(a1 + 32);
  if (v6 >= *(_QWORD *)(result + 8))
    return objc_msgSend((id)result, "flushPendingOperations:", 0, (_QWORD)v14);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(id *)(result + 24);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v8);
        v11 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "sizeInBytes", (_QWORD)v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  result = *(_QWORD *)(a1 + 32);
  if (v11 >= *(_QWORD *)(result + 16))
    return objc_msgSend((id)result, "flushPendingOperations:", 0, (_QWORD)v14);
  return result;
}

void __47___GEOTileDBWriteQueue__flushPendingOperations__block_invoke_278(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
        objc_msgSend(v7, "performWithDB:", WeakRetained, (_QWORD)v9);

        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= objc_msgSend(v7, "canIncreaseDataSizeInDB");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __48___GEOTileDBWriteQueue_dropAllPendingOperations__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    GEOGetTileDBLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
      v6 = 134217984;
      v7 = v3;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_INFO, "Dropping %llu pending writes on the floor", (uint8_t *)&v6, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
}

uint64_t __68___GEOTileDBWriteQueue_prunePendingOperationsSupercededByOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prunePendingOperationsSupercededByOperationOnIsolationQueue:", *(_QWORD *)(a1 + 40));
}

@end
