@implementation NSMutableArray(EmailFoundationAdditions)

- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingSortFunction:context:allowDuplicates:
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __102__NSMutableArray_EmailFoundationAdditions__ef_insertObject_usingSortFunction_context_allowDuplicates___block_invoke;
  v15 = &__block_descriptor_48_e11_q24__0_8_16l;
  v16 = a4;
  v17 = a5;
  v8 = a3;
  v9 = _Block_copy(&v12);
  v10 = objc_msgSend(a1, "ef_insertObject:usingComparator:allowDuplicates:", v8, v9, a6, v12, v13, v14, v15, v16, v17);

  return v10;
}

- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingComparator:allowDuplicates:
{
  id v8;
  uint64_t (**v9)(id, void *, id);
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(a1, "ef_indexWhereObjectWouldBeInserted:usingComparator:", v8, v9);
  v11 = v10;
  if ((a5 & 1) != 0
    || !v10
    || v10 > objc_msgSend(a1, "count")
    || (objc_msgSend(a1, "objectAtIndex:", v11 - 1),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = v9[2](v9, v12, v8),
        v12,
        v13))
  {
    objc_msgSend(a1, "insertObject:atIndex:", v8, v11);
  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (BOOL)ef_addObjectIfAbsent:()EmailFoundationAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "indexOfObjectIdenticalTo:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "addObject:", v4);

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)ef_addOptionalObject:()EmailFoundationAdditions
{
  id v4;

  v4 = a3;
  if (v4)
    objc_msgSend(a1, "addObject:", v4);

}

- (BOOL)ef_addObjectIfAbsentAccordingToEquals:()EmailFoundationAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "addObject:", v4);

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)ef_addObject:()EmailFoundationAdditions orPlaceholder:
{
  if (!a3)
    a3 = a4;
  return objc_msgSend(a1, "addObject:", a3);
}

- (void)ef_moveObjectAtIndex:()EmailFoundationAdditions toIndex:
{
  uint64_t v7;
  id v8;

  objc_msgSend(a1, "objectAtIndex:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "insertObject:atIndex:");
  if (a4 > a3)
    v7 = a3;
  else
    v7 = a3 + 1;
  objc_msgSend(a1, "removeObjectAtIndex:", v7);

}

- (void)ef_addAbsentObjectsFromArrayAccordingToEquals:()EmailFoundationAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "ef_addObjectIfAbsentAccordingToEquals:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)ef_reverseObjects
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(a1, "count");
  v3 = objc_msgSend(a1, "count");
  if (v2 >= 2)
  {
    v4 = 0;
    v5 = v2 >> 1;
    v6 = v3 - 1;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setObject:atIndexedSubscript:", v7, v6);
      objc_msgSend(a1, "setObject:atIndexedSubscript:", v8, v4);

      ++v4;
      --v6;
    }
    while (v5 != v4);
  }
}

- (uint64_t)ef_insertObject:()EmailFoundationAdditions usingSortDescriptors:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD aBlock[4];
  id v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NSMutableArray_EmailFoundationAdditions__ef_insertObject_usingSortDescriptors___block_invoke;
  aBlock[3] = &unk_1E62A6388;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(aBlock);
  v10 = objc_msgSend(a1, "ef_insertObject:usingComparator:allowDuplicates:", v8, v9, 1);

  return v10;
}

- (unint64_t)ef_insertObjectIfAbsent:()EmailFoundationAdditions usingComparator:
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "count");
  v9 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v8, 1280, v7);
  if (v9 < v8
    && (objc_msgSend(a1, "objectAtIndexedSubscript:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqual:", v6),
        v10,
        (v11 & 1) != 0))
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(a1, "insertObject:atIndex:", v6, v9);
  }

  return v9;
}

- (uint64_t)ef_removeObject:()EmailFoundationAdditions usingComparator:
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "ef_indexOfObject:usingComparator:", v6, v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "removeObjectAtIndex:", v8);

  return v8;
}

- (uint64_t)ef_removeObject:()EmailFoundationAdditions usingSortFunction:context:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __86__NSMutableArray_EmailFoundationAdditions__ef_removeObject_usingSortFunction_context___block_invoke;
  v13 = &__block_descriptor_48_e11_q24__0_8_16l;
  v14 = a4;
  v15 = a5;
  v6 = a3;
  v7 = _Block_copy(&v10);
  v8 = objc_msgSend(a1, "ef_removeObject:usingComparator:", v6, v7, v10, v11, v12, v13, v14, v15);

  return v8;
}

- (unint64_t)ef_trimToCount:()EmailFoundationAdditions fromStart:
{
  unint64_t result;
  uint64_t v8;

  result = objc_msgSend(a1, "count");
  if (result > a3)
  {
    if (a4)
      v8 = 0;
    else
      v8 = a3;
    return objc_msgSend(a1, "removeObjectsInRange:", v8, result - a3);
  }
  return result;
}

- (id)ef_removeFirst
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

- (id)ef_popElement
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndex:", v2 - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeLastObject");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
