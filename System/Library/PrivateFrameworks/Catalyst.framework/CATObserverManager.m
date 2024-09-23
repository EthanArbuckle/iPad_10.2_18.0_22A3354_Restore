@implementation CATObserverManager

void __41___CATObserverManager_initWithOperation___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "notifyObserversOperationDidProgress:", v2);

}

uint64_t __35___CATObserverManager_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "events");
    v3 = result;
  }
  else
  {
    v3 = 15;
  }
  if (*(int *)(*(_QWORD *)(a1 + 40) + 16) >= 3)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(*(id *)(a1 + 32), "operationDidStart:", *(_QWORD *)(a1 + 48));
    if (*(int *)(*(_QWORD *)(a1 + 40) + 16) < 5)
    {
      if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0)
        return result;
      goto LABEL_12;
    }
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      result = objc_msgSend(*(id *)(a1 + 32), "operationDidFinish:", *(_QWORD *)(a1 + 48));
    v3 &= 0xFFFFFFFFFFFFFFF0;
  }
  if (!v3)
    return result;
LABEL_12:
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v5;

    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  }
  return objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
}

void __38___CATObserverManager_removeObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __41___CATObserverManager_operationDidStart___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "operationDidStart:", *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __44___CATObserverManager_operationDidProgress___block_invoke(uint64_t a1)
{
  dispatch_source_merge_data(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 32), 1uLL);
}

void __42___CATObserverManager_operationDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObserver:forKeyPath:context:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "operationDidFinish:", *(_QWORD *)(a1 + 40));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = 0;

}

@end
