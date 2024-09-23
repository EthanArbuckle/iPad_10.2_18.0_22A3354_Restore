@implementation NSCompoundPredicate

uint64_t __88__NSCompoundPredicate_EDSearchableIndexExpressionGenerator__ed_hasOnlySpotlightKeypaths__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ed_hasOnlySpotlightKeypaths");
}

id __134__NSCompoundPredicate_EDSearchableIndexExpressionGenerator__ed_searchableIndexQueryStringForQueryWithSuggestion_originalSearchString___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ed_searchableIndexQueryStringForQueryWithSuggestion:originalSearchString:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __132__NSCompoundPredicate_EDSearchableIndexQueryTransformer__ed_transformSearchableIndexPredicateWithSuggestion_searchableIndexManager___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ed_transformSearchableIndexPredicateWithSuggestion:searchableIndexManager:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
