@implementation NSComparisonPredicate(EDSearchableIndexExpressionGenerator)

- (uint64_t)ed_hasOnlySpotlightKeypaths
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (ed_hasOnlySpotlightKeypaths_onceToken != -1)
    dispatch_once(&ed_hasOnlySpotlightKeypaths_onceToken, &__block_literal_global_63);
  v2 = (void *)ed_hasOnlySpotlightKeypaths_spotlightKeyPaths;
  objc_msgSend(a1, "leftExpression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

- (id)ed_searchableIndexQueryStringForQueryWithSuggestion:()EDSearchableIndexExpressionGenerator originalSearchString:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "leftExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "rightExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constantValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D1DEA0]))
  {
    objc_storeStrong(a4, v10);
    v11 = 0;
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D1DE68]))
    {
      v12 = v10;
    }
    else
    {
      +[EDSearchableIndexExpressionGenerator searchableIndexQueryStringForComparisionPredicate:hasSuggestion:](EDSearchableIndexExpressionGenerator, "searchableIndexQueryStringForComparisionPredicate:hasSuggestion:", a1, a3);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v12;
  }

  return v11;
}

@end
