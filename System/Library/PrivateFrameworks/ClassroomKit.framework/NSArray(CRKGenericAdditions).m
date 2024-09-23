@implementation NSArray(CRKGenericAdditions)

- (id)crk_firstMatching:()CRKGenericAdditions
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

  v16 = *MEMORY[0x24BDAC8D0];
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

- (id)crk_filterUsingBlock:()CRKGenericAdditions
{
  unsigned int (**v4)(id, _QWORD);
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

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)crk_mapUsingBlock:()CRKGenericAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)crk_flatMapUsingBlock:()CRKGenericAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a1;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          if ((objc_msgSend(v10, "conformsToProtocol:", &unk_255026228) & 1) == 0)
            objc_msgSend(v5, "addObject:", v11);
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v21;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v21 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16++));
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v14);
          }

        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

- (id)crk_mapToSetUsingBlock:()CRKGenericAdditions
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", (unint64_t)((double)(unint64_t)objc_msgSend(a1, "count") * 1.5));
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
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v12 = (void *)objc_opt_new();
  }

  return v12;
}

- (uint64_t)crk_containsObjectMatchingPredicate:()CRKGenericAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "crk_containsObjectMatchingPredicate:", v4);

  return v6;
}

- (uint64_t)crk_allObjectsMatchPredicate:()CRKGenericAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "crk_allObjectsMatchPredicate:", v4);

  return v6;
}

- (id)crk_arrayByRemovingFirstObject
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "removeObjectAtIndex:", 0);
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)crk_arrayByRemovingObject:()CRKGenericAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v5, "removeObject:", v4);
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = (void *)objc_msgSend(a1, "copy");
  }

  return v6;
}

- (id)crk_arrayByRemovingObjectsInArray:()CRKGenericAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectsInArray:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (BOOL)crk_isSortedByComparator:()CRKGenericAdditions
{
  uint64_t (**v4)(id, void *, void *);
  _BOOL8 v5;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if ((unint64_t)objc_msgSend(a1, "count") >= 2 && (unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    v7 = 1;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7 - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4[2](v4, v8, v9);

      v5 = v10 != 1;
      if (v10 == 1)
        break;
      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)crk_sortedArrayForRange:()CRKGenericAdditions usingComparator:
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v9 = a5;
  if (a3 + a4 > (unint64_t)objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+CRKAdditions.m"), 133, CFSTR("Cannot sort subarray that extends beyond the size of the original array"));

  }
  objc_msgSend(a1, "crk_sortedSubarrayWithRange:comparator:", a3, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v11, "replaceObjectsInRange:withObjectsFromArray:", a3, a4, v10);
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

- (id)crk_dictionaryUsingKeyGenerator:()CRKGenericAdditions valueGenerator:
{
  void (**v6)(id, _QWORD);
  void (**v7)(id, void *);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
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
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        if (v6)
        {
          v6[2](v6, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13));
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = v14;
        }
        v16 = v15;
        if (v7)
        {
          v7[2](v7, v14);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = v14;
        }
        v18 = v17;
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v16, (_QWORD)v21);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v19 = (void *)objc_msgSend(v8, "copy");
  return v19;
}

- (id)crk_sortedSubarrayWithRange:()CRKGenericAdditions comparator:
{
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;

  v9 = a3 + a4;
  v10 = a5;
  if (v9 > objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+CRKAdditions.m"), 159, CFSTR("Cannot sort subarray that extends beyond the size of the original array"));

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, a1, a3, a4);
  objc_msgSend(v11, "sortUsingComparator:", v10);

  v12 = (void *)objc_msgSend(v11, "copy");
  return v12;
}

- (id)crk_partitionUsingKeyGenerator:()CRKGenericAdditions valueGenerator:
{
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (a3)
    v5 = a3;
  else
    v5 = &__block_literal_global_22;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A226E8](v5);
  if (v6)
    v8 = v6;
  else
    v8 = &__block_literal_global_8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A226E8](v8);

  v10 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = a1;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        v7[2](v7, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          v19 = (void *)objc_opt_new();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v17);
        }
        objc_msgSend(v19, "addObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v13);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v10, "allKeys", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v10, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v22);
  }

  v28 = (void *)objc_msgSend(v10, "copy");
  return v28;
}

- (uint64_t)crk_startsWith:()CRKGenericAdditions
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 <= objc_msgSend(a1, "count"))
  {
    if (objc_msgSend(v4, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "isEqual:", v9);

        if ((v6 & 1) == 0)
          break;
        ++v7;
      }
      while (v7 < objc_msgSend(v4, "count"));
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)crk_optionalObjectAtIndex:()CRKGenericAdditions
{
  void *v5;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
