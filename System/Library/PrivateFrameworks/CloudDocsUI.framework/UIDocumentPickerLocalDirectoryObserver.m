@implementation UIDocumentPickerLocalDirectoryObserver

id *__61___UIDocumentPickerLocalDirectoryObserver_setQueryPredicate___block_invoke(uint64_t a1)
{
  id v2;
  id *result;

  v2 = *(id *)(a1 + 40);
  result = (id *)(*(_QWORD *)(a1 + 32) + 72);
  if (*result != v2)
  {
    objc_storeStrong(result, v2);
    result = (id *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count");
    if (result)
      return (id *)objc_msgSend(*(id *)(a1 + 32), "updateResultsForSource:", 0);
  }
  return result;
}

void __57___UIDocumentPickerLocalDirectoryObserver_queryPredicate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __58___UIDocumentPickerLocalDirectoryObserver_setStaticItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v3 != v2 && (objc_msgSend(v3, "isEqualToOrderedSet:") & 1) == 0)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "indexOfObject:", v11, (_QWORD)v17);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v4, "addObject:", v11);
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndex:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);
            objc_msgSend(v4, "addObject:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v14 = objc_msgSend(v4, "copy");
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 64);
    *(_QWORD *)(v15 + 64) = v14;

    objc_msgSend(*(id *)(a1 + 32), "updateResultsForSource:", 0);
  }
}

void __54___UIDocumentPickerLocalDirectoryObserver_staticItems__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t __61___UIDocumentPickerLocalDirectoryObserver_isVisiblePredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v8;

  objc_msgSend(a2, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v3 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v8, *MEMORY[0x24BDBCC78], 0);
  v4 = v8;
  v5 = v4;
  if (v3)
  {
    if (v4)
      v6 = objc_msgSend(v4, "BOOLValue") ^ 1;
    else
      v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __66___UIDocumentPickerLocalDirectoryObserver_gatherResultsForSource___block_invoke()
{
  return 1;
}

void __56___UIDocumentPickerLocalDirectoryObserver_initialUpdate__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "gatherResultsForSource:", v7, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "gatherResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processUpdate:changedObjects:", v10, 0);

}

void __66___UIDocumentPickerLocalDirectoryObserver_updateResultsForSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "gatherResultsForSource:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

  }
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "gatherResults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processUpdate:changedObjects:", v4, 0);

}

uint64_t __73___UIDocumentPickerLocalDirectoryObserver_dispatchSourceDidReceiveEvent___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateResultsForSource:", *(_QWORD *)(a1 + 40));
}

@end
