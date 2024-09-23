@implementation NSArray(DESExtensions)

- (id)_fides_shuffledArray
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(a1, "count"))
  {
    v2 = (void *)objc_msgSend(a1, "mutableCopy");
    v3 = objc_msgSend(v2, "count");
    v4 = v3 - 1;
    if (v3 != 1)
    {
      do
      {
        objc_msgSend(v2, "exchangeObjectAtIndex:withObjectAtIndex:", v4, arc4random_uniform(v4 + 1));
        --v4;
      }
      while (v4);
    }
    v5 = (void *)objc_msgSend(v2, "copy");

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_fides_objectByReplacingValue:()DESExtensions withValue:
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = a1;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "_fides_objectByReplacingValue:withValue:", v6, v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

@end
