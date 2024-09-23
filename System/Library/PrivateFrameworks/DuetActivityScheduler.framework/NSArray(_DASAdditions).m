@implementation NSArray(_DASAdditions)

+ (id)arrayWithIntersectionOf:()_DASAdditions and:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1B5E114F8]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v14, (_QWORD)v17))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  objc_autoreleasePoolPop(v7);

  return v15;
}

+ (id)arrayWithUnionOf:()_DASAdditions and:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1B5E114F8]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        if ((objc_msgSend(v8, "containsObject:", v20, (_QWORD)v23) & 1) == 0)
          objc_msgSend(v8, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v8, "copy");
  objc_autoreleasePoolPop(v7);

  return v21;
}

+ (id)array:()_DASAdditions withItemsIn:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = v5;
      v9 = (void *)MEMORY[0x1B5E114F8]();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (objc_msgSend(v7, "containsObject:", v16, (_QWORD)v20))
              objc_msgSend(v10, "addObject:", v16);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v13);
      }

      v17 = objc_msgSend(v10, "count");
      if (v17 != objc_msgSend(v11, "count"))
      {
        v18 = objc_msgSend(v10, "copy");

        v11 = (id)v18;
      }

      objc_autoreleasePoolPop(v9);
    }
    else
    {
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)arrayWithObjectsFrom:()_DASAdditions
{
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  id *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = objc_msgSend(v10, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id *)&a10;
  v13 = a9;
  if (v13)
  {
    v14 = v13;
    while (objc_msgSend(v14, "conformsToProtocol:", &unk_1EEEDD200))
    {
      v11 += objc_msgSend(v14, "count");
      objc_msgSend(v12, "addObject:", v14);
      v15 = v39++;
      v16 = *v15;

      v14 = v16;
      if (!v16)
        goto LABEL_5;
    }
    v18 = 0;
  }
  else
  {
LABEL_5:
    v17 = 2;
    if (v11 > 2)
      v17 = v11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1 << ((unint64_t)log2((double)(unint64_t)(v17 - 1)) + 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v12;
    v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v19)
    {
      v20 = v19;
      v30 = v10;
      v21 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v14);
          v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v32 != v27)
                  objc_enumerationMutation(v24);
                objc_msgSend(v18, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            }
            while (v26);
          }

        }
        v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v20);
      v10 = v30;
    }
  }

  return v18;
}

- (uint64_t)anyItemsIntersectArray:()_DASAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(a1, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13) & 1) != 0)
          {
            v11 = 1;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)mean
{
  double v2;
  void *v3;
  char isKindOfClass;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = 0.0;
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = a1;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "doubleValue", (_QWORD)v12);
            v2 = v2 + v10;
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }

      return v2 / (double)(unint64_t)objc_msgSend(v5, "count");
    }
  }
  return v2;
}

- (double)standardDeviationWithMean:()_DASAdditions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "doubleValue", (_QWORD)v11);
        v7 = v7 + (v9 - a2) * (v9 - a2);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return sqrt(v7 / (double)(unint64_t)(objc_msgSend(v3, "count") - 1));
}

- (double)standardDeviation
{
  void *v2;
  char isKindOfClass;
  double result;

  if ((unint64_t)objc_msgSend(a1, "count") < 2)
    return 0.0;
  objc_msgSend(a1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0.0;
  objc_msgSend(a1, "mean");
  objc_msgSend(a1, "standardDeviationWithMean:");
  return result;
}

- (double)cooccurrencesWith:()_DASAdditions
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  double v14;

  v4 = a3;
  objc_msgSend(a1, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    v14 = 1.79769313e308;
    goto LABEL_12;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_11;
  v8 = objc_msgSend(v4, "count");
  if (v8 != objc_msgSend(a1, "count"))
    goto LABEL_11;
  if (objc_msgSend(a1, "count"))
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v13)
        v10 = v10 + 1.0;
      ++v9;
    }
    while (v9 < objc_msgSend(a1, "count"));
  }
  else
  {
    v10 = 0.0;
  }
  v14 = v10 / (double)(unint64_t)objc_msgSend(a1, "count");
LABEL_12:

  return v14;
}

- (double)correlationWith:()_DASAdditions
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;

  v4 = a3;
  objc_msgSend(a1, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    v14 = 1.79769313e308;
    goto LABEL_12;
  }
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_11;
  v8 = objc_msgSend(v4, "count");
  if (v8 != objc_msgSend(a1, "count"))
    goto LABEL_11;
  v9 = objc_msgSend(a1, "count");
  if (v9 < 2)
    goto LABEL_11;
  v10 = v9;
  objc_msgSend(a1, "mean");
  v12 = v11;
  objc_msgSend(a1, "standardDeviationWithMean:");
  v14 = 0.0;
  if (v13 != 0.0)
  {
    v15 = v13;
    objc_msgSend(v4, "mean");
    v17 = v16;
    objc_msgSend(v4, "standardDeviationWithMean:");
    if (v18 != 0.0)
    {
      v19 = v18;
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22 - v12;
        objc_msgSend(v4, "objectAtIndexedSubscript:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v14 = v14 + v23 * (v25 - v17);

      }
      v14 = 1.0 / (double)(v10 - 1) * (v14 / (v15 * v19));
    }
  }
LABEL_12:

  return v14;
}

@end
