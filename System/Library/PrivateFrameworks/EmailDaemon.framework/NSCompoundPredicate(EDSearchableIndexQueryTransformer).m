@implementation NSCompoundPredicate(EDSearchableIndexQueryTransformer)

- (id)ed_transformSearchableIndexPredicateWithSuggestion:()EDSearchableIndexQueryTransformer searchableIndexManager:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "ed_hasOnlySpotlightKeypaths"))
  {
    +[EDSearchableIndexQueryTransformer transformSearchableIndexPredicate:suggestion:searchableIndexManager:](EDSearchableIndexQueryTransformer, "transformSearchableIndexPredicate:suggestion:searchableIndexManager:", a1, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "subpredicates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __132__NSCompoundPredicate_EDSearchableIndexQueryTransformer__ed_transformSearchableIndexPredicateWithSuggestion_searchableIndexManager___block_invoke;
    v16 = &unk_1E94A1220;
    v17 = v6;
    v18 = v7;
    objc_msgSend(v9, "ef_compactMap:", &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CB3528]);
    v8 = (void *)objc_msgSend(v11, "initWithType:subpredicates:", objc_msgSend(a1, "compoundPredicateType", v13, v14, v15, v16), v10);

  }
  return v8;
}

@end
