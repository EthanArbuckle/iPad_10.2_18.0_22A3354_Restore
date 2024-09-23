@implementation NSMutableOrderedSet(FCAdditions)

- (id)fc_mergeSortedOrderedCollection:()FCAdditions usingComparator:
{
  return mergeSortedOrderedCollections(a3, a1, a4);
}

- (id)fc_removeAndReturnObjectsPassingTest:()FCAdditions
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
  v9[2] = __73__NSMutableOrderedSet_FCAdditions__fc_removeAndReturnObjectsPassingTest___block_invoke;
  v9[3] = &unk_1E46474C8;
  v10 = v4;
  v5 = v4;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectsAtIndexes:", v6);

  return v7;
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

- (void)fc_transformWithBlock:()FCAdditions
{
  void (**v4)(id, void *, uint64_t, unsigned __int8 *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  unsigned __int8 v12;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    v6 = 0;
    v7 = v5 - 1;
    do
    {
      objc_msgSend(a1, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v4[2](v4, v8, v6, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v8)
        objc_msgSend(a1, "replaceObjectAtIndex:withObject:", v6, v9);
      v10 = v12;

      if (v10)
        break;
    }
    while (v7 != v6++);
  }

}

@end
