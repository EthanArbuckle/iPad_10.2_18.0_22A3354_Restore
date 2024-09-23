@implementation NSComparisonPredicate(EDSearchableIndexQueryTransformer)

- (id)ed_transformSearchableIndexPredicateWithSuggestion:()EDSearchableIndexQueryTransformer searchableIndexManager:
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "ed_hasOnlySpotlightKeypaths") & 1) != 0)
  {
    +[EDSearchableIndexQueryTransformer transformSearchableIndexPredicate:suggestion:searchableIndexManager:](EDSearchableIndexQueryTransformer, "transformSearchableIndexPredicate:suggestion:searchableIndexManager:", a1, v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = a1;
  }
  v9 = v8;

  return v9;
}

@end
