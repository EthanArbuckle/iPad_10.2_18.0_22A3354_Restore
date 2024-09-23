@implementation ICSearchIndexImplementation

- (CSSearchableIndex)searchableIndex
{
  CSSearchableIndex *searchableIndex;
  id v4;
  void *v5;
  void *v6;
  CSSearchableIndex *v7;
  CSSearchableIndex *v8;

  searchableIndex = self->_searchableIndex;
  if (!searchableIndex)
  {
    v4 = objc_alloc(MEMORY[0x1E0CA6B38]);
    ICSearchableIndexName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICNotesAppBundleIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CSSearchableIndex *)objc_msgSend(v4, "initWithName:bundleIdentifier:", v5, v6);
    v8 = self->_searchableIndex;
    self->_searchableIndex = v7;

    searchableIndex = self->_searchableIndex;
  }
  return searchableIndex;
}

- (void)beginIndexBatch
{
  id v2;

  -[ICSearchIndexImplementation searchableIndex](self, "searchableIndex");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginIndexBatch");

}

- (void)endIndexBatchWithClientState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICSearchIndexImplementation searchableIndex](self, "searchableIndex");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endIndexBatchWithClientState:completionHandler:", v7, v6);

}

- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICSearchIndexImplementation searchableIndex](self, "searchableIndex");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexSearchableItems:completionHandler:", v7, v6);

}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICSearchIndexImplementation searchableIndex](self, "searchableIndex");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteAllSearchableItemsWithCompletionHandler:", v4);

}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICSearchIndexImplementation searchableIndex](self, "searchableIndex");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteSearchableItemsWithIdentifiers:completionHandler:", v7, v6);

}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICSearchIndexImplementation searchableIndex](self, "searchableIndex");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v7, v6);

}

- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[ICSearchIndexImplementation searchableIndex](self, "searchableIndex");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v16, v15, v14, v13, v12);

}

- (void)fetchLastClientStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICSearchIndexImplementation searchableIndex](self, "searchableIndex");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchLastClientStateWithCompletionHandler:", v4);

}

- (void)setSearchableIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchableIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

@end
