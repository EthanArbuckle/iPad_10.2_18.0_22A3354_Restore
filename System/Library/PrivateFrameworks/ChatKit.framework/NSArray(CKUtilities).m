@implementation NSArray(CKUtilities)

- (id)__ck_indexSetForIndexPathRowsInSection:()CKUtilities
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__NSArray_CKUtilities____ck_indexSetForIndexPathRowsInSection___block_invoke;
  v8[3] = &unk_1E274E430;
  v10 = a3;
  v6 = v5;
  v9 = v6;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

- (id)__ck_indexSetForIndexPathItemsInSection:()CKUtilities
{
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__NSArray_CKUtilities____ck_indexSetForIndexPathItemsInSection___block_invoke;
  v8[3] = &unk_1E274E430;
  v10 = a3;
  v6 = v5;
  v9 = v6;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

- (id)__ck_shuffledArray
{
  void *v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v1, "count"))
  {
    v3 = arc4random();
    v4 = v3 % objc_msgSend(v1, "count");
    objc_msgSend(v1, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);
    objc_msgSend(v1, "removeObjectAtIndex:", v4);

  }
  v6 = (void *)objc_msgSend(v2, "copy");

  return v6;
}

@end
