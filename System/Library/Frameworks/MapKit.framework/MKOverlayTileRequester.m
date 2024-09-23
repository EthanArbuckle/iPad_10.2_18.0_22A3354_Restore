@implementation MKOverlayTileRequester

BOOL __42___MKOverlayTileRequester__doWorkOrFinish__block_invoke()
{
  _BOOL8 result;

  result = _MKLinkedOnOrAfterReleaseSet(3081);
  _MergedGlobals_4 = !result;
  return result;
}

void __42___MKOverlayTileRequester__doWorkOrFinish__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x1E0D277A8]));
  objc_msgSend(WeakRetained, "tileRequesterFinished:", *(_QWORD *)(a1 + 32));

}

void __46___MKOverlayTileRequester__operationFinished___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id WeakRetained;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0D275C0]);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithData:", v4);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0D275C0]);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "initWithDecodedRepresentation:", v4);
  }
  v8 = (id)v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + (int)*MEMORY[0x1E0D277A8]));
  objc_msgSend(WeakRetained, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", *(_QWORD *)(a1 + 40), v8, 1, 1, 0, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);

}

void __50___MKOverlayTileRequester__operationFailed_error___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + (int)*MEMORY[0x1E0D277A8]));
  objc_msgSend(WeakRetained, "tileRequester:receivedError:forKey:", a1[4], a1[5], a1[6], a1[7]);

}

uint64_t __32___MKOverlayTileRequester_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startOnWorkQueue");
}

uint64_t __36___MKOverlayTileRequester_isRunning__block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count");
  if (result)
  {
    v3 = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
    v3 = result != 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __33___MKOverlayTileRequester_cancel__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5++), "cancel", (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

void __37___MKOverlayTileRequester_cancelKey___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v4)
        objc_enumerationMutation(v2);
      v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v5);
      v17 = 0;
      v18 = 0;
      v17 = objc_msgSend(v6, "key", (_QWORD)v13);
      v18 = v7;
      if ((GEOTileKeyEquals() & 1) != 0)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v8 = v6;

    if (!v8)
      goto LABEL_12;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", v8);
    objc_msgSend(v8, "cancel");
  }
  else
  {
LABEL_9:

LABEL_12:
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count", (_QWORD)v13))
    {
      v9 = 0;
      while (1)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        v18 = 0;
        v17 = objc_msgSend(v10, "key");
        v18 = v11;
        v12 = GEOTileKeyEquals();

        if ((v12 & 1) != 0)
          break;
        if (++v9 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"))
          goto LABEL_19;
      }
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectAtIndex:", v9);
    }
LABEL_19:
    v8 = 0;
  }

}

@end
