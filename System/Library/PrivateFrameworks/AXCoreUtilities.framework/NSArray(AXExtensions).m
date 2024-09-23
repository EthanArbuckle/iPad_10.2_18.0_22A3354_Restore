@implementation NSArray(AXExtensions)

+ (id)axArrayWithPossiblyNilArrays:()AXExtensions
{
  uint64_t v9;
  void *v10;
  id *v11;
  id v12;
  id *v14;

  v14 = (id *)&a9;
  if (a3)
  {
    v9 = a3;
    v10 = 0;
    do
    {
      v11 = v14++;
      v12 = *v11;
      if (objc_msgSend(v12, "count"))
      {
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "addObjectsFromArray:", v12);
      }

      --v9;
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)axArrayByIgnoringNilElementsWithCount:()AXExtensions
{
  void *v10;
  uint64_t *v11;
  uint64_t *i;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = &a9; a3; --a3)
  {
    v11 = i++;
    if (*v11)
      objc_msgSend(v10, "addObject:");
  }
  return v10;
}

- (id)axUniqueArrayWithPredicate:()AXExtensions
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v4[2](v4, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && (objc_msgSend(v5, "containsObject:", v13, (_QWORD)v15) & 1) == 0)
        {
          objc_msgSend(v5, "addObject:", v13);
          objc_msgSend(v6, "addObject:", v12);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)axIsEqualToOrderedArray:()AXExtensions withPredicate:
{
  id v6;
  uint64_t (**v7)(id, void *, void *);
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t i;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "count");
  v9 = objc_msgSend(v6, "count");
  v10 = 0;
  if (v6 && v8 == v9)
  {
    if (v8)
    {
      v10 = 0;
      for (i = 0; i != v8; v10 = i >= v8)
      {
        objc_msgSend(a1, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v7[2](v7, v12, v13);

        if ((v14 & 1) == 0)
          break;
        ++i;
      }
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

- (id)axMapObjectsUsingBlock:()AXExtensions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__NSArray_AXExtensions__axMapObjectsUsingBlock___block_invoke;
    v10[3] = &unk_1E28C2A48;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

  }
  else
  {
    v8 = (id)objc_msgSend(a1, "copy");
  }

  return v8;
}

- (id)axFilterObjectsUsingBlock:()AXExtensions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__NSArray_AXExtensions__axFilterObjectsUsingBlock___block_invoke;
    v10[3] = &unk_1E28C2A48;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

  }
  else
  {
    v8 = (id)objc_msgSend(a1, "copy");
  }

  return v8;
}

- (id)axFirstObjectsUsingBlock:()AXExtensions
{
  id v4;
  void *v5;
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
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__NSArray_AXExtensions__axFirstObjectsUsingBlock___block_invoke;
    v8[3] = &unk_1E28C2A70;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    objc_msgSend(a1, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)axSafeObjectAtIndex:()AXExtensions
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

@end
