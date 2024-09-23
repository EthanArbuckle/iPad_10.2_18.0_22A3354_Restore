@implementation NSArray(GKCollectionUtils)

- (uint64_t)_gkMapDictionaryWithKeyPath:()GKCollectionUtils
{
  return objc_msgSend(a1, "_gkMapDictionaryWithKeyPath:valueKeyPath:", a3, 0);
}

- (id)_gkMapDictionaryWithKeyPath:()GKCollectionUtils valueKeyPath:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a1;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "valueForKeyPath:", v6, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v12, "valueForKeyPath:", v7);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = v12;
        }
        v15 = v14;
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v13 == v16 || v15 == 0)
          {

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15 != v19)
              objc_msgSend(v21, "setObject:forKey:", v15, v13);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  return v21;
}

- (id)_gkMapConcurrentlyWithBlock:()GKCollectionUtils
{
  id v4;
  size_t v5;
  void **v6;
  id v7;
  void *v8;
  void **v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;
  void **v17;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  v6 = (void **)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __58__NSArray_GKCollectionUtils___gkMapConcurrentlyWithBlock___block_invoke;
  v15 = &unk_1E75B0708;
  v17 = v6;
  v7 = v4;
  v16 = v7;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 1, &v12);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, v5, v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v6;
    do
    {
      v10 = *v9;
      *v9++ = 0;

      --v5;
    }
    while (v5);
  }
  free(v6);

  return v8;
}

- (id)_gkMapWithBlock:()GKCollectionUtils
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__NSArray_GKCollectionUtils___gkMapWithBlock___block_invoke;
  v11[3] = &unk_1E75B0730;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)_gkFilterWithBlock:()GKCollectionUtils
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__NSArray_GKCollectionUtils___gkFilterWithBlock___block_invoke;
  v11[3] = &unk_1E75B0730;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)_gkSubarraysByKeyWithBlock:()GKCollectionUtils
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v6 = objc_msgSend(a1, "count");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__NSArray_GKCollectionUtils___gkSubarraysByKeyWithBlock___block_invoke;
  v12[3] = &unk_1E75B0758;
  v14 = v4;
  v7 = v5;
  v13 = v7;
  v15 = v6;
  v8 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v9 = v13;
  v10 = v7;

  return v10;
}

- (id)_gkValuesForKeyPath:()GKCollectionUtils
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "valueForKeyPath:", v4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_gkDistinctValuesForKeyPath:()GKCollectionUtils
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "valueForKeyPath:", v4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_gkFoldWithInitialValue:()GKCollectionUtils block:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v8 = v6;
  v20 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__NSArray_GKCollectionUtils___gkFoldWithInitialValue_block___block_invoke;
  v12[3] = &unk_1E75B0780;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)_gkContainsObjectPassingTest:()GKCollectionUtils
{
  id v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NSArray_GKCollectionUtils___gkContainsObjectPassingTest___block_invoke;
  v8[3] = &unk_1E75B07A8;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

@end
