@implementation NSCompoundPredicate(EDSearchableIndexExpressionGenerator)

- (uint64_t)ed_hasOnlySpotlightKeypaths
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "subpredicates");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ef_all:", &__block_literal_global_8_0);

  return v2;
}

- (id)ed_searchableIndexQueryStringForQueryWithSuggestion:()EDSearchableIndexExpressionGenerator originalSearchString:
{
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  char v12;

  objc_msgSend(a1, "subpredicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __134__NSCompoundPredicate_EDSearchableIndexExpressionGenerator__ed_searchableIndexQueryStringForQueryWithSuggestion_originalSearchString___block_invoke;
  v11[3] = &__block_descriptor_41_e31___NSString_16__0__NSPredicate_8l;
  v12 = a3;
  v11[4] = a4;
  objc_msgSend(v7, "ef_compactMap:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDSearchableIndexExpressionGenerator queryStringByJoiningQueries:withPredicateType:](EDSearchableIndexExpressionGenerator, "queryStringByJoiningQueries:withPredicateType:", v8, objc_msgSend(a1, "compoundPredicateType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
