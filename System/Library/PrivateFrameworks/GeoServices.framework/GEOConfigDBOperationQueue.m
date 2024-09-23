@implementation GEOConfigDBOperationQueue

uint64_t __47___GEOConfigDBOperationQueue_enqueueOperation___block_invoke(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 24), "addObject:", a1[5]);
  result = objc_msgSend(*(id *)(a1[4] + 24), "count");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __35___GEOConfigDBOperationQueue_flush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flushOnDBQueue");
}

void __35___GEOConfigDBOperationQueue_init___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "flush");

}

void __44___GEOConfigDBOperationQueue_flushOnDBQueue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v2;

  }
}

uint64_t __44___GEOConfigDBOperationQueue_flushOnDBQueue__block_invoke_271(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "performOperation", (_QWORD)v8))
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

@end
