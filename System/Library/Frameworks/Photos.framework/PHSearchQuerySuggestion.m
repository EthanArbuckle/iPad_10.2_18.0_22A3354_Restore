@implementation PHSearchQuerySuggestion

- (PHSearchQuerySuggestion)init
{
  PHSearchQuerySuggestion *v2;
  id v3;

  v2 = self;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PHSearchQuerySuggestion)initWithQueryText:(id)a3 type:(unint64_t)a4 assetCount:(int64_t)a5 keyAssetUUIDs:(id)a6
{
  id v11;
  id v12;
  PHSearchQuerySuggestion *v13;
  uint64_t v14;
  NSAttributedString *queryText;
  uint64_t v16;
  NSArray *keyAssetUUIDs;
  void *v19;
  void *v20;
  objc_super v21;

  v11 = a3;
  v12 = a6;
  if (v11)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQuerySuggestion.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryText"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQuerySuggestion.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != PHSearchQuerySuggestionTypeUndefined"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)PHSearchQuerySuggestion;
  v13 = -[PHSearchQuerySuggestion init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    queryText = v13->_queryText;
    v13->_queryText = (NSAttributedString *)v14;

    v13->_type = a4;
    v13->_assetCount = a5;
    v16 = objc_msgSend(v12, "copy");
    keyAssetUUIDs = v13->_keyAssetUUIDs;
    v13->_keyAssetUUIDs = (NSArray *)v16;

  }
  return v13;
}

- (float)score
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  float v7;
  double v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float *v20;
  uint64_t v21;
  int v22;

  v19 = 0;
  v20 = (float *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PHSearchQuerySuggestion queryText](self, "queryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchQuerySuggestion queryText](self, "queryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__PHSearchQuerySuggestion_score__block_invoke;
  v10[3] = &unk_1E35D7348;
  v10[4] = &v11;
  v10[5] = &v19;
  v10[6] = &v15;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("PHSearchQueryAttributeKey"), 0, v5, 0, v10);

  if (v12[3])
  {
    v6 = v16[3];
    if (v6)
      v7 = v20[6] / (float)v6;
    else
      v7 = 0.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D71AB8], "suggestionScoreForIndexCategory:", 1102);
    v7 = v8;
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PHSearchQuerySuggestion *v4;
  PHSearchQuerySuggestion *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (PHSearchQuerySuggestion *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PHSearchQuerySuggestion type](self, "type");
      if (v6 == -[PHSearchQuerySuggestion type](v5, "type"))
      {
        -[PHSearchQuerySuggestion queryText](self, "queryText");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHSearchQuerySuggestion queryText](v5, "queryText");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToAttributedString:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[PHSearchQuerySuggestion type](self, "type");
  -[PHSearchQuerySuggestion queryText](self, "queryText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (PHSearchQuerySuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PHSearchQuerySuggestion *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchQuerySuggestionPropertyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("PHSearchQuerySuggestionPropertyQueryText"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchQuerySuggestionPropertyAssetCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "integerValue");
  else
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PHSearchQuerySuggestionPropertyKeyAssetUUIDs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (objc_msgSend(v10, "length") && v6)
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL && v6 == 2)
    {
      v15 = 0;
    }
    else
    {
      self = -[PHSearchQuerySuggestion initWithQueryText:type:assetCount:keyAssetUUIDs:](self, "initWithQueryText:type:assetCount:keyAssetUUIDs:", v10, v6, v13, v14);
      v15 = self;
    }
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_queryText, CFSTR("PHSearchQuerySuggestionPropertyQueryText"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("PHSearchQuerySuggestionPropertyType"));

  if (self->_assetCount != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("PHSearchQuerySuggestionPropertyAssetCount"));

  }
  objc_msgSend(v6, "encodeObject:forKey:", self->_keyAssetUUIDs, CFSTR("PHSearchQuerySuggestionPropertyKeyAssetUUIDs"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t type;
  __CFString *v8;
  __CFString *v9;
  float v10;
  double v11;
  int64_t v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PHSearchQuerySuggestion queryText](self, "queryText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  v8 = CFSTR("PHSearchQuerySuggestionTypeUndefined");
  if (type == 1)
    v8 = CFSTR("PHSearchQuerySuggestionTypeInitial");
  if (type == 2)
    v8 = CFSTR("PHSearchQuerySuggestionTypeRecent");
  v9 = v8;
  -[PHSearchQuerySuggestion score](self, "score");
  v11 = v10;
  v12 = -[PHSearchQuerySuggestion assetCount](self, "assetCount");
  -[PHSearchQuerySuggestion keyAssetUUIDs](self, "keyAssetUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %p, query text: '%@', type: %ld (%@), score: %f, asset count: %ld, key asset uuids: %@"), v4, self, v6, type, v9, *(_QWORD *)&v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)jsonDictionary
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v18 = objc_alloc(MEMORY[0x1E0C99E08]);
  v20[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHSearchQuerySuggestion type](self, "type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v20[1] = CFSTR("type_humanReadable");
  v3 = -[PHSearchQuerySuggestion type](self, "type");
  v4 = CFSTR("PHSearchQuerySuggestionTypeUndefined");
  if (v3 == 1)
    v4 = CFSTR("PHSearchQuerySuggestionTypeInitial");
  if (v3 == 2)
    v4 = CFSTR("PHSearchQuerySuggestionTypeRecent");
  v5 = v4;
  v21[1] = v5;
  v20[2] = CFSTR("query_attr_text");
  -[PHSearchQuerySuggestion queryText](self, "queryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = CFSTR("query_plain_text");
  -[PHSearchQuerySuggestion queryText](self, "queryText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v9;
  v20[4] = CFSTR("score");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PHSearchQuerySuggestion score](self, "score");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v11;
  v20[5] = CFSTR("asset_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHSearchQuerySuggestion assetCount](self, "assetCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v12;
  v20[6] = CFSTR("key_asset_uuids");
  -[PHSearchQuerySuggestion keyAssetUUIDs](self, "keyAssetUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v18, "initWithDictionary:", v14);

  v16 = (void *)objc_msgSend(v15, "copy");
  return v16;
}

- (NSAttributedString)queryText
{
  return self->_queryText;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)assetCount
{
  return self->_assetCount;
}

- (NSArray)keyAssetUUIDs
{
  return self->_keyAssetUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_queryText, 0);
}

void __32__PHSearchQuerySuggestion_score__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "suggestionComponents", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "score");
          *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = v10 + *(float *)(*(_QWORD *)(a1[5] + 8) + 24);
          ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

+ (id)new
{
  id v2;
  id v3;

  v2 = a1;
  PFMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (void)initialSearchQuerySuggestionsForPhotoLibrary:(id)a3 suggestionLimit:(unint64_t)a4 minimumResultCountPerSuggestion:(unint64_t)a5 suggestionsHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0C99DC8];
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PLSearchNaturalLanguageInitialSuggestionsSupportedForLocale();
  PLSearchBackendInitialSuggestionsGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CFSTR("NO");
    if (v14)
      v16 = CFSTR("YES");
    v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "Device locale supports natural language style initial suggestions: %@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(a1, "initialSearchQuerySuggestionsForPhotoLibrary:suggestionLimit:minimumResultCountPerSuggestion:suggestionStyleType:suggestionsHandler:", v12, a4, a5, v14 ^ 1u, v11);
}

+ (void)initialSearchQuerySuggestionsForPhotoLibrary:(id)a3 suggestionLimit:(unint64_t)a4 minimumResultCountPerSuggestion:(unint64_t)a5 suggestionStyleType:(unint64_t)a6 suggestionsHandler:(id)a7
{
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v13 = a3;
  v14 = a7;
  v15 = v14;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionsHandler"));

    if (a4)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (a4)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionLimit > 0"));

LABEL_4:
  if (initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__onceToken != -1)
    dispatch_once(&initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__onceToken, &__block_literal_global_7722);
  v16 = initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__initialSuggestionGenerationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke_2;
  block[3] = &unk_1E35D73B8;
  v24 = v13;
  v25 = v15;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v17 = v15;
  v18 = v13;
  v19 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  dispatch_async(v16, v19);

}

+ (id)recentSearchesForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(a1, "_recentSuggestionsForPhotoLibrary:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)saveRecentSearchQuery:(id)a3 assetResultCount:(int64_t)a4 keyAssetUUIDs:(id)a5 photoLibrary:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PHSearchQuerySuggestion *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  id v33;
  id *v34;
  void *v36;
  void *v37;
  id v38;
  PHSearchQuerySuggestion *v39;
  id v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  v45 = v14;
  if (v12)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

    v15 = v45;
    if (v45)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  v15 = v45;
LABEL_3:
  v51 = 0;
  objc_msgSend(a1, "recentSearchesForPhotoLibrary:error:", v15, &v51);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v51;
  v44 = v12;
  objc_msgSend(v12, "searchText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = a1;
  objc_msgSend(a1, "_prepareQueryTextForSaving:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)v18;
  +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:](PHSearchUtility, "insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v13;
  v20 = -[PHSearchQuerySuggestion initWithQueryText:type:assetCount:keyAssetUUIDs:]([PHSearchQuerySuggestion alloc], "initWithQueryText:type:assetCount:keyAssetUUIDs:", v19, 2, a4, v13);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 10);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  objc_msgSend(v21, "addObject:", v19);
  v39 = v20;
  objc_msgSend(v22, "addObject:", v20);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v23 = v16;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v48;
LABEL_5:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v26)
        objc_enumerationMutation(v23);
      v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v27);
      if ((unint64_t)objc_msgSend(v22, "count") > 9)
        break;
      objc_msgSend(v28, "queryText");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v21, "containsObject:", v29);

      if ((v30 & 1) == 0)
      {
        objc_msgSend(v28, "queryText");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v31);

        objc_msgSend(v22, "addObject:", v28);
      }
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
        if (v25)
          goto LABEL_5;
        break;
      }
    }
  }

  v46 = 0;
  v32 = objc_msgSend(v40, "_saveRecentSuggestions:photoLibrary:error:", v22, v45, &v46);
  v33 = v46;

  if (v32)
  {
    v34 = a7;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v45;
      _os_log_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Saved recent search query for photoLibrary: %@", buf, 0xCu);
    }
  }
  else
  {
    v34 = a7;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v53 = v44;
      v54 = 2112;
      v55 = v45;
      v56 = 2112;
      v57 = v33;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to save recent search query: %@, photoLibrary: %@, error: %@", buf, 0x20u);
    }
  }
  if (v34)
    *v34 = objc_retainAutorelease(v33);

  return v32;
}

+ (BOOL)deleteRecentSearchSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionsToDelete"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = objc_msgSend(a1, "_deleteRecentSuggestions:photoLibrary:error:", v9, v11, a5);

  return v12;
}

+ (BOOL)deleteAllRecentSearchSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchRecentSearchesFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v10 = objc_msgSend(v9, "removeItemAtPath:error:", v6, &v19);
    v11 = v19;

    PLSearchBackendRecentSuggestionsGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      v14 = "Successfully deleted recent suggestions at path: \"%@\".";
      v15 = v13;
      v16 = OS_LOG_TYPE_DEFAULT;
      v17 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v11;
      v14 = "Failed to delete recent suggestions at path: \"%@\" with error: %@.";
      v15 = v13;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 22;
    }
    _os_log_impl(&dword_1991EC000, v15, v16, v14, buf, v17);
LABEL_11:

    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      *a4 = v11;
    }
    goto LABEL_13;
  }
  PLSearchBackendRecentSuggestionsGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "No recent suggestions found at path: \"%@\", nothing to delete.", buf, 0xCu);
  }
  LOBYTE(v10) = 1;
LABEL_13:

  return v10;
}

+ (id)_recentSuggestionsForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v7, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchRecentSearchesFilePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v9, 0, &v23);
  v11 = v23;
  v12 = v11;
  if (v10)
  {
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v15, v10, &v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v22;

    if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v7;
      v26 = 2112;
      v27 = v17;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to unarchive search suggestions for photoLibrary: %@, error: %@", buf, 0x16u);
    }

    if (a4)
      goto LABEL_8;
  }
  else
  {
    v16 = 0;
    v17 = v11;
    if (a4)
LABEL_8:
      *a4 = objc_retainAutorelease(v17);
  }
  if (v16)
    v18 = v16;
  else
    v18 = (void *)MEMORY[0x1E0C9AA60];
  v19 = v18;

  return v19;
}

+ (BOOL)_saveRecentSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  BOOL v19;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestions"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

LABEL_3:
  objc_msgSend(v11, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchRecentSearchesFilePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;
  v16 = v15;
  if (v14)
  {
    v23 = v15;
    v17 = objc_msgSend(v14, "writeToFile:options:error:", v13, 1073741825, &v23);
    v18 = v23;

    if (v17)
    {
      v19 = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v9;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Saved search suggestions: %@, photoLibrary: %@", buf, 0x16u);
      }
      goto LABEL_11;
    }
  }
  else
  {
    v18 = v15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v9;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v18;
    _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to save search suggestions: %@, photoLibrary: %@, error: %@", buf, 0x20u);
  }
  v19 = 0;
LABEL_11:
  if (a5)
    *a5 = objc_retainAutorelease(v18);

  return v19;
}

+ (BOOL)_deleteRecentSuggestions:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionsToDelete"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuerySuggestion.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

LABEL_3:
  if (objc_msgSend(v9, "count"))
  {
    v21 = 0;
    objc_msgSend(a1, "_recentSuggestionsForPhotoLibrary:error:", v11, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;
    v14 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v14, "removeObjectsInArray:", v9);
    v20 = 0;
    v15 = objc_msgSend(a1, "_saveRecentSuggestions:photoLibrary:error:", v14, v11, &v20);
    v16 = v20;

    if (v15)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = v11;
        _os_log_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Deleted search suggestions: %@, photoLibrary: %@", buf, 0x16u);
        if (!a5)
          goto LABEL_12;
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v9;
      v24 = 2112;
      v25 = v11;
      v26 = 2112;
      v27 = v16;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to delete search suggestions: %@, photoLibrary: %@, error: %@", buf, 0x20u);
      if (!a5)
        goto LABEL_12;
      goto LABEL_11;
    }
    if (!a5)
    {
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    *a5 = objc_retainAutorelease(v16);
    goto LABEL_12;
  }
  LOBYTE(v15) = 1;
LABEL_13:

  return v15;
}

+ (id)_assetUUIDsFromFetchResult:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PHSearchQuerySuggestion__assetUUIDsFromFetchResult___block_invoke;
  v9[3] = &unk_1E35DA078;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_prepareQueryTextForSaving:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (objc_class *)MEMORY[0x1E0CB3778];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v8 = objc_msgSend(v4, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PHSearchQuerySuggestion__prepareQueryTextForSaving___block_invoke;
  v12[3] = &unk_1E35D73E0;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("PHSearchQueryAttributeKey"), 0, v8, 0, v12);

  v10 = (void *)objc_msgSend(v9, "copy");
  return v10;
}

uint64_t __54__PHSearchQuerySuggestion__prepareQueryTextForSaving___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", CFSTR("PHSearchQueryAttributeKey"), a2, a3, a4);
  return result;
}

void __54__PHSearchQuerySuggestion__assetUUIDsFromFetchResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  PHSearchQuerySuggestion *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v30;
  id obj;
  _QWORD v32[5];
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  PLPhotosSearchGetLog();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = os_signpost_id_generate(v1);

  v3 = v1;
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "PLSearchBackendInitialSuggestionGeneration", ", buf, 2u);
  }
  v27 = v4;

  objc_msgSend(*(id *)(a1 + 32), "searchIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unverifiedPsiSearchIndex");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0D717D8], "sharedManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fetchInitialSuggestionsWithLimit:minimumResultCountPerSuggestion:suggestionStyleType:photoLibrary:psiDatabase:", v6, v7, v8, v9, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "count"))
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v42 = 0u;
      v40 = 0u;
      v41 = 0u;
      v39 = 0u;
      obj = v26;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v40;
        v12 = *MEMORY[0x1E0D72D90];
        v13 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v40 != v11)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            *(_QWORD *)buf = 0;
            v34 = buf;
            v35 = 0x3032000000;
            v36 = __Block_byref_object_copy__7729;
            v37 = __Block_byref_object_dispose__7730;
            v38 = 0;
            v16 = objc_msgSend(v15, "length");
            v32[0] = v13;
            v32[1] = 3221225472;
            v32[2] = __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke_42;
            v32[3] = &unk_1E35D7390;
            v32[4] = buf;
            objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v16, 0, v32);
            if (objc_msgSend(*((id *)v34 + 5), "length"))
            {
              +[PHSearchUtility updateInitialSearchQueryStringWithSearchAnnotations:](PHSearchUtility, "updateInitialSearchQueryStringWithSearchAnnotations:", v15);
              v17 = objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v18 = -[PHSearchQuerySuggestion initWithQueryText:type:assetCount:keyAssetUUIDs:]([PHSearchQuerySuggestion alloc], "initWithQueryText:type:assetCount:keyAssetUUIDs:", v17, 1, 0x7FFFFFFFFFFFFFFFLL, 0);
                objc_msgSend(v30, "addObject:", v18);

              }
            }
            else
            {
              PLSearchBackendInitialSuggestionsGetLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v43 = 138412290;
                v44 = v15;
                _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Found invalid initial suggestion containing no template key: %@, suggestion will be skipped.", v43, 0xCu);
              }
            }

            _Block_object_dispose(buf, 8);
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v10);
      }

      v19 = *(_QWORD *)(a1 + 40);
      v20 = (void *)objc_msgSend(v30, "copy");
      (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v20, 0);

      v21 = v27;
      v22 = v21;
      if (v2 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v22, OS_SIGNPOST_INTERVAL_END, v2, "PLSearchBackendInitialSuggestionGeneration", ", buf, 2u);
      }

    }
    else
    {
      PLSearchBackendInitialSuggestionsGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEFAULT, "No initial suggestions found.", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Unexpected nil psiDatabase. No initial suggestions will be generated.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __159__PHSearchQuerySuggestion_initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler___block_invoke()
{
  qos_class_t v0;
  dispatch_qos_class_t v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = objc_claimAutoreleasedReturnValue();
  v0 = qos_class_self();
  if (v0 >= QOS_CLASS_UTILITY)
    v1 = QOS_CLASS_UTILITY;
  else
    v1 = v0;
  dispatch_queue_attr_make_with_qos_class(attr, v1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.photos.search.initial-suggestion-generation", v2);
  v4 = (void *)initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__initialSuggestionGenerationQueue;
  initialSearchQuerySuggestionsForPhotoLibrary_suggestionLimit_minimumResultCountPerSuggestion_suggestionStyleType_suggestionsHandler__initialSuggestionGenerationQueue = (uint64_t)v3;

}

@end
