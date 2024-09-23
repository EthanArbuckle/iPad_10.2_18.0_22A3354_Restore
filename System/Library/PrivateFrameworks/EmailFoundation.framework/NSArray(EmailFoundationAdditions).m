@implementation NSArray(EmailFoundationAdditions)

- (uint64_t)ef_indexWhereObjectWouldBeInserted:()EmailFoundationAdditions usingComparator:
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(a1, "count"), 1536, v7);

  return v8;
}

- (id)ef_compactMap:()EmailFoundationAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1B5E15A60](v7);
        v4[2](v4, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13, (_QWORD)v15);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (id)ef_firstObjectPassingTest:()EmailFoundationAdditions
{
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)ef_map:()EmailFoundationAdditions
{
  void *v3;
  void (**v5)(id, _QWORD);
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v9 = v8;
  if (v8)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1B5E15A60](v8);
        v5[2](v5, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v17);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v3;
        }
        objc_msgSend(v6, "addObject:", v15, (_QWORD)v17);
        if (!v14)

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v9 = v8;
    }
    while (v8);
  }

  return v6;
}

- (BOOL)ef_any:()EmailFoundationAdditions
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "ef_firstObjectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)ef_prefix:()EmailFoundationAdditions
{
  unint64_t v5;
  unint64_t v6;

  v5 = objc_msgSend(a1, "count");
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  return objc_msgSend(a1, "subarrayWithRange:", 0, v6);
}

- (id)ef_filter:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1B5E15A60]();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__NSArray_EmailFoundationAdditions__ef_filter___block_invoke;
  v10[3] = &unk_1E62A62F0;
  v6 = v4;
  v11 = v6;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  objc_msgSend(a1, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ef_mapSelector:()EmailFoundationAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__NSArray_EmailFoundationAdditions__ef_mapSelector___block_invoke;
  v4[3] = &__block_descriptor_40_e8__16__0_8l;
  v4[4] = a3;
  objc_msgSend(a1, "ef_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ef_notEmpty
{
  void *v2;

  if (objc_msgSend(a1, "count"))
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

- (id)ef_reduce:()EmailFoundationAdditions
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
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
  v4 = a3;
  objc_msgSend(a1, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "ef_tail", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v4[2](v4, v10, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)ef_tail
{
  void *v2;

  if ((unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    objc_msgSend(a1, "subarrayWithRange:", 1, objc_msgSend(a1, "count") - 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (void)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions overlapBy:block:
{
  void (**v9)(id, void *, BOOL *);
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  BOOL v18;

  v9 = a5;
  v10 = a3 - a4;
  if (a3 <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFNSArrayAdditions.m"), 111, CFSTR("Overlap must be smaller than batch size"));

  }
  v11 = objc_msgSend(a1, "count");
  if (v11)
  {
    v12 = 0;
    v18 = 0;
    do
    {
      if (v11 >= a3)
        v13 = a3;
      else
        v13 = v11;
      objc_msgSend(a1, "subarrayWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v14, &v18);
      if (v18)
      {
        v15 = 1;
      }
      else
      {
        v15 = v11 < a3;
        v18 = v11 < a3;
      }
      if (v15)
        v16 = 0;
      else
        v16 = v10;

      if (v18)
        break;
      v12 += v16;
      v11 -= v16;
    }
    while (v11);
  }

}

- (uint64_t)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions block:
{
  return objc_msgSend(a1, "ef_enumerateObjectsInBatchesOfSize:overlapBy:block:", a3, 0, a4);
}

- (BOOL)ef_isEmpty
{
  return objc_msgSend(a1, "count") == 0;
}

- (id)ef_flatMap:()EmailFoundationAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1B5E15A60](v7);
        v4[2](v4, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v5, "addObjectsFromArray:", v13, (_QWORD)v15);
        }

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (id)ef_flatten
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "ef_flatten");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v8);

        }
        else
        {
          objc_msgSend(v2, "addObject:", v7, (_QWORD)v10);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return v2;
}

- (id)ef_compactMapSelector:()EmailFoundationAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__NSArray_EmailFoundationAdditions__ef_compactMapSelector___block_invoke;
  v4[3] = &__block_descriptor_40_e8__16__0_8l;
  v4[4] = a3;
  objc_msgSend(a1, "ef_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)ef_all:()EmailFoundationAdditions
{
  id v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__NSArray_EmailFoundationAdditions__ef_all___block_invoke;
  v9[3] = &unk_1E62A62C8;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "ef_firstObjectPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return v7;
}

- (id)ef_partition:()EmailFoundationAdditions
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v4[2](v4, v11))
          v12 = v5;
        else
          v12 = v6;
        objc_msgSend(v12, "addObject:", v11, (_QWORD)v15);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)ef_countObjectsPassingTest:()EmailFoundationAdditions
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v6 += v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v6;
}

- (id)ef_groupBy:()EmailFoundationAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v8 = v7;
  if (v7)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1B5E15A60](v7);
        v4[2](v4, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v13, (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v13);
          }
          objc_msgSend(v14, "addObject:", v11);

        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (id)ef_suffix:()EmailFoundationAdditions
{
  id v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", objc_msgSend(a1, "count") - a3, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)ef_arrayByAddingAbsentObjectsFromArray:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "ef_addObjectIfAbsentAccordingToEquals:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)ef_indicesOfStringsWithPrefix:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  int v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(a1, "count"), 1280, &__block_literal_global_4_1); i < objc_msgSend(a1, "count"); ++i)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", v4);

    if (!v8)
      break;
    objc_msgSend(v5, "addIndex:", i);
  }

  return v5;
}

- (void)ef_enumerateObjectsInBatchesOfSize:()EmailFoundationAdditions objectArrayBlock:
{
  void (**v6)(id, _BYTE *, uint64_t, unint64_t, char *);
  unint64_t v7;
  _BYTE *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;
  char v14;
  _BYTE v15[1024];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  if (v7)
  {
    v8 = v15;
    bzero(v15, 0x400uLL);
    if (v7 >= 0x81)
    {
      if (a3 >= 0x400)
        v10 = 1024;
      else
        v10 = a3;
      v8 = malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
      v9 = v8;
    }
    else
    {
      v9 = 0;
      v10 = 128;
    }
    v11 = 0;
    v14 = 0;
    while (!v14 && v7 != 0)
    {
      if (v10 >= v7)
        v13 = v7;
      else
        v13 = v10;
      objc_msgSend(a1, "getObjects:range:", v8, v11, v13);
      v7 -= v13;
      v6[2](v6, v8, v11, v13, &v14);
      v11 += v13;
    }
    if (v9)
      free(v9);
  }

}

- (uint64_t)ef_indexOfObject:()EmailFoundationAdditions usingComparator:
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(a1, "count"), 256, v7);

  return v8;
}

- (uint64_t)ef_indexOfObject:()EmailFoundationAdditions usingSortFunction:context:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __80__NSArray_EmailFoundationAdditions__ef_indexOfObject_usingSortFunction_context___block_invoke;
  v13 = &__block_descriptor_48_e11_q24__0_8_16l;
  v14 = a4;
  v15 = a5;
  v6 = a3;
  v7 = _Block_copy(&v10);
  v8 = objc_msgSend(a1, "ef_indexOfObject:usingComparator:", v6, v7, v10, v11, v12, v13, v14, v15);

  return v8;
}

- (id)ef_objectSameAs:()EmailFoundationAdditions usingComparator:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "ef_indexOfObject:usingComparator:", v6, v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)ef_objectsPassingTest:()EmailFoundationAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ef_lastObjectPassingTest:()EmailFoundationAdditions
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__NSArray_EmailFoundationAdditions__ef_lastObjectPassingTest___block_invoke;
  v8[3] = &unk_1E62A6318;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)ef_uniquifyWithComparator:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a1;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v9, "ef_flatten");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v17;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v17 != v12)
                  objc_enumerationMutation(v10);
                objc_msgSend(v5, "ef_insertObject:usingComparator:allowDuplicates:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), v4, 0);
              }
              while (v11 != v13);
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v11);
          }

        }
        else
        {
          objc_msgSend(v5, "ef_insertObject:usingComparator:allowDuplicates:", v9, v4, 0);
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  return v5;
}

- (id)ef_compactMapItemsInRange:()EmailFoundationAdditions usingTransform:
{
  void (**v8)(id, void *);
  void *i;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; --a4)
  {
    v10 = (void *)MEMORY[0x1B5E15A60]();
    objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "ef_addOptionalObject:", v12);

    objc_autoreleasePoolPop(v10);
    ++a3;
  }

  return i;
}

- (id)ef_groupByObject:()EmailFoundationAdditions
{
  objc_msgSend(a1, "ef_groupByObject:keyOptions:valueOptions:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ef_groupByObject:()EmailFoundationAdditions keyOptions:valueOptions:
{
  void (**v8)(id, _QWORD);
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = a1;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v12 = v11;
  if (v11)
  {
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1B5E15A60](v11);
        v8[2](v8, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v9, "objectForKey:", v17, (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v18, v17);
          }
          objc_msgSend(v18, "addObject:", v15);

        }
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v12 = v11;
    }
    while (v11);
  }

  return v9;
}

- (id)ef_subarraysOfSize:()EmailFoundationAdditions
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;

  if (a3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count") / a3 + 1);
    v6 = objc_msgSend(a1, "count");
    if (v6)
    {
      v7 = 0;
      do
      {
        if (v6 >= a3)
          v8 = a3;
        else
          v8 = v6;
        objc_msgSend(a1, "subarrayWithRange:", v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);
        v7 += v8;
        v6 -= v8;

      }
      while (v6);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)ef_permutations
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "count");
  v3 = v2 - 1;
  if (v2 > 1)
  {
    if (v2 == 2)
    {
      v29[0] = a1;
      objc_msgSend(a1, "objectAtIndexedSubscript:", 1, v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v18;
      objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
    else
    {
      v21 = v2;
      objc_msgSend(a1, "subarrayWithRange:", 1, v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ef_permutations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (i = 0; i != v21; ++i)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        obj = v20;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v13, "subarrayWithRange:", 0, i);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObjectsFromArray:", v15);

              objc_msgSend(a1, "firstObject");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v16);

              objc_msgSend(v13, "subarrayWithRange:", i, v21 + ~i);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObjectsFromArray:", v17);

              objc_msgSend(v8, "addObject:", v14);
            }
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v10);
        }

      }
      return v8;
    }
  }
  else
  {
    v30[0] = a1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)ef_reverse
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "reverseObjectEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ef_longestCommonPrefix
{
  void *v1;
  id v2;
  _QWORD v4[5];
  _QWORD v5[3];
  char v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__NSArray_EmailFoundationAdditions__ef_longestCommonPrefix__block_invoke;
  v4[3] = &unk_1E62A6360;
  v4[4] = v5;
  objc_msgSend(a1, "ef_reduce:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
    v2 = v1;
  else
    v2 = 0;

  _Block_object_dispose(v5, 8);
  return v2;
}

- (id)ef_sum
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expressionForFunction:arguments:", CFSTR("sum:"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionValueWithObject:context:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ef_min
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expressionForFunction:arguments:", CFSTR("min:"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionValueWithObject:context:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ef_max
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expressionForFunction:arguments:", CFSTR("max:"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionValueWithObject:context:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ef_mean
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expressionForFunction:arguments:", CFSTR("average:"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionValueWithObject:context:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ef_median
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expressionForFunction:arguments:", CFSTR("median:"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionValueWithObject:context:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ef_mode
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expressionForFunction:arguments:", CFSTR("mode:"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionValueWithObject:context:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ef_standardDeviation
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expressionForFunction:arguments:", CFSTR("stddev:"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expressionValueWithObject:context:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
