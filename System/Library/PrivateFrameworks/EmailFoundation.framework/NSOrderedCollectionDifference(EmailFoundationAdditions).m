@implementation NSOrderedCollectionDifference(EmailFoundationAdditions)

- (id)ef_groupedInsertions
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a1, "insertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__NSOrderedCollectionDifference_EmailFoundationAdditions__ef_groupedInsertions__block_invoke;
  v8[3] = &unk_1E62A6560;
  v6 = v4;
  v9 = v6;
  -[NSOrderedCollectionDifference _groupedInsertionsWithObjectsToInsert:insertGroup:](a1, v5, v8);

  return v6;
}

- (id)ef_removalsExcludingMoves
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "removals");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ef_filter:", &__block_literal_global_18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ef_groupedInsertionsByObjectForTargetArray:()EmailFoundationAdditions inferMoves:
{
  -[NSOrderedCollectionDifference _groupedInsertionsByObjectForCollection:inferMoves:](a1, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ef_groupedInsertionsByObjectForTargetOrderedSet:()EmailFoundationAdditions inferMoves:
{
  -[NSOrderedCollectionDifference _groupedInsertionsByObjectForCollection:inferMoves:](a1, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
