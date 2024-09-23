@implementation NSMutableOrderedSet(EmailFoundationAdditions)

- (void)ef_insertObjects:()EmailFoundationAdditions before:
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(a1, "indexOfObject:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "addObjectsFromArray:", v9);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v7, objc_msgSend(v9, "count"));
    objc_msgSend(a1, "insertObjects:atIndexes:", v9, v8);

  }
}

- (id)ef_uniquedObject:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "member:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
    objc_msgSend(a1, "addObject:", v6);
  }

  return v6;
}

- (void)ef_removeObjectsInArray:()EmailFoundationAdditions
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
        objc_msgSend(a1, "removeObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)ef_insertObjects:()EmailFoundationAdditions after:
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = objc_msgSend(a1, "indexOfObject:", a4);
  v7 = objc_alloc(MEMORY[0x1E0CB36B8]);
  v8 = objc_msgSend(v11, "count");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = v6 + 1;
  v10 = (void *)objc_msgSend(v7, "initWithIndexesInRange:", v9, v8);
  objc_msgSend(a1, "insertObjects:atIndexes:", v11, v10);

}

- (void)ef_insertObject:()EmailFoundationAdditions usingComparator:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(a1, "insertObject:atIndex:", v7, objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(a1, "count"), 1024, v6));

}

@end
