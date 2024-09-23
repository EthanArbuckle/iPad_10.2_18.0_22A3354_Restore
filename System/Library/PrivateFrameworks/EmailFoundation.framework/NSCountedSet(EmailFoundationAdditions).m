@implementation NSCountedSet(EmailFoundationAdditions)

- (id)ef_mostCommonObjects
{
  id v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v3, "countForObject:", v8, (_QWORD)v12);
        v10 = v9;
        if (v9 <= v5)
        {
          if (v9 == v5)
            objc_msgSend(v2, "addObject:", v8);
        }
        else
        {
          objc_msgSend(v2, "removeAllObjects");
          objc_msgSend(v2, "addObject:", v8);
          v5 = v10;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return v2;
}

- (id)ef_leastCommonObjects
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    v6 = -1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v3, "countForObject:", v8, (_QWORD)v12);
        v10 = v9;
        if (v9 >= v6)
        {
          if (v9 == v6)
            objc_msgSend(v2, "addObject:", v8);
        }
        else
        {
          objc_msgSend(v2, "removeAllObjects");
          objc_msgSend(v2, "addObject:", v8);
          v6 = v10;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return v2;
}

@end
