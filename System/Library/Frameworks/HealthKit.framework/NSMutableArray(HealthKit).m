@implementation NSMutableArray(HealthKit)

- (id)hk_dequeue
{
  void *v2;

  objc_msgSend(a1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return v2;
}

- (void)hk_addObjectsFromArray:()HealthKit passingTest:
{
  id v6;
  unsigned int (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v7[2](v7, v12))
          objc_msgSend(a1, "addObject:", v12);
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)hk_addUniqueObjectsFromArray:()HealthKit
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(a1, "containsObject:", v9) & 1) == 0)
          objc_msgSend(a1, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)hk_removeObjectsPassingTest:()HealthKit
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned int (**v8)(id, void *);

  v8 = a3;
  v4 = objc_msgSend(a1, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8[2](v8, v7))
      {
        objc_msgSend(a1, "removeObjectAtIndex:", v6);
        --v5;
      }
      else
      {
        ++v6;
      }

    }
    while (v6 < v5);
  }

}

- (void)hk_addNonNilObject:()HealthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (uint64_t)hk_shuffle
{
  uint64_t result;
  unint64_t v3;

  result = objc_msgSend(a1, "count");
  if (result - 1 >= 1)
  {
    do
    {
      v3 = result - 1;
      objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:", result - 1, arc4random_uniform(result));
      result = v3;
    }
    while (v3 > 1);
  }
  return result;
}

@end
