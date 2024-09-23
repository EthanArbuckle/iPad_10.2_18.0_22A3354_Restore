@implementation NSArray(CoreRecentsUtilities)

- (unint64_t)cr_binaryInsertionIndexOfObject:()CoreRecentsUtilities usingComparator:match:
{
  unint64_t v8;

  v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(a1, "count"), 1024, a4);
  if (a5)
  {
    *a5 = 0;
    if (v8 < objc_msgSend(a1, "count"))
      *a5 = objc_msgSend(a3, "isEqual:", objc_msgSend(a1, "objectAtIndex:", v8));
  }
  return v8;
}

- (uint64_t)cr_firstObjectPassingTest:()CoreRecentsUtilities
{
  uint64_t v5;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(a1);
    v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, v9) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)cr_map:()CoreRecentsUtilities
{
  void *v5;
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
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a1);
        objc_msgSend(v5, "cr_addObject:orPlaceholder:", (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++)), objc_msgSend(MEMORY[0x1E0C99E38], "null"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  return v5;
}

- (void)cr_insertionSortedArrayUsingComparator:()CoreRecentsUtilities
{
  void *v5;
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
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(a1);
        objc_msgSend(v5, "cr_insertObject:usingComparator:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  return v5;
}

@end
