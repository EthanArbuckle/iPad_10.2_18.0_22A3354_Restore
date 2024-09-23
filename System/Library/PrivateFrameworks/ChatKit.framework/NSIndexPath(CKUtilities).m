@implementation NSIndexPath(CKUtilities)

- (id)__ck_indexPathShiftedForInsertedIndexes:()CKUtilities deletedIndexes:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__ck_indexSetForIndexPathItemsInSection:", objc_msgSend(a1, "section", v15, v16));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "__ck_indexSetShiftedForInsertedIndexes:removedIndexes:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "__ck_indexPathItemsInSection:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
