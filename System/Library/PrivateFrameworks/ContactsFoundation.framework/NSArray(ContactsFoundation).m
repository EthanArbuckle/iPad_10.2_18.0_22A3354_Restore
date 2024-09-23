@implementation NSArray(ContactsFoundation)

- (id)_cn_filter:()ContactsFoundation
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
  v9[2] = __42__NSArray_ContactsFoundation___cn_filter___block_invoke;
  v9[3] = &unk_1E29B8FD8;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_cn_each:()ContactsFoundation
{
  void (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_cn_flatten
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__NSArray_ContactsFoundation___cn_flatten__block_invoke;
  v5[3] = &unk_1E29B9050;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

- (id)_cn_indexBy:()ContactsFoundation
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
        objc_msgSend(v5, "setObject:forKey:", v11, v12, (_QWORD)v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_cn_groupBy:()ContactsFoundation
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
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
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
        objc_msgSend(v5, "objectForKey:", v12, (_QWORD)v15);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v5, "setObject:forKey:", v13, v12);
        }
        objc_msgSend(v13, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_cn_each:()ContactsFoundation untilCancelled:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NSArray_ContactsFoundation___cn_each_untilCancelled___block_invoke;
  v8[3] = &unk_1E29B8F50;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_cn_each:until:", a3, v8);

}

- (void)_cn_each:()ContactsFoundation until:
{
  void (**v6)(id, _QWORD);
  uint64_t (**v7)(_QWORD);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = a1;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12);
      if ((v7[2](v7) & 1) != 0)
        break;
      v6[2](v6, v13);
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_cn_reduce:()ContactsFoundation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_cn_tail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_reduce:initialValue:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)_cn_tail
{
  return objc_msgSend(a1, "_cn_skip:", 1);
}

- (id)_cn_skip:()ContactsFoundation
{
  void *v5;

  if (objc_msgSend(a1, "count") >= a3)
  {
    objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)_cn_join:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__NSArray_ContactsFoundation___cn_join___block_invoke;
    v8[3] = &unk_1E29B8C60;
    v9 = v4;
    objc_msgSend(a1, "_cn_joinWithBlock:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = a1;
  }

  return v6;
}

- (id)_cn_joinWithBlock:()ContactsFoundation
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__NSArray_ContactsFoundation___cn_joinWithBlock___block_invoke;
    v9[3] = &unk_1E29B8FA8;
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_cn_reduce:initialValue:", v9, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a1;
  }

  return v7;
}

- (id)_cn_reduce:()ContactsFoundation initialValue:
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
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
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = a1;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v10 = v7;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v17;
    v10 = v7;
    do
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        v6[2](v6, v14, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v10;
}

- (id)_cn_distinctObjects
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_cn_any:()ContactsFoundation
{
  uint64_t (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_cn_compactMap:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a1 && objc_msgSend(a1, "count"))
  {
    if ((unint64_t)objc_msgSend(a1, "count") > 0x80)
    {
      v6 = a1;
      v7 = (void (**)(id, _QWORD))v4;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v7[2](v7, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            CNNullToNil_block_invoke_3((uint64_t)&__block_literal_global_2_1, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              objc_msgSend(v5, "addObject:", v13, (_QWORD)v16);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

    }
    else
    {
      CNArrayCompactMapFastPath(a1, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)_cn_map:()ContactsFoundation
{
  id v4;
  id v5;
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  if (a1 && objc_msgSend(a1, "count"))
  {
    if ((unint64_t)objc_msgSend(a1, "count") > 0x80)
    {
      v6 = v4;
      v7 = (objc_class *)MEMORY[0x1E0C99DE8];
      v8 = a1;
      v9 = (void *)objc_msgSend([v7 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __CNArrayMapSlowPath_block_invoke;
      v14[3] = &unk_1E29B9178;
      v16 = v6;
      v10 = v9;
      v15 = v10;
      v11 = v6;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

      v12 = v15;
      v5 = v10;

    }
    else
    {
      CNArrayMapFastPath(a1, v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)_cn_firstObjectPassingTest:()ContactsFoundation
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

- (BOOL)_cn_containsObject:()ContactsFoundation
{
  return objc_msgSend(a1, "indexOfObject:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cn_indicesForObjects:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
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
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
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
        v11 = objc_msgSend(a1, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addIndex:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_cn_take:()ContactsFoundation
{
  id v5;

  if (objc_msgSend(a1, "count") >= a3)
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (BOOL)_cn_isIdenticalToArray:()ContactsFoundation
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (v4 == a1)
  {
    v7 = 1;
  }
  else if (v4 && (v6 = objc_msgSend(v4, "count"), v6 == objc_msgSend(a1, "count")))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__NSArray_ContactsFoundation___cn_isIdenticalToArray___block_invoke;
    v9[3] = &unk_1E29B90C8;
    v10 = v5;
    v11 = &v12;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v9);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_cn_all:()ContactsFoundation
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)))
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)_cn_flatMap:()ContactsFoundation
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__NSArray_ContactsFoundation___cn_flatMap___block_invoke;
  v11[3] = &unk_1E29B9078;
  v6 = v5;
  v12 = v6;
  v13 = v4;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

+ (id)_cn_arrayWithObject:()ContactsFoundation count:
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "arrayWithCapacity:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_addObject:count:", v6, a4);

  return v7;
}

- (id)_cn_reversed
{
  id v2;
  void *v3;

  if ((unint64_t)objc_msgSend(a1, "count") > 1)
  {
    objc_msgSend(a1, "reverseObjectEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (uint64_t)_cn_indexOfFirstObjectPassingTest:()ContactsFoundation
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__NSArray_ContactsFoundation___cn_indexOfFirstObjectPassingTest___block_invoke;
  v9[3] = &unk_1E29B8FD8;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "firstIndex");

  return v7;
}

- (id)_cn_arrayByRotatingRange:()ContactsFoundation by:
{
  void *v8;

  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "_cn_rotateRange:by:", a3, a4, a5);
  return v8;
}

- (void)_cn_each_reverse:()ContactsFoundation
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__NSArray_ContactsFoundation___cn_each_reverse___block_invoke;
  v6[3] = &unk_1E29B8F78;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:", 2, v6);

}

- (id)_cn_concurrentMap:()ContactsFoundation
{
  id v4;
  id v5;
  id v6;
  size_t v7;
  void **v8;
  id v9;
  id v10;
  void *v11;
  void **v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;
  void **v20;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = a1;
    v6 = v4;
    v7 = objc_msgSend(v5, "count");
    v8 = (void **)malloc_type_calloc(v7, 8uLL, 0x80040B8603338uLL);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __CNArrayConcurrentMapSlowPath_block_invoke;
    v18 = &unk_1E29B91A0;
    v9 = v6;
    v19 = v9;
    v20 = v8;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 1, &v15);
    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    v11 = (void *)objc_msgSend(v10, "initWithObjects:count:", v8, v7, v15, v16, v17, v18);
    if (v7)
    {
      v12 = v8;
      do
      {
        v13 = *v12;
        *v12++ = 0;

        --v7;
      }
      while (v7);
    }
    free(v8);

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (CNPair)_cn_partition:()ContactsFoundation
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  CNPair *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__NSArray_ContactsFoundation___cn_partition___block_invoke;
  v12[3] = &unk_1E29B9000;
  v14 = v6;
  v15 = v4;
  v13 = v5;
  v7 = v6;
  v8 = v5;
  v9 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v10 = -[CNPair initWithFirst:second:]([CNPair alloc], "initWithFirst:second:", v8, v7);

  return v10;
}

- (id)_cn_slicesWithMaximumCount:()ContactsFoundation
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  CNRangeDividedIntoStridesOfLength(0, objc_msgSend(a1, "count"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__NSArray_ContactsFoundation___cn_slicesWithMaximumCount___block_invoke;
  v7[3] = &unk_1E29B9028;
  v7[4] = a1;
  objc_msgSend(v4, "_cn_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_cn_balancedSlicesWithMaximumCount:()ContactsFoundation
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  CNRangeDividedIntoBalancedStridesOfLength(0, objc_msgSend(a1, "count"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__NSArray_ContactsFoundation___cn_balancedSlicesWithMaximumCount___block_invoke;
  v7[3] = &unk_1E29B9028;
  v7[4] = a1;
  objc_msgSend(v4, "_cn_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)_cn_none:()ContactsFoundation
{
  uint64_t (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)) & 1) != 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)_cn_skipLast:()ContactsFoundation
{
  void *v5;

  if (objc_msgSend(a1, "count") >= a3)
  {
    objc_msgSend(a1, "_cn_take:", objc_msgSend(a1, "count") - a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)_cn_sortedArrayUsingAuxiliarySortOrder:()ContactsFoundation transform:
{
  void *v2;
  void *v3;

  +[_CNSortsByPositionInAuxiliaryArray comparatorForSortingAccordingToAuxiliaryValues:transform:](_CNSortsByPositionInAuxiliaryArray, "comparatorForSortingAccordingToAuxiliaryValues:transform:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sortedArrayUsingComparator:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_cn_takeLast:()ContactsFoundation
{
  id v5;

  if (objc_msgSend(a1, "count") >= a3)
  {
    objc_msgSend(a1, "subarrayWithRange:", objc_msgSend(a1, "count") - a3, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)_cn_zip:()ContactsFoundation
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__NSArray_ContactsFoundation___cn_zip___block_invoke;
  v9[3] = &unk_1E29B90A0;
  v7 = v6;
  v10 = v7;
  objc_msgSend(a1, "_cn_zip:withBlock:", v5, v9);

  return v7;
}

- (void)_cn_zip:()ContactsFoundation withBlock:
{
  void (**v6)(id, void *, void *);
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "count");
  v8 = objc_msgSend(v13, "count");
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v11, v12);

    }
  }

}

- (id)_cn_safeSortedArrayUsingComparator:()ContactsFoundation
{
  id v3;

  if (a3)
  {
    objc_msgSend(a1, "sortedArrayUsingComparator:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = a1;
  }
  return v3;
}

- (void)_cn_isNonEmpty
{
  if (result)
    return (void *)(objc_msgSend(result, "count") != 0);
  return result;
}

- (CNLazyArray)_cn_lazy
{
  return -[CNLazyArray initWithArray:]([CNLazyArray alloc], "initWithArray:", a1);
}

@end
