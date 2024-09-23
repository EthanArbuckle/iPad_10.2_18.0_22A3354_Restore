@implementation PHSearchProcessor

- (PHSearchProcessor)init
{
  PHSearchProcessor *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PHSearchProcessor;
  v2 = -[PHSearchProcessor init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CA6AC0]);
    v4 = (void *)objc_msgSend(v3, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", *MEMORY[0x1E0D72E28], 0, 0, 0, 1);
    -[PHSearchProcessor setPhotosAlbumIdentifiersKey:](v2, "setPhotosAlbumIdentifiersKey:", v4);

    v5 = objc_alloc(MEMORY[0x1E0CA6AC0]);
    v6 = (void *)objc_msgSend(v5, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", *MEMORY[0x1E0D72E20], 0, 0, 0, 1);
    -[PHSearchProcessor setPhotosAlbumAssetCountsKey:](v2, "setPhotosAlbumAssetCountsKey:", v6);

    v7 = objc_alloc(MEMORY[0x1E0CA6AC0]);
    v8 = (void *)objc_msgSend(v7, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", *MEMORY[0x1E0D72E48], 0, 0, 0, 1);
    -[PHSearchProcessor setPhotosMemoryIdentifiersKey:](v2, "setPhotosMemoryIdentifiersKey:", v8);

    v9 = objc_alloc(MEMORY[0x1E0CA6AC0]);
    v10 = (void *)objc_msgSend(v9, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", *MEMORY[0x1E0D72E40], 0, 0, 0, 1);
    -[PHSearchProcessor setPhotosMemoryAssetCountsKey:](v2, "setPhotosMemoryAssetCountsKey:", v10);

    v11 = objc_alloc(MEMORY[0x1E0CA6AC0]);
    v12 = (void *)objc_msgSend(v11, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", *MEMORY[0x1E0D72E38], 0, 0, 0, 1);
    -[PHSearchProcessor setPhotosHighlightIdentifiersKey:](v2, "setPhotosHighlightIdentifiersKey:", v12);

    v13 = objc_alloc(MEMORY[0x1E0CA6AC0]);
    v14 = (void *)objc_msgSend(v13, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", *MEMORY[0x1E0D72E30], 0, 0, 0, 1);
    -[PHSearchProcessor setPhotosHighlightAssetCountsKey:](v2, "setPhotosHighlightAssetCountsKey:", v14);

  }
  return v2;
}

- (void)searchResultsFromSpotlightSearchableItems:(id)a3 query:(id)a4 annotatedQueryString:(id)a5 searchResults:(id *)a6 unfilteredAssetSearchResults:(id *)a7 rankedAssetSearchResults:(id *)a8 rankedCollectionSearchResults:(id *)a9 assetUUIDsForSuggestions:(id *)a10 collectionUUIDsForSuggestions:(id *)a11
{
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  id v39;
  char v40;
  char v41;
  BOOL v42;
  char v43;
  unint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  uint64_t v52;
  PHSearchResult *v53;
  char v54;
  char v55;
  unint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void (**v75)(void *, uint64_t, void *);
  NSObject *v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  NSObject *v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  unint64_t v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  NSObject *v132;
  id v133;
  id *v134;
  id v135;
  id v136;
  os_signpost_id_t spid;
  NSObject *v139;
  id v140;
  id v141;
  void *v143;
  NSObject *v144;
  id v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  _QWORD aBlock[4];
  id v151;
  id v152;
  id v153;
  uint64_t v154;
  int v155;
  int v156;
  _QWORD v157[4];
  id v158;
  NSObject *v159;
  PHSearchProcessor *v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  BOOL v170;
  char v171;
  char v172;
  char v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint8_t buf[4];
  _BYTE v179[10];
  _BYTE v180[10];
  _BYTE v181[10];
  uint64_t v182;
  __int16 v183;
  uint64_t v184;
  __int16 v185;
  uint64_t v186;
  __int16 v187;
  void *v188;
  _BYTE v189[128];
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v145 = a3;
  v15 = a4;
  v141 = a5;
  v147 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchProcessor.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  v134 = a6;
  if (a6)
  {
    if (a7)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchProcessor.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSearchResults"));

    if (a7)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchProcessor.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outUnfilteredAssetSearchResults"));

LABEL_5:
  if (!a10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchProcessor.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outAssetUUIDsForSuggestions"));

  }
  if (!a11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchProcessor.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outCollectionUUIDsForSuggestions"));

  }
  v149 = objc_msgSend(v15, "batchIdentifier");
  v146 = objc_msgSend(v15, "queryIdentifier");
  objc_msgSend(v15, "searchOptions");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  PLSearchBackendResultProcessingGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)v149)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v145, "count");
    objc_msgSend(v148, "scopedIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)v179 = v17;
    *(_WORD *)&v179[8] = 2048;
    *(_QWORD *)v180 = v18;
    *(_WORD *)&v180[8] = 2048;
    *(_QWORD *)v181 = objc_msgSend(v19, "count");
    _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing %tu items from Spotlight with %tu scoped identifiers", buf, 0x20u);

  }
  PLPhotosSearchGetLog();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v20);
  v21 = v20;

  v22 = v21;
  v23 = v22;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v23, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchBackendQuerySearchableItemTranslation", ", buf, 2u);
  }

  v139 = v23;
  v24 = +[PHSearchUtility locationDisambiguationSpansFullLengthOfString:](PHSearchUtility, "locationDisambiguationSpansFullLengthOfString:", v141);
  objc_msgSend(v148, "scopedIdentifiers");
  v25 = objc_claimAutoreleasedReturnValue();
  v144 = v25;
  if (v25)
    v26 = -[NSObject count](v25, "count") == 0;
  else
    v26 = 0;
  v27 = objc_msgSend(v145, "count");
  v28 = !v24;
  if (v27)
    v28 = 0;
  if ((v28 | v26) == 1)
  {
    if (objc_msgSend(v148, "maxRankedAssetSearchResults") >= 1)
      *a8 = (id)MEMORY[0x1E0C9AA60];
    if (objc_msgSend(v148, "maxRankedCollectionSearchResults") >= 1)
      *a9 = (id)MEMORY[0x1E0C9AA60];
    v29 = (void *)MEMORY[0x1E0C9AA60];
    *v134 = (id)MEMORY[0x1E0C9AA60];
    *a10 = v29;
    *a11 = v29;
    if (v26)
    {
      PLSearchBackendResultProcessingGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "queryStringSentToSpotlight");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v179 = v62;
        *(_WORD *)&v179[8] = 2112;
        *(_QWORD *)v180 = v63;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Scoped search set is empty, no results to process for query \"%@\".", buf, 0x16u);

      }
    }
    else
    {
      PLSearchBackendResultProcessingGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "queryStringSentToSpotlight");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v179 = v64;
        *(_WORD *)&v179[8] = 2112;
        *(_QWORD *)v180 = v65;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ No results to process for query: \"%@\", buf, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend(v147, "searchText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHSearchUtility extractAssetUUIDsForLocationDisambiguationsInQueryString:](PHSearchUtility, "extractAssetUUIDsForLocationDisambiguationsInQueryString:", v31);
    v132 = objc_claimAutoreleasedReturnValue();

    v32 = v148;
    if (-[NSObject count](v132, "count"))
    {
      PLSearchBackendResultProcessingGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[NSObject count](v132, "count");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v179 = v34;
        *(_WORD *)&v179[8] = 2048;
        *(_QWORD *)v180 = v35;
        _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %tu assetUUIDs from location disambiguations which will be used to scope the search", buf, 0x16u);

      }
      if (-[NSObject count](v144, "count"))
      {
        v36 = -[NSObject mutableCopy](v144, "mutableCopy");
        -[NSObject intersectSet:](v36, "intersectSet:", v132);
        v37 = -[NSObject copy](v36, "copy");

        v144 = v37;
      }
      else
      {
        v36 = v144;
        v144 = v132;
      }

      v32 = v148;
    }
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v140 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v131 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v133 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v130 = (void *)objc_opt_new();
    v136 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v135 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = objc_msgSend(v32, "searchQueryResultTypes");
    v41 = objc_msgSend(v32, "searchQueryResultTypes");
    v42 = objc_msgSend(v32, "maxRankedAssetSearchResults") > 0;
    v43 = objc_msgSend(v32, "fastRanking");
    v44 = v41 & 2;
    v125 = v44;
    if (v24)
    {
      -[NSObject allObjects](v144, "allObjects");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "sortedArrayUsingSelector:", sel_compare_);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v176 = 0u;
      v177 = 0u;
      v174 = 0u;
      v175 = 0u;
      v47 = v46;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v174, v189, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v175;
        v50 = MEMORY[0x1E0C9AA60];
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v175 != v49)
              objc_enumerationMutation(v47);
            v52 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * i);
            LOWORD(v121) = 0;
            v53 = -[PHSearchResult initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:]([PHSearchResult alloc], "initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:", 1, v52, v50, v50, v50, v50, 0, v121, 0, 0, 0, 0, 0, 0, 0);
            objc_msgSend(v39, "addObject:", v52);
            objc_msgSend(v38, "addObject:", v53);

          }
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v174, v189, 16);
        }
        while (v48);
      }

      v128 = 0;
      v129 = 0;
      v127 = 0;
    }
    else
    {
      v54 = v43;
      v55 = v40 & 1;
      v56 = v44 >> 1;
      v157[0] = MEMORY[0x1E0C809B0];
      v157[1] = 3221225472;
      v157[2] = __243__PHSearchProcessor_searchResultsFromSpotlightSearchableItems_query_annotatedQueryString_searchResults_unfilteredAssetSearchResults_rankedAssetSearchResults_rankedCollectionSearchResults_assetUUIDsForSuggestions_collectionUUIDsForSuggestions___block_invoke;
      v157[3] = &unk_1E35D6048;
      v57 = v147;
      v158 = v57;
      v159 = v144;
      v160 = self;
      v161 = v130;
      v162 = v148;
      v170 = v42;
      v171 = v54;
      v58 = v131;
      v163 = v58;
      v164 = v135;
      v172 = v55;
      v59 = v39;
      v165 = v59;
      v60 = v38;
      v166 = v60;
      v173 = v56;
      v167 = v133;
      v168 = v140;
      v169 = v136;
      objc_msgSend(v145, "enumerateObjectsUsingBlock:", v157);
      *a7 = (id)objc_msgSend(v60, "copy");
      objc_msgSend((id)objc_opt_class(), "_filterResultsByMatchType:forQuery:", v60, v57);
      v38 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "_filterResultsByMatchType:forQuery:", v58, v57);
      v131 = (id)objc_claimAutoreleasedReturnValue();

      if (v125)
      {
        objc_msgSend((id)objc_opt_class(), "_albumUUIDsFromAssetBasedSearchResults:", v38);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_highlightUUIDsFromAssetBasedSearchResults:", v38);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_memoryUUIDsFromAssetBasedSearchResults:", v38);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v128 = 0;
        v129 = 0;
        v127 = 0;
      }
      PLSearchBackendResultProcessingGetLog();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v38, "count");
        v66 = objc_msgSend(v59, "count");
        v67 = objc_msgSend(v129, "count");
        v68 = objc_msgSend(v128, "count");
        v69 = objc_msgSend(v127, "count");
        objc_msgSend(v57, "queryStringSentToSpotlight");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        *(_QWORD *)v179 = v123;
        *(_WORD *)&v179[8] = 2048;
        *(_QWORD *)v180 = v122;
        *(_WORD *)&v180[8] = 2048;
        *(_QWORD *)v181 = v66;
        *(_WORD *)&v181[8] = 2048;
        v182 = v67;
        v183 = 2048;
        v184 = v68;
        v185 = 2048;
        v186 = v69;
        v187 = 2112;
        v188 = v70;
        _os_log_impl(&dword_1991EC000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %tu assets, %tu assets for suggestions, %tu albums, %tu highlights, and %tu memories from Spotlight for query: %@", buf, 0x48u);

      }
      v47 = v158;
    }

    if (v125)
    {
      v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v148, "collectionThreshold");
      v73 = v72;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __243__PHSearchProcessor_searchResultsFromSpotlightSearchableItems_query_annotatedQueryString_searchResults_unfilteredAssetSearchResults_rankedAssetSearchResults_rankedCollectionSearchResults_assetUUIDsForSuggestions_collectionUUIDsForSuggestions___block_invoke_28;
      aBlock[3] = &unk_1E35D6070;
      v151 = v130;
      v154 = v73;
      v152 = v140;
      v155 = v149;
      v156 = v146;
      v74 = v71;
      v153 = v74;
      v75 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
      v75[2](v75, 2, v129);
      v75[2](v75, 3, v127);
      v75[2](v75, 4, v128);
      if (objc_msgSend(v74, "count"))
      {
        PLSearchBackendResultProcessingGetLog();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          if ((_DWORD)v149)
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v74, "count");
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v179 = v77;
          *(_WORD *)&v179[8] = 2048;
          *(_QWORD *)v180 = v78;
          *(_WORD *)&v180[8] = 2112;
          *(_QWORD *)v181 = v74;
          _os_log_impl(&dword_1991EC000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %tu collections below threshold. Collection UUIDs: %@", buf, 0x20u);

        }
      }
      PLSearchBackendResultProcessingGetLog();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v126 = v74;
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v129, "count");
        v82 = objc_msgSend(v128, "count");
        v83 = objc_msgSend(v127, "count");
        objc_msgSend(v147, "queryStringSentToSpotlight");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)v179 = v80;
        *(_WORD *)&v179[8] = 2048;
        *(_QWORD *)v180 = v81;
        *(_WORD *)&v180[8] = 2048;
        *(_QWORD *)v181 = v82;
        *(_WORD *)&v181[8] = 2048;
        v182 = v83;
        v183 = 2112;
        v184 = (uint64_t)v84;
        _os_log_impl(&dword_1991EC000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@ Updated collections with asset based collections: %tu albums, %tu highlights and %tu memories from Spotlight for query: %@", buf, 0x34u);

        v74 = v126;
      }

    }
    if (objc_msgSend(v136, "count"))
    {
      PLSearchBackendResultProcessingGetLog();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT))
      {
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v136, "count");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v179 = v86;
        *(_WORD *)&v179[8] = 2048;
        *(_QWORD *)v180 = v87;
        *(_WORD *)&v180[8] = 2112;
        *(_QWORD *)v181 = v136;
        _os_log_impl(&dword_1991EC000, v85, OS_LOG_TYPE_FAULT, "%{public}@ %tu unexpected domain identifiers returned from Spotlight: %@", buf, 0x20u);

      }
    }
    if (objc_msgSend(v135, "count"))
    {
      PLSearchBackendResultProcessingGetLog();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
      {
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v135, "count");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v179 = v89;
        *(_WORD *)&v179[8] = 2048;
        *(_QWORD *)v180 = v90;
        *(_WORD *)&v180[8] = 2112;
        *(_QWORD *)v181 = v135;
        _os_log_impl(&dword_1991EC000, v88, OS_LOG_TYPE_FAULT, "%{public}@ Received %tu searchable item(s) with undefined type(s): %@", buf, 0x20u);

      }
    }
    v91 = v148;
    v92 = objc_msgSend(v148, "maxRankedAssetSearchResults");
    if (v92)
    {
      if (!a8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchProcessor.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outRankedAssetSearchResults"));

      }
      objc_msgSend((id)objc_opt_class(), "_rankedAssetSearchResultsFromResults:maxResults:queryId:batchId:", v131, v92, v146, v149);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      PLSearchBackendResultProcessingGetLog();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(*a8, "count");
        objc_msgSend(v147, "queryStringSentToSpotlight");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v179 = v94;
        *(_WORD *)&v179[8] = 2048;
        *(_QWORD *)v180 = v95;
        *(_WORD *)&v180[8] = 2112;
        *(_QWORD *)v181 = v96;
        _os_log_impl(&dword_1991EC000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@ Identified %tu ranked assets for query: %@", buf, 0x20u);

      }
      v91 = v148;
    }
    else
    {
      *a8 = (id)MEMORY[0x1E0C9AA60];
    }
    v97 = objc_msgSend(v91, "maxRankedCollectionSearchResults");
    if (v97)
    {
      if (!a9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchProcessor.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outRankedCollectionSearchResults"));

      }
      objc_msgSend((id)objc_opt_class(), "_rankedCollectionSearchResultsFromResults:maxResults:queryId:batchId:", v140, v97, v146, v149);
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      PLSearchBackendResultProcessingGetLog();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)v149)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(*a9, "count");
        objc_msgSend(v147, "queryStringSentToSpotlight");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v179 = v99;
        *(_WORD *)&v179[8] = 2048;
        *(_QWORD *)v180 = v100;
        *(_WORD *)&v180[8] = 2112;
        *(_QWORD *)v181 = v101;
        _os_log_impl(&dword_1991EC000, v98, OS_LOG_TYPE_DEFAULT, "%{public}@ Identified %tu ranked collections for query: %@", buf, 0x20u);

      }
    }
    else
    {
      *a9 = (id)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend((id)objc_opt_class(), "_removeTransientProcessingStateForSearchResults:", v38);
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v102, "addObjectsFromArray:", v143);
    objc_msgSend(v102, "addObjectsFromArray:", v140);
    *v134 = (id)objc_msgSend(v102, "copy");
    *a10 = (id)objc_msgSend(v39, "copy");
    *a11 = (id)objc_msgSend(v133, "copy");
    PLSearchBackendResultProcessingGetLog();
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v149)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v149, v146);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v146);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v143, "count");
      v106 = objc_msgSend(v39, "count");
      v107 = objc_msgSend(v140, "count");
      v108 = objc_msgSend(v133, "count");
      objc_msgSend(v147, "queryStringSentToSpotlight");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)v179 = v104;
      *(_WORD *)&v179[8] = 2048;
      *(_QWORD *)v180 = v105;
      *(_WORD *)&v180[8] = 2048;
      *(_QWORD *)v181 = v106;
      *(_WORD *)&v181[8] = 2048;
      v182 = v107;
      v183 = 2048;
      v184 = v108;
      v185 = 2112;
      v186 = (uint64_t)v109;
      _os_log_impl(&dword_1991EC000, v103, OS_LOG_TYPE_DEFAULT, "%{public}@ Processed %tu asset results, %tu asset results for suggestions, and %tu collection results, %tu collection results for suggestions for query: %@", buf, 0x3Eu);

    }
    v110 = v139;
    v111 = v110;
    if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v110))
    {
      v112 = objc_msgSend(v145, "count");
      v113 = objc_msgSend(v102, "count");
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v179 = v146;
      *(_WORD *)&v179[4] = 1024;
      *(_DWORD *)&v179[6] = v149;
      *(_WORD *)v180 = 2048;
      *(_QWORD *)&v180[2] = v112;
      *(_WORD *)v181 = 2048;
      *(_QWORD *)&v181[2] = v113;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v111, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQuerySearchableItemTranslation", "Query: %d, Batch: %d, CSSearchableItems: %tu, PHSearchResults: %tu", buf, 0x22u);
    }

    v30 = v132;
  }

}

- (id)_searchResultFromSpotlightSearchableItem:(id)a3 queryOptions:(id)a4 assetCountByCollectionUUID:(id)a5
{
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  void *v30;
  void *v31;
  PHSearchResult *v32;
  void *v33;
  PHSearchResult *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  id v46;
  id v47;

  v9 = a3;
  v47 = a4;
  v46 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchProcessor.m"), 636, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

  }
  v10 = objc_msgSend((id)objc_opt_class(), "_searchResultTypeForSpotlightSearchableItem:", v9);
  objc_msgSend(v9, "attributeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "enableQueryMatchDetails"))
  {
    objc_msgSend(v11, "attributeForKey:", *MEMORY[0x1E0CA6AA8]);
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v11, "attributeForKey:", *MEMORY[0x1E0CA6A60]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CA6AC0]);
    v15 = (void *)objc_msgSend(v14, "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", *MEMORY[0x1E0D72E50], 0, 0, 0, 0);
    objc_msgSend(v11, "valueForCustomKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v16, "BOOLValue");

    v10 = v12;
  }
  else
  {
    v42 = 0;
    v44 = 0;
    v45 = 0;
  }
  objc_msgSend(v11, "attributeForKey:", *MEMORY[0x1E0CA6A98]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributeForKey:", *MEMORY[0x1E0CA6AA0]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = &unk_1E3654C58;
  if (v10 == 1)
    v17 = 0;
  v18 = *MEMORY[0x1E0CA6A90];
  v39 = v17;
  v40 = v11;
  objc_msgSend(v11, "attributeForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v19, "unsignedIntegerValue");

  v20 = 0;
  v21 = 0;
  v22 = 0;
  if (v10 == 1)
  {
    v23 = (void *)objc_opt_class();
    -[PHSearchProcessor photosAlbumIdentifiersKey](self, "photosAlbumIdentifiersKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchProcessor photosAlbumAssetCountsKey](self, "photosAlbumAssetCountsKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_collectionUUIDsForSpotlightSearchableItem:identifiersKey:countsKey:assetCountByCollectionUUID:", v9, v24, v25, v46);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_opt_class();
    -[PHSearchProcessor photosHighlightIdentifiersKey](self, "photosHighlightIdentifiersKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchProcessor photosHighlightAssetCountsKey](self, "photosHighlightAssetCountsKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_collectionUUIDsForSpotlightSearchableItem:identifiersKey:countsKey:assetCountByCollectionUUID:", v9, v27, v28, v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_opt_class();
    -[PHSearchProcessor photosMemoryIdentifiersKey](self, "photosMemoryIdentifiersKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchProcessor photosMemoryAssetCountsKey](self, "photosMemoryAssetCountsKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    objc_msgSend(v29, "_collectionUUIDsForSpotlightSearchableItem:identifiersKey:countsKey:assetCountByCollectionUUID:", v9, v30, v31, v46);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v32 = [PHSearchResult alloc];
  objc_msgSend(v9, "uniqueIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v37) = v42;
  LOBYTE(v37) = v44;
  v34 = -[PHSearchResult initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:](v32, "initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:", v10, v33, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v38, v37, v45, v43, v41, v39, v20, v22, v21);

  return v34;
}

- (CSCustomAttributeKey)photosAlbumIdentifiersKey
{
  return self->_photosAlbumIdentifiersKey;
}

- (void)setPhotosAlbumIdentifiersKey:(id)a3
{
  objc_storeStrong((id *)&self->_photosAlbumIdentifiersKey, a3);
}

- (CSCustomAttributeKey)photosAlbumAssetCountsKey
{
  return self->_photosAlbumAssetCountsKey;
}

- (void)setPhotosAlbumAssetCountsKey:(id)a3
{
  objc_storeStrong((id *)&self->_photosAlbumAssetCountsKey, a3);
}

- (CSCustomAttributeKey)photosMemoryIdentifiersKey
{
  return self->_photosMemoryIdentifiersKey;
}

- (void)setPhotosMemoryIdentifiersKey:(id)a3
{
  objc_storeStrong((id *)&self->_photosMemoryIdentifiersKey, a3);
}

- (CSCustomAttributeKey)photosMemoryAssetCountsKey
{
  return self->_photosMemoryAssetCountsKey;
}

- (void)setPhotosMemoryAssetCountsKey:(id)a3
{
  objc_storeStrong((id *)&self->_photosMemoryAssetCountsKey, a3);
}

- (CSCustomAttributeKey)photosHighlightIdentifiersKey
{
  return self->_photosHighlightIdentifiersKey;
}

- (void)setPhotosHighlightIdentifiersKey:(id)a3
{
  objc_storeStrong((id *)&self->_photosHighlightIdentifiersKey, a3);
}

- (CSCustomAttributeKey)photosHighlightAssetCountsKey
{
  return self->_photosHighlightAssetCountsKey;
}

- (void)setPhotosHighlightAssetCountsKey:(id)a3
{
  objc_storeStrong((id *)&self->_photosHighlightAssetCountsKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosHighlightAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosHighlightIdentifiersKey, 0);
  objc_storeStrong((id *)&self->_photosMemoryAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosMemoryIdentifiersKey, 0);
  objc_storeStrong((id *)&self->_photosAlbumAssetCountsKey, 0);
  objc_storeStrong((id *)&self->_photosAlbumIdentifiersKey, 0);
}

void __243__PHSearchProcessor_searchResultsFromSpotlightSearchableItems_query_annotatedQueryString_searchResults_unfilteredAssetSearchResults_rankedAssetSearchResults_rankedCollectionSearchResults_assetUUIDsForSuggestions_collectionUUIDsForSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  int v20;
  char v21;
  void **v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  __CFString *v29;

  v29 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    *a4 = 1;
  v6 = *(void **)(a1 + 40);
  if (!v6
    || (-[__CFString uniqueIdentifier](v29, "uniqueIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "containsObject:", v7),
        v7,
        v8))
  {
    -[__CFString domainIdentifier](v29, "domainIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D72E58]);

    if (!v10)
    {
      v15 = *(void **)(a1 + 120);
      -[__CFString domainIdentifier](v29, "domainIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      v13 = (__CFString *)v16;
      if (v16)
        v17 = (const __CFString *)v16;
      else
        v17 = &stru_1E35DFFF8;
      v18 = v15;
      goto LABEL_37;
    }
    v11 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "searchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_searchResultFromSpotlightSearchableItem:queryOptions:assetCountByCollectionUUID:", v29, v12, *(_QWORD *)(a1 + 56));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 64), "excludeOCRTextResultMatches")
      && (-[__CFString hasOCRTextMatch](v13, "hasOCRTextMatch") & 1) != 0)
    {
      goto LABEL_38;
    }
    if (*(_BYTE *)(a1 + 128) && -[__CFString type](v13, "type") == 1)
    {
      -[__CFString l2Score](v13, "l2Score");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

      }
      else if (!*(_BYTE *)(a1 + 129))
      {
        goto LABEL_18;
      }
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v13);
    }
LABEL_18:
    v19 = -[__CFString type](v13, "type");
    if ((unint64_t)(v19 - 2) >= 3)
    {
      if (v19 == 1)
      {
        if (*(_BYTE *)(a1 + 130))
        {
          if ((-[__CFString isEligibleForSuggestions](v13, "isEligibleForSuggestions") & 1) != 0
            || (objc_msgSend(*(id *)(a1 + 32), "searchOptions"),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v26 = objc_msgSend(v25, "disableSemanticSearch"),
                v25,
                v26))
          {
            v27 = *(void **)(a1 + 88);
            -[__CFString uuid](v13, "uuid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v28);

          }
          v22 = (void **)(a1 + 96);
          goto LABEL_35;
        }
      }
      else if (!v19)
      {
        v22 = (void **)(a1 + 80);
        v17 = v29;
LABEL_36:
        v18 = *v22;
LABEL_37:
        objc_msgSend(v18, "addObject:", v17);
      }
    }
    else
    {
      v20 = *(unsigned __int8 *)(a1 + 131);
      if (-[__CFString type](v13, "type") == 3)
      {
        v21 = PLIsFeaturedContentAllowed();
        if (!v20 || (v21 & 1) == 0)
          goto LABEL_38;
        goto LABEL_27;
      }
      if (v20)
      {
LABEL_27:
        if (-[__CFString isEligibleForSuggestions](v13, "isEligibleForSuggestions"))
        {
          v23 = *(void **)(a1 + 104);
          -[__CFString uuid](v13, "uuid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v24);

        }
        v22 = (void **)(a1 + 112);
LABEL_35:
        v17 = v13;
        goto LABEL_36;
      }
    }
LABEL_38:

  }
}

void __243__PHSearchProcessor_searchResultsFromSpotlightSearchableItems_query_annotatedQueryString_searchResults_unfilteredAssetSearchResults_rankedAssetSearchResults_rankedCollectionSearchResults_assetUUIDsForSuggestions_collectionUUIDsForSuggestions___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  PHSearchResult *v20;
  void *v21;
  PHSearchResult *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    v26 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        v13 = objc_msgSend(v5, "countForObject:", v10);
        v14 = (double)v13 / (double)v12;
        if (v14 >= *(double *)(a1 + 56))
        {
          v20 = [PHSearchResult alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LOWORD(v25) = 0;
          v22 = -[PHSearchResult initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:](v20, "initWithSearchResultType:uuid:personUUIDs:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:retrievalType:hasOCRTextMatch:isSensitiveLocation:embeddingDistances:l1Score:l2Score:collectionScore:assetAlbumUUIDs:assetMemoryUUIDs:assetHighlightUUIDs:", a2, v10, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, v25, 0, 0, 0, v21, 0, 0, 0);

          objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);
        }
        else
        {
          v15 = v13;
          PLSearchBackendResultProcessingGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = v7;
            v18 = v8;
            v19 = a2;
            if (*(_DWORD *)(a1 + 64))
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68));
            else
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 68), v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = 138544642;
            v32 = v23;
            v33 = 2112;
            v34 = v10;
            v35 = 2048;
            v36 = v14;
            v37 = 2048;
            v38 = v24;
            v39 = 2048;
            v40 = v12;
            v41 = 2048;
            v42 = v15;
            _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ Skipping collection below threshold. Collection: %@, confidence: %f, threshold: %f, collectionAssetCount: %tu, collectionAssetHitCount: %tu", buf, 0x3Eu);

            a2 = v19;
            v8 = v18;
            v7 = v17;
            v5 = v26;
          }

          objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v7);
  }

}

+ (void)searchSuggestionsFromPLSearchSuggestions:(id)a3 suggestions:(id *)a4 queryId:(int)a5 batchId:(int)a6 rangeOfSuggestionText:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  NSUInteger v24;
  NSUInteger v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  length = a7.length;
  location = a7.location;
  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (objc_msgSend(v12, "count"))
  {
    PLPhotosSearchGetLog();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_generate(v13);

    v15 = v13;
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLSearchBackendQuerySuggestionTranslation", ", buf, 2u);
    }

    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __112__PHSearchProcessor_searchSuggestionsFromPLSearchSuggestions_suggestions_queryId_batchId_rangeOfSuggestionText___block_invoke;
    v22[3] = &unk_1E35D6098;
    v24 = location;
    v25 = length;
    v18 = v17;
    v23 = v18;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v22);
    *a4 = (id)objc_msgSend(v18, "copy");
    v19 = v16;
    v20 = v19;
    if (v14 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
    {
      v21 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 67109632;
      v27 = a5;
      v28 = 1024;
      v29 = a6;
      v30 = 2048;
      v31 = v21;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_INTERVAL_END, v14, "PLSearchBackendQuerySuggestionTranslation", "Query: %d, Batch: %d, Suggestions: %tu", buf, 0x18u);
    }

  }
  else
  {
    *a4 = (id)MEMORY[0x1E0C9AA60];
  }

}

+ (id)queryMatchDetailsForSearchResults:(id)a3 queryText:(id)a4 queryEmbedding:(id)a5 matchedPersonUUIDs:(id)a6 matchedScenes:(id)a7 queryId:(int)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  PHSearchQueryMatchDetails *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PHSearchQueryMatchDetails *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  __CFString *v46;
  __CFString *v47;
  void *v49;
  void *v50;
  os_signpost_id_t spid;
  unint64_t v53;
  NSObject *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  _BYTE v71[24];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v56 = a5;
  v55 = a6;
  v16 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryText"));

    if (v14)
      goto LABEL_3;
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResults"));

    goto LABEL_3;
  }
  if (!v14)
    goto LABEL_40;
LABEL_3:
  PLPhotosSearchGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v17);
  v19 = v17;
  v20 = v19;
  spid = v18;
  v53 = v18 - 1;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PLSearchBackendQueryExtractQueryMatchDetails", ", buf, 2u);
  }
  v54 = v20;

  v60 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v58 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v59 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v14;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v67 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        if (objc_msgSend(v24, "type") == 1 && objc_msgSend(v24, "hasOCRTextMatch"))
        {
          objc_msgSend(v24, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v25);

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v21);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v26 = v16;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v63 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        if (objc_msgSend(v30, "count") == 2)
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
          v31 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "unsignedIntegerValue");

          v34 = v60;
          switch(v33)
          {
            case 1:
              goto LABEL_30;
            case 2:
              v34 = v57;
              goto LABEL_30;
            case 3:
              v34 = v58;
LABEL_30:
              objc_msgSend(v34, "addObject:", v31);
              break;
            case 4:
            case 6:
            case 7:
            case 8:
              break;
            default:
              PLSearchBackendResultProcessingGetLog();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)v71 = v33;
                *(_WORD *)&v71[8] = 2112;
                *(_QWORD *)&v71[10] = v30;
                _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_ERROR, "Invalid scene type %tu, while resolving match details. sceneIdentifierAndType: %@", buf, 0x16u);
              }

              break;
          }
        }
        else
        {
          PLSearchBackendQueryGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v71 = v30;
            _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_ERROR, "Invalid sceneIdentifierAndType: %@", buf, 0xCu);
          }
        }

      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v27);
  }

  v36 = [PHSearchQueryMatchDetails alloc];
  objc_msgSend(v55, "allObjects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "allObjects");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "allObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "allObjects");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "allObjects");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[PHSearchQueryMatchDetails initWithQueryText:queryEmbedding:personUUIDS:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrAssetUUIDS:](v36, "initWithQueryText:queryEmbedding:personUUIDS:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrAssetUUIDS:", v15, v56, v37, v38, v39, v40, v41);

  v43 = v54;
  v44 = v43;
  if (v53 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v43))
  {
    v45 = objc_msgSend(obj, "count");
    v46 = CFSTR("YES");
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v71 = a8;
    if (!v56)
      v46 = CFSTR("NO");
    *(_WORD *)&v71[4] = 2048;
    *(_QWORD *)&v71[6] = v45;
    *(_WORD *)&v71[14] = 2112;
    *(_QWORD *)&v71[16] = v46;
    v47 = v46;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v44, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQueryExtractQueryMatchDetails", "Query: %d, SearchResults: %tu, QueryEmbedding: %@", buf, 0x1Cu);

  }
  return v42;
}

+ (id)queryMatchDetailsForSearchResults:(id)a3 queryText:(id)a4 queryEmbedding:(id)a5 queryId:(int)a6
{
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
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
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  __CFString *v37;
  __CFString *v38;
  void *v40;
  void *v41;
  os_signpost_id_t spid;
  PHSearchQueryMatchDetails *v44;
  PHSearchQueryMatchDetails *v45;
  unint64_t v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  __CFString *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v48 = a4;
  v49 = a5;
  if (!v48)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 431, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryText"));

    if (v10)
      goto LABEL_3;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 432, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResults"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_23;
LABEL_3:
  PLPhotosSearchGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  spid = v12;
  v46 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLSearchBackendQueryExtractQueryMatchDetails", ", buf, 2u);
  }
  v47 = v14;

  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v52 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (objc_msgSend(v23, "type") == 1)
        {
          objc_msgSend(v23, "personUUIDS");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v24);

          objc_msgSend(v23, "sceneIdentifiers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObjectsFromArray:", v25);

          objc_msgSend(v23, "audioIdentifiers");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObjectsFromArray:", v26);

          objc_msgSend(v23, "humanActionIdentifiers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObjectsFromArray:", v27);

          if (objc_msgSend(v23, "hasOCRTextMatch"))
          {
            objc_msgSend(v23, "uuid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v28);

          }
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v20);
  }

  v44 = [PHSearchQueryMatchDetails alloc];
  objc_msgSend(v15, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "allObjects");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[PHSearchQueryMatchDetails initWithQueryText:queryEmbedding:personUUIDS:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrAssetUUIDS:](v44, "initWithQueryText:queryEmbedding:personUUIDS:sceneIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrAssetUUIDS:", v48, v49, v29, v30, v31, v32, v33);

  v34 = v47;
  v35 = v34;
  if (v46 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v34))
  {
    v36 = objc_msgSend(v19, "count");
    v37 = CFSTR("YES");
    *(_DWORD *)buf = 67109634;
    v56 = a6;
    if (!v49)
      v37 = CFSTR("NO");
    v57 = 2048;
    v58 = v36;
    v59 = 2112;
    v60 = v37;
    v38 = v37;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v35, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQueryExtractQueryMatchDetails", "Query: %d, SearchResults: %tu, QueryEmbedding: %@", buf, 0x1Cu);

  }
  return v45;
}

+ (id)_rankedAssetSearchResultsFromResults:(id)a3 maxResults:(unint64_t)a4 queryId:(int)a5 batchId:(int)a6
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  PLPhotosSearchGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PLSearchBackendQueryAssetRanking", ", buf, 2u);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("l2Score"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("l1Score"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    v30[1] = v13;
    v30[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingDescriptors:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count") > a4)
    {
      objc_msgSend(v16, "subarrayWithRange:", 0, a4);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  v18 = v11;
  v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 67109632;
    v25 = a5;
    v26 = 1024;
    v27 = a6;
    v28 = 2048;
    v29 = v20;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PLSearchBackendQueryAssetRanking", "Query: %d, Batch: %d, AssetResults: %tu", buf, 0x18u);
  }

  return v16;
}

+ (id)_rankedCollectionSearchResultsFromResults:(id)a3 maxResults:(unint64_t)a4 queryId:(int)a5 batchId:(int)a6
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v35;
  os_signpost_id_t spid;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  NSObject *v42;
  id v44;
  id v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  _BYTE v54[10];
  __int16 v55;
  uint64_t v56;
  _BYTE v57[128];
  _QWORD v58[6];

  LODWORD(v35) = a5;
  HIDWORD(v35) = a6;
  v58[4] = *MEMORY[0x1E0C80C00];
  v44 = a3;
  PLPhotosSearchGetLog();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  v8 = v6;
  v9 = v8;
  spid = v7;
  v41 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PLSearchBackendQueryCollectionRanking", ", buf, 2u);
  }
  v42 = v9;

  if (objc_msgSend(v44, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("collectionScore"), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("l2Score"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("l1Score"), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v40;
    v58[1] = v39;
    v58[2] = v38;
    v58[3] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sortedArrayUsingDescriptors:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") <= a4)
    {
      v46 = v11;
    }
    else
    {
      v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
      v12 = (void *)objc_opt_new();
      v47 = (void *)objc_opt_new();
      v48 = (void *)objc_opt_new();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v50 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v17, "type", v35);
            v18 = v12;
            switch((unint64_t)v12)
            {
              case 0uLL:
              case 1uLL:
                PLSearchBackendResultProcessingGetLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v54 = v17;
                  _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Unexpected result type found during Top Collections ranking: %@", buf, 0xCu);
                }

                continue;
              case 2uLL:
                goto LABEL_17;
              case 3uLL:
                v18 = v47;
                goto LABEL_17;
              case 4uLL:
                v18 = v48;
LABEL_17:
                objc_msgSend(v18, "addObject:", v17);
                break;
              default:
                continue;
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v14);
      }

      v20 = objc_msgSend(v12, "count");
      v21 = objc_msgSend(v48, "count");
      v22 = objc_msgSend(v47, "count");
      v23 = (unint64_t)((double)a4 * 0.2);
      objc_msgSend(a1, "_popResultsFromResults:popCount:", v12, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObjectsFromArray:", v24);

      objc_msgSend(a1, "_popResultsFromResults:popCount:", v48, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObjectsFromArray:", v25);

      objc_msgSend(a1, "_popResultsFromResults:popCount:", v47, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObjectsFromArray:", v26);

      if (v21 + v20 + v22 >= a4)
        v27 = a4;
      else
        v27 = v21 + v20 + v22;
      do
      {
        if (objc_msgSend(v46, "count", v35) >= v27)
          break;
        objc_msgSend(a1, "_popResultsFromResults:popCount:", v12, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObjectsFromArray:", v28);

        if (objc_msgSend(v46, "count") >= v27)
          break;
        objc_msgSend(a1, "_popResultsFromResults:popCount:", v48, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObjectsFromArray:", v29);

        if (objc_msgSend(v46, "count") >= v27)
          break;
        objc_msgSend(a1, "_popResultsFromResults:popCount:", v47, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObjectsFromArray:", v30);

      }
      while (objc_msgSend(v46, "count") < v27);

    }
  }
  else
  {
    v46 = (id)MEMORY[0x1E0C9AA60];
  }
  v31 = v42;
  v32 = v31;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    v33 = objc_msgSend(v44, "count");
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v54 = v35;
    *(_WORD *)&v54[4] = 1024;
    *(_DWORD *)&v54[6] = HIDWORD(v35);
    v55 = 2048;
    v56 = v33;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQueryCollectionRanking", "Query: %d, Batch: %d, CollectionResults: %tu", buf, 0x18u);
  }

  return v46;
}

+ (id)_popResultsFromResults:(id)a3 popCount:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  void *v7;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 < a4)
    a4 = v6;
  objc_msgSend(v5, "subarrayWithRange:", 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInRange:", 0, a4);

  return v7;
}

+ (id)_collectionUUIDsForSpotlightSearchableItem:(id)a3 identifiersKey:(id)a4 countsKey:(id)a5 assetCountByCollectionUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 593, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 595, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("countsKey"));

      if (v14)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 596, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCountByCollectionUUID"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 594, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiersKey"));

  if (!v13)
    goto LABEL_8;
LABEL_4:
  if (!v14)
    goto LABEL_9;
LABEL_5:
  objc_msgSend(v11, "attributeSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForCustomKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForCustomKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __116__PHSearchProcessor__collectionUUIDsForSpotlightSearchableItem_identifiersKey_countsKey_assetCountByCollectionUUID___block_invoke;
  v25[3] = &unk_1E35D60C0;
  v26 = v14;
  v27 = v17;
  v18 = v17;
  v19 = v14;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v25);

  return v16;
}

+ (unint64_t)_searchResultTypeForSpotlightSearchableItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

  }
  objc_msgSend(v5, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photosResultType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D72E68]) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D72E60]) & 1) != 0)
  {
    v8 = 2;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D72E78]) & 1) != 0)
  {
    v8 = 3;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D72E70]) & 1) != 0)
  {
    v8 = 4;
  }
  else
  {
    PLSearchBackendResultProcessingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Received searchableItem with invalid result type: %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

+ (void)_matchedPeopleForSearchableItem:(id)a3 personUUIDs:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 705, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 706, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outPersonUUIDs"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributeForKey:", *MEMORY[0x1E0CA6648]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_matchedPersonIndexesForSearchableItem:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__PHSearchProcessor__matchedPeopleForSearchableItem_personUUIDs___block_invoke;
  v17[3] = &unk_1E35D60E8;
  v18 = v10;
  v19 = v8;
  v20 = v7;
  v11 = v7;
  v12 = v8;
  v13 = v10;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v17);
  *a4 = (id)objc_msgSend(v12, "copy");

}

+ (id)_matchedPersonIndexesForSearchableItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 727, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeForKey:", *MEMORY[0x1E0CA6640]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "unsignedIntegerValue"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v6;
}

+ (void)_matchedScenesForSearchableItem:(id)a3 sceneIDs:(id *)a4 audioIDs:(id *)a5 humanActionIDs:(id *)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v11 = a3;
  if (v11)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 746, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 748, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outAudioIDs"));

      if (a6)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 749, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outHumanActionIDs"));

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 747, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSceneIDs"));

  if (!a5)
    goto LABEL_8;
LABEL_4:
  if (!a6)
    goto LABEL_9;
LABEL_5:
  objc_msgSend(v11, "attributeSet");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  objc_msgSend(v28, "attributeForKey:", *MEMORY[0x1E0CA6670]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "attributeForKey:", *MEMORY[0x1E0CA66A0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_matchedSceneIndexesForSearchableItem:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __86__PHSearchProcessor__matchedScenesForSearchableItem_sceneIDs_audioIDs_humanActionIDs___block_invoke;
  v29[3] = &unk_1E35D6110;
  v30 = v15;
  v31 = v16;
  v32 = v12;
  v33 = v13;
  v34 = v14;
  v35 = v11;
  v18 = v11;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v16;
  v23 = v15;
  objc_msgSend(v17, "enumerateIndexesUsingBlock:", v29);
  *a4 = (id)objc_msgSend(v21, "copy");
  *a5 = (id)objc_msgSend(v20, "copy");
  *a6 = (id)objc_msgSend(v19, "copy");

}

+ (id)_matchedSceneIndexesForSearchableItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchProcessor.m"), 795, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeForKey:", *MEMORY[0x1E0CA6680]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v6, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "unsignedIntegerValue"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v11);
  }
  v31 = v9;

  objc_msgSend(v5, "attributeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributeForKey:", *MEMORY[0x1E0CA6698]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v5;
  objc_msgSend(v5, "attributeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributeForKey:", *MEMORY[0x1E0CA6690]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v17)
  {
    v18 = v17;
    v34 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        v20 = v6;
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(obj);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "unsignedIntegerValue");
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v22 = v35;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v23)
        {
          v24 = v23;
          v25 = 0;
          v26 = *(_QWORD *)v37;
          while (2)
          {
            v27 = 0;
            v28 = v25 + v24;
            do
            {
              if (*(_QWORD *)v37 != v26)
                objc_enumerationMutation(v22);
              v21 -= objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v27), "unsignedIntegerValue");
              if (v21 < 0)
              {
                v28 = v25 + v27;
                goto LABEL_26;
              }
              ++v27;
            }
            while (v24 != v27);
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
            v25 = v28;
            if (v24)
              continue;
            break;
          }
        }
        else
        {
          v28 = 0;
        }
LABEL_26:

        v6 = v20;
        objc_msgSend(v20, "addIndex:", v28);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v18);
  }

  return v6;
}

+ (id)_albumUUIDsFromAssetBasedSearchResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v13) == 1)
        {
          objc_msgSend(v10, "assetAlbumUUIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_memoryUUIDsFromAssetBasedSearchResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v13) == 1)
        {
          objc_msgSend(v10, "assetMemoryUUIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_highlightUUIDsFromAssetBasedSearchResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v13) == 1)
        {
          objc_msgSend(v10, "assetHighlightUUIDs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_removeTransientProcessingStateForSearchResults:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "releaseOwningCollectionUUIDs");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return v3;
}

+ (id)_filterResultsByMatchType:(id)a3 forQuery:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  __CFString *v10;
  NSObject *v11;
  __CFString *v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  void *v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint32_t v32;
  NSObject *v33;
  void *v35;
  void *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  __CFString *v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    PLSearchBackendResultProcessingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "batchIdentifier"))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), objc_msgSend(v6, "batchIdentifier"), objc_msgSend(v6, "queryIdentifier"));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), objc_msgSend(v6, "queryIdentifier"), v43);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v15;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ No results available to filter by match type", buf, 0xCu);

    }
    v16 = v5;
    goto LABEL_65;
  }
  objc_msgSend(v6, "searchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "matchType");
  v9 = v8;
  if (v8 > 3)
    v10 = CFSTR("Unknown");
  else
    v10 = off_1E35D6C98[v8];
  v12 = v10;
  if (!+[PHSearchQueryManager currentSpotlightVersionSupportsExactMatchBehavior](PHSearchQueryManager, "currentSpotlightVersionSupportsExactMatchBehavior"))
  {
    if (v9 - 1 > 1)
    {
LABEL_63:
      v16 = v5;
      goto LABEL_64;
    }
    PLSearchBackendResultProcessingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (objc_msgSend(v6, "batchIdentifier"))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), objc_msgSend(v6, "batchIdentifier"), objc_msgSend(v6, "queryIdentifier"));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), objc_msgSend(v6, "queryIdentifier"), v43);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v28;
      v29 = "%{public}@ Exact or hybrid match results requested by client, but not supported on the this device build.";
      v30 = v13;
      v31 = OS_LOG_TYPE_ERROR;
      v32 = 12;
      goto LABEL_61;
    }
LABEL_62:

    goto LABEL_63;
  }
  if (v9 == 3 || !v9)
  {
    PLSearchBackendResultProcessingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v6, "batchIdentifier"))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), objc_msgSend(v6, "batchIdentifier"), objc_msgSend(v6, "queryIdentifier"));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), objc_msgSend(v6, "queryIdentifier"), v43);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v28;
      v56 = 2112;
      v57 = v12;
      v29 = "%{public}@ Returning results of all match types for the query due to match type of: %@";
      v30 = v13;
      v31 = OS_LOG_TYPE_DEFAULT;
      v32 = 22;
LABEL_61:
      _os_log_impl(&dword_1991EC000, v30, v31, v29, buf, v32);

      goto LABEL_62;
    }
    goto LABEL_62;
  }
  v46 = v6;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v7, "enableEmbeddingOnlyResultsInExactMatches"))
    v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v49 = 0;
  v44 = v12;
  v45 = v7;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v47 = v5;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (!v18)
  {
    v20 = 0;
    v48 = 0;
    goto LABEL_46;
  }
  v19 = v18;
  v20 = 0;
  v48 = 0;
  v21 = *(_QWORD *)v51;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v51 != v21)
        objc_enumerationMutation(v17);
      v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      v24 = objc_msgSend(v23, "isExclusivelyExactOCRTextMatch");
      if (objc_msgSend(v23, "retrievalType") == 2)
      {
        v25 = v49;
LABEL_31:
        objc_msgSend(v25, "addObject:", v23);
        goto LABEL_40;
      }
      v26 = objc_msgSend(v23, "matchType");
      if (v26 == 2)
      {
        if (v9 == 2)
        {
          objc_msgSend(v14, "addObject:", v23);
          ++v48;
        }
      }
      else if (v26 == 1 && v9 - 1 <= 1)
      {
        v25 = v14;
        goto LABEL_31;
      }
LABEL_40:
      v20 = (__CFString *)((char *)v20 + v24);
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  }
  while (v19);
LABEL_46:

  if (objc_msgSend(v14, "count"))
  {
    v6 = v46;
    v5 = v47;
    if ((__CFString *)objc_msgSend(v14, "count") == v20)
    {
      PLSearchBackendResultProcessingGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(v46, "batchIdentifier"))
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), objc_msgSend(v46, "batchIdentifier"), objc_msgSend(v46, "queryIdentifier"));
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), objc_msgSend(v46, "queryIdentifier"), v43);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v36;
        v56 = 2048;
        v57 = v20;
        v37 = "%{public}@ All %tu exact match results were for OCR results: returning all results";
        v38 = v33;
        v39 = 22;
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (v20 && (__CFString *)objc_msgSend(v14, "count") == (__CFString *)((char *)v20 + v48))
    {
      PLSearchBackendResultProcessingGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(v46, "batchIdentifier"))
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), objc_msgSend(v46, "batchIdentifier"), objc_msgSend(v46, "queryIdentifier"));
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), objc_msgSend(v46, "queryIdentifier"), v43);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v36;
        v56 = 2048;
        v57 = v20;
        v58 = 2048;
        v59 = v48;
        v37 = "%{public}@ All %tu exact match results were for OCR or %tu hybrid boosted results: returning all results";
        v38 = v33;
        v39 = 32;
LABEL_78:
        _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);

      }
LABEL_79:
      v12 = v44;
      v7 = v45;
    }
    else
    {
      objc_msgSend(v14, "addObjectsFromArray:", v49);
      PLSearchBackendResultProcessingGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v12 = v44;
      v7 = v45;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend(v46, "batchIdentifier"))
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), objc_msgSend(v46, "batchIdentifier"), objc_msgSend(v46, "queryIdentifier"));
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), objc_msgSend(v46, "queryIdentifier"), v43);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v14, "count");
        v42 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 138543874;
        v55 = v40;
        v56 = 2048;
        v57 = (__CFString *)v41;
        v58 = 2048;
        v59 = v42;
        _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Filtered %tu asset results from %tu asset results returned from Spotlight", buf, 0x20u);

      }
      v17 = v14;
    }
  }
  else
  {
    PLSearchBackendResultProcessingGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    v6 = v46;
    v5 = v47;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    v12 = v44;
    v7 = v45;
    if (objc_msgSend(v46, "batchIdentifier"))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), objc_msgSend(v46, "batchIdentifier"), objc_msgSend(v46, "queryIdentifier"));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), objc_msgSend(v46, "queryIdentifier"), v43);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v35;
    v56 = 2112;
    v57 = v44;
    _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ No filtered results found for match type: %@, returning all results", buf, 0x16u);

  }
  v16 = v17;

LABEL_64:
LABEL_65:

  return v16;
}

void __86__PHSearchProcessor__matchedScenesForSearchableItem_sceneIDs_audioIDs_humanActionIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "unsignedIntegerValue"))
  {
    case 1:
      v6 = *(void **)(a1 + 48);
      goto LABEL_8;
    case 2:
      v6 = *(void **)(a1 + 64);
      goto LABEL_8;
    case 3:
      v6 = *(void **)(a1 + 56);
LABEL_8:
      objc_msgSend(v6, "addObject:", v4);
      break;
    case 4:
    case 6:
    case 7:
    case 8:
      break;
    default:
      PLSearchBackendResultProcessingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 72), "uniqueIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v5;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Invalid scene type (%@), while resolving match details for searchable item: %@", (uint8_t *)&v9, 0x16u);

      }
      break;
  }

}

void __65__PHSearchProcessor__matchedPeopleForSearchableItem_personUUIDs___block_invoke(id *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1[5], "addObject:", v3);
  }
  else
  {
    PLSearchBackendResultProcessingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[6], "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Missing expected MDItemPhotosPeoplePersonIdentifiers for %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __116__PHSearchProcessor__collectionUUIDsForSpotlightSearchableItem_identifiersKey_countsKey_assetCountByCollectionUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "_pl_safeObjectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __112__PHSearchProcessor_searchSuggestionsFromPLSearchSuggestions_suggestions_queryId_batchId_rangeOfSuggestionText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PHSearchSuggestion *v11;
  void *v12;
  void *v13;
  PHSearchSuggestion *v14;
  id v15;

  v15 = a2;
  v3 = objc_msgSend(v15, "suggestionType");
  v4 = objc_msgSend(v15, "categoriesType");
  if (objc_msgSend(v15, "matchedAssetsCount"))
    v5 = objc_msgSend(v15, "matchedAssetsCount");
  else
    v5 = objc_msgSend(v15, "matchedCollectionsCount");
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(v15, "matchRangeOfSearchText");
    v9 = v8;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
  }
  if ((unint64_t)(v4 - 1) >= 0x29)
    v4 = 0;
  if (v3 == 1)
    v10 = 1;
  else
    v10 = 2 * (v3 == 2);
  v11 = [PHSearchSuggestion alloc];
  objc_msgSend(v15, "contentString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "suggestionComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PHSearchSuggestion initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:](v11, "initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:", v10, v4, v12, v7, v9, v6, v13);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
}

@end
