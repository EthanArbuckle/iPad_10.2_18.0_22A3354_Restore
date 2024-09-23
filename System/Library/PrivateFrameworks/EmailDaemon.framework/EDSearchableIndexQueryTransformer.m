@implementation EDSearchableIndexQueryTransformer

- (EDSearchableIndexQueryTransformer)initWithSearchableIndexManager:(id)a3
{
  id v5;
  EDSearchableIndexQueryTransformer *v6;
  EDSearchableIndexQueryTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDSearchableIndexQueryTransformer;
  v6 = -[EDSearchableIndexQueryTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchableIndexManager, a3);

  return v7;
}

- (id)persistenceQueryForSearchableIndexQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexQueryTransformer searchableIndexManager](self, "searchableIndexManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ed_transformSearchableIndexPredicateWithSuggestion:searchableIndexManager:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v10 = objc_msgSend(v4, "targetClass");
  objc_msgSend(v4, "sortDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithTargetClass:predicate:sortDescriptors:", v10, v8, v11);

  return v12;
}

+ (id)transformSearchableIndexPredicate:(id)a3 suggestion:(id)a4 searchableIndexManager:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v7 = a5;
  +[EDSearchableIndexExpressionGenerator expressionForPredicate:suggestion:](EDSearchableIndexExpressionGenerator, "expressionForPredicate:suggestion:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "searchableItemResultForExpression:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "snippetData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "threadDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D1DCE8]);

  objc_msgSend(v9, "identifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v9, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessageListItemPredicates predicateForMessagesWithPersistentIDs:](EDMessageListItemPredicates, "predicateForMessagesWithPersistentIDs:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "ef_matchNothingPredicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (EDSearchableIndexManager)searchableIndexManager
{
  return (EDSearchableIndexManager *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableIndexManager, 0);
}

@end
