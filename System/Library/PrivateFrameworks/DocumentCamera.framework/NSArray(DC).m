@implementation NSArray(DC)

- (id)dc_objectPassingTest:()DC
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)dc_containsObjectPassingTest:()DC
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "dc_objectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)dc_objectsPassingTest:()DC
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dc_objectsOfClass:()DC
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__NSArray_DC__dc_objectsOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "dc_objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dc_arrayByGroupingIntoArraysWithMaxCount:()DC
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v9, "count", (_QWORD)v16);
        if (!v9 || v13 >= a3)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v14);
          v9 = (void *)v14;
        }
        objc_msgSend(v9, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (unint64_t)dc_indexOfSortedObject:()DC insertionIndex:usingComparator:
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), 1280, v9);

  if (a4)
    *a4 = v10;
  if (v10 >= objc_msgSend(a1, "count")
    || (objc_msgSend(a1, "objectAtIndexedSubscript:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v8),
        v11,
        (v12 & 1) == 0))
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)dc_indexIsValid:()DC
{
  return a3 >= 1 && objc_msgSend(a1, "count") > (unint64_t)a3;
}

- (uint64_t)dc_objectBefore:()DC
{
  return objc_msgSend(a1, "dc_objectBefore:wrap:", a3, 0);
}

- (uint64_t)dc_objectAfter:()DC
{
  return objc_msgSend(a1, "dc_objectAfter:wrap:", a3, 0);
}

- (id)dc_objectBefore:()DC wrap:
{
  uint64_t v6;
  void *v7;
  int v8;

  v6 = objc_msgSend(a1, "indexOfObject:");
  v7 = 0;
  if (v6)
    v8 = 1;
  else
    v8 = a4;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", (v6 + objc_msgSend(a1, "count") - 1) % (unint64_t)objc_msgSend(a1, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)dc_objectAfter:()DC wrap:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend(a1, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (v7 = v6, (a4 & 1) == 0) && v6 == objc_msgSend(a1, "count") - 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", (v7 + 1) % (unint64_t)objc_msgSend(a1, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)dc_compactMap:()DC
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __29__NSArray_DC__dc_compactMap___block_invoke;
  v13 = &unk_24C5B9030;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)dc_map:()DC
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __22__NSArray_DC__dc_map___block_invoke;
  v13 = &unk_24C5B9030;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)dc_flatMap:()DC
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __26__NSArray_DC__dc_flatMap___block_invoke;
  v13 = &unk_24C5B9030;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end
