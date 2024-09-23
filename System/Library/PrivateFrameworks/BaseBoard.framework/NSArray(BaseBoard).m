@implementation NSArray(BaseBoard)

- (BOOL)bs_containsObjectPassingTest:()BaseBoard
{
  void *v3;
  _BOOL8 v4;

  BSCollectionFind(a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)bs_firstObjectPassingTest:()BaseBoard
{
  return BSCollectionFind(a1, a3);
}

- (id)bs_filter:()BaseBoard
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  return BSCollectionFilter(v5, a1, a3);
}

- (id)bs_map:()BaseBoard
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  return BSCollectionMap(v5, a1, a3);
}

- (id)bs_objectsOfClass:()BaseBoard
{
  objc_class *v5;
  _QWORD v7[5];

  v5 = (objc_class *)objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__NSArray_BaseBoard__bs_objectsOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v7[4] = a3;
  BSCollectionFilter(v5, a1, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bs_compactMap:()BaseBoard
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  return BSCollectionCompactMap(v5, a1, a3);
}

- (id)bs_mapNoNulls:()BaseBoard
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  return BSCollectionCompactMap(v5, a1, a3);
}

- (id)bs_differenceWithArray:()BaseBoard
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsInArray:", a3);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)bs_each:()BaseBoard
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = a1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)bs_flatten
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
          objc_msgSend(v7, "bs_flatten");
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

- (uint64_t)bs_set
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1);
}

- (id)bs_array
{
  return (id)objc_msgSend(a1, "copy");
}

- (uint64_t)bs_orderedSet
{
  return objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a1);
}

- (void)bs_enumerateObjectsOfClass:()BaseBoard usingBlock:
{
  _QWORD v4[6];

  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__NSArray_BaseBoard__bs_enumerateObjectsOfClass_usingBlock___block_invoke;
    v4[3] = &unk_1E1EC0170;
    v4[4] = a4;
    v4[5] = a3;
    return (void *)objc_msgSend(result, "enumerateObjectsUsingBlock:", v4);
  }
  return result;
}

- (uint64_t)bs_first:()BaseBoard
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

- (id)bs_firstObjectOfClass:()BaseBoard
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__NSArray_BaseBoard__bs_firstObjectOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  BSCollectionFind(a1, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)bs_firstObjectOfClassNamed:()BaseBoard
{
  return objc_msgSend(a1, "bs_firstObjectOfClass:", NSClassFromString(aClassName));
}

- (id)bs_reverse
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "reverseObjectEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)bs_reduce:()BaseBoard block:
{
  return BSCollectionReduce(a1, a3, a4);
}

- (id)bs_dictionaryByPartitioning:()BaseBoard
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  return BSCollectionPartition(v5, a1, a3);
}

- (id)bs_flattenedDifferenceWithArray:()BaseBoard
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "bs_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "bs_flatten");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_differenceWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
