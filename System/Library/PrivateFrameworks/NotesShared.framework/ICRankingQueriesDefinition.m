@implementation ICRankingQueriesDefinition

- (ICRankingQueriesDefinition)initWithExpandedTokens:(id)a3 rankingQueryType:(int64_t)a4 rankingQueryFlags:(id)a5
{
  id v9;
  id v10;
  ICRankingQueriesDefinition *v11;
  ICRankingQueriesDefinition *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *matchingDescriptorsCache;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICRankingQueriesDefinition;
  v11 = -[ICRankingQueriesDefinition init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_expandedTokens, a3);
    v12->_rankingQueryType = a4;
    objc_storeStrong((id *)&v12->_rankingQueryFlags, a5);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    matchingDescriptorsCache = v12->_matchingDescriptorsCache;
    v12->_matchingDescriptorsCache = v13;

  }
  return v12;
}

- (ICRankingQueriesDefinition)initWithSearchString:(id)a3 rankingQueryType:(int64_t)a4 rankingQueryFlags:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  ICRankingQueriesDefinition *v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ICRankingQueriesDefinition initWithExpandedTokens:rankingQueryType:rankingQueryFlags:](self, "initWithExpandedTokens:rankingQueryType:rankingQueryFlags:", v12, a4, v9);
  return v13;
}

- (NSArray)rankingQueryDescriptors
{
  NSArray *rankingQueryDescriptors;
  id v4;
  void *v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  ICRankingQueryDescriptor *v12;
  void *v13;
  int64_t v14;
  void *v15;
  ICRankingQueryDescriptor *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  ICRankingQueriesDefinition *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  ICRankingQueriesDefinition *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  ICRankingQueryDescriptor *v44;
  void *v45;
  int64_t v46;
  void *v47;
  int64_t v48;
  ICRankingQueryDescriptor *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  id v56;
  void *v57;
  int64_t v58;
  void *v59;
  void *v60;
  NSArray *v61;
  NSArray *v62;
  id obj;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  void *v98;
  void *v99;
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  unint64_t v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  rankingQueryDescriptors = self->_rankingQueryDescriptors;
  if (!rankingQueryDescriptors)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    objc_msgSend(MEMORY[0x1E0D64278], "rankingQueryFieldsForGenericHighlighting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
    v7 = &off_1E76C5000;
    v70 = v4;
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v94 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i);
          v12 = [ICRankingQueryDescriptor alloc];
          -[ICRankingQueriesDefinition expandedTokens](self, "expandedTokens");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[ICRankingQueriesDefinition rankingQueryType](self, "rankingQueryType");
          -[ICRankingQueriesDefinition rankingQueryFlags](self, "rankingQueryFlags");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[ICRankingQueryDescriptor initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:purpose:](v12, "initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:purpose:", v11, v13, v14, v15, 0);

          v7 = &off_1E76C5000;
          v4 = v70;
          objc_msgSend(v70, "addObject:", v16);

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
      }
      while (v8);
    }

    v17 = (void *)objc_opt_class();
    -[ICRankingQueriesDefinition expandedTokens](self, "expandedTokens");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "maxCountOfVariantsForCountOfTokens:", objc_msgSend(v18, "count"));

    v72 = v19;
    if (v19)
    {
      v87 = 0uLL;
      v88 = 0uLL;
      v85 = 0uLL;
      v86 = 0uLL;
      objc_msgSend(MEMORY[0x1E0D64278], "rankingQueryFieldsForWordSpecificHighlighting");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
      if (v66)
      {
        v65 = *(_QWORD *)v86;
        v20 = 0x1E0C99000uLL;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v86 != v65)
            {
              v22 = v21;
              objc_enumerationMutation(obj);
              v21 = v22;
            }
            v67 = v21;
            v74 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v21);
            v81 = 0u;
            v82 = 0u;
            v83 = 0u;
            v84 = 0u;
            -[ICRankingQueriesDefinition expandedTokens](self, "expandedTokens");
            v68 = (id)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v81, v104, 16);
            if (v71)
            {
              v69 = *(_QWORD *)v82;
              do
              {
                v23 = 0;
                do
                {
                  if (*(_QWORD *)v82 != v69)
                    objc_enumerationMutation(v68);
                  v24 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v23);
                  v25 = objc_msgSend(v24, "count");
                  v73 = v23;
                  if (objc_msgSend(v24, "count") > v72)
                  {
                    v26 = os_log_create("com.apple.notes", "SearchIndexer");
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                    {
                      v38 = objc_msgSend(v24, "count");
                      *(_DWORD *)buf = 134218240;
                      v101 = v38;
                      v102 = 2048;
                      v103 = v72;
                      _os_log_debug_impl(&dword_1BD918000, v26, OS_LOG_TYPE_DEBUG, "Observed %lu variants for token, but we only allow %lu.", buf, 0x16u);
                    }

                    v25 = v72;
                  }
                  v27 = self;
                  if (v25)
                  {
                    v28 = 0;
                    v75 = v24;
                    do
                    {
                      v76 = objc_alloc((Class)v7[494]);
                      objc_msgSend(v24, "objectAtIndexedSubscript:", v28);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v98 = v29;
                      objc_msgSend(*(id *)(v20 + 3360), "arrayWithObjects:count:", &v98, 1);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v99 = v30;
                      objc_msgSend(*(id *)(v20 + 3360), "arrayWithObjects:count:", &v99, 1);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = -[ICRankingQueriesDefinition rankingQueryType](v27, "rankingQueryType");
                      -[ICRankingQueriesDefinition rankingQueryFlags](v27, "rankingQueryFlags");
                      v33 = v27;
                      v34 = v25;
                      v35 = v20;
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = (void *)objc_msgSend(v76, "initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:purpose:", v74, v31, v32, v36, 0);

                      v20 = v35;
                      v25 = v34;
                      v27 = v33;

                      v24 = v75;
                      v7 = &off_1E76C5000;
                      objc_msgSend(v70, "addObject:", v37);

                      ++v28;
                    }
                    while (v25 != v28);
                  }
                  v23 = v73 + 1;
                }
                while (v73 + 1 != v71);
                v71 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v81, v104, 16);
              }
              while (v71);
            }

            v21 = v67 + 1;
          }
          while (v67 + 1 != v66);
          v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
        }
        while (v66);
      }
    }
    else
    {
      v91 = 0uLL;
      v92 = 0uLL;
      v89 = 0uLL;
      v90 = 0uLL;
      objc_msgSend(MEMORY[0x1E0D64278], "rankingQueryFieldsForWordSpecificHighlighting");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v90;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v90 != v41)
              objc_enumerationMutation(obj);
            v43 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j);
            v44 = [ICRankingQueryDescriptor alloc];
            -[ICRankingQueriesDefinition expandedTokens](self, "expandedTokens");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = -[ICRankingQueriesDefinition rankingQueryType](self, "rankingQueryType");
            -[ICRankingQueriesDefinition rankingQueryFlags](self, "rankingQueryFlags");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v46;
            v7 = &off_1E76C5000;
            v49 = -[ICRankingQueryDescriptor initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:purpose:](v44, "initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:purpose:", v43, v45, v48, v47, 0);

            objc_msgSend(v4, "addObject:", v49);
          }
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
        }
        while (v40);
      }
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    objc_msgSend(MEMORY[0x1E0D64278], "rankingQueryFieldsForSorting");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v52; ++k)
        {
          if (*(_QWORD *)v78 != v53)
            objc_enumerationMutation(v50);
          v55 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
          v56 = objc_alloc((Class)v7[494]);
          -[ICRankingQueriesDefinition expandedTokens](self, "expandedTokens");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = -[ICRankingQueriesDefinition rankingQueryType](self, "rankingQueryType");
          -[ICRankingQueriesDefinition rankingQueryFlags](self, "rankingQueryFlags");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (void *)objc_msgSend(v56, "initWithQueryFields:expandedTokens:rankingQueryType:rankingQueryFlags:purpose:", v55, v57, v58, v59, 1);

          v7 = &off_1E76C5000;
          objc_msgSend(v70, "addObject:", v60);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
      }
      while (v52);
    }

    v61 = (NSArray *)objc_msgSend(v70, "copy");
    v62 = self->_rankingQueryDescriptors;
    self->_rankingQueryDescriptors = v61;

    rankingQueryDescriptors = self->_rankingQueryDescriptors;
  }
  return rankingQueryDescriptors;
}

- (NSArray)rankingQueries
{
  NSArray *rankingQueries;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  rankingQueries = self->_rankingQueries;
  if (!rankingQueries)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[ICRankingQueriesDefinition rankingQueryDescriptors](self, "rankingQueryDescriptors", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "rankingQuery");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v12 = self->_rankingQueries;
    self->_rankingQueries = v11;

    rankingQueries = self->_rankingQueries;
  }
  return rankingQueries;
}

+ (unint64_t)maxCountOfVariantsForCountOfTokens:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;

  if (!a3)
    return 0;
  v4 = objc_msgSend(MEMORY[0x1E0D64278], "rankingQueryLimit");
  objc_msgSend(MEMORY[0x1E0D64278], "rankingQueryFieldsForGenericHighlighting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(MEMORY[0x1E0D64278], "rankingQueryFieldsForSorting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = v4 - (v6 + v8);
  objc_msgSend(MEMORY[0x1E0D64278], "rankingQueryFieldsForWordSpecificHighlighting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  return vcvtmd_u64_f64((double)v9 / (double)v11 / (double)a3);
}

- (id)highlightInfoForSearchableItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = v4;
  -[ICRankingQueriesDefinition matchingDescriptorsForBitFields:](self, "matchingDescriptorsForBitFields:", objc_msgSend((id)objc_opt_class(), "relevanceBitFieldForSearchableItem:", v4));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v6;
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
        if (!objc_msgSend(v7, "purpose"))
        {
          v8 = objc_msgSend(v7, "displayedMatchedFields");
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = objc_msgSend(&unk_1E771AA40, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v26 != v11)
                  objc_enumerationMutation(&unk_1E771AA40);
                v13 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "unsignedIntegerValue");
                if ((v13 & v8) != 0)
                {
                  v14 = v13;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
                  v16 = (id)objc_claimAutoreleasedReturnValue();

                  if (!v16)
                  {
                    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v17);

                  }
                  -[ICRankingQueriesDefinition addDescriptor:intoSearchResultHighlightInfoFieldElement:](self, "addDescriptor:intoSearchResultHighlightInfoFieldElement:", v7, v16);

                }
              }
              v10 = objc_msgSend(&unk_1E771AA40, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v10);
          }
        }
        v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (double)rankingScoreForSearchableItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICRankingQueriesDefinition matchingDescriptorsForBitFields:](self, "matchingDescriptorsForBitFields:", objc_msgSend((id)objc_opt_class(), "relevanceBitFieldForSearchableItem:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "purpose") == 1)
        {
          objc_msgSend(v4, "attributeSet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "rankingScoreForSearchResultType:", objc_msgSend(v12, "ic_searchResultType"));
          v9 = v9 + v13;

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

+ (unint64_t)modificationDateBucketForSearchableItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;

  objc_msgSend(a3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentModificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  v8 = v7;

  v9 = objc_msgSend(a1, "bucketOfTimeInterval:", v8);
  return v9;
}

+ (unint64_t)relevanceBitFieldForSearchableItem:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_relevance");

  return v4;
}

- (void)addDescriptor:(id)a3 intoSearchResultHighlightInfoFieldElement:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = a3;
  v6 = 2 * ((unint64_t)(objc_msgSend(v5, "rankingQueryType") - 1) < 2);
  objc_msgSend(v5, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v10);

    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v7)
LABEL_3:
    objc_msgSend(v9, "addObjectsFromArray:", v7);
LABEL_4:

}

- (id)matchingDescriptorsForBitFields:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;

  -[ICRankingQueriesDefinition matchingDescriptorsCache](self, "matchingDescriptorsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3)
    {
      -[ICRankingQueriesDefinition rankingQueryDescriptors](self, "rankingQueryDescriptors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        v11 = 0;
        do
        {
          if (((1 << v11) & a3) >> v11)
          {
            -[ICRankingQueriesDefinition rankingQueryDescriptors](self, "rankingQueryDescriptors");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v13);

          }
          ++v11;
          -[ICRankingQueriesDefinition rankingQueryDescriptors](self, "rankingQueryDescriptors");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

        }
        while (v11 < v15);
      }
    }
    v7 = (void *)objc_msgSend(v8, "copy");
    -[ICRankingQueriesDefinition matchingDescriptorsCache](self, "matchingDescriptorsCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v17);

  }
  return v7;
}

+ (unint64_t)bucketOfTimeInterval:(double)a3
{
  double v3;

  if (a3 <= 0.0)
    return 2;
  v3 = ceil(log(a3) * 1.28617347 + -6.14189718);
  if (v3 <= 2.0)
    return 2;
  else
    return (unint64_t)v3;
}

- (NSArray)expandedTokens
{
  return self->_expandedTokens;
}

- (void)setExpandedTokens:(id)a3
{
  objc_storeStrong((id *)&self->_expandedTokens, a3);
}

- (int64_t)rankingQueryType
{
  return self->_rankingQueryType;
}

- (void)setRankingQueryType:(int64_t)a3
{
  self->_rankingQueryType = a3;
}

- (NSString)rankingQueryFlags
{
  return self->_rankingQueryFlags;
}

- (void)setRankingQueryFlags:(id)a3
{
  objc_storeStrong((id *)&self->_rankingQueryFlags, a3);
}

- (NSMutableDictionary)matchingDescriptorsCache
{
  return self->_matchingDescriptorsCache;
}

- (void)setMatchingDescriptorsCache:(id)a3
{
  objc_storeStrong((id *)&self->_matchingDescriptorsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingDescriptorsCache, 0);
  objc_storeStrong((id *)&self->_rankingQueryFlags, 0);
  objc_storeStrong((id *)&self->_expandedTokens, 0);
  objc_storeStrong((id *)&self->_rankingQueries, 0);
  objc_storeStrong((id *)&self->_rankingQueryDescriptors, 0);
}

@end
