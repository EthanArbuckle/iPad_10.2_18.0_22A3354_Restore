@implementation CNStringRangeFinder

+ (id)rangesOfStrings:(id)a3 inString:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
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
        objc_msgSend(a1, "rangesOfString:inString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_67);
  objc_msgSend(a1, "removeOverlappingRanges:", v8);

  return v8;
}

+ (id)rangesOfString:(id)a3 inString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "rangeOfString:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    v11 = v9;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);
      v10 = objc_msgSend(v6, "rangeOfString:options:range:", v5, 0, v10 + v11, objc_msgSend(v6, "length") - (v10 + v11));
      v11 = v13;

    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v7;
}

+ (void)removeOverlappingRanges:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    objc_msgSend(v12, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "rangeValue");
    v6 = v5;

    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      v7 = 1;
      do
      {
        objc_msgSend(v12, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "rangeValue");
        v11 = v10;

        if (v9 >= v6 + v4)
        {
          ++v7;
          v4 = v9;
          v6 = v11;
        }
        else
        {
          objc_msgSend(v12, "removeObjectAtIndex:", v7);
        }
      }
      while (v7 < objc_msgSend(v12, "count"));
    }
  }

}

@end
