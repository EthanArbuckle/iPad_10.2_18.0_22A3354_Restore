@implementation NSSet(BaseBoard)

- (id)bs_firstObjectPassingTest:()BaseBoard
{
  return BSCollectionFind(a1, a3);
}

- (BOOL)bs_containsObjectPassingTest:()BaseBoard
{
  void *v3;
  _BOOL8 v4;

  BSCollectionFind(a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
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
  return BSCollectionCompactMap(v5, a1, a3);
}

- (id)bs_compactMap:()BaseBoard
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  return BSCollectionCompactMap(v5, a1, a3);
}

- (id)bs_set
{
  return (id)objc_msgSend(a1, "copy");
}

- (uint64_t)bs_orderedSet
{
  return objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithSet:", a1);
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

@end
