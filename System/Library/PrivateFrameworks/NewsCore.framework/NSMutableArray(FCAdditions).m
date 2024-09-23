@implementation NSMutableArray(FCAdditions)

- (void)fc_safelyAddObject:()FCAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (id)fc_popFirstObject
{
  void *v2;

  objc_msgSend(a1, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return v2;
}

- (void)fc_removeObjectsPassingTest:()FCAdditions
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int (**v7)(id, void *);

  v7 = a3;
  v4 = objc_msgSend(a1, "count");
  if (v4)
  {
    v5 = v4 - 1;
    do
    {
      objc_msgSend(a1, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7[2](v7, v6))
        objc_msgSend(a1, "removeObjectAtIndex:", v5);

      --v5;
    }
    while (v5 != -1);
  }

}

- (void)fc_insertObjects:()FCAdditions atIndex:
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB36B8];
  v7 = a3;
  objc_msgSend(v6, "indexSetWithIndexesInRange:", a4, objc_msgSend(v7, "count"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "insertObjects:atIndexes:", v7, v8);

}

- (unint64_t)fc_trimFromFrontToMaxCount:()FCAdditions
{
  unint64_t result;

  result = objc_msgSend(a1, "count");
  if (result > a3)
    return objc_msgSend(a1, "removeObjectsInRange:", 0, result - a3);
  return result;
}

- (id)fc_mergeSortedOrderedCollection:()FCAdditions usingComparator:
{
  return mergeSortedOrderedCollections(a3, a1, a4);
}

- (void)fc_insertObject:()FCAdditions sortedUsingSelector:
{
  id v6;
  uint64_t v7;
  _QWORD v8[5];

  v6 = a3;
  v7 = objc_msgSend(a1, "count");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__NSMutableArray_FCAdditions__fc_insertObject_sortedUsingSelector___block_invoke_0;
  v8[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v8[4] = a4;
  objc_msgSend(a1, "insertObject:atIndex:", v6, objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v7, 1024, v8));

}

- (uint64_t)fc_removeObject:()FCAdditions sortedUsingSelector:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];

  v6 = a3;
  v7 = objc_msgSend(a1, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__NSMutableArray_FCAdditions__fc_removeObject_sortedUsingSelector___block_invoke_0;
  v10[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v10[4] = a4;
  v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v7, 256, v10);

  return objc_msgSend(a1, "removeObjectAtIndex:", v8);
}

- (uint64_t)fc_removeFirstObject
{
  uint64_t result;

  result = objc_msgSend(a1, "count");
  if (result)
    return objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return result;
}

- (id)fc_safelyPopFirstObject
{
  void *v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)fc_popLeadingObjectsOfCount:()FCAdditions
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v5 = objc_msgSend(a1, "count");
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectsAtIndexes:", v7);

  return v8;
}

- (id)fc_popLastObject
{
  void *v2;

  objc_msgSend(a1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeLastObject");
  return v2;
}

- (void)fc_insertObject:()FCAdditions inOrderRelativeToContents:
{
  id v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "object");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSMutableArray(FCAdditions) fc_insertObject:inOrderRelativeToContents:]";
    v11 = 2080;
    v12 = "NSMutableArray+FCAdditions.m";
    v13 = 1024;
    v14 = 101;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a4 == 1)
  {
    v7 = objc_msgSend(a1, "count");
  }
  else if (a4)
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(a1, "insertObject:atIndex:", v6, v7);

}

- (void)fc_insertObjects:()FCAdditions inOrderRelativeToContents:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "objects");
    *(_DWORD *)buf = 136315906;
    v11 = "-[NSMutableArray(FCAdditions) fc_insertObjects:inOrderRelativeToContents:]";
    v12 = 2080;
    v13 = "NSMutableArray+FCAdditions.m";
    v14 = 1024;
    v15 = 124;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (a4 == 1)
  {
    v7 = objc_msgSend(a1, "count");
  }
  else if (a4)
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v7, objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "insertObjects:atIndexes:", v6, v8);

}

- (unint64_t)fc_trimToMaxCount:()FCAdditions
{
  unint64_t result;

  result = objc_msgSend(a1, "count");
  if (result > a3)
    return objc_msgSend(a1, "removeObjectsInRange:", a3, result - a3);
  return result;
}

- (uint64_t)fc_safelyAddObjectsFromArray:()FCAdditions
{
  if (!a3)
    a3 = MEMORY[0x1E0C9AA60];
  return objc_msgSend(a1, "addObjectsFromArray:", a3);
}

- (void)fc_replaceObjectIdenticalTo:()FCAdditions withObject:
{
  uint64_t v6;
  id v7;

  v7 = a4;
  v6 = objc_msgSend(a1, "indexOfObjectIdenticalTo:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "replaceObjectAtIndex:withObject:", v6, v7);

}

- (void)fc_replaceObjectIdenticalTo:()FCAdditions withObjects:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a1, "indexOfObjectIdenticalTo:", a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    objc_msgSend(a1, "removeObjectAtIndex:", v7);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v8 + i, (_QWORD)v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v8 += i;
      }
      while (v11);
    }

  }
}

- (uint64_t)fc_reverseObjects
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = objc_msgSend(a1, "count");
  if (result)
  {
    result = objc_msgSend(a1, "count");
    v3 = result - 1;
    if (result != 1)
    {
      v4 = 1;
      do
        result = objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:", v4 - 1, v3--);
      while (v4++ < v3);
    }
  }
  return result;
}

- (void)fc_rotateRightWithCount:()FCAdditions
{
  id v5;

  if (a3)
  {
    objc_msgSend(a1, "fc_popLastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "insertObject:atIndex:", v5, 0);
    objc_msgSend(a1, "fc_rotateRightWithCount:", a3 - 1);

  }
}

@end
