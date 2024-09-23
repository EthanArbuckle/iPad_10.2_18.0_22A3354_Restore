@implementation PHSearchQuery

- (PHSearchQuery)initWithSearchText:(id)a3 searchOptions:(id)a4 photoLibrary:(id)a5 queryIdentifier:(int)a6 batchIdentifier:(int)a7
{
  NSAttributedString *v13;
  NSAttributedString *v14;
  id v15;
  void *v16;
  PHSearchQuery *v17;
  uint64_t v18;
  NSAttributedString *searchText;
  void *v20;
  void *v21;
  PHSearchQueryOptions *v22;
  PHSearchQueryOptions *searchOptions;
  uint64_t v24;
  CSUserQueryContext *spotlightQueryContext;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSAttributedString *v32;
  uint64_t v33;
  NSAttributedString *queryStringSentToSpotlight;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  CSUserQuery *spotlightQuery;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  PSISuggestionQuery *photosSuggestionsQuery;
  NSObject *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSAttributedString *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  objc_super v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  NSAttributedString *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v13 = (NSAttributedString *)a3;
  v14 = (NSAttributedString *)a4;
  v15 = a5;
  v16 = v15;
  if (v13)
  {
    if (v15)
      goto LABEL_3;
LABEL_73:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQuery.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    if (a6)
      goto LABEL_4;
    goto LABEL_74;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQuery.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchText"));

  if (!v16)
    goto LABEL_73;
LABEL_3:
  if (a6)
    goto LABEL_4;
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQuery.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryIdentifier != PHInvalidSearchQueryID"));

LABEL_4:
  v71.receiver = self;
  v71.super_class = (Class)PHSearchQuery;
  v17 = -[PHSearchQuery init](&v71, sel_init);
  if (!v17)
    goto LABEL_71;
  v18 = -[NSAttributedString copy](v13, "copy");
  searchText = v17->_searchText;
  v17->_searchText = (NSAttributedString *)v18;

  v20 = (void *)-[NSAttributedString copy](v14, "copy");
  v21 = v20;
  if (v20)
    v22 = v20;
  else
    v22 = (PHSearchQueryOptions *)objc_opt_new();
  searchOptions = v17->_searchOptions;
  v17->_searchOptions = v22;

  v17->_queryIdentifier = a6;
  v17->_batchIdentifier = a7;
  objc_storeStrong((id *)&v17->_photoLibrary, a5);
  objc_msgSend((id)objc_opt_class(), "_spotlightQueryContextWithSearchOptions:", v14);
  v24 = objc_claimAutoreleasedReturnValue();
  spotlightQueryContext = v17->_spotlightQueryContext;
  v17->_spotlightQueryContext = (CSUserQueryContext *)v24;

  if (!-[NSAttributedString length](v13, "length"))
  {
    PLSearchBackendQueryGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (v17->_batchIdentifier)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v17->_batchIdentifier, v17->_queryIdentifier);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v17->_queryIdentifier, v69);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v27;
      _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "%{public}@ PHSearchQuery initialized with empty query string.", buf, 0xCu);

    }
  }
  if (-[NSAttributedString excludeOCRTextResultMatches](v14, "excludeOCRTextResultMatches")
    && (-[NSAttributedString enableQueryMatchDetails](v14, "enableQueryMatchDetails") & 1) == 0)
  {
    PLSearchBackendQueryGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      if (v17->_batchIdentifier)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v17->_batchIdentifier, v17->_queryIdentifier);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v17->_queryIdentifier, v69);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v29;
      _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "%{public}@ excludeOCRTextResultMatches set, but enableQueryMatchDetails is not set. OCR result info will not be available for exclusion.", buf, 0xCu);

    }
  }
  if (-[NSAttributedString disableMetadataSearch](v14, "disableMetadataSearch")
    && -[NSAttributedString disableSemanticSearch](v14, "disableSemanticSearch"))
  {
    PLSearchBackendQueryGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      if (v17->_batchIdentifier)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v17->_batchIdentifier, v17->_queryIdentifier);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v17->_queryIdentifier, v69);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v31;
      _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "%{public}@ disableMetadataSearch and disableSemanticSearch options set. Query won't retrieve on anything.", buf, 0xCu);

    }
  }
  +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:](PHSearchUtility, "insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:", v13);
  v32 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  +[PHSearchQueryAnnotation spotlightAttributedQueryStringFromAnnotatedQueryString:](PHSearchQueryAnnotation, "spotlightAttributedQueryStringFromAnnotatedQueryString:", v32);
  v33 = objc_claimAutoreleasedReturnValue();
  queryStringSentToSpotlight = v17->_queryStringSentToSpotlight;
  v17->_queryStringSentToSpotlight = (NSAttributedString *)v33;

  if (objc_msgSend(MEMORY[0x1E0D71B48], "spotlightPrivateIndexEnabled"))
  {
    objc_msgSend(v16, "pathManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "spotlightSearchIndexPath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_alloc(MEMORY[0x1E0CA6B00]);
    -[PHSearchQuery queryStringSentToSpotlight](v17, "queryStringSentToSpotlight");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "initWithUserAttributedQueryString:userQueryContext:path:", v38, v17->_spotlightQueryContext, v36);
    spotlightQuery = v17->_spotlightQuery;
    v17->_spotlightQuery = (CSUserQuery *)v39;

  }
  else
  {
    v41 = objc_alloc(MEMORY[0x1E0CA6B90]);
    -[PHSearchQuery queryStringSentToSpotlight](v17, "queryStringSentToSpotlight");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "initWithUserAttributedQueryString:userQueryContext:", v36, v17->_spotlightQueryContext);
    v38 = v17->_spotlightQuery;
    v17->_spotlightQuery = (CSUserQuery *)v42;
  }

  if (-[NSAttributedString suggestionLimit](v14, "suggestionLimit"))
  {
    objc_msgSend(v16, "searchIndex");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "unverifiedPsiSearchIndex");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      -[PHSearchQuery searchText](v17, "searchText");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = +[PHSearchUtility suggestionTypeForQueryString:locationInQueryStringForSuggestionGeneration:](PHSearchUtility, "suggestionTypeForQueryString:locationInQueryStringForSuggestionGeneration:", v45, -[NSAttributedString locationInQueryStringForSuggestionGeneration](v14, "locationInQueryStringForSuggestionGeneration"));

      if (!v46)
      {
LABEL_54:

        goto LABEL_55;
      }
      v47 = 0x7FFFFFFFFFFFFFFFLL;
      if (-[NSAttributedString locationInQueryStringForSuggestionGeneration](v14, "locationInQueryStringForSuggestionGeneration") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = +[PHSearchUtility numberOfInsertedSpacesBetweenAnnotationsAndPlainTextInQueryString:beforeLocation:](PHSearchUtility, "numberOfInsertedSpacesBetweenAnnotationsAndPlainTextInQueryString:beforeLocation:", v13, -[NSAttributedString locationInQueryStringForSuggestionGeneration](v14, "locationInQueryStringForSuggestionGeneration"));
        v47 = -[NSAttributedString locationInQueryStringForSuggestionGeneration](v14, "locationInQueryStringForSuggestionGeneration")+ v48;
      }
      v49 = -[NSAttributedString suggestionLimit](v14, "suggestionLimit");
      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71C10]), "initWithSuggestionType:suggestionLimit:", v46, v49);
      -[NSObject setLimitSuggestionsToExactTextMatches:](v50, "setLimitSuggestionsToExactTextMatches:", -[NSAttributedString limitSuggestionsToExactTextMatches](v14, "limitSuggestionsToExactTextMatches"));
      -[NSObject setSuggestionResultTypes:](v50, "setSuggestionResultTypes:", objc_msgSend((id)objc_opt_class(), "_searchResultTypesFromSearchQueryResultTypes:", -[NSAttributedString searchQueryResultTypes](v14, "searchQueryResultTypes")));
      -[NSObject setLocationInQueryStringForSuggestionGeneration:](v50, "setLocationInQueryStringForSuggestionGeneration:", v47);
      -[NSObject setMinNumberOfResultsForNextTokenGeneration:](v50, "setMinNumberOfResultsForNextTokenGeneration:", -[NSAttributedString minNumberOfResultsForNextTokenGeneration](v14, "minNumberOfResultsForNextTokenGeneration"));
      -[NSObject setEnableNextTokenSuggestions:](v50, "setEnableNextTokenSuggestions:", -[NSAttributedString enableNextTokenSuggestions](v14, "enableNextTokenSuggestions"));
      v70 = v16;
      if (-[NSObject searchSuggestionType](v50, "searchSuggestionType") == 1)
      {
        +[PHSearchUtility completionSuggestionTextsForQueryString:locationInQueryString:](PHSearchUtility, "completionSuggestionTextsForQueryString:locationInQueryString:", v32, v47);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v51 = (void *)MEMORY[0x1E0C9AA60];
      }
      +[PHSearchUtility suggestionComponentsInQueryString:](PHSearchUtility, "suggestionComponentsInQueryString:", v32);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71C18]), "initWithFormattedSearchText:originalSearchText:completionSuggestionTexts:suggestionOptions:suggestionComponents:photosEntityStore:", v32, v13, v51, v50, v52, v44);
      photosSuggestionsQuery = v17->_photosSuggestionsQuery;
      v17->_photosSuggestionsQuery = (PSISuggestionQuery *)v53;

      PLSearchBackendQueryGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        if (v17->_batchIdentifier)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v17->_batchIdentifier, v17->_queryIdentifier);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v17->_queryIdentifier, v69);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v73 = v56;
        v74 = 2112;
        v75 = v32;
        v76 = 2112;
        v77 = v51;
        v78 = 2112;
        v79 = v52;
        _os_log_impl(&dword_1991EC000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ Initializing PSISuggestionQuery with query string: \"%@\", completion suggestion texts: \"%@\", query suggestion components: \"%@\".", buf, 0x2Au);

      }
      v16 = v70;
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        if (v17->_batchIdentifier)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v17->_batchIdentifier, v17->_queryIdentifier);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v17->_queryIdentifier, v69);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v73 = v57;
        _os_log_impl(&dword_1991EC000, v50, OS_LOG_TYPE_ERROR, "%{public}@ Unable to access Photos Entity Store (PSI database).", buf, 0xCu);

      }
    }

    goto LABEL_54;
  }
LABEL_55:
  PLSearchBackendQueryGetLog();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    if (v17->_batchIdentifier)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v17->_batchIdentifier, v17->_queryIdentifier);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v17->_queryIdentifier, v69);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v17->_queryStringSentToSpotlight;
    *(_DWORD *)buf = 138543618;
    v73 = v59;
    v74 = 2112;
    v75 = v60;
    _os_log_impl(&dword_1991EC000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ Initializing PHSearchQuery with Spotlight query string: \"%@\".", buf, 0x16u);

  }
  PLSearchBackendQueryGetLog();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    if (v17->_batchIdentifier)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v17->_batchIdentifier, v17->_queryIdentifier);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v17->_queryIdentifier, v69);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v62;
    v74 = 2112;
    v75 = v14;
    _os_log_impl(&dword_1991EC000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ Initializing PHSearchQuery with Search Options: %@", buf, 0x16u);

  }
  PLSearchBackendQueryGetLog();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    if (v17->_batchIdentifier)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v17->_batchIdentifier, v17->_queryIdentifier);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v17->_queryIdentifier, v69);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v64;
    v74 = 2112;
    v75 = v13;
    _os_log_impl(&dword_1991EC000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ Initialized PHSearchQuery for searchText: \"%@\", buf, 0x16u);

  }
LABEL_71:

  return v17;
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  PHSearchQuery *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PHSearchQuery setIsCancelled:](self, "setIsCancelled:", 1);
  PLSearchBackendQueryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (-[PHSearchQuery batchIdentifier](self, "batchIdentifier"))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), -[PHSearchQuery batchIdentifier](self, "batchIdentifier"), -[PHSearchQuery queryIdentifier](self, "queryIdentifier"));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), -[PHSearchQuery queryIdentifier](self, "queryIdentifier"), v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v4;
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ PHSearchQuery cancelled: %@", buf, 0x16u);

  }
  -[PHSearchQuery spotlightQuery](self, "spotlightQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[PHSearchQuery photosSuggestionsQuery](self, "photosSuggestionsQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

}

- (void)_executeSpotlightSearchWithResultsHandler:(id)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _BYTE *v33;
  _QWORD *v34;
  _QWORD *v35;
  id v36;
  NSObject *v37;
  os_signpost_id_t v38;
  int v39;
  int v40;
  _QWORD v41[6];
  id v42;
  int v43;
  int v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[5];
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  id location;
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  PLPhotosSearchGetLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLSearchBackendQuerySpotlightQuery", ", buf, 2u);
  }

  v8 = -[PHSearchQuery batchIdentifier](self, "batchIdentifier");
  v9 = -[PHSearchQuery queryIdentifier](self, "queryIdentifier");
  PLSearchBackendQueryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v8)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v8, v9);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchQuery spotlightQuery](self, "spotlightQuery");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchQuery queryStringSentToSpotlight](self, "queryStringSentToSpotlight");
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v55 = v13;
    _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Start Spotlight query: %@, queryString: \"%@\".", buf, 0x20u);

  }
  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__28044;
  v56 = __Block_byref_object_dispose__28045;
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__28044;
  v51[4] = __Block_byref_object_dispose__28045;
  v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__28044;
  v49[4] = __Block_byref_object_dispose__28045;
  v14 = MEMORY[0x1E0C809B0];
  v50 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke;
  v48[3] = &unk_1E35DBDE8;
  v48[4] = buf;
  -[PHSearchQuery spotlightQuery](self, "spotlightQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFoundItemsHandler:", v48);

  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_2;
  v45[3] = &unk_1E35DBE10;
  v18 = v16;
  v46 = v18;
  v19 = v17;
  v47 = v19;
  -[PHSearchQuery spotlightQuery](self, "spotlightQuery");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPhotosComputedAttributesHandler:", v45);

  v41[0] = v14;
  v41[1] = 3221225472;
  v41[2] = __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_73;
  v41[3] = &unk_1E35DBE38;
  v41[4] = v51;
  objc_copyWeak(&v42, &location);
  v41[5] = v49;
  v43 = v8;
  v44 = v9;
  -[PHSearchQuery spotlightQuery](self, "spotlightQuery");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAttributedQueryHandler:", v41);

  v29[0] = v14;
  v29[1] = 3254779904;
  v29[2] = __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_75;
  v29[3] = &unk_1E35D50E8;
  v22 = v7;
  v37 = v22;
  v38 = v5;
  v39 = v9;
  v40 = v8;
  v33 = buf;
  v34 = v49;
  objc_copyWeak(&v36, &location);
  v35 = v51;
  v23 = v18;
  v30 = v23;
  v24 = v19;
  v31 = v24;
  v25 = v28;
  v32 = v25;
  -[PHSearchQuery spotlightQuery](self, "spotlightQuery");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCompletionHandler:", v29);

  -[PHSearchQuery spotlightQuery](self, "spotlightQuery");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "start");

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v42);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

}

- (id)_executePhotosEntityStoreSearchWithAssetUUIDs:(id)a3 collectionUUIDs:(id)a4 rangeOfSuggestionText:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id v28;
  id v29;
  uint8_t buf[4];
  _BYTE v31[10];
  _BYTE v32[10];
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  length = a5.length;
  location = a5.location;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v28 = a4;
  PLPhotosSearchGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PLSearchBackendQuerySuggestions", ", buf, 2u);
  }

  -[PHSearchQuery photosSuggestionsQuery](self, "photosSuggestionsQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performQueryWithSearchResultAssetUUIDs:collectionUUIDs:", v9, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v9;
  v29 = 0;
  +[PHSearchProcessor searchSuggestionsFromPLSearchSuggestions:suggestions:queryId:batchId:rangeOfSuggestionText:](PHSearchProcessor, "searchSuggestionsFromPLSearchSuggestions:suggestions:queryId:batchId:rangeOfSuggestionText:", v15, &v29, -[PHSearchQuery queryIdentifier](self, "queryIdentifier"), -[PHSearchQuery batchIdentifier](self, "batchIdentifier"), location, length);
  v17 = v29;
  v18 = -[PHSearchQuery queryIdentifier](self, "queryIdentifier");
  v19 = -[PHSearchQuery batchIdentifier](self, "batchIdentifier");
  v20 = v13;
  v21 = v20;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v22 = objc_msgSend(v9, "count");
    v23 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v31 = v18;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = v19;
    *(_WORD *)v32 = 2048;
    *(_QWORD *)&v32[2] = v22;
    v33 = 2048;
    v34 = v23;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v21, OS_SIGNPOST_INTERVAL_END, v11, "PLSearchBackendQuerySuggestions", "Query: %d, Batch: %d, Input Assets: %tu, Input Collections: %tu", buf, 0x22u);
    v9 = v16;
  }

  PLSearchBackendQueryGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v19)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v19, v18);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v31 = v25;
    *(_WORD *)&v31[8] = 2048;
    *(_QWORD *)v32 = v26;
    _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Suggestion generation completed with %tu suggestions.", buf, 0x16u);

  }
  return v17;
}

- (void)setIsCancelled:(BOOL)a3
{
  PHSearchQuery *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isCancelled = a3;
  objc_sync_exit(obj);

}

- (BOOL)isCancelled
{
  PHSearchQuery *v2;
  BOOL isCancelled;

  v2 = self;
  objc_sync_enter(v2);
  isCancelled = v2->_isCancelled;
  objc_sync_exit(v2);

  return isCancelled;
}

- (BOOL)isEqual:(id)a3
{
  PHSearchQuery *v4;
  PHSearchQuery *v5;
  int v6;
  int v7;
  BOOL v8;

  v4 = (PHSearchQuery *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PHSearchQuery queryIdentifier](self, "queryIdentifier");
      v7 = -[PHSearchQuery queryIdentifier](v5, "queryIdentifier");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PHSearchQuery queryIdentifier](self, "queryIdentifier");
  v5 = -[PHSearchQuery batchIdentifier](self, "batchIdentifier");
  if (-[PHSearchQuery isCancelled](self, "isCancelled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  -[PHSearchQuery searchText](self, "searchText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (PLIsFeaturedContentAllowed())
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v9;
  -[PHSearchQuery searchOptions](self, "searchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("QueryId: %d, BatchId: %d, isCancelled: %@, SearchText: '%@', FeaturedContentAllowed: %@, SearchOptions: %@"), v4, v5, v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[8];
  _QWORD v23[10];

  v23[8] = *MEMORY[0x1E0C80C00];
  v15 = objc_alloc(MEMORY[0x1E0C99E08]);
  v22[0] = CFSTR("searchOptions");
  -[PHSearchQuery searchOptions](self, "searchOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "jsonDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  v22[1] = CFSTR("searchText");
  -[PHSearchQuery searchText](self, "searchText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v18;
  v22[2] = CFSTR("queryIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PHSearchQuery queryIdentifier](self, "queryIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  v22[3] = CFSTR("batchIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PHSearchQuery batchIdentifier](self, "batchIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  v22[4] = CFSTR("isCancelled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHSearchQuery isCancelled](self, "isCancelled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v3;
  v22[5] = CFSTR("isFeaturedContentAllowed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", PLIsFeaturedContentAllowed());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v4;
  v22[6] = CFSTR("queryStringSentToSpotlight");
  -[PHSearchQuery queryStringSentToSpotlight](self, "queryStringSentToSpotlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[6] = v7;
  v22[7] = CFSTR("spotlightFetchAttributes");
  -[PHSearchQuery spotlightQueryContext](self, "spotlightQueryContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithDictionary:", v11);

  if (!v9)
  if (!v6)

  v13 = (void *)objc_msgSend(v12, "copy");
  return v13;
}

- (PHSearchQueryOptions)searchOptions
{
  return self->_searchOptions;
}

- (NSAttributedString)searchText
{
  return self->_searchText;
}

- (int)queryIdentifier
{
  return self->_queryIdentifier;
}

- (int)batchIdentifier
{
  return self->_batchIdentifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (CSUserQuery)spotlightQuery
{
  return self->_spotlightQuery;
}

- (CSUserQueryContext)spotlightQueryContext
{
  return self->_spotlightQueryContext;
}

- (PSISuggestionQuery)photosSuggestionsQuery
{
  return self->_photosSuggestionsQuery;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSAttributedString)queryStringSentToSpotlight
{
  return self->_queryStringSentToSpotlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryStringSentToSpotlight, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_photosSuggestionsQuery, 0);
  objc_storeStrong((id *)&self->_spotlightQueryContext, 0);
  objc_storeStrong((id *)&self->_spotlightQuery, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_searchOptions, 0);
}

uint64_t __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObjectsFromArray:", a2);
}

void __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend((id)*MEMORY[0x1E0CA6648], "isEqualToString:", v5))
  {
    v7 = *(void **)(a1 + 32);
LABEL_5:
    objc_msgSend(v7, "addObjectsFromArray:", v6);
    goto LABEL_9;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0CA5EF0], "isEqualToString:", v5))
  {
    v7 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  PLSearchBackendQueryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Unexpected attribute found in photosComputedAttributesHandler. Attribute: %@, values: %@", (uint8_t *)&v9, 0x16u);
  }

LABEL_9:
}

void __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_73(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "searchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enableQueryUnderstanding");
  if (v7)
  {
    objc_msgSend(v4, "query");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v2, "copy");
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v8);
  if (v7)
  {

  }
  objc_msgSend(v4, "queryEmbedding");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  PLSearchBackendQueryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 56))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 60), v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Spotlight QU annotated query: \"%@\", buf, 0x16u);

  }
  PLSearchBackendQueryGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 56))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 60), v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Spotlight Query Embedding: %@", buf, 0x16u);

  }
}

void __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  id WeakRetained;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  PHSearchProcessor *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  _BYTE v55[10];
  _BYTE v56[10];
  _QWORD v57[5];

  v57[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 88);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 96);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = *(_DWORD *)(a1 + 104);
    v8 = *(_DWORD *)(a1 + 108);
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v11 = v10;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v55 = v7;
    *(_WORD *)&v55[4] = 1024;
    *(_DWORD *)&v55[6] = v8;
    *(_WORD *)v56 = 2048;
    *(_QWORD *)&v56[2] = v9;
    LOWORD(v57[0]) = 2112;
    *(_QWORD *)((char *)v57 + 2) = v11;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLSearchBackendQuerySpotlightQuery", "Query: %d, Batch: %d, CSSearchableItems: %tu, QueryEmbedding: %@", buf, 0x22u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  PLSearchBackendQueryGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 108))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 108), *(unsigned int *)(a1 + 104));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 104), v41);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v55 = v14;
    *(_WORD *)&v55[8] = 2048;
    *(_QWORD *)v56 = v15;
    _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Spotlight returned %tu items.", buf, 0x16u);

  }
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) != 0)
  {
    v16 = 0;
    v17 = 0;
    v18 = (id)MEMORY[0x1E0C9AA60];
    v19 = (id)MEMORY[0x1E0C9AA60];
    v46 = (id)MEMORY[0x1E0C9AA60];
    v47 = (id)MEMORY[0x1E0C9AA60];
    v44 = (id)MEMORY[0x1E0C9AA60];
    v45 = (id)MEMORY[0x1E0C9AA60];
    if (!v3)
      goto LABEL_24;
    goto LABEL_18;
  }
  v42 = v3;
  objc_msgSend(WeakRetained, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "searchIndex");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unverifiedPsiSearchIndex");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v24 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v24, "photoLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHSearchQueryAnnotation annotatedQueryStringFromSpotlightAttributedQueryString:forSearchQuery:photosEntityStore:photoLibrary:](PHSearchQueryAnnotation, "annotatedQueryStringFromSpotlightAttributedQueryString:forSearchQuery:photosEntityStore:photoLibrary:", v23, WeakRetained, v22, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc_init(PHSearchProcessor);
  v27 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "copy");
  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  -[PHSearchProcessor searchResultsFromSpotlightSearchableItems:query:annotatedQueryString:searchResults:unfilteredAssetSearchResults:rankedAssetSearchResults:rankedCollectionSearchResults:assetUUIDsForSuggestions:collectionUUIDsForSuggestions:](v26, "searchResultsFromSpotlightSearchableItems:query:annotatedQueryString:searchResults:unfilteredAssetSearchResults:rankedAssetSearchResults:rankedCollectionSearchResults:assetUUIDsForSuggestions:collectionUUIDsForSuggestions:", v27, WeakRetained, v17, &v53, &v52, &v51, &v50, &v49, &v48);
  v18 = v53;
  v19 = v52;
  v47 = v51;
  v46 = v50;
  v45 = v49;
  v44 = v48;

  objc_msgSend(WeakRetained, "searchOptions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "enableQueryMatchDetails");

  v16 = 0;
  if (v29)
  {
    +[PHSearchProcessor queryMatchDetailsForSearchResults:queryText:queryEmbedding:matchedPersonUUIDs:matchedScenes:queryId:](PHSearchProcessor, "queryMatchDetailsForSearchResults:queryText:queryEmbedding:matchedPersonUUIDs:matchedScenes:queryId:", v18, v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v3 = v42;
  if (v42)
  {
LABEL_18:
    PLSearchBackendQueryGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      if (*(_DWORD *)(a1 + 108))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 108), *(unsigned int *)(a1 + 104));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 104), v41);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v55 = v31;
      *(_WORD *)&v55[8] = 2112;
      *(_QWORD *)v56 = v3;
      _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Spotlight Query error: %@", buf, 0x16u);

    }
  }
LABEL_24:
  PLSearchBackendQueryGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v43 = v17;
    v33 = v19;
    v34 = v3;
    if (*(_DWORD *)(a1 + 108))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 108), *(unsigned int *)(a1 + 104));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 104), v41);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "spotlightQuery");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "queryString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v55 = v35;
    *(_WORD *)&v55[8] = 2112;
    *(_QWORD *)v56 = v37;
    _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Spotlight query completed for \"%@\".", buf, 0x16u);

    v3 = v34;
    v19 = v33;
    v17 = v43;
  }

  PLSearchBackendQueryGetLog();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 108))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 108), *(unsigned int *)(a1 + 104));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 104), v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v55 = v39;
    *(_WORD *)&v55[8] = 2048;
    *(_QWORD *)v56 = v40;
    *(_WORD *)&v56[8] = 2112;
    v57[0] = v16;
    _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %tu search results. Match details: %@", buf, 0x20u);

  }
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v18, v19);

}

+ (void)performSearch:(id)a3 queryQueue:(id)a4 resultsHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  int v38;
  int v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuery.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryQueue"));

    if (v11)
      goto LABEL_4;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuery.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

  if (!v10)
    goto LABEL_26;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuery.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultsHandler"));

LABEL_4:
  v12 = objc_msgSend(v9, "batchIdentifier");
  v13 = objc_msgSend(v9, "queryIdentifier");
  PLSearchBackendQueryGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v12)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v12, v13);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v13, v33);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v15;
    v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Perform Search: %@", buf, 0x16u);

  }
  PLSearchBackendQueryGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v12)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v12, v13);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v13, v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v17;
    v42 = 2112;
    v43 = v18;
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Search Options: %@", buf, 0x16u);

  }
  PLSearchBackendQueryGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v12)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v12, v13);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v13, v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryStringSentToSpotlight");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v20;
    v42 = 2112;
    v43 = v21;
    _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Query string sent to Spotlight: %@", buf, 0x16u);

  }
  PLSearchBackendQueryGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v12)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v12, v13);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v13, v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v23;
    v42 = 2112;
    v43 = v25;
    _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Plain text query string: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStartDate:", v26);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke;
  block[3] = &unk_1E35DF638;
  v36 = v10;
  v37 = v11;
  v35 = v9;
  v38 = v12;
  v39 = v13;
  v27 = v10;
  v28 = v11;
  v29 = v9;
  dispatch_async(v27, block);

}

+ (void)suggestionsForSearchQuery:(id)a3 searchQueryResult:(id)a4 rangeOfSuggestionText:(_NSRange)a5 queryQueue:(id)a6 suggestionsHandler:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  NSUInteger v29;
  NSUInteger v30;

  length = a5.length;
  location = a5.location;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuery.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQuery"));

    if (v16)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuery.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchQueryResult"));

      if (v17)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuery.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionsHandler"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchQuery.m"), 275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryQueue"));

  if (!v15)
    goto LABEL_8;
LABEL_4:
  if (!v17)
    goto LABEL_9;
LABEL_5:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__PHSearchQuery_suggestionsForSearchQuery_searchQueryResult_rangeOfSuggestionText_queryQueue_suggestionsHandler___block_invoke;
  block[3] = &unk_1E35DBDC0;
  v26 = v15;
  v27 = v14;
  v29 = location;
  v30 = length;
  v28 = v17;
  v18 = v17;
  v19 = v14;
  v20 = v15;
  dispatch_async(v16, block);

}

+ (id)_spotlightQueryContextWithSearchOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[4];
  _QWORD v33[3];
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CA6B98], "userQueryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLSearchFileProtectionTypes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProtectionClasses:", v5);

  v37[0] = CFSTR("com.apple.mobileslideshow");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIDs:", v6);

  objc_msgSend(v4, "setDisableBlockingOnIndex:", 1);
  if (objc_msgSend(v3, "maxSearchResults"))
  {
    v7 = objc_msgSend(v3, "maxSearchResults");
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "maxSearchResults == 0, forcing maxResultCount = 1000000 due to rdar://123315356", buf, 2u);
    }

    v7 = 1000000;
  }
  objc_msgSend(v4, "setMaxResultCount:", v7);
  v9 = PLSearchSemanticSearchQueriesSupported();
  v10 = objc_msgSend(v3, "disableSemanticSearch");
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if ((v10 & 1) != 0)
      goto LABEL_12;
    PLSearchBackendQueryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEFAULT, "Embedding search not supported. Embedding search will not run.", buf, 2u);
    }

    v11 = 1;
  }
  objc_msgSend(v4, "setDisableSemanticSearch:", v11);
LABEL_12:
  objc_msgSend(v4, "setDisableMetadataSearch:", objc_msgSend(v3, "disableMetadataSearch", v11));
  objc_msgSend(v4, "setDisableSafetyCheck:", objc_msgSend(v3, "disableSafetyCheck"));
  objc_msgSend(v3, "embeddingRelevanceThreshold");
  if (v13 != -1.0)
  {
    PLSearchBackendQueryGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "embeddingRelevanceThreshold");
      *(_DWORD *)buf = 134217984;
      v36 = v15;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "[OVERRIDE SET] Set the queryContext.embeddingRelevanceThreshold to %lf", buf, 0xCu);
    }

    objc_msgSend(v3, "embeddingRelevanceThreshold");
    objc_msgSend(v4, "setEmbeddingRelevanceThreshold:");
  }
  if (objc_msgSend(v3, "embeddingGenerationTimeout") != -1)
    objc_msgSend(v4, "setEmbeddingGenerationTimeout:", objc_msgSend(v3, "embeddingGenerationTimeout"));
  objc_msgSend(v4, "setDisableU2:", objc_msgSend(v3, "disableU2"));
  v16 = (void *)MEMORY[0x1E0C99DE8];
  v34 = *MEMORY[0x1E0CA6650];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "enableQueryMatchDetails"))
  {
    objc_msgSend(v4, "setComputePhotosDerivedAttributes:", 1);
    v19 = *MEMORY[0x1E0CA6A90];
    v33[0] = *MEMORY[0x1E0CA6AA8];
    v33[1] = v19;
    v33[2] = *MEMORY[0x1E0D72E50];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObjectsFromArray:", v20);

    if ((objc_msgSend(v3, "disableSemanticSearch") & 1) == 0)
      objc_msgSend(v18, "addObject:", *MEMORY[0x1E0CA6A60]);
  }
  if (objc_msgSend(v3, "maxRankedAssetSearchResults") >= 1)
  {
    objc_msgSend(v18, "addObject:", *MEMORY[0x1E0CA6A98]);
    if ((objc_msgSend(v3, "fastRanking") & 1) == 0)
    {
      objc_msgSend(v4, "setEnableRankedResults:", 1);
      objc_msgSend(v4, "setMaxRankedResultCount:", objc_msgSend(v3, "maxRankedAssetSearchResults"));
      objc_msgSend(v18, "addObject:", *MEMORY[0x1E0CA6AA0]);
    }
  }
  if ((objc_msgSend(v3, "searchQueryResultTypes") & 2) != 0)
  {
    v21 = *MEMORY[0x1E0D72E20];
    v32[0] = *MEMORY[0x1E0D72E28];
    v32[1] = v21;
    v22 = *MEMORY[0x1E0D72E30];
    v32[2] = *MEMORY[0x1E0D72E38];
    v32[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObjectsFromArray:", v23);

    if (PLIsFeaturedContentAllowed())
    {
      v24 = *MEMORY[0x1E0D72E40];
      v31[0] = *MEMORY[0x1E0D72E48];
      v31[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v25);

    }
  }
  v26 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v4, "setFetchAttributes:", v26);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FieldMatch(_kMDItemDomainIdentifier, %@)"), *MEMORY[0x1E0D72E58]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterQueries:", v28);

  return v4;
}

+ (unint64_t)_searchResultTypesFromSearchQueryResultTypes:(unint64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if ((a3 & 1) == 0)
    v3 = 2;
  if ((~(_BYTE)a3 & 3) != 0)
    return v3;
  else
    return v3 | 2;
}

void __113__PHSearchQuery_suggestionsForSearchQuery_searchQueryResult_rangeOfSuggestionText_queryQueue_suggestionsHandler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "searchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __113__PHSearchQuery_suggestionsForSearchQuery_searchQueryResult_rangeOfSuggestionText_queryQueue_suggestionsHandler___block_invoke_2;
  v26 = &unk_1E35DBD98;
  v5 = v2;
  v27 = v5;
  v6 = v3;
  v28 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v23);

  v7 = *(void **)(a1 + 40);
  v8 = (void *)objc_msgSend(v5, "copy");
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v7, "_executePhotosEntityStoreSearchWithAssetUUIDs:collectionUUIDs:rangeOfSuggestionText:", v8, v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
  if (v11)
    v12 = 2;
  else
    v12 = 1;
  if (v11)
    v13 = (void *)MEMORY[0x1E0C9AA60];
  else
    v13 = v10;
  (*(void (**)(_QWORD, void *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v13, v12, 0);
  PLSearchBackendQueryGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(*(id *)(a1 + 40), "batchIdentifier");
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = *(void **)(a1 + 40);
    if (v15)
    {
      v18 = objc_msgSend(v17, "batchIdentifier");
      v22 = objc_msgSend(*(id *)(a1 + 40), "queryIdentifier");
      objc_msgSend(v16, "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v18, v22, v23, v24, v25, v26, v27);
    }
    else
    {
      v20 = objc_msgSend(v17, "queryIdentifier");
      objc_msgSend(v16, "stringWithFormat:", CFSTR("[Query: %d]"), v20, v21, v23, v24, v25, v26, v27);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v19;
    v31 = 2048;
    v32 = v12;
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Suggestions for search query completed. Status: %tu, Suggestions: %@", buf, 0x20u);

  }
}

void __113__PHSearchQuery_suggestionsForSearchQuery_searchQueryResult_rangeOfSuggestionText_queryQueue_suggestionsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "type");
  if ((unint64_t)(v3 - 2) < 3)
  {
    v4 = *(void **)(a1 + 40);
LABEL_5:
    objc_msgSend(v6, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    goto LABEL_6;
  }
  if (v3 == 1)
  {
    v4 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
LABEL_6:

}

void __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  PHSearchQueryResult *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;

  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEndDate:", v2);

    v3 = *(_QWORD *)(a1 + 48);
    v17 = -[PHSearchQueryResult initWithSearchQuery:]([PHSearchQueryResult alloc], "initWithSearchQuery:", *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, PHSearchQueryResult *, uint64_t, _QWORD))(v3 + 16))(v3, v17, 2, 0);

  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71B90]), "initWithQueue:name:", *(_QWORD *)(a1 + 40), CFSTR("PHSearchQuery performSearch"));
    objc_msgSend(*(id *)(a1 + 32), "searchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightQueryTimeout");
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (*(_DWORD *)(a1 + 56))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 60), v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Spotlight query: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enterWithTimeout:name:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__28044;
    v30[4] = __Block_byref_object_dispose__28045;
    v31 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v13 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_55;
    v23[3] = &unk_1E35DBD70;
    v28 = v30;
    v14 = v11;
    v24 = v14;
    v25 = *(id *)(a1 + 32);
    v26 = *(id *)(a1 + 40);
    v29 = *(_QWORD *)(a1 + 56);
    v27 = *(id *)(a1 + 48);
    objc_msgSend(v13, "_executeSpotlightSearchWithResultsHandler:", v23);
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_59;
    v18[3] = &unk_1E35DF638;
    v15 = v14;
    v19 = v15;
    v20 = *(id *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 56);
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v4, "notify:", v18);

    _Block_object_dispose(v30, 8);
  }
}

void __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_55(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  char v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  NSObject *queue;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD block[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  _QWORD v70[5];
  id v71;

  v52 = a2;
  v51 = a3;
  v49 = a4;
  v48 = a5;
  v50 = a6;
  v18 = a7;
  v47 = a8;
  v46 = a9;
  v44 = a10;
  v19 = a11;
  v20 = (void *)MEMORY[0x1E0D732B8];
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v19);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
    v24 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "successWithResult:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;
    v24 = 1;
  }

  objc_msgSend(*(id *)(a1 + 32), "leaveWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v28 = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
  v29 = v28;
  v30 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__28044;
  v70[4] = __Block_byref_object_dispose__28045;
  v71 = 0;
  if (!v19 && (v28 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "photosSuggestionsQuery");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 && objc_msgSend(v52, "count"))
      v30 = objc_msgSend(*(id *)(a1 + 40), "isCancelled") ^ 1;
    else
      v30 = 0;

  }
  if (v29)
    v32 = 2;
  else
    v32 = v24;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_2;
  block[3] = &unk_1E35DBD48;
  v69 = v30;
  queue = *(NSObject **)(a1 + 48);
  v54 = *(id *)(a1 + 40);
  v55 = v50;
  v56 = v18;
  v57 = v52;
  v41 = v18;
  v58 = v51;
  v59 = v49;
  v60 = v48;
  v61 = v47;
  v62 = v46;
  v63 = v44;
  v68 = *(_QWORD *)(a1 + 72);
  v66 = v70;
  v67 = v32;
  v64 = v19;
  v65 = *(id *)(a1 + 56);
  v43 = v19;
  v45 = v44;
  v33 = v46;
  v34 = v47;
  v35 = v48;
  v36 = v49;
  v37 = v51;
  v38 = v52;
  v39 = v41;
  v40 = v50;
  dispatch_async(queue, block);

  _Block_object_dispose(v70, 8);
}

void __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_59(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PHSearchQueryResult *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  PHSearchQueryResult *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "didTimeout"))
  {
    objc_msgSend(*(id *)(a1 + 40), "cancel");
    objc_msgSend(*(id *)(a1 + 40), "searchOptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "spotlightQueryTimeout");
    v4 = v3;

    v5 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2938];
    v6 = (void *)MEMORY[0x1E0CB3940];
    if (*(_DWORD *)(a1 + 56))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 60), v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Spotlight query: %@, timed out in %0.4fs"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 6100, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[PHSearchQueryResult initWithSearchQuery:]([PHSearchQueryResult alloc], "initWithSearchQuery:", *(_QWORD *)(a1 + 40));
    PLSearchBackendQueryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (*(_DWORD *)(a1 + 56))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 60), v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v17 = v13;
      v18 = 2048;
      v19 = v4;
      v20 = 2048;
      v21 = 3;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Query timed out in %0.4fs, with status: %tu, error: %@, result: %@", buf, 0x34u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  char v5;
  PHSearchQueryResult *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  PHSearchQueryResult *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 152);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_executePhotosEntityStoreSearchWithAssetUUIDs:collectionUUIDs:rangeOfSuggestionText:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0x7FFFFFFFFFFFFFFFLL, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v6 = [PHSearchQueryResult alloc];
    v7 = *(_QWORD *)(a1 + 32);
    if ((v5 & 1) != 0)
      v8 = -[PHSearchQueryResult initWithSearchQuery:](v6, "initWithSearchQuery:", v7);
    else
      v8 = -[PHSearchQueryResult initWithSearchQuery:searchResults:unfilteredAssetSearchResults:rankedAssetSearchResults:rankedCollectionSearchResults:searchSuggestions:queryMatchDetails:annotatedQueryString:queryStringReceivedFromSpotlight:](v6, "initWithSearchQuery:searchResults:unfilteredAssetSearchResults:rankedAssetSearchResults:rankedCollectionSearchResults:searchSuggestions:queryMatchDetails:annotatedQueryString:queryStringReceivedFromSpotlight:", v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v4, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v8;

  }
  else
  {
    v9 = objc_msgSend(v3, "isCancelled");
    v10 = [PHSearchQueryResult alloc];
    v11 = *(_QWORD *)(a1 + 32);
    if ((v9 & 1) != 0)
      v12 = -[PHSearchQueryResult initWithSearchQuery:](v10, "initWithSearchQuery:", v11);
    else
      v12 = -[PHSearchQueryResult initWithSearchQuery:searchResults:unfilteredAssetSearchResults:rankedAssetSearchResults:rankedCollectionSearchResults:searchSuggestions:queryMatchDetails:annotatedQueryString:queryStringReceivedFromSpotlight:](v10, "initWithSearchQuery:searchResults:unfilteredAssetSearchResults:rankedAssetSearchResults:rankedCollectionSearchResults:searchSuggestions:queryMatchDetails:annotatedQueryString:queryStringReceivedFromSpotlight:", v11, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104));
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
    v4 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v12;
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEndDate:", v16);

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v18);
  v20 = v19;

  PLSearchBackendQueryGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 144))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 144), *(unsigned int *)(a1 + 148));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 148), v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 112);
    v24 = *(_QWORD *)(a1 + 136);
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
    *(_DWORD *)buf = 138544386;
    v29 = v22;
    v30 = 2048;
    v31 = v20;
    v32 = 2048;
    v33 = v24;
    v34 = 2112;
    v35 = v23;
    v36 = 2112;
    v37 = v25;
    _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Query completed in %0.4fs, with status: %tu, error: %@, result: %@", buf, 0x34u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 120) + 16))();
}

@end
