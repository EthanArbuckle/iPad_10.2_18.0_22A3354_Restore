@implementation CNAutocompleteQueryResponseUniqueResultFinder

+ (id)findUniqueResults:(id)a3 duplicateResultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResults:duplicateResultHandler:", v7, v6);

  objc_msgSend(v8, "findUniqueResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CNAutocompleteQueryResponseUniqueResultFinder)initWithResults:(id)a3 duplicateResultHandler:(id)a4
{
  id v6;
  id v7;
  CNAutocompleteQueryResponseUniqueResultFinder *v8;
  uint64_t v9;
  NSMutableArray *uniqueResults;
  uint64_t v11;
  id duplicateResultHandler;
  CNAutocompleteQueryResponseUniqueResultFinder *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAutocompleteQueryResponseUniqueResultFinder;
  v8 = -[CNAutocompleteQueryResponseUniqueResultFinder init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    uniqueResults = v8->_uniqueResults;
    v8->_uniqueResults = (NSMutableArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    duplicateResultHandler = v8->_duplicateResultHandler;
    v8->_duplicateResultHandler = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (id)findUniqueResults
{
  -[CNAutocompleteQueryResponseUniqueResultFinder generateHashes](self, "generateHashes");
  -[CNAutocompleteQueryResponseUniqueResultFinder indexHashes](self, "indexHashes");
  -[CNAutocompleteQueryResponseUniqueResultFinder removeDuplicateResults](self, "removeDuplicateResults");
  return (id)-[NSMutableArray objectsAtIndexes:](self->_uniqueResults, "objectsAtIndexes:", self->_uniqueResultIndexes);
}

- (void)generateHashes
{
  NSMutableArray *v3;
  NSMutableArray *hashes;
  id v5;

  -[NSMutableArray _cn_map:](self->_uniqueResults, "_cn_map:", CNAutocompleteResultStringForHashingTransform);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
  hashes = self->_hashes;
  self->_hashes = v3;

}

- (void)indexHashes
{
  void *v3;
  void *v4;
  NSMutableArray *hashes;
  NSDictionary *v6;
  NSIndexSet *v7;
  NSDictionary *hashIndex;
  NSIndexSet *firstIndexes;
  NSIndexSet *v10;
  NSMutableIndexSet *v11;
  NSMutableIndexSet *uniqueResultIndexes;
  NSDictionary *v13;
  _QWORD v14[4];
  NSDictionary *v15;
  NSIndexSet *v16;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  hashes = self->_hashes;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__CNAutocompleteQueryResponseUniqueResultFinder_indexHashes__block_invoke;
  v14[3] = &unk_1E70DFE60;
  v6 = v4;
  v15 = v6;
  v7 = v3;
  v16 = v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](hashes, "enumerateObjectsUsingBlock:", v14);
  hashIndex = self->_hashIndex;
  self->_hashIndex = v6;
  v13 = v6;

  firstIndexes = self->_firstIndexes;
  self->_firstIndexes = v7;
  v10 = v7;

  v11 = (NSMutableIndexSet *)-[NSIndexSet mutableCopy](self->_firstIndexes, "mutableCopy");
  uniqueResultIndexes = self->_uniqueResultIndexes;
  self->_uniqueResultIndexes = v11;

}

void __60__CNAutocompleteQueryResponseUniqueResultFinder_indexHashes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }
  objc_msgSend(v5, "addIndex:", a3);

}

- (void)removeDuplicateResults
{
  NSDictionary *v3;
  NSMutableArray *hashes;
  NSIndexSet *firstIndexes;
  NSDictionary *v6;
  _QWORD v7[4];
  NSDictionary *v8;
  CNAutocompleteQueryResponseUniqueResultFinder *v9;

  v3 = self->_hashIndex;
  hashes = self->_hashes;
  firstIndexes = self->_firstIndexes;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CNAutocompleteQueryResponseUniqueResultFinder_removeDuplicateResults__block_invoke;
  v7[3] = &unk_1E70DFE60;
  v8 = v3;
  v9 = self;
  v6 = v3;
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](hashes, "enumerateObjectsAtIndexes:options:usingBlock:", firstIndexes, 0, v7);

}

void __71__CNAutocompleteQueryResponseUniqueResultFinder_removeDuplicateResults__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "resolveDuplicatesWithinIndexes:", v3);

}

- (void)resolveDuplicatesWithinIndexes:(id)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (unint64_t)objc_msgSend(v11, "count") >= 2;
  v5 = v11;
  if (v4)
  {
    v6 = objc_msgSend(v11, "firstIndex");
    -[NSMutableArray objectAtIndex:](self->_uniqueResults, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "indexGreaterThanIndex:", v6);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v8; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v11, "indexGreaterThanIndex:", i))
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_uniqueResults, "objectAtIndexedSubscript:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v10))
          (*((void (**)(void))self->_duplicateResultHandler + 2))();
        else
          -[NSMutableIndexSet addIndex:](self->_uniqueResultIndexes, "addIndex:", i);

      }
    }

    v5 = v11;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_duplicateResultHandler, 0);
  objc_storeStrong((id *)&self->_uniqueResultIndexes, 0);
  objc_storeStrong((id *)&self->_firstIndexes, 0);
  objc_storeStrong((id *)&self->_hashIndex, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
  objc_storeStrong((id *)&self->_uniqueResults, 0);
}

@end
