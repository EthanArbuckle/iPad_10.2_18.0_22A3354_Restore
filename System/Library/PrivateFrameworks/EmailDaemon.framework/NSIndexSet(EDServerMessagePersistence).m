@implementation NSIndexSet(EDServerMessagePersistence)

- (uint64_t)ed_enumerateUIDsWithLimit:()EDServerMessagePersistence reverseEnumeration:usingBlock:
{
  return objc_msgSend(a1, "ed_enumerateUIDsWithLimit:reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:", a3, a4, 900, 500, a5);
}

- (void)ed_enumerateUIDsWithLimit:()EDServerMessagePersistence reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:
{
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unint64_t v15;
  __int128 v16;
  void *v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  if (a3)
    v12 = a3;
  else
    v12 = -1;
  v33 = v12;
  v34 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219264;
    v36 = (uint64_t)a1;
    v37 = 2048;
    v38 = objc_msgSend(a1, "count");
    v39 = 2048;
    v40 = v33;
    v41 = 1024;
    v42 = a4;
    v43 = 2048;
    v44 = a5;
    v45 = 2048;
    v46 = a6;
    _os_log_debug_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEBUG, "%p: fetching %llu UIDs, limit %llu, reverse %{BOOL}d, range count limit %llu, batch limit %llu.", buf, 0x3Au);
  }
  v31 = (uint64_t)a1;

  v14 = (void *)objc_msgSend(a1, "mutableCopy");
  v15 = 0;
  *(_QWORD *)&v16 = 134218496;
  v30 = v16;
  while (objc_msgSend(v14, "count", v30) && v33 > v15)
  {
    v17 = (void *)MEMORY[0x1D824B334]();
    if (v33 - v15 >= a6)
      v18 = a6;
    else
      v18 = v33 - v15;
    objc_msgSend(v14, "ed_nextRangesWithRangeCountLimit:reverseEnumeration:", a5, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v19, "ed_logDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v36 = v31;
      v37 = 2114;
      v38 = (uint64_t)v27;
      v39 = 2048;
      v40 = v18;
      _os_log_debug_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_DEBUG, "%p: fetching UIDs {%{public}@} with limit %llu", buf, 0x20u);

    }
    ((void (**)(_QWORD, void *, unint64_t))v34)[2](v34, v19, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v21, "ed_logDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v36 = v31;
      v37 = 2114;
      v38 = (uint64_t)v28;
      _os_log_debug_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEBUG, "%p: got UIDs {%{public}@}", buf, 0x16u);

    }
    v23 = objc_msgSend(v21, "count");
    v24 = v23;
    if (v23 >= v18)
    {
      if (v23 > v18)
      {
        +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v30;
          v36 = v31;
          v37 = 2048;
          v38 = v24;
          v39 = 2048;
          v40 = v18;
          _os_log_error_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_ERROR, "%p: got more UIDs in batch (%lu) than allowed (%lu)", buf, 0x20u);
        }

      }
      if ((_DWORD)a4)
      {
        v26 = objc_msgSend(v21, "firstIndex");
        objc_msgSend(v14, "removeIndexesInRange:", v26, objc_msgSend(v14, "lastIndex") - v26 + 1);
      }
      else
      {
        objc_msgSend(v14, "removeIndexesInRange:", 0, objc_msgSend(v21, "lastIndex") + 1);
      }
    }
    else if (objc_msgSend(v14, "isEqualToIndexSet:", v19))
    {
      objc_msgSend(v14, "removeAllIndexes");
    }
    else
    {
      objc_msgSend(v14, "removeIndexes:", v19);
    }

    v15 += v24;
    objc_autoreleasePoolPop(v17);
  }
  +[EDServerMessagePersistence log](EDServerMessagePersistence, "log");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[NSIndexSet(EDServerMessagePersistence) ed_enumerateUIDsWithLimit:reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:].cold.1(v31, v29);

}

- (id)ed_nextRangesWithRangeCountLimit:()EDServerMessagePersistence reverseEnumeration:
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[4];

  if (objc_msgSend(a1, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    if (a4)
      v8 = 2;
    else
      v8 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__NSIndexSet_EDServerMessagePersistence__ed_nextRangesWithRangeCountLimit_reverseEnumeration___block_invoke;
    v11[3] = &unk_1E94A1C60;
    v13 = v15;
    v14 = a3;
    v9 = v7;
    v12 = v9;
    objc_msgSend(a1, "enumerateRangesWithOptions:usingBlock:", v8, v11);

    _Block_object_dispose(v15, 8);
    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (uint64_t)ed_uidQueryExpression
{
  return objc_msgSend(a1, "ed_uidQueryExpressionWithTableName:", 0);
}

- (id)ed_uidQueryExpressionWithTableName:()EDServerMessagePersistence
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
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
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "_uidRangesAndSingleUIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 0x3DF)
  {
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_442);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "ef_suffix:", objc_msgSend(v7, "count") - 990);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "rangeValue", (_QWORD)v16);
          objc_msgSend(a1, "_addUIDsFromRange:toArray:", v12, v13, v5);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v7, "ef_prefix:", 990);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_uidQueryExpressionForRanges:andSingleUIDs:withTableName:", v6, v5, v4, (_QWORD)v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_uidRangesAndSingleUIDs:()EDServerMessagePersistence
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__NSIndexSet_EDServerMessagePersistence___uidRangesAndSingleUIDs___block_invoke;
    v9[3] = &unk_1E94A1CC8;
    v9[4] = a1;
    v10 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateRangesUsingBlock:", v9);
    objc_msgSend(v6, "ef_notEmpty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_addUIDsFromRange:()EDServerMessagePersistence toArray:
{
  void *v7;
  id v8;

  v8 = a5;
  if (a3 < a3 + a4)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

      ++a3;
      --a4;
    }
    while (a4);
  }

}

- (__CFString)_uidQueryExpressionForRanges:()EDServerMessagePersistence andSingleUIDs:withTableName:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  _QWORD v20[4];
  __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".remote_id"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("remote_id");
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99__NSIndexSet_EDServerMessagePersistence___uidQueryExpressionForRanges_andSingleUIDs_withTableName___block_invoke;
  v20[3] = &unk_1E94A1CF0;
  v12 = v11;
  v21 = v12;
  objc_msgSend(v7, "ef_map:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("(%@ IN (%@))"), v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "arrayByAddingObject:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    else
    {
      v22[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v13, "count") == 1)
      objc_msgSend(v13, "firstObject");
    else
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" OR "));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("0");
  }

  return v18;
}

- (id)ed_logDescription
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)MEMORY[0x1D824B334]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__NSIndexSet_EDServerMessagePersistence__ed_logDescription__block_invoke;
  v7[3] = &unk_1E94A1D18;
  v4 = v3;
  v8 = v4;
  objc_msgSend(a1, "enumerateRangesWithOptions:usingBlock:", 0, v7);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v5;
}

- (void)ed_enumerateUIDsWithLimit:()EDServerMessagePersistence reverseEnumeration:queryRangeCountLimit:batchLimit:usingBlock:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1D2F2C000, a2, OS_LOG_TYPE_DEBUG, "%p: done.", (uint8_t *)&v2, 0xCu);
}

@end
