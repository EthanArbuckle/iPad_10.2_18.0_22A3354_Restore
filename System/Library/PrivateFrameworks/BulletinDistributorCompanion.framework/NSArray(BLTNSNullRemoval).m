@implementation NSArray(BLTNSNullRemoval)

- (id)objectWithNoNSNulls:()BLTNSNullRemoval
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  id v17;
  id v18;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v5;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __49__NSArray_BLTNSNullRemoval__objectWithNoNSNulls___block_invoke;
  v16 = &unk_24D763D60;
  v7 = v6;
  v17 = v7;
  v8 = v5;
  v18 = v8;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v13);
  v9 = objc_msgSend(v8, "count", v13, v14, v15, v16);
  if (a3 && !v9)
    *a3 = 0;
  v10 = v18;
  v11 = v7;

  return v11;
}

- (id)objectWithNSNulls:()BLTNSNullRemoval
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = a1;
  if (objc_msgSend(v4, "count"))
  {
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v4, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(v8, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), 0, objc_msgSend(v8, "count"), 1024, &__block_literal_global_18));
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = v8;
    v13 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v25);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v4, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "integerValue");
          objc_msgSend(v18, "objectSentinelNull");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v6, "insertObject:atIndex:", v20, v19);
          }
          else
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v19);
            v21 = v4;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectWithNSNulls:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:atIndexedSubscript:", v23, v19);

            v4 = v21;
          }

        }
        v14 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v14);
    }

  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (uint64_t)objectSentinelNull
{
  return 0;
}

@end
