@implementation NSArray(FCAdditions)

- (BOOL)fc_containsObjectPassingTest:()FCAdditions
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "fc_firstObjectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)fc_firstObjectPassingTest:()FCAdditions
{
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)fc_arrayByTransformingWithBlock:()FCAdditions
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSArray_FCAdditions__fc_arrayByTransformingWithBlock___block_invoke;
  v8[3] = &unk_1E46474A0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "fc_arrayByTransformingWithBlockWithIndex:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fc_arrayByTransformingWithBlockWithIndex:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__NSArray_FCAdditions__fc_arrayByTransformingWithBlockWithIndex___block_invoke;
  v11[3] = &unk_1E4647450;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:()FCAdditions valueBlock:
{
  void (**v6)(id, _QWORD);
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "keyBlock != nil");
    *(_DWORD *)buf = 136315906;
    v27 = "-[NSArray(FCAdditions) fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:valueBlock:]";
    v28 = 2080;
    v29 = "NSArray+FCAdditions.m";
    v30 = 1024;
    v31 = 233;
    v32 = 2114;
    v33 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "valueBlock != nil");
    *(_DWORD *)buf = 136315906;
    v27 = "-[NSArray(FCAdditions) fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:valueBlock:]";
    v28 = 2080;
    v29 = "NSArray+FCAdditions.m";
    v30 = 1024;
    v31 = 234;
    v32 = 2114;
    v33 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v8 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = a1;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v6[2](v6, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v16 = (void *)objc_opt_new();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);
          }
          v7[2](v7, v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)fc_splitArrayWithTest:()FCAdditions result:
{
  id v6;
  void (**v7)(id, id, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__NSArray_FCAdditions__fc_splitArrayWithTest_result___block_invoke;
  v13[3] = &unk_1E4647608;
  v15 = v8;
  v16 = v6;
  v14 = v9;
  v10 = v8;
  v11 = v9;
  v12 = v6;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v13);
  v7[2](v7, v10, v11);

}

+ (id)fc_arrayByAddingObjectsFromArray:()FCAdditions toArray:
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v6);

  objc_msgSend(v8, "addObjectsFromArray:", v7);
  return v8;
}

- (id)fc_onlyObject
{
  id v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "count") != 1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("expected one element; got %@"), v4);
    *(_DWORD *)buf = 136315906;
    v7 = "-[NSArray(FCAdditions) fc_onlyObject]";
    v8 = 2080;
    v9 = "NSArray+FCAdditions.m";
    v10 = 1024;
    v11 = 260;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(a1, "firstObject");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)fc_countOfObjectsPassingTest:()FCAdditions
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v8 += v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fc_dictionaryWithKeyBlock:()FCAdditions valueBlock:
{
  void (**v6)(id, _QWORD);
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "keyBlock");
    *(_DWORD *)buf = 136315906;
    v28 = "-[NSArray(FCAdditions) fc_dictionaryWithKeyBlock:valueBlock:]";
    v29 = 2080;
    v30 = "NSArray+FCAdditions.m";
    v31 = 1024;
    v32 = 134;
    v33 = 2114;
    v34 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "valueBlock");
    *(_DWORD *)buf = 136315906;
    v28 = "-[NSArray(FCAdditions) fc_dictionaryWithKeyBlock:valueBlock:]";
    v29 = 2080;
    v30 = "NSArray+FCAdditions.m";
    v31 = 1024;
    v32 = 135;
    v33 = 2114;
    v34 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = a1;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v6[2](v6, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v14);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v15)
          v18 = v16 == 0;
        else
          v18 = 1;
        if (!v18)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)fc_enumerateSideBySideWithArray:()FCAdditions reverse:block:
{
  id v8;
  void (**v9)(id, uint64_t, void *, uint8_t *);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (v8)
    {
      if ((a4 & 1) != 0)
      {
        objc_msgSend(a1, "reverseObjectEnumerator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reverseObjectEnumerator");
      }
      else
      {
        objc_msgSend(a1, "objectEnumerator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectEnumerator");
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nextObject");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nextObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v12 | v13)
      {
        v14 = (void *)v13;
        while (1)
        {
          buf[0] = 0;
          v9[2](v9, v12, v14, buf);
          if (buf[0])
            break;
          objc_msgSend(v10, "nextObject");
          v15 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "nextObject");
          v16 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v16;
          v12 = v15;
          if (!(v15 | v16))
            goto LABEL_14;
        }

      }
LABEL_14:

      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[NSArray(FCAdditions) fc_enumerateSideBySideWithArray:reverse:block:]";
    v19 = 2080;
    v20 = "NSArray+FCAdditions.m";
    v21 = 1024;
    v22 = 59;
    v23 = 2114;
    v24 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_15:

  }
}

- (id)fc_dictionaryOfSortedObjectsWithKeyBlock:()FCAdditions
{
  id v4;
  void *v5;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "keyBlock != nil");
    *(_DWORD *)buf = 136315906;
    v9 = "-[NSArray(FCAdditions) fc_dictionaryOfSortedObjectsWithKeyBlock:]";
    v10 = 2080;
    v11 = "NSArray+FCAdditions.m";
    v12 = 1024;
    v13 = 223;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(a1, "fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:valueBlock:", v4, &__block_literal_global_130);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fc_arrayOfObjectsPassingTest:()FCAdditions
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__NSArray_FCAdditions__fc_arrayOfObjectsPassingTest___block_invoke;
  v11[3] = &unk_1E46474C8;
  v12 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(a1, "count"))
  {
    v8 = objc_msgSend(a1, "copy");
  }
  else
  {
    objc_msgSend(a1, "objectsAtIndexes:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)fc_arrayByRemovingObject:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithArray:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  return v6;
}

- (id)fc_reduceArrayWithInitial:()FCAdditions block:
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = a1;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v11 = v8;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v18;
    v11 = v8;
    do
    {
      v14 = 0;
      v15 = v11;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v9);
        v7[2](v7, v15, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v11;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v11;
}

- (id)fc_setByCollectingObjectsWithBlock:()FCAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "collectionBlock");
    *(_DWORD *)buf = 136315906;
    v20 = "-[NSArray(FCAdditions) fc_setByCollectingObjectsWithBlock:]";
    v21 = 2080;
    v22 = "NSArray+FCAdditions.m";
    v23 = 1024;
    v24 = 832;
    v25 = 2114;
    v26 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_opt_new();
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
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fc_safelyUnionSet:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)fc_array:()FCAdditions
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
    v3[2](v3, v4);
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v5;

  return v7;
}

- (id)fc_arrayByRemovingKeysInDictionary:()FCAdditions
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NSArray_FCAdditions__fc_arrayByRemovingKeysInDictionary___block_invoke;
  v8[3] = &unk_1E4643668;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "fc_arrayOfObjectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fc_subarrayUpToCountInclusive:()FCAdditions
{
  id v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)fc_subarrayWithMaxCount:()FCAdditions
{
  unint64_t v5;
  unint64_t v6;

  v5 = objc_msgSend(a1, "count");
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  return objc_msgSend(a1, "fc_subarrayUpToCountInclusive:", v6);
}

- (id)fc_arrayByFlattening
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  FCFlattenArrayToArray(a1, v2);
  return v2;
}

- (id)fc_dictionaryWithKeySelector:()FCAdditions
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          ((void (*)(void *, uint64_t))objc_msgSend(v11, "methodForSelector:", a3))(v11, a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "keySelector != NULL");
      *(_DWORD *)buf = 136315906;
      v21 = "-[NSArray(FCAdditions) fc_dictionaryWithKeySelector:]";
      v22 = 2080;
      v23 = "NSArray+FCAdditions.m";
      v24 = 1024;
      v25 = 109;
      v26 = 2114;
      v27 = v14;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v5 = 0;
  }
  return v5;
}

- (id)fc_arrayByRemovingObjectsInArray:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithArray:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInArray:", v5);

  return v6;
}

- (void)fc_visitSubarraysWithMaxCount:()FCAdditions block:
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = a4;
  v6 = objc_msgSend(a1, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = (void *)MEMORY[0x1A8580B64]();
      if (v7 - v8 >= a3)
        v10 = a3;
      else
        v10 = v7 - v8;
      if (v12)
      {
        objc_msgSend(a1, "subarrayWithRange:", v8, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v11);

      }
      v8 += v10;
      objc_autoreleasePoolPop(v9);
    }
    while (v8 < v7);
  }

}

- (id)fc_dictionaryWithKeyBlock:()FCAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v21 = "-[NSArray(FCAdditions) fc_dictionaryWithKeyBlock:]";
    v22 = 2080;
    v23 = "NSArray+FCAdditions.m";
    v24 = 1024;
    v25 = 184;
    v26 = 2114;
    v27 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v4[2](v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)fc_setByTransformingWithBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__NSArray_FCAdditions__fc_setByTransformingWithBlock___block_invoke;
  v11[3] = &unk_1E4647450;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (void)fc_enumerateIslandsOfCommonValuesForKeyBlock:()FCAdditions withBlock:
{
  void (**v6)(id, void *);
  void (**v7)(id, void *, void *, _QWORD, uint64_t, uint8_t *);
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(id, void *);
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "keyBlock");
    *(_DWORD *)buf = 136315906;
    v24 = "-[NSArray(FCAdditions) fc_enumerateIslandsOfCommonValuesForKeyBlock:withBlock:]";
    v25 = 2080;
    v26 = "NSArray+FCAdditions.m";
    v27 = 1024;
    v28 = 1272;
    v29 = 2114;
    v30 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v24 = "-[NSArray(FCAdditions) fc_enumerateIslandsOfCommonValuesForKeyBlock:withBlock:]";
    v25 = 2080;
    v26 = "NSArray+FCAdditions.m";
    v27 = 1024;
    v28 = 1273;
    v29 = 2114;
    v30 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v8 = objc_msgSend(a1, "count");
  v9 = 0;
  do
  {
    if (v9 >= v8)
      break;
    objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v9 + 1;
    if (v8 <= v9 + 1)
    {
      v15 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v9 + 1, v8 - (v9 + 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __79__NSArray_FCAdditions__fc_enumerateIslandsOfCommonValuesForKeyBlock_withBlock___block_invoke;
      v20[3] = &unk_1E4647630;
      v22 = v6;
      v21 = v11;
      v14 = objc_msgSend(a1, "indexOfObjectAtIndexes:options:passingTest:", v13, 0, v20);

      v12 = v14 == 0x7FFFFFFFFFFFFFFFLL ? v8 : v14;
      v15 = v12 - 1;

    }
    v16 = v15 - v9 + 1;
    objc_msgSend(a1, "subarrayWithRange:", v9, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    buf[0] = 0;
    v7[2](v7, v17, v11, v9, v16, buf);
    LODWORD(v16) = buf[0];

    v9 = v12;
  }
  while (!(_DWORD)v16);

}

- (void)fc_enumerateObjectsPairwiseUsingBlock:()FCAdditions
{
  enumerateOrderedCollectionPairwise(a1, a3);
}

- (void)fc_enumerateObjectsInReverse:()FCAdditions usingSkipAheadBlock:
{
  uint64_t (**v6)(id, void *, uint64_t, _BYTE *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v14;

  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  v8 = v7;
  v14 = 0;
  if ((a3 & 1) != 0)
  {
    v9 = v7 - 1;
    if (v7 >= 1)
    {
      do
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 -= v6[2](v6, v10, v9, &v14);

      }
      while ((v9 & 0x8000000000000000) == 0 && !v14);
    }
  }
  else if (v7 >= 1)
  {
    v11 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 += v6[2](v6, v12, v11, &v14);

    }
    while (v11 < v8 && v14 == 0);
  }

}

- (void)fc_enumerateObjectsFromIndex:()FCAdditions usingBlock:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB36B8];
  v7 = a4;
  objc_msgSend(v6, "indexSetWithIndexesInRange:", a3, objc_msgSend(a1, "count") - a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enumerateObjectsAtIndexes:options:usingBlock:", v8, 0, v7);

}

- (BOOL)fc_isSortedUsingComparator:()FCAdditions
{
  return isOrderedCollectionSorted(a1, a3);
}

- (id)fc_diffAgainstSortedOrderedCollection:()FCAdditions usingComparator:
{
  return diffSortedOrderedCollections(a3, a1, a4);
}

- (id)fc_objectInSortedOrderedCollectionWithFeature:()FCAdditions usingFeatureProvider:comparator:
{
  return findObjectWithFeatureInSortedOrderedCollection(a1, a3, a4, a5);
}

- (id)fc_randomlyMergeWithArray:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  _QWORD aBlock[4];
  id v18;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count") + objc_msgSend(a1, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__NSArray_FCAdditions__fc_randomlyMergeWithArray___block_invoke;
  aBlock[3] = &unk_1E46473B8;
  v18 = v6;
  v8 = v6;
  v12 = v7;
  v13 = 3221225472;
  v14 = __50__NSArray_FCAdditions__fc_randomlyMergeWithArray___block_invoke_2;
  v15 = &unk_1E46473E0;
  v16 = _Block_copy(aBlock);
  v9 = v16;
  objc_msgSend(a1, "fc_enumerateSideBySideWithArray:reverse:block:", v5, 0, &v12);

  v10 = (void *)objc_msgSend(v8, "copy", v12, v13, v14, v15);
  return v10;
}

- (id)fc_dictionaryWithKeySelector:()FCAdditions valueSelector:
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "keySelector != NULL");
      *(_DWORD *)buf = 136315906;
      v27 = "-[NSArray(FCAdditions) fc_dictionaryWithKeySelector:valueSelector:]";
      v28 = 2080;
      v29 = "NSArray+FCAdditions.m";
      v30 = 1024;
      v31 = 155;
      v32 = 2114;
      v33 = v19;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!a4)
      {
LABEL_18:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "valueSelector != NULL");
          *(_DWORD *)buf = 136315906;
          v27 = "-[NSArray(FCAdditions) fc_dictionaryWithKeySelector:valueSelector:]";
          v28 = 2080;
          v29 = "NSArray+FCAdditions.m";
          v30 = 1024;
          v31 = 156;
          v32 = 2114;
          v33 = v20;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
      }
    }
    else if (!a4)
    {
      goto LABEL_18;
    }
    v7 = 0;
    return v7;
  }
  if (!a4)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = a1;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        ((void (*)(void *, uint64_t))objc_msgSend(v13, "methodForSelector:", a3))(v13, a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void *, uint64_t))objc_msgSend(v13, "methodForSelector:", a4))(v13, a4);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (!v17)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)fc_dictionaryWithValueBlock:()FCAdditions
{
  void (**v4)(id, id);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v21 = "-[NSArray(FCAdditions) fc_dictionaryWithValueBlock:]";
    v22 = 2080;
    v23 = "NSArray+FCAdditions.m";
    v24 = 1024;
    v25 = 203;
    v26 = 2114;
    v27 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v4[2](v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)fc_firstObjectFromIndex:()FCAdditions passingTest:
{
  id v6;
  id v7;
  id v8;
  void *v10;
  _QWORD v11[4];
  id v12;
  _BYTE *v13;
  _BYTE buf[24];
  __int128 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "testBlock");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[NSArray(FCAdditions) fc_firstObjectFromIndex:passingTest:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v15) = 279;
    WORD2(v15) = 2114;
    *(_QWORD *)((char *)&v15 + 6) = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v15 = __Block_byref_object_copy__54;
  *((_QWORD *)&v15 + 1) = __Block_byref_object_dispose__54;
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__NSArray_FCAdditions__fc_firstObjectFromIndex_passingTest___block_invoke;
  v11[3] = &unk_1E4647318;
  v7 = v6;
  v12 = v7;
  v13 = buf;
  objc_msgSend(a1, "fc_enumerateObjectsFromIndex:usingBlock:", a3, v11);
  v8 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (id)fc_firstObjectWithValue:()FCAdditions forKey:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__NSArray_FCAdditions__fc_firstObjectWithValue_forKey___block_invoke;
  v12[3] = &unk_1E4647408;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "fc_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fc_firstObjectOfClass:()FCAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__NSArray_FCAdditions__fc_firstObjectOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "fc_firstObjectPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fc_lastObjectPassingTest:()FCAdditions
{
  unsigned int (**v4)(id, void *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11))
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fc_randomObject
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(a1, "count")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (uint64_t)fc_containsObjectsAtFront:()FCAdditions
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 >= objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "fc_safeSubarrayWithCountFromFront:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToArray:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)fc_containsObjectsAtBack:()FCAdditions
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 >= objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "fc_safeSubarrayWithCountFromBack:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToArray:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)fc_containsObjectsWithValue:()FCAdditions forKey:
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "fc_firstObjectWithValue:forKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)fc_allObjectsPassTest:()FCAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__NSArray_FCAdditions__fc_allObjectsPassTest___block_invoke;
  v8[3] = &unk_1E4644500;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "fc_containsObjectPassingTest:", v8) ^ 1;

  return v6;
}

- (id)fc_objectsOfMaxValueWithValueBlock:()FCAdditions comparator:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__NSArray_FCAdditions__fc_objectsOfMaxValueWithValueBlock_comparator___block_invoke;
  v13[3] = &unk_1E4647478;
  v13[4] = a1;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "fc_array:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fc_objectsOfMinValueWithValueBlock:()FCAdditions comparator:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__NSArray_FCAdditions__fc_objectsOfMinValueWithValueBlock_comparator___block_invoke;
  v13[3] = &unk_1E4647478;
  v13[4] = a1;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "fc_array:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fc_setOfObjectsPassingTest:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__NSArray_FCAdditions__fc_setOfObjectsPassingTest___block_invoke;
  v11[3] = &unk_1E4647450;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)fc_orderedSetByTransformingWithBlock:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__NSArray_FCAdditions__fc_orderedSetByTransformingWithBlock___block_invoke;
  v11[3] = &unk_1E4647450;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)fc_arrayOfObjectsFailingTest:()FCAdditions
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__NSArray_FCAdditions__fc_arrayOfObjectsFailingTest___block_invoke;
  v11[3] = &unk_1E46474C8;
  v12 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(a1, "count"))
  {
    v8 = objc_msgSend(a1, "copy");
  }
  else
  {
    objc_msgSend(a1, "objectsAtIndexes:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)fc_arrayByRemovingObjectIdenticalTo:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithArray:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectIdenticalTo:", v5);

  return v6;
}

- (id)fc_arrayByReplacingObjectIdenticalTo:()FCAdditions withObject:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v7, "arrayWithArray:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "indexOfObjectIdenticalTo:", v8);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
      objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v10, v6);
    else
      objc_msgSend(v9, "removeObjectAtIndex:", v10);
  }

  return v9;
}

- (id)fc_arrayByReplacingObjectAtIndex:()FCAdditions withObject:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v6)
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", a3, v6);

  return v8;
}

- (id)fc_arrayByRemovingFirstObject
{
  id v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "fc_arrayByRemovingObjectsInRange:", 0, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)fc_arrayByRemovingObjectsInRange:()FCAdditions
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsInRange:", a3, a4);
  return v6;
}

- (id)fc_arrayByRemovingObjectsAtIndexes:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithArray:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectsAtIndexes:", v5);

  return v6;
}

- (id)fc_arrayByRemovingObjectsPassingTest:()FCAdditions
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__NSArray_FCAdditions__fc_arrayByRemovingObjectsPassingTest___block_invoke;
  v9[3] = &unk_1E46474C8;
  v5 = v4;
  v10 = v5;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsAtIndexes:", v6);
  }
  else
  {
    v7 = a1;
  }

  return v7;
}

- (id)fc_arrayByReplacingObjectsInRange:()FCAdditions withObject:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  objc_msgSend(v8, "arrayWithArray:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "replaceObjectsInRange:withObjectsFromArray:", a3, a4, v11);
  return v10;
}

- (id)fc_arraysByExcisingRange:()FCAdditions
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3 + a4;
  v7 = objc_msgSend(a1, "count");
  if (v7 < v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "maxRange <= count");
    *(_DWORD *)buf = 136315906;
    v15 = "-[NSArray(FCAdditions) fc_arraysByExcisingRange:]";
    v16 = 2080;
    v17 = "NSArray+FCAdditions.m";
    v18 = 1024;
    v19 = 673;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(a1, "subarrayWithRange:", 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  if (v7 == v6)
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", v6, v7 - v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v6)

  return v10;
}

- (id)fc_arraysByPartitioningOnObjectsPassingTest:()FCAdditions
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "testBlock");
    *(_DWORD *)buf = 136315906;
    v23 = "-[NSArray(FCAdditions) fc_arraysByPartitioningOnObjectsPassingTest:]";
    v24 = 2080;
    v25 = "NSArray+FCAdditions.m";
    v26 = 1024;
    v27 = 683;
    v28 = 2114;
    v29 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
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
        if (v4[2](v4, v12))
        {
          v20 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

          v9 = 0;
        }
        else
        {
          if (!v9)
          {
            v9 = (void *)objc_opt_new();
            objc_msgSend(v5, "addObject:", v9);
          }
          objc_msgSend(v9, "addObject:", v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (id)fc_arraysByPartitioningWithBudget:()FCAdditions indicesOfOverBudgetObjects:appraiser:accumulator:comparator:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _BYTE *v42;
  _QWORD *v43;
  _QWORD aBlock[4];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  _BYTE buf[24];
  __int128 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "budget");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 718;
    WORD2(v50) = 2114;
    *(_QWORD *)((char *)&v50 + 6) = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!a4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "indicesOfOverBudgetObjectsOut");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 719;
    WORD2(v50) = 2114;
    *(_QWORD *)((char *)&v50 + 6) = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v12 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appraiser");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 720;
    WORD2(v50) = 2114;
    *(_QWORD *)((char *)&v50 + 6) = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accumulator");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 721;
    WORD2(v50) = 2114;
    *(_QWORD *)((char *)&v50 + 6) = v33;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "comparator");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[NSArray(FCAdditions) fc_arraysByPartitioningWithBudget:indicesOfOverBudgetObjects:appraiser:a"
                         "ccumulator:comparator:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v50) = 722;
    WORD2(v50) = 2114;
    *(_QWORD *)((char *)&v50 + 6) = v34;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v50 = __Block_byref_object_copy__54;
  *((_QWORD *)&v50 + 1) = __Block_byref_object_dispose__54;
  v51 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__54;
  v47[4] = __Block_byref_object_dispose__54;
  v48 = &unk_1E470AD78;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke;
  aBlock[3] = &unk_1E46474F0;
  v18 = v14;
  v46 = v18;
  v19 = v11;
  v45 = v19;
  v20 = _Block_copy(aBlock);
  v36[0] = v17;
  v36[1] = 3221225472;
  v36[2] = __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke_2;
  v36[3] = &unk_1E4647540;
  v21 = v12;
  v39 = v21;
  v22 = v20;
  v40 = v22;
  v23 = v15;
  v37 = v23;
  v24 = v16;
  v38 = v24;
  v42 = buf;
  v25 = v13;
  v41 = v25;
  v43 = v47;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v36);
  v26 = objc_retainAutorelease(v23);
  *a4 = v26;
  v27 = v41;
  v28 = v24;

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(buf, 8);

  return v28;
}

- (uint64_t)fc_indexOfFirstObjectWithValue:()FCAdditions forKey:
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__NSArray_FCAdditions__fc_indexOfFirstObjectWithValue_forKey___block_invoke;
  v12[3] = &unk_1E4647568;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  v10 = objc_msgSend(a1, "indexOfObjectPassingTest:", v12);

  return v10;
}

- (id)fc_indexesOfObjectsIdenticalTo:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__NSArray_FCAdditions__fc_indexesOfObjectsIdenticalTo___block_invoke;
  v14[3] = &unk_1E4647590;
  v15 = v5;
  v11 = v5;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fc_indexesOfObjectsPassingTest:()FCAdditions
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NSArray_FCAdditions__fc_indexesOfObjectsPassingTest___block_invoke;
  v8[3] = &unk_1E46474C8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fc_arrayByCollectingObjectsWithBlock:()FCAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11, (_QWORD)v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)fc_arrayByAddingNonContainedObjectsFromArray:()FCAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "count")) != 0)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(a1, "containsObject:", v10) & 1) == 0)
      {
        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count") + v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", a1);
        }
        objc_msgSend(v8, "addObject:", v10);
      }

      ++v9;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if (v8)
    v11 = v8;
  else
    v11 = a1;
  v12 = v11;

  return v12;
}

- (uint64_t)fc_subarrayUpToIndex:()FCAdditions inclusive:
{
  return objc_msgSend(a1, "subarrayWithRange:", 0, a3 - (a4 ^ 1u) + 1);
}

- (uint64_t)fc_subarrayFromIndex:()FCAdditions inclusive:
{
  return objc_msgSend(a1, "fc_subarrayFromCount:", (a4 ^ 1u) + a3);
}

- (uint64_t)fc_subarrayFromCount:()FCAdditions
{
  return objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
}

- (id)fc_subarrayInOrder:()FCAdditions relativeToIndex:inclusive:
{
  void *v5;

  if (a3 == 1)
  {
    objc_msgSend(a1, "fc_subarrayFromIndex:inclusive:", a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "fc_subarrayUpToIndex:inclusive:", a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)fc_subarrayInOrder:()FCAdditions relativeToIndex:withMaxCount:range:
{
  void *v6;

  if (a3 == 1)
  {
    objc_msgSend(a1, "fc_subarrayFromIndex:withMaxCount:range:", a4, a5, a6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "fc_subarrayToIndex:withMaxCount:range:", a4, a5, a6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)fc_subarrayFromIndex:()FCAdditions withMaxCount:range:
{
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a1, "count");
  v10 = v9 - a3;
  if (v9 <= a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "index < count");
    *(_DWORD *)buf = 136315906;
    v15 = "-[NSArray(FCAdditions) fc_subarrayFromIndex:withMaxCount:range:]";
    v16 = 2080;
    v17 = "NSArray+FCAdditions.m";
    v18 = 1024;
    v19 = 934;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (v10 >= a4)
    v11 = a4;
  else
    v11 = v10;
  if (a5)
  {
    *a5 = a3;
    a5[1] = v11;
  }
  objc_msgSend(a1, "subarrayWithRange:", a3, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fc_subarrayToIndex:()FCAdditions withMaxCount:range:
{
  unint64_t v9;
  uint64_t v10;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "count") <= a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "index < count");
    *(_DWORD *)buf = 136315906;
    v14 = "-[NSArray(FCAdditions) fc_subarrayToIndex:withMaxCount:range:]";
    v15 = 2080;
    v16 = "NSArray+FCAdditions.m";
    v17 = 1024;
    v18 = 949;
    v19 = 2114;
    v20 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a3 + 1 >= a4)
    v9 = a3 + 1 - a4;
  else
    v9 = 0;
  v10 = a3 - v9 + 1;
  if (a5)
  {
    *a5 = v9;
    a5[1] = v10;
  }
  objc_msgSend(a1, "subarrayWithRange:", v9, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fc_arrayByMergingAdjacentObjectsWithMergePolicy:()FCAdditions mergeBlock:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  __int128 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "policy");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[NSArray(FCAdditions) fc_arrayByMergingAdjacentObjectsWithMergePolicy:mergeBlock:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v23) = 965;
    WORD2(v23) = 2114;
    *(_QWORD *)((char *)&v23 + 6) = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "mergeBlock");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[NSArray(FCAdditions) fc_arrayByMergingAdjacentObjectsWithMergePolicy:mergeBlock:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "NSArray+FCAdditions.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v23) = 966;
    WORD2(v23) = 2114;
    *(_QWORD *)((char *)&v23 + 6) = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)objc_opt_new();
  v9 = objc_msgSend(a1, "count");
  if (v9)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&v23 = __Block_byref_object_copy__54;
    *((_QWORD *)&v23 + 1) = __Block_byref_object_dispose__54;
    objc_msgSend(a1, "firstObject");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, v9 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__NSArray_FCAdditions__fc_arrayByMergingAdjacentObjectsWithMergePolicy_mergeBlock___block_invoke;
    v17[3] = &unk_1E46475B8;
    v19 = v6;
    v21 = buf;
    v20 = v7;
    v11 = v8;
    v18 = v11;
    objc_msgSend(a1, "enumerateObjectsAtIndexes:options:usingBlock:", v10, 0, v17);

    v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
    objc_msgSend(v11, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = v12 == v13;

    if ((v12 & 1) == 0)
      objc_msgSend(v11, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
  }

  return v8;
}

- (id)fc_safeObjectAtIndex:()FCAdditions
{
  void *v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)fc_safeSubarrayWithCountFromFront:()FCAdditions
{
  unint64_t v5;
  unint64_t v6;

  v5 = objc_msgSend(a1, "count");
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  return objc_msgSend(a1, "subarrayWithRange:", 0, v6);
}

- (uint64_t)fc_safeSubarrayWithCountFromBack:()FCAdditions
{
  unint64_t v5;

  v5 = objc_msgSend(a1, "count");
  if (v5 < a3)
    a3 = v5;
  return objc_msgSend(a1, "subarrayWithRange:", objc_msgSend(a1, "count") - a3, a3);
}

- (void)fc_subarrayWithCount:()FCAdditions result:
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, _QWORD);

  v11 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v6 = objc_msgSend(a1, "count");
    if (v6 < a3)
      a3 = v6;
    if (a3 >= objc_msgSend(a1, "count"))
    {
      v7 = 0;
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v7 = objc_msgSend(a1, "count") - a3;
      v8 = a3;
    }
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11[2](v11, v9, MEMORY[0x1E0C9AA60]);
    }
    else
    {
      objc_msgSend(a1, "subarrayWithRange:", v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v11)[2](v11, v9, v10);

    }
  }
  else
  {
    v11[2](v11, (void *)MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }

}

- (id)fc_subarrayWithPercentFromBeginning:()FCAdditions
{
  double v3;
  double v4;
  uint64_t v5;
  void *v7;
  double v8;
  unint64_t v9;
  double v10;

  v3 = fmin(a2, 1.0);
  if (v3 >= 0.0)
    v4 = v3;
  else
    v4 = 0.0;
  v5 = objc_msgSend(a1, "count");
  if (v4 == 0.0 || v5 == 0)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v8 = round(v4 * (double)(unint64_t)objc_msgSend(a1, "count"));
    v9 = objc_msgSend(a1, "count");
    v10 = (double)v9;
    if (v8 < (double)v9)
      v10 = v8;
    objc_msgSend(a1, "subarrayWithRange:", 0, (unint64_t)v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)fc_subarrayWithPercentToEnd:()FCAdditions
{
  double v3;
  double v4;
  uint64_t v5;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;

  v3 = fmin(a2, 1.0);
  if (v3 >= 0.0)
    v4 = v3;
  else
    v4 = 0.0;
  v5 = objc_msgSend(a1, "count");
  if (v4 == 0.0 || v5 == 0)
    goto LABEL_12;
  v7 = round(v4 * (double)(unint64_t)objc_msgSend(a1, "count"));
  v8 = (double)(unint64_t)objc_msgSend(a1, "count");
  if (v7 < v8)
    v8 = v7;
  v9 = (unint64_t)v8;
  if (objc_msgSend(a1, "count") <= (unint64_t)v8)
  {
LABEL_12:
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", v9, objc_msgSend(a1, "count") - v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (double)fc_reduceArrayWithDouble:()FCAdditions block:
{
  double (**v6)(id, _QWORD, double);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a2 = v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), a2);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a2;
}

+ (id)fc_arrayByAddingObjectsFromArray:()FCAdditions toArray:inRelativeOrder:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    if (a5 != 1)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v10 = a1;
    v11 = v8;
    v12 = v9;
  }
  else
  {
    v10 = a1;
    v11 = v9;
    v12 = v8;
  }
  objc_msgSend(v10, "fc_arrayByAddingObjectsFromArray:toArray:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

+ (id)fc_arrayByAddingUniqueObjectsFromArray:()FCAdditions toArray:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v6);

  objc_msgSend(v8, "addObjectsFromArray:", v7);
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fc_generatedArrayWithCount:()FCAdditions generator:
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "generator");
    *(_DWORD *)buf = 136315906;
    v12 = "+[NSArray(FCAdditions) fc_generatedArrayWithCount:generator:]";
    v13 = 2080;
    v14 = "NSArray+FCAdditions.m";
    v15 = 1024;
    v16 = 1154;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = 0;
    do
    {
      v5[2](v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v8, v7);

      ++v7;
    }
    while (a3 != v7);
  }

  return v6;
}

- (id)fc_arrayByReversingObjects
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "reverseObjectEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)fc_uniqueCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");

  return v2;
}

- (uint64_t)fc_distanceFromArray:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithArray:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__NSArray_FCAdditions__fc_distanceFromArray___block_invoke;
  v16[3] = &unk_1E4643668;
  v17 = v7;
  v9 = v7;
  v10 = objc_msgSend(a1, "fc_countOfObjectsPassingTest:", v16);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __45__NSArray_FCAdditions__fc_distanceFromArray___block_invoke_2;
  v14[3] = &unk_1E4643668;
  v15 = v6;
  v11 = v6;
  v12 = objc_msgSend(v5, "fc_countOfObjectsPassingTest:", v14);

  return v12 + v10;
}

- (id)fc_uniqueByValueBlock:()FCAdditions
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__NSArray_FCAdditions__fc_uniqueByValueBlock___block_invoke;
  v10[3] = &unk_1E46475E0;
  v11 = v5;
  v12 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "fc_arrayOfObjectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)fc_walkArray:()FCAdditions andArray:withBlock:
{
  id v7;
  id v8;
  void (**v9)(id, void *, void *, _QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "count");
  if (v10 != objc_msgSend(v8, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't walk side-by-side arrays with different counts"));
    v18 = 136315906;
    v19 = "+[NSArray(FCAdditions) fc_walkArray:andArray:withBlock:]";
    v20 = 2080;
    v21 = "NSArray+FCAdditions.m";
    v22 = 1024;
    v23 = 1207;
    v24 = 2114;
    v25 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);

    if (!v9)
      goto LABEL_8;
  }
  else if (!v9)
  {
    goto LABEL_8;
  }
  v11 = objc_msgSend(v7, "count");
  if (v11 == objc_msgSend(v8, "count"))
  {
    v12 = objc_msgSend(v7, "count");
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v15, v16, i);

      }
    }
  }
LABEL_8:

}

- (uint64_t)fc_expandIndex:()FCAdditions toIncludeAdjacentObjectsPassingTest:
{
  uint64_t (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;

  v6 = a4;
  if (v6)
  {
    v7 = 0;
    do
    {
      v8 = v7;
      if (!(a3 + v7))
        break;
      --v7;
      objc_msgSend(a1, "objectAtIndexedSubscript:", v8 - 1 + a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6[2](v6, v9);

    }
    while ((v10 & 1) != 0);
    v11 = objc_msgSend(a1, "count");
    v12 = a3 + 1;
    v13 = 1 - v8;
    a3 += v8;
    do
    {
      v14 = v13;
      if (v12 >= v11)
        break;
      objc_msgSend(a1, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v6[2](v6, v15);

      v13 = v14 + 1;
      ++v12;
    }
    while ((v16 & 1) != 0);
  }

  return a3;
}

- (id)fc_sortedArrayStartingWithElementsSatisfying:()FCAdditions sortedBy:
{
  const void *v5;
  id v6;
  void *v7;
  const void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  if (a3)
    v5 = a3;
  else
    v5 = &__block_literal_global_49_2;
  v6 = a4;
  v7 = _Block_copy(v5);
  if (v6)
    v8 = v6;
  else
    v8 = &__block_literal_global_51_2;
  v9 = _Block_copy(v8);

  v10 = (void *)MEMORY[0x1E0C99D20];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_3;
  v15[3] = &unk_1E4647478;
  v15[4] = a1;
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v10, "fc_array:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)fc_rotateElementsFromTheIndexOfSelectedItem:()FCAdditions
{
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "count") <= a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("indexOfSelectedItem must be within range of array length"));
    v12 = 136315906;
    v13 = "-[NSArray(FCAdditions) fc_rotateElementsFromTheIndexOfSelectedItem:]";
    v14 = 2080;
    v15 = "NSArray+FCAdditions.m";
    v16 = 1024;
    v17 = 1343;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "count") > a3)
    {
      v6 = a3;
      do
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

        ++v6;
      }
      while (v6 < objc_msgSend(a1, "count"));
    }
    if (a3)
    {
      v8 = 0;
      do
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

        ++v8;
      }
      while (a3 != v8);
    }
  }
  return v5;
}

- (BOOL)fc_isEqualToArray:()FCAdditions inRange:
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;

  v8 = a3;
  v18 = a1;
  v9 = objc_msgSend(a1, "count");
  v10 = objc_msgSend(v8, "count");
  v11 = a4 + a5;
  if (a4 >= a4 + a5)
  {
    v13 = 1;
  }
  else
  {
    v12 = v10;
    v13 = 0;
    do
    {
      if (a4 >= v9)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (a4 >= v12)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v14, v15);

      if ((v16 & 1) == 0)
        break;
      v13 = ++a4 >= v11;
      --a5;
    }
    while (a5);
  }

  return v13;
}

- (uint64_t)fc_isEqualToArray:()FCAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 == objc_msgSend(v4, "count"))
    v6 = objc_msgSend(a1, "fc_isEqualToArray:inRange:", v4, 0, v5);
  else
    v6 = 0;

  return v6;
}

- (double)fc_euclideanDistanceToArray:()FCAdditions
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 != objc_msgSend(v4, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Lengths of vectors should be the same when computing euclidean distance."));
    v15 = 136315906;
    v16 = "-[NSArray(FCAdditions) fc_euclideanDistanceToArray:]";
    v17 = 2080;
    v18 = "NSArray+FCAdditions.m";
    v19 = 1024;
    v20 = 1396;
    v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);

  }
  if (objc_msgSend(a1, "count"))
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v7 = v7 + (v10 - v12) * (v10 - v12);

      ++v6;
    }
    while (objc_msgSend(a1, "count") > v6);
  }
  else
  {
    v7 = 0.0;
  }

  return sqrt(v7);
}

- (double)fc_cosineDistanceToArray:()FCAdditions
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 != objc_msgSend(v4, "count") && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Lengths of vectors should be the same when computing cosine distance."));
    v20 = 136315906;
    v21 = "-[NSArray(FCAdditions) fc_cosineDistanceToArray:]";
    v22 = 2080;
    v23 = "NSArray+FCAdditions.m";
    v24 = 1024;
    v25 = 1407;
    v26 = 2114;
    v27 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v20, 0x26u);

  }
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  if (objc_msgSend(a1, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      v8 = v8 + v12 * v15;
      v6 = v6 + v12 * v12;
      ++v9;
      v7 = v7 + v15 * v15;
    }
    while (objc_msgSend(a1, "count") > v9);
  }
  v16 = sqrt(v6) * sqrt(v7);
  if (v16 <= 0.0)
    v17 = 0.0;
  else
    v17 = v8 / v16;

  return v17;
}

@end
