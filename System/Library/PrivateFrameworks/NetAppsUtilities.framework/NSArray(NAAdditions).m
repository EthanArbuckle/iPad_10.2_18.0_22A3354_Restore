@implementation NSArray(NAAdditions)

- (id)na_flatMap:()NAAdditions
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        if (v11)
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

- (id)na_map:()NAAdditions
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        if (v11)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)na_any:()NAAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__NSArray_NAAdditions__na_any___block_invoke;
  v8[3] = &unk_1E62281C8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)na_firstObjectPassingTest:()NAAdditions
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__NSArray_NAAdditions__na_firstObjectPassingTest___block_invoke;
  v8[3] = &unk_1E62281C8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)na_filter:()NAAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__NSArray_NAAdditions__na_filter___block_invoke;
  v9[3] = &unk_1E6228218;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)na_each:()NAAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__NSArray_NAAdditions__na_each___block_invoke;
  v6[3] = &unk_1E6228240;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v6);

}

- (id)na_dictionaryByBucketingObjectsUsingKeyGenerator:()NAAdditions
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
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)objc_opt_new();
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
          {
            objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v12, &__block_literal_global_4, (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v11);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (uint64_t)na_allObjectsPassTest:()NAAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__NSArray_NAAdditions__na_allObjectsPassTest___block_invoke;
  v8[3] = &unk_1E62281C8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)na_reduceWithInitialValue:()NAAdditions reducer:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v8 = v6;
  v20 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__NSArray_NAAdditions__na_reduceWithInitialValue_reducer___block_invoke;
  v12[3] = &unk_1E62281A0;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)na_dictionaryWithKeyGenerator:()NAAdditions
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v4[2](v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12, (_QWORD)v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)na_safeContainsObject:()NAAdditions
{
  if (a3)
    return objc_msgSend(a1, "containsObject:");
  else
    return 0;
}

- (id)na_arrayWithResultsOfBlock:()NAAdditions
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
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__NSArray_NAAdditions__na_arrayWithResultsOfBlock___block_invoke;
  v11[3] = &unk_1E62281F0;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (BOOL)na_all:()NAAdditions
{
  id v4;
  _BOOL8 v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__NSArray_NAAdditions__na_all___block_invoke;
    v7[3] = &unk_1E62281C8;
    v8 = v4;
    v9 = &v10;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v7);
    v5 = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)na_arrayByFlattening
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__NSArray_NAAdditions__na_arrayByFlattening__block_invoke;
  v5[3] = &unk_1E6228268;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "na_each:", v5);

  return v3;
}

- (uint64_t)na_safeSubarrayWithRange:()NAAdditions
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v6 = a3 + a4;
  v7 = objc_msgSend(a1, "count");
  if (v6 >= v7)
    v6 = v7;
  v8 = objc_msgSend(a1, "count");
  if (a3 >= v8)
    v9 = v8;
  else
    v9 = a3;
  return objc_msgSend(a1, "subarrayWithRange:", v9, v6 - v9);
}

+ (id)na_arrayByRepeatingWithCount:()NAAdditions generatorBlock:
{
  void (**v5)(_QWORD);
  void *i;
  void *v7;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    v5[2](v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v7);

  }
  return i;
}

+ (id)na_arrayWithSafeObject:()NAAdditions
{
  if (a3)
    objc_msgSend(a1, "arrayWithObject:");
  else
    objc_msgSend(a1, "array");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)na_arrayWithTerminator:()NAAdditions nullableObjects:
{
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  unint64_t v21;
  _QWORD *v22;
  id *v23;
  id v24;
  void *v25;
  void *v26;
  id *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v28 = (id *)&a9;
  v12 = a4;
  v13 = v12;
  if (v12 == v11)
  {
    v14 = 0;
    v18 = v12;
  }
  else
  {
    v14 = 0;
    v15 = v12;
    do
    {
      ++v14;
      v16 = v28++;
      v17 = *v16;

      v15 = v17;
    }
    while (v17 != v11);
    v18 = v11;
  }

  v19 = (id **)((char *)&v28 - ((8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v19, 8 * v14);
  if (v14)
  {
    v28 = (id *)&a9;
    if (v13)
    {
      *v19 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *v19 = v20;

    }
    if (v14 >= 2)
    {
      v21 = v14 - 1;
      v22 = v19 + 1;
      do
      {
        v23 = v28++;
        v24 = *v23;
        if (v24)
        {
          *v22 = v24;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *v22 = v25;

        }
        ++v22;
        --v21;
      }
      while (v21);
    }
  }
  objc_msgSend(a1, "arrayWithObjects:count:", (char *)&v28 - ((8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14, v28, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
