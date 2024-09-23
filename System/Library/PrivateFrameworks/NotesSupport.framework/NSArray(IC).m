@implementation NSArray(IC)

- (BOOL)ic_containsObjectPassingTest:()IC
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "ic_objectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)ic_objectPassingTest:()IC
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)ic_map:()IC
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __22__NSArray_IC__ic_map___block_invoke;
  v13 = &unk_1EA824D68;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ic_compactMap:()IC
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __29__NSArray_IC__ic_compactMap___block_invoke;
  v13 = &unk_1EA824D68;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

+ (id)ic_arrayFromNonNilObject:()IC
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return MEMORY[0x1E0C9AA60];
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ic_objectsConformingToProtocol:()IC
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__NSArray_IC__ic_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_1EA824CF8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "ic_objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ic_objectsPassingTest:()IC
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)ic_containsObjectOfClass:()IC
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "ic_firstObjectOfClass:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)ic_randomObject
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

- (uint64_t)ic_containsObjectMatchingPredicate:()IC
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__NSArray_IC__ic_containsObjectMatchingPredicate___block_invoke;
  v8[3] = &unk_1EA824CF8;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "ic_containsObjectPassingTest:", v8);

  return v6;
}

- (id)ic_objectsOfClass:()IC
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__NSArray_IC__ic_objectsOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "ic_objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ic_firstObjectOfClass:()IC
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__NSArray_IC__ic_firstObjectOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "ic_objectPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ic_firstObjectConformingToProtocol:()IC
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__NSArray_IC__ic_firstObjectConformingToProtocol___block_invoke;
  v8[3] = &unk_1EA824CF8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "ic_objectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ICTuple)ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount:()IC
{
  void *v5;
  void *v6;
  ICTuple *v7;
  ICTuple *v8;

  if (objc_msgSend(a1, "count") <= a3)
  {
    v8 = [ICTuple alloc];
    v7 = -[ICTuple initWithFirstObject:secondObject:](v8, "initWithFirstObject:secondObject:", a1, MEMORY[0x1E0C9AA60]);
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICTuple initWithFirstObject:secondObject:]([ICTuple alloc], "initWithFirstObject:secondObject:", v5, v6);

  }
  return v7;
}

- (ICTuple)ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount:()IC prefixMatchingPredicate:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  ICTuple *v13;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") < a3)
  {
    v9 = MEMORY[0x1E0C809B0];
    while (objc_msgSend(v8, "count"))
    {
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __90__NSArray_IC__ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount_prefixMatchingPredicate___block_invoke;
      v15[3] = &unk_1EA824D40;
      v16 = v6;
      v10 = objc_msgSend(v8, "indexOfObjectPassingTest:", v15);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {

        break;
      }
      v11 = v10;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectAtIndex:", v11);
      objc_msgSend(v7, "addObject:", v12);

      if (objc_msgSend(v7, "count") >= a3)
        break;
    }
  }
  v13 = -[ICTuple initWithFirstObject:secondObject:]([ICTuple alloc], "initWithFirstObject:secondObject:", v7, v8);

  return v13;
}

- (id)ic_arrayByGroupingIntoArraysWithMaxCount:()IC
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
        v13 = objc_msgSend(v9, "count", (_QWORD)v16);
        if (!v9 || v13 >= a3)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
          v14 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v14);
          v9 = (void *)v14;
        }
        objc_msgSend(v9, "addObject:", v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (unint64_t)ic_indexOfSortedObject:()IC insertionIndex:usingComparator:
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), 1280, v9);

  if (a4)
    *a4 = v10;
  if (v10 >= objc_msgSend(a1, "count")
    || (objc_msgSend(a1, "objectAtIndexedSubscript:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v8),
        v11,
        (v12 & 1) == 0))
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)ic_indexIsValid:()IC
{
  return (a3 & 0x8000000000000000) == 0 && objc_msgSend(a1, "count") > a3;
}

- (uint64_t)ic_objectBefore:()IC
{
  return objc_msgSend(a1, "ic_objectBefore:wrap:", a3, 0);
}

- (uint64_t)ic_objectAfter:()IC
{
  return objc_msgSend(a1, "ic_objectAfter:wrap:", a3, 0);
}

- (id)ic_objectBefore:()IC wrap:
{
  uint64_t v6;
  void *v7;
  int v8;

  v6 = objc_msgSend(a1, "indexOfObject:");
  v7 = 0;
  if (v6)
    v8 = 1;
  else
    v8 = a4;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", (v6 + objc_msgSend(a1, "count") - 1) % (unint64_t)objc_msgSend(a1, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)ic_objectAfter:()IC wrap:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend(a1, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || (v7 = v6, (a4 & 1) == 0) && v6 == objc_msgSend(a1, "count") - 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", (v7 + 1) % (unint64_t)objc_msgSend(a1, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)ic_arrayByAddingNonNilObject:()IC
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "arrayByAddingObject:", a3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)ic_arrayByAddingObjectsFromNonNilArray:()IC
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a1;
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", a3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)ic_flatMap:()IC
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __26__NSArray_IC__ic_flatMap___block_invoke;
  v13 = &unk_1EA824D68;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ic_reduceStartingWithState:()IC usingBlock:
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
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v8 = v6;
  v20 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__NSArray_IC__ic_reduceStartingWithState_usingBlock___block_invoke;
  v12[3] = &unk_1EA824D90;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (uint64_t)ic_subarrayFromIndex:()IC
{
  return objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
}

- (id)ic_dictionaryByHashingContentWithFunction:()IC
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
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
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12, (_QWORD)v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (BOOL)ic_allSatisfy:()IC
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  objc_msgSend(a1, "ic_objectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = v3 == objc_msgSend(a1, "count");

  return v4;
}

@end
