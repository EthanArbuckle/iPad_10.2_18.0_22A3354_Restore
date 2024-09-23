@implementation NSArray(IRExtensions)

- (id)firstWhere:()IRExtensions
{
  return sequenceFirstWhere(a1, a3);
}

- (id)allWhere:()IRExtensions
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(a1, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v4[2](v4, v8) & 1) == 0)
        objc_msgSend(v5, "removeObjectAtIndex:", v7 - v6++);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (BOOL)containsObjectPassingTest:()IRExtensions
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "firstWhere:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)arrayByAddingObject:()IRExtensions withCapacityLimit:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  if (objc_msgSend(a1, "count") >= a4)
  {
    v7 = a1;
  }
  else
  {
    objc_msgSend(a1, "arrayByAddingObject:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)compactMap:()IRExtensions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

@end
