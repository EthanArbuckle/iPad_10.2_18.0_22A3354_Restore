@implementation PHSearchQueryResult

- (PHSearchQueryResult)initWithSearchQuery:(id)a3 searchResults:(id)a4 unfilteredAssetSearchResults:(id)a5 rankedAssetSearchResults:(id)a6 rankedCollectionSearchResults:(id)a7 searchSuggestions:(id)a8 queryMatchDetails:(id)a9 annotatedQueryString:(id)a10 queryStringReceivedFromSpotlight:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PHSearchQueryResult *v22;
  PHSearchQueryResult *v23;
  void *v25;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v17 = a3;
  v28 = a4;
  v35 = a4;
  v29 = a5;
  v34 = a5;
  v30 = a6;
  v33 = a6;
  v31 = a7;
  v32 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryResult.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

  }
  v36.receiver = self;
  v36.super_class = (Class)PHSearchQueryResult;
  v22 = -[PHSearchQueryResult init](&v36, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_searchQuery, a3);
    objc_storeStrong((id *)&v23->_searchResults, v28);
    objc_storeStrong((id *)&v23->_unfilteredAssetSearchResults, v29);
    objc_storeStrong((id *)&v23->_rankedAssetSearchResults, v30);
    objc_storeStrong((id *)&v23->_rankedCollectionSearchResults, v31);
    objc_storeStrong((id *)&v23->_searchSuggestions, a8);
    objc_storeStrong((id *)&v23->_queryMatchDetails, a9);
    objc_storeStrong((id *)&v23->_annotatedQueryString, a10);
    objc_storeStrong((id *)&v23->_queryStringReceivedFromSpotlight, a11);
  }

  return v23;
}

- (PHSearchQueryResult)initWithSearchQuery:(id)a3
{
  id v5;
  void *v6;
  PHSearchQueryResult *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryResult.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

  }
  objc_msgSend(v5, "searchText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PHSearchQueryResult initWithSearchQuery:searchResults:unfilteredAssetSearchResults:rankedAssetSearchResults:rankedCollectionSearchResults:searchSuggestions:queryMatchDetails:annotatedQueryString:queryStringReceivedFromSpotlight:](self, "initWithSearchQuery:searchResults:unfilteredAssetSearchResults:rankedAssetSearchResults:rankedCollectionSearchResults:searchSuggestions:queryMatchDetails:annotatedQueryString:queryStringReceivedFromSpotlight:", v5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, v6, 0);

  return v7;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("Query: %d, "), -[PHSearchQuery queryIdentifier](self->_searchQuery, "queryIdentifier"));
  if (-[PHSearchQuery batchIdentifier](self->_searchQuery, "batchIdentifier"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Batch: %d, "), -[PHSearchQuery batchIdentifier](self->_searchQuery, "batchIdentifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu results, "), -[NSArray count](self->_searchResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu unfiltered results, "), -[NSArray count](self->_unfilteredAssetSearchResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu top assets, "), -[NSArray count](self->_rankedAssetSearchResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu top collections, "), -[NSArray count](self->_rankedCollectionSearchResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu suggestions, "), -[NSArray count](self->_searchSuggestions, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("match details: %@, "), self->_queryMatchDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR("Spotlight annotated query: %@"), self->_queryStringReceivedFromSpotlight);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)redactedDescription
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("Query: %d, "), -[PHSearchQuery queryIdentifier](self->_searchQuery, "queryIdentifier"));
  if (-[PHSearchQuery batchIdentifier](self->_searchQuery, "batchIdentifier"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Batch: %d, "), -[PHSearchQuery batchIdentifier](self->_searchQuery, "batchIdentifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu results, "), -[NSArray count](self->_searchResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu unfiltered results, "), -[NSArray count](self->_unfilteredAssetSearchResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu top assets, "), -[NSArray count](self->_rankedAssetSearchResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu top collections, "), -[NSArray count](self->_rankedCollectionSearchResults, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%tu suggestions"), -[NSArray count](self->_searchSuggestions, "count"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)jsonDictionary
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[9];
  _QWORD v51[11];

  v51[9] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHSearchQueryResult rankedAssetSearchResults](self, "rankedAssetSearchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke;
  v48[3] = &unk_1E35D7C50;
  v6 = v3;
  v49 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v48);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHSearchQueryResult rankedCollectionSearchResults](self, "rankedCollectionSearchResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v5;
  v46[1] = 3221225472;
  v46[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke_2;
  v46[3] = &unk_1E35D7C50;
  v9 = v7;
  v47 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v46);

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHSearchQueryResult searchResults](self, "searchResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v5;
  v44[1] = 3221225472;
  v44[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke_3;
  v44[3] = &unk_1E35D7C50;
  v12 = v10;
  v45 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v44);

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHSearchQueryResult unfilteredAssetSearchResults](self, "unfilteredAssetSearchResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v5;
  v42[1] = 3221225472;
  v42[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke_4;
  v42[3] = &unk_1E35D7C50;
  v15 = v13;
  v43 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v42);

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHSearchQueryResult searchSuggestions](self, "searchSuggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v5;
  v40[1] = 3221225472;
  v40[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke_5;
  v40[3] = &unk_1E35D7C78;
  v18 = v16;
  v41 = v18;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v40);

  v31 = objc_alloc(MEMORY[0x1E0C99E08]);
  v50[0] = CFSTR("searchQuery");
  -[PHSearchQueryResult searchQuery](self, "searchQuery");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "jsonDictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v33;
  v51[1] = v12;
  v36 = v15;
  v37 = v12;
  v50[1] = CFSTR("searchResults");
  v50[2] = CFSTR("unfilteredResults");
  v51[2] = v15;
  v51[3] = v6;
  v38 = v9;
  v39 = v6;
  v50[3] = CFSTR("topAssets");
  v50[4] = CFSTR("topCollections");
  v51[4] = v9;
  v51[5] = v18;
  v35 = v18;
  v50[5] = CFSTR("searchSuggestions");
  v50[6] = CFSTR("queryMatchDetails");
  -[PHSearchQueryResult queryMatchDetails](self, "queryMatchDetails");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "jsonDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51[6] = v20;
  v50[7] = CFSTR("annotatedQueryString");
  -[PHSearchQueryResult annotatedQueryString](self, "annotatedQueryString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "description");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51[7] = v23;
  v50[8] = CFSTR("queryStringReceivedFromSpotlight");
  -[PHSearchQueryResult queryStringReceivedFromSpotlight](self, "queryStringReceivedFromSpotlight");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "description");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51[8] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v31, "initWithDictionary:", v27);

  if (!v25)
  if (!v22)

  if (!v19)
  v29 = (void *)objc_msgSend(v28, "copy");

  return v29;
}

- (PHSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (NSArray)rankedAssetSearchResults
{
  return self->_rankedAssetSearchResults;
}

- (NSArray)rankedCollectionSearchResults
{
  return self->_rankedCollectionSearchResults;
}

- (NSArray)searchSuggestions
{
  return self->_searchSuggestions;
}

- (PHSearchQueryMatchDetails)queryMatchDetails
{
  return self->_queryMatchDetails;
}

- (NSAttributedString)annotatedQueryString
{
  return self->_annotatedQueryString;
}

- (NSAttributedString)queryStringReceivedFromSpotlight
{
  return self->_queryStringReceivedFromSpotlight;
}

- (NSArray)unfilteredAssetSearchResults
{
  return self->_unfilteredAssetSearchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfilteredAssetSearchResults, 0);
  objc_storeStrong((id *)&self->_queryStringReceivedFromSpotlight, 0);
  objc_storeStrong((id *)&self->_annotatedQueryString, 0);
  objc_storeStrong((id *)&self->_queryMatchDetails, 0);
  objc_storeStrong((id *)&self->_searchSuggestions, 0);
  objc_storeStrong((id *)&self->_rankedCollectionSearchResults, 0);
  objc_storeStrong((id *)&self->_rankedAssetSearchResults, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "jsonDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "jsonDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "jsonDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "jsonDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "jsonDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
