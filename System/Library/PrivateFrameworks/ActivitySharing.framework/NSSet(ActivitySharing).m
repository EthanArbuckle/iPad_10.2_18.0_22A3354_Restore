@implementation NSSet(ActivitySharing)

- (id)as_autoreleasingCompactMap:()ActivitySharing
{
  void (**v4)(id, _QWORD);
  id v5;
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

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = a1;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x2199B7074](v7);
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

  }
  else
  {
    v5 = (id)objc_msgSend(a1, "copy");
  }

  return v5;
}

@end
