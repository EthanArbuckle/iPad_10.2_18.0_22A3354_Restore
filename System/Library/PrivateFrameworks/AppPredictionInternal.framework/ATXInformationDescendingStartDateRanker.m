@implementation ATXInformationDescendingStartDateRanker

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
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "scoreWithFeatureWeights:", v6, (_QWORD)v21);
        v15 = v14;
        v16 = [ATXScoredInfoSuggestion alloc];
        objc_msgSend(v13, "suggestion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "featureSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[ATXScoredInfoSuggestion initWithSuggestion:featureSet:score:](v16, "initWithSuggestion:featureSet:score:", v17, v18, v15);

        objc_msgSend(v7, "addObject:", v19);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortWithOptions:usingComparator:", 16, &__block_literal_global_13);
  return v7;
}

uint64_t __88__ATXInformationDescendingStartDateRanker_sortFeaturizedSuggestions_withFeatureWeights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v27;
  double v28;
  double v29;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "confidenceLevel");
  objc_msgSend(v5, "suggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "confidenceLevel");

  if (v7 > v9)
    goto LABEL_8;
  objc_msgSend(v4, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "confidenceLevel");
  objc_msgSend(v5, "suggestion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "confidenceLevel");

  if (v11 < v13)
    goto LABEL_6;
  objc_msgSend(v4, "suggestion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;

  objc_msgSend(v5, "suggestion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v21 = v20;

  if (v17 > v21)
  {
LABEL_8:
    v22 = -1;
    goto LABEL_9;
  }
  if (v17 >= v21)
  {
    objc_msgSend(v4, "score");
    v24 = v23;
    objc_msgSend(v5, "score");
    if (v24 <= v25)
    {
      objc_msgSend(v4, "score");
      v28 = v27;
      objc_msgSend(v5, "score");
      v22 = v28 < v29;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_6:
  v22 = 1;
LABEL_9:

  return v22;
}

@end
