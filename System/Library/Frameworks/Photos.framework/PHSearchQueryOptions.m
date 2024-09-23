@implementation PHSearchQueryOptions

- (PHSearchQueryOptions)init
{
  PHSearchQueryOptions *v2;
  PHSearchQueryOptions *v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHSearchQueryOptions;
  v2 = -[PHSearchQueryOptions init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_searchQueryResultTypes = 1;
    v2->_locationInQueryStringForSuggestionGeneration = 0x7FFFFFFFFFFFFFFFLL;
    v2->_embeddingRelevanceThreshold = -1.0;
    v2->_embeddingGenerationTimeout = 1000;
    v2->_collectionThreshold = 0.33;
    v2->_minNumberOfResultsForNextTokenGeneration = 35;
    v4 = +[PHSearchQueryManager currentSpotlightVersionSupportsExactMatchBehavior](PHSearchQueryManager, "currentSpotlightVersionSupportsExactMatchBehavior");
    v5 = 2;
    if (!v4)
      v5 = 3;
    v3->_matchType = v5;
    v3->_spotlightQueryTimeout = 10.0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHSearchQueryOptions *v4;
  void *v5;

  v4 = objc_alloc_init(PHSearchQueryOptions);
  -[PHSearchQueryOptions setSearchQueryResultTypes:](v4, "setSearchQueryResultTypes:", self->_searchQueryResultTypes);
  v5 = (void *)-[NSSet copy](self->_scopedIdentifiers, "copy");
  -[PHSearchQueryOptions setScopedIdentifiers:](v4, "setScopedIdentifiers:", v5);

  -[PHSearchQueryOptions setSuggestionLimit:](v4, "setSuggestionLimit:", self->_suggestionLimit);
  -[PHSearchQueryOptions setDisableSemanticSearch:](v4, "setDisableSemanticSearch:", self->_disableSemanticSearch);
  -[PHSearchQueryOptions setDisableMetadataSearch:](v4, "setDisableMetadataSearch:", self->_disableMetadataSearch);
  -[PHSearchQueryOptions setDisableSafetyCheck:](v4, "setDisableSafetyCheck:", self->_disableSafetyCheck);
  -[PHSearchQueryOptions setEnableQueryMatchDetails:](v4, "setEnableQueryMatchDetails:", self->_enableQueryMatchDetails);
  -[PHSearchQueryOptions setMaxSearchResults:](v4, "setMaxSearchResults:", self->_maxSearchResults);
  -[PHSearchQueryOptions setExcludeOCRTextResultMatches:](v4, "setExcludeOCRTextResultMatches:", self->_excludeOCRTextResultMatches);
  -[PHSearchQueryOptions setMaxRankedAssetSearchResults:](v4, "setMaxRankedAssetSearchResults:", self->_maxRankedAssetSearchResults);
  -[PHSearchQueryOptions setMaxRankedCollectionSearchResults:](v4, "setMaxRankedCollectionSearchResults:", self->_maxRankedCollectionSearchResults);
  -[PHSearchQueryOptions setLocationInQueryStringForSuggestionGeneration:](v4, "setLocationInQueryStringForSuggestionGeneration:", self->_locationInQueryStringForSuggestionGeneration);
  -[PHSearchQueryOptions setEnableQueryUnderstanding:](v4, "setEnableQueryUnderstanding:", self->_enableQueryUnderstanding);
  -[PHSearchQueryOptions setFastRanking:](v4, "setFastRanking:", self->_fastRanking);
  -[PHSearchQueryOptions setEmbeddingRelevanceThreshold:](v4, "setEmbeddingRelevanceThreshold:", self->_embeddingRelevanceThreshold);
  -[PHSearchQueryOptions setDisableU2:](v4, "setDisableU2:", self->_disableU2);
  -[PHSearchQueryOptions setEmbeddingGenerationTimeout:](v4, "setEmbeddingGenerationTimeout:", self->_embeddingGenerationTimeout);
  -[PHSearchQueryOptions setEnableQueryUnderstandingGenericLocations:](v4, "setEnableQueryUnderstandingGenericLocations:", self->_enableQueryUnderstandingGenericLocations);
  -[PHSearchQueryOptions setCollectionThreshold:](v4, "setCollectionThreshold:", self->_collectionThreshold);
  -[PHSearchQueryOptions setMatchType:](v4, "setMatchType:", self->_matchType);
  -[PHSearchQueryOptions setMinNumberOfResultsForNextTokenGeneration:](v4, "setMinNumberOfResultsForNextTokenGeneration:", self->_minNumberOfResultsForNextTokenGeneration);
  -[PHSearchQueryOptions setEnableEmbeddingOnlyResultsInExactMatches:](v4, "setEnableEmbeddingOnlyResultsInExactMatches:", self->_enableEmbeddingOnlyResultsInExactMatches);
  -[PHSearchQueryOptions setSpotlightQueryTimeout:](v4, "setSpotlightQueryTimeout:", self->_spotlightQueryTimeout);
  -[PHSearchQueryOptions setEnableNextTokenSuggestions:](v4, "setEnableNextTokenSuggestions:", self->_enableNextTokenSuggestions);
  return v4;
}

- (void)setEnableEmbeddingOnlyResultsInExactMatches:(BOOL)a3
{
  if (!+[PHSearchQueryManager currentSpotlightVersionSupportsExactMatchBehavior](PHSearchQueryManager, "currentSpotlightVersionSupportsExactMatchBehavior")|| -[PHSearchQueryOptions disableSemanticSearch](self, "disableSemanticSearch"))
  {
    a3 = 0;
  }
  self->_enableEmbeddingOnlyResultsInExactMatches = a3;
}

- (void)setMatchType:(unint64_t)a3
{
  _BOOL4 v5;
  unint64_t v6;

  v5 = +[PHSearchQueryManager currentSpotlightVersionSupportsExactMatchBehavior](PHSearchQueryManager, "currentSpotlightVersionSupportsExactMatchBehavior");
  v6 = 3;
  if (v5)
    v6 = a3;
  self->_matchType = v6;
}

- (id)_rankingModeDescription
{
  if (!self->_maxRankedAssetSearchResults && !self->_maxRankedCollectionSearchResults)
    return CFSTR("OFF");
  if (self->_fastRanking)
    return CFSTR("ON (L1)");
  return CFSTR("ON (L2)");
}

- (id)description
{
  unint64_t locationInQueryStringForSuggestionGeneration;
  __CFString *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  unint64_t matchType;
  __CFString *v18;
  __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;

  locationInQueryStringForSuggestionGeneration = self->_locationInQueryStringForSuggestionGeneration;
  if (locationInQueryStringForSuggestionGeneration == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = CFSTR("NSNotFound");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%tu"), locationInQueryStringForSuggestionGeneration);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PHSearchQueryOptions _rankingModeDescription](self, "_rankingModeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Ranking: %@, "), v6);

  if (self->_disableSemanticSearch)
    v7 = CFSTR("NO");
  else
    v7 = CFSTR("YES");
  objc_msgSend(v5, "appendFormat:", CFSTR("Embeddings: %@, "), v7);
  if (self->_disableMetadataSearch)
    v8 = CFSTR("NO");
  else
    v8 = CFSTR("YES");
  objc_msgSend(v5, "appendFormat:", CFSTR("Metadata: %@, "), v8);
  if (self->_enableQueryMatchDetails)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("QueryMatchDetails: %@, "), v9);
  objc_msgSend(v5, "appendFormat:", CFSTR("SuggestionLimit: %tu, "), self->_suggestionLimit);
  objc_msgSend(v5, "appendFormat:", CFSTR("ScopedIdentifiers count: %tu, "), -[NSSet count](self->_scopedIdentifiers, "count"));
  PHSearchQueryResultTypesDescription(-[PHSearchQueryOptions searchQueryResultTypes](self, "searchQueryResultTypes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("ResultTypes: %@, "), v10);

  objc_msgSend(v5, "appendFormat:", CFSTR("Max Top Assets: %tu, "), self->_maxRankedAssetSearchResults);
  objc_msgSend(v5, "appendFormat:", CFSTR("Max Top Collections: %tu, "), self->_maxRankedCollectionSearchResults);
  objc_msgSend(v5, "appendFormat:", CFSTR("Query text position for suggestions: %@, "), v4);
  if (self->_enableQueryUnderstanding)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("Enable Query Understanding: %@, "), v11);
  if (self->_excludeOCRTextResultMatches)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("Exclude OCR results: %@, "), v12);
  if (self->_disableSafetyCheck)
    v13 = CFSTR("NO");
  else
    v13 = CFSTR("YES");
  objc_msgSend(v5, "appendFormat:", CFSTR("SafetyCheck: %@, "), v13);
  if (self->_fastRanking)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("FastRanking: %@, "), v14);
  if (self->_disableU2)
    v15 = CFSTR("NO");
  else
    v15 = CFSTR("YES");
  objc_msgSend(v5, "appendFormat:", CFSTR("U2: %@, "), v15);
  objc_msgSend(v5, "appendFormat:", CFSTR("CollectionThreshold: %f, "), *(_QWORD *)&self->_collectionThreshold);
  objc_msgSend(v5, "appendFormat:", CFSTR("EmbeddingThreshold: %f, "), *(_QWORD *)&self->_embeddingRelevanceThreshold);
  objc_msgSend(v5, "appendFormat:", CFSTR("EmbeddingTimeout: %ld, "), self->_embeddingGenerationTimeout);
  if (self->_enableQueryUnderstandingGenericLocations)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("Enable QU Generic Location: %@, "), v16);
  matchType = self->_matchType;
  if (matchType > 3)
    v18 = CFSTR("Unknown");
  else
    v18 = off_1E35D6C98[matchType];
  v19 = v18;
  objc_msgSend(v5, "appendFormat:", CFSTR("Result match type: %@, "), v19);

  objc_msgSend(v5, "appendFormat:", CFSTR("MinNumberOfResultsForNextTokenGeneration: %tu"), self->_minNumberOfResultsForNextTokenGeneration);
  if (self->_enableEmbeddingOnlyResultsInExactMatches)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("EnableEmbeddingOnlyResultsInExactMatches: %@ "), v20);
  objc_msgSend(v5, "appendFormat:", CFSTR("Spotlight Query Timeout: %f, "), *(_QWORD *)&self->_spotlightQueryTimeout);
  if (self->_enableNextTokenSuggestions)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("EnableNextTokenSuggestions: %@, "), v21);
  v22 = (void *)objc_msgSend(v5, "copy");

  return v22;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t matchType;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[26];
  _QWORD v43[28];

  v43[26] = *MEMORY[0x1E0C80C00];
  v34 = objc_alloc(MEMORY[0x1E0C99E08]);
  v42[0] = CFSTR("rankingMode_humanReadable");
  -[PHSearchQueryOptions _rankingModeDescription](self, "_rankingModeDescription");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v41;
  v42[1] = CFSTR("disableSemanticSearch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions disableSemanticSearch](self, "disableSemanticSearch"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v40;
  v42[2] = CFSTR("disableMetadataSearch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions disableMetadataSearch](self, "disableMetadataSearch"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v39;
  v42[3] = CFSTR("disableSafetyCheck");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions disableSafetyCheck](self, "disableSafetyCheck"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v38;
  v42[4] = CFSTR("enableQueryMatchDetails");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions enableQueryMatchDetails](self, "enableQueryMatchDetails"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v37;
  v42[5] = CFSTR("maxSearchResults");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHSearchQueryOptions maxSearchResults](self, "maxSearchResults"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v36;
  v42[6] = CFSTR("maxRankedAssetSearchResults");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHSearchQueryOptions maxRankedAssetSearchResults](self, "maxRankedAssetSearchResults"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v35;
  v42[7] = CFSTR("maxRankedCollectionSearchResults");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHSearchQueryOptions maxRankedCollectionSearchResults](self, "maxRankedCollectionSearchResults"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v33;
  v42[8] = CFSTR("suggestionLimit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchQueryOptions suggestionLimit](self, "suggestionLimit"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v32;
  v42[9] = CFSTR("searchQueryResultTypes");
  PHSearchQueryResultTypesDescription(-[PHSearchQueryOptions searchQueryResultTypes](self, "searchQueryResultTypes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v31;
  v42[10] = CFSTR("scopedIdentifiers");
  -[PHSearchQueryOptions scopedIdentifiers](self, "scopedIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v3;
  v43[10] = v3;
  v42[11] = CFSTR("excludeOCRMatchedResults");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions excludeOCRTextResultMatches](self, "excludeOCRTextResultMatches"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v28;
  v42[12] = CFSTR("locationInQueryStringForSuggestionGeneration");
  if (-[PHSearchQueryOptions locationInQueryStringForSuggestionGeneration](self, "locationInQueryStringForSuggestionGeneration") == 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchQueryOptions locationInQueryStringForSuggestionGeneration](self, "locationInQueryStringForSuggestionGeneration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[12] = v27;
  v42[13] = CFSTR("enableQueryUnderstanding");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions enableQueryUnderstanding](self, "enableQueryUnderstanding"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[13] = v26;
  v42[14] = CFSTR("fastRanking");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions fastRanking](self, "fastRanking"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[14] = v25;
  v42[15] = CFSTR("collectionThreshold");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PHSearchQueryOptions collectionThreshold](self, "collectionThreshold");
  objc_msgSend(v4, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[15] = v24;
  v42[16] = CFSTR("embeddingRelevanceThreshold");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PHSearchQueryOptions embeddingRelevanceThreshold](self, "embeddingRelevanceThreshold");
  objc_msgSend(v5, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[16] = v23;
  v42[17] = CFSTR("disableU2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions disableU2](self, "disableU2"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[17] = v22;
  v42[18] = CFSTR("embeddingGenerationTimeout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHSearchQueryOptions embeddingGenerationTimeout](self, "embeddingGenerationTimeout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43[18] = v6;
  v42[19] = CFSTR("enableQueryUnderstandingGenericLocations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions enableQueryUnderstandingGenericLocations](self, "enableQueryUnderstandingGenericLocations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[19] = v7;
  v42[20] = CFSTR("minNumberOfResultsForNextTokenGeneration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchQueryOptions minNumberOfResultsForNextTokenGeneration](self, "minNumberOfResultsForNextTokenGeneration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[20] = v8;
  v42[21] = CFSTR("matchType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchQueryOptions matchType](self, "matchType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[21] = v9;
  v42[22] = CFSTR("matchType_humanReadable");
  matchType = self->_matchType;
  if (matchType > 3)
    v11 = CFSTR("Unknown");
  else
    v11 = off_1E35D6C98[matchType];
  v12 = v11;
  v43[22] = v12;
  v42[23] = CFSTR("enableEmbeddingOnlyResultsInExactMatches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions enableEmbeddingOnlyResultsInExactMatches](self, "enableEmbeddingOnlyResultsInExactMatches"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[23] = v13;
  v42[24] = CFSTR("spotlightQueryTimeout");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[PHSearchQueryOptions spotlightQueryTimeout](self, "spotlightQueryTimeout");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[24] = v15;
  v42[25] = CFSTR("enableNextTokenSuggestions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQueryOptions enableNextTokenSuggestions](self, "enableNextTokenSuggestions"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[25] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v34, "initWithDictionary:", v17);

  if (!v29)
  v19 = (void *)objc_msgSend(v18, "copy");

  return v19;
}

- (unint64_t)searchQueryResultTypes
{
  return self->_searchQueryResultTypes;
}

- (void)setSearchQueryResultTypes:(unint64_t)a3
{
  self->_searchQueryResultTypes = a3;
}

- (NSSet)scopedIdentifiers
{
  return self->_scopedIdentifiers;
}

- (void)setScopedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_scopedIdentifiers, a3);
}

- (int64_t)maxRankedAssetSearchResults
{
  return self->_maxRankedAssetSearchResults;
}

- (void)setMaxRankedAssetSearchResults:(int64_t)a3
{
  self->_maxRankedAssetSearchResults = a3;
}

- (int64_t)maxRankedCollectionSearchResults
{
  return self->_maxRankedCollectionSearchResults;
}

- (void)setMaxRankedCollectionSearchResults:(int64_t)a3
{
  self->_maxRankedCollectionSearchResults = a3;
}

- (BOOL)disableSemanticSearch
{
  return self->_disableSemanticSearch;
}

- (void)setDisableSemanticSearch:(BOOL)a3
{
  self->_disableSemanticSearch = a3;
}

- (OS_dispatch_queue)resultsHandlerQueue
{
  return self->_resultsHandlerQueue;
}

- (void)setResultsHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultsHandlerQueue, a3);
}

- (BOOL)disableMetadataSearch
{
  return self->_disableMetadataSearch;
}

- (void)setDisableMetadataSearch:(BOOL)a3
{
  self->_disableMetadataSearch = a3;
}

- (BOOL)enableQueryMatchDetails
{
  return self->_enableQueryMatchDetails;
}

- (void)setEnableQueryMatchDetails:(BOOL)a3
{
  self->_enableQueryMatchDetails = a3;
}

- (int64_t)maxSearchResults
{
  return self->_maxSearchResults;
}

- (void)setMaxSearchResults:(int64_t)a3
{
  self->_maxSearchResults = a3;
}

- (BOOL)excludeOCRTextResultMatches
{
  return self->_excludeOCRTextResultMatches;
}

- (void)setExcludeOCRTextResultMatches:(BOOL)a3
{
  self->_excludeOCRTextResultMatches = a3;
}

- (BOOL)enableQueryUnderstanding
{
  return self->_enableQueryUnderstanding;
}

- (void)setEnableQueryUnderstanding:(BOOL)a3
{
  self->_enableQueryUnderstanding = a3;
}

- (unint64_t)suggestionLimit
{
  return self->_suggestionLimit;
}

- (void)setSuggestionLimit:(unint64_t)a3
{
  self->_suggestionLimit = a3;
}

- (BOOL)enableNextTokenSuggestions
{
  return self->_enableNextTokenSuggestions;
}

- (void)setEnableNextTokenSuggestions:(BOOL)a3
{
  self->_enableNextTokenSuggestions = a3;
}

- (unint64_t)locationInQueryStringForSuggestionGeneration
{
  return self->_locationInQueryStringForSuggestionGeneration;
}

- (void)setLocationInQueryStringForSuggestionGeneration:(unint64_t)a3
{
  self->_locationInQueryStringForSuggestionGeneration = a3;
}

- (BOOL)enableResultRanking
{
  return self->_enableResultRanking;
}

- (void)setEnableResultRanking:(BOOL)a3
{
  self->_enableResultRanking = a3;
}

- (unint64_t)completionSuggestionLimit
{
  return self->_completionSuggestionLimit;
}

- (void)setCompletionSuggestionLimit:(unint64_t)a3
{
  self->_completionSuggestionLimit = a3;
}

- (unint64_t)nextEntitySuggestionLimit
{
  return self->_nextEntitySuggestionLimit;
}

- (void)setNextEntitySuggestionLimit:(unint64_t)a3
{
  self->_nextEntitySuggestionLimit = a3;
}

- (BOOL)limitSuggestionsToExactTextMatches
{
  return self->_limitSuggestionsToExactTextMatches;
}

- (void)setLimitSuggestionsToExactTextMatches:(BOOL)a3
{
  self->_limitSuggestionsToExactTextMatches = a3;
}

- (BOOL)fastRanking
{
  return self->_fastRanking;
}

- (void)setFastRanking:(BOOL)a3
{
  self->_fastRanking = a3;
}

- (double)embeddingRelevanceThreshold
{
  return self->_embeddingRelevanceThreshold;
}

- (void)setEmbeddingRelevanceThreshold:(double)a3
{
  self->_embeddingRelevanceThreshold = a3;
}

- (BOOL)disableU2
{
  return self->_disableU2;
}

- (void)setDisableU2:(BOOL)a3
{
  self->_disableU2 = a3;
}

- (int64_t)embeddingGenerationTimeout
{
  return self->_embeddingGenerationTimeout;
}

- (void)setEmbeddingGenerationTimeout:(int64_t)a3
{
  self->_embeddingGenerationTimeout = a3;
}

- (BOOL)disableSafetyCheck
{
  return self->_disableSafetyCheck;
}

- (void)setDisableSafetyCheck:(BOOL)a3
{
  self->_disableSafetyCheck = a3;
}

- (BOOL)enableQueryUnderstandingGenericLocations
{
  return self->_enableQueryUnderstandingGenericLocations;
}

- (void)setEnableQueryUnderstandingGenericLocations:(BOOL)a3
{
  self->_enableQueryUnderstandingGenericLocations = a3;
}

- (double)collectionThreshold
{
  return self->_collectionThreshold;
}

- (void)setCollectionThreshold:(double)a3
{
  self->_collectionThreshold = a3;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (unint64_t)minNumberOfResultsForNextTokenGeneration
{
  return self->_minNumberOfResultsForNextTokenGeneration;
}

- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3
{
  self->_minNumberOfResultsForNextTokenGeneration = a3;
}

- (BOOL)enableEmbeddingOnlyResultsInExactMatches
{
  return self->_enableEmbeddingOnlyResultsInExactMatches;
}

- (double)spotlightQueryTimeout
{
  return self->_spotlightQueryTimeout;
}

- (void)setSpotlightQueryTimeout:(double)a3
{
  self->_spotlightQueryTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsHandlerQueue, 0);
  objc_storeStrong((id *)&self->_scopedIdentifiers, 0);
}

@end
