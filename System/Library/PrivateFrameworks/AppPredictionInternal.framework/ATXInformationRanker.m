@implementation ATXInformationRanker

- (id)sortFeaturizedSuggestions:(id)a3 withFeatureWeights:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  ATXScoredInfoSuggestion *v16;
  void *v17;
  void *v18;
  ATXScoredInfoSuggestion *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "scoreWithFeatureWeights:", v6, (_QWORD)v22);
        v15 = v14;
        v16 = [ATXScoredInfoSuggestion alloc];
        objc_msgSend(v13, "suggestion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "featureSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[ATXScoredInfoSuggestion initWithSuggestion:featureSet:score:](v16, "initWithSuggestion:featureSet:score:", v17, v18, v15);
        objc_msgSend(v7, "addObject:", v19);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_72);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __69__ATXInformationRanker_sortFeaturizedSuggestions_withFeatureWeights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "score");
    v11 = v10;
    objc_msgSend(v5, "score");
    v9 = v11 < v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

@end
