@implementation UIDocumentPickerCloudDirectoryObserver

uint64_t __67___UIDocumentPickerCloudDirectoryObserver_initWithScopes_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateQuery");
}

void __53___UIDocumentPickerCloudDirectoryObserver_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stopQuery");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = 0;

}

void __61___UIDocumentPickerCloudDirectoryObserver_setQueryPredicate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  char v4;
  _QWORD *v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = v2;
  if (v6 == v3)
  {

    return;
  }
  if (v3)
  {
    v4 = objc_msgSend(v6, "isEqual:", v3);

    if ((v4 & 1) != 0)
      return;
  }
  else
  {

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[11])
    objc_msgSend(v5, "_updateQuery");
}

void __57___UIDocumentPickerCloudDirectoryObserver_queryPredicate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "predicate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __90___UIDocumentPickerCloudDirectoryObserver__queryResultsWithChangedObjects_changedResults___block_invoke(id *a1, void *a2)
{
  id v3;
  int v4;
  _UIDocumentPickerContainerMetadataItem *v5;

  v3 = a2;
  v5 = -[_UIDocumentPickerContainerMetadataItem initWithMetadataItem:]([_UIDocumentPickerContainerMetadataItem alloc], "initWithMetadataItem:", v3);
  objc_msgSend(a1[4], "addObject:");
  v4 = objc_msgSend(a1[5], "containsObject:", v3);

  if (v4)
    objc_msgSend(a1[6], "addObject:", v5);

}

void __58___UIDocumentPickerCloudDirectoryObserver_setStaticItems___block_invoke(uint64_t a1)
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v3 != v2 && (objc_msgSend(v3, "isEqualToOrderedSet:") & 1) == 0)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "indexOfObject:", v11, (_QWORD)v14);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v4, "addObject:", v11);
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndex:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);
            objc_msgSend(v4, "addObject:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v4);
    if (objc_msgSend(*(id *)(a1 + 32), "afterInitialUpdate"))
      objc_msgSend(*(id *)(a1 + 32), "_updateObservers:", v5);

  }
}

void __54___UIDocumentPickerCloudDirectoryObserver_staticItems__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

uint64_t __61___UIDocumentPickerCloudDirectoryObserver_isVisiblePredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("."));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "hasPrefix:", CFSTR("."), (_QWORD)v14) & 1) != 0)
          {
            v5 = 0;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
    v5 = 1;
LABEL_13:

  }
  return v5;
}

uint64_t __61___UIDocumentPickerCloudDirectoryObserver_isVisiblePredicate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  int v3;

  objc_msgSend(a2, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("."));

  return v3 ^ 1u;
}

@end
