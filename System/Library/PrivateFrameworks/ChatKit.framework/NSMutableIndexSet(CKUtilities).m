@implementation NSMutableIndexSet(CKUtilities)

- (void)__ck_intersectIndexes:()CKUtilities
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__NSMutableIndexSet_CKUtilities____ck_intersectIndexes___block_invoke;
  v8[3] = &unk_1E274E480;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v8);
  objc_msgSend(a1, "removeIndexes:", v6);

}

@end
