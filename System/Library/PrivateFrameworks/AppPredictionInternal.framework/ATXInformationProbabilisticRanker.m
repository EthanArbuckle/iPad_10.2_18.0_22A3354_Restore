@implementation ATXInformationProbabilisticRanker

- (id)sortFeaturizedSuggestions:(id)a3 withFeatureWeights:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  ATXScoredInfoSuggestion *v36;
  void *v37;
  void *v38;
  ATXScoredInfoSuggestion *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *context;
  void *v57;
  id obj;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  _BYTE v85[14];
  _BYTE v86[128];
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v65 = a4;
  __atxlog_handle_gi();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v85 = "-[ATXInformationProbabilisticRanker sortFeaturizedSuggestions:withFeatureWeights:]";
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "ATXInformationProbabilisticRanker %s", buf, 0xCu);
  }

  context = (void *)MEMORY[0x1CAA48B6C]();
  -[ATXInformationProbabilisticRanker _groupSuggestionsByConfidenceLevel:](self, "_groupSuggestionsByConfidenceLevel:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 19);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v60 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E83CC718);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v79 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "suggestion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setClientModelId:", v64);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    }
    while (v11);
  }

  v57 = v6;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_msgSend(v60, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingDescriptors:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v19;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v75;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v75 != v59)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v20);
        objc_msgSend(v60, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v20;
        if ((unint64_t)objc_msgSend(v22, "count") >= 2)
        {
          __atxlog_handle_gi();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend(v22, "count");
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v85 = v24;
            *(_WORD *)&v85[4] = 2112;
            *(_QWORD *)&v85[6] = v21;
            _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "ATXInformationProbabilisticRanker: %d candidates at the same level %@. Rank probabilistically.", buf, 0x12u);
          }

          -[ATXInformationProbabilisticRanker _rankSuggestionsProbabilistically:](self, "_rankSuggestionsProbabilistically:", v22);
          v25 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)v25;
        }
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v26 = v22;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v71;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v71 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
              objc_msgSend(v31, "scoreWithFeatureWeights:", v65);
              v33 = v32;
              -[ATXInformationProbabilisticRanker _tieBreakingScoreForSuggestion:](self, "_tieBreakingScoreForSuggestion:", v31);
              v35 = v33 + v34;
              v36 = [ATXScoredInfoSuggestion alloc];
              objc_msgSend(v31, "suggestion");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "featureSet");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[ATXScoredInfoSuggestion initWithSuggestion:featureSet:score:](v36, "initWithSuggestion:featureSet:score:", v37, v38, v35);
              objc_msgSend(v15, "addObject:", v39);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
          }
          while (v28);
        }

        v20 = v62 + 1;
      }
      while (v62 + 1 != v61);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    }
    while (v61);
  }

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v63 = (void *)objc_opt_new();
  v41 = (void *)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v42 = v15;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v67 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
        objc_msgSend(v47, "suggestion");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "clientModelId");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", v64);

        v51 = v40;
        if (v50)
        {
          objc_msgSend(v47, "suggestion");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "confidenceLevel");

          if (v53 == 1)
            v51 = v63;
          else
            v51 = v41;
        }
        objc_msgSend(v51, "addObject:", v47);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    }
    while (v44);
  }

  objc_msgSend(v41, "sortedArrayUsingComparator:", &__block_literal_global_21_0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObjectsFromArray:", v54);

  objc_msgSend(v40, "addObjectsFromArray:", v63);
  objc_autoreleasePoolPop(context);

  return v40;
}

uint64_t __82__ATXInformationProbabilisticRanker_sortFeaturizedSuggestions_withFeatureWeights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 > 0.0)
    return -1;
  else
    return v10 < 0.0;
}

- (id)_groupSuggestionsByConfidenceLevel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "featureSet", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueForFeature:", 4);
        LODWORD(v14) = llround(v13);
        objc_msgSend(v11, "numberWithInt:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v16 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v15);
        }
        objc_msgSend(v16, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_rankSuggestionsProbabilistically:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  -[ATXInformationProbabilisticRanker _tieBreakingScoresForSuggestions:](self, "_tieBreakingScoresForSuggestions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:](self, "_rankNumbersProbabilistically:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v4, "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "intValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
  }

  return v5;
}

- (id)_tieBreakingScoresForSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)MEMORY[0x1E0CB37E8];
        -[ATXInformationProbabilisticRanker _tieBreakingScoreForSuggestion:](self, "_tieBreakingScoreForSuggestion:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        objc_msgSend(v11, "numberWithDouble:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[ATXInformationProbabilisticRanker _smooth:](self, "_smooth:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)_tieBreakingScoreForSuggestion:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "featureSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForFeature:", 2);
  v5 = v4;

  return v5 + 0.00001;
}

- (id)_smooth:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t j;
  void *v20;
  double v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "doubleValue");
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v12 = objc_msgSend(v4, "count");
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = v8 / (double)v12;
      v17 = *(_QWORD *)v25;
      v18 = v8 + v8;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "doubleValue", (_QWORD)v24);
          objc_msgSend(v20, "numberWithDouble:", (v16 + v21) / v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v22);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v15);
    }

  }
  else
  {
    v11 = v3;
  }

  return v11;
}

- (id)_rankNumbersProbabilistically:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  double v15;
  double v16;
  int v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v32;
  NSObject *v33;

  v4 = a3;
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@sum.self"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if (v7 <= 0.0)
  {
    __atxlog_handle_gi();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      -[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:].cold.2(v33, v7);

    v12 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "count");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    if (v8 >= 1)
    {
      v10 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

        v10 = (v10 + 1);
      }
      while (v8 != (_DWORD)v10);
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    if (v8 > 1)
    {
      v13 = 0;
      v14 = v8 - 2;
      do
      {
        -[ATXInformationProbabilisticRanker _standardUniformDistribution](self, "_standardUniformDistribution");
        v16 = v15;
        v17 = objc_msgSend(v9, "count");
        if (v17 < 2)
        {
          LODWORD(v21) = 0;
        }
        else
        {
          v19 = 0;
          v20 = v7 * v16;
          v21 = (v17 - 1);
          v18 = 0.0;
          while (1)
          {
            v22 = v18;
            objc_msgSend(v9, "objectAtIndexedSubscript:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectAtIndexedSubscript:", (int)objc_msgSend(v23, "intValue"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            v26 = v25;

            v18 = v22 + v26;
            if (v20 >= v22 && v20 < v18)
              break;
            if (v21 == ++v19)
              goto LABEL_15;
          }
          LODWORD(v21) = v19;
        }
LABEL_15:
        objc_msgSend(v9, "objectAtIndexedSubscript:", v21, v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v27);

        objc_msgSend(v9, "objectAtIndexedSubscript:", v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", (int)objc_msgSend(v28, "intValue"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v7 = v7 - v30;

        objc_msgSend(v9, "removeObjectAtIndex:", v21);
      }
      while (v13++ != v14);
    }
    if (objc_msgSend(v9, "count") != 1)
      -[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:].cold.1();
    objc_msgSend(v9, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v32);

  }
  return v12;
}

- (double)_standardUniformDistribution
{
  return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0;
}

- (void)_rankNumbersProbabilistically:.cold.1()
{
  __assert_rtn("-[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:]", "ATXInformationRanker.m", 245, "indices.count == 1");
}

- (void)_rankNumbersProbabilistically:(os_log_t)log .cold.2(os_log_t log, double a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ATXInformationProbabilisticRanker _rankNumbersProbabilistically:]";
  v4 = 2048;
  v5 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXInformationProbabilisticRanker %s: sum of nums == %lf <= 0 is invalid", (uint8_t *)&v2, 0x16u);
}

@end
