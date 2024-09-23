@implementation NSOrderedSet(IC)

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

- (BOOL)ic_containsObjectPassingTest:()IC
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "ic_objectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

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
  v8[2] = __55__NSOrderedSet_IC__ic_containsObjectMatchingPredicate___block_invoke;
  v8[3] = &unk_1EA824CF8;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "ic_containsObjectPassingTest:", v8);

  return v6;
}

- (id)ic_objectsMovedFromOrderedSet:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[4];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v6, "intersectOrderedSet:", v4);
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v7, "intersectOrderedSet:", a1);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__NSOrderedSet_IC__ic_objectsMovedFromOrderedSet___block_invoke;
  v12[3] = &unk_1EA824FD0;
  v8 = v6;
  v13 = v8;
  v15 = v16;
  v9 = v5;
  v14 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
  v10 = (void *)objc_msgSend(v9, "copy");

  _Block_object_dispose(v16, 8);
  return v10;
}

@end
