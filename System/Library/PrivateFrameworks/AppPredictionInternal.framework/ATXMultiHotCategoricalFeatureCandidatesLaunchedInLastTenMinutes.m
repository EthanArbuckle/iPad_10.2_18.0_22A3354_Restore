@implementation ATXMultiHotCategoricalFeatureCandidatesLaunchedInLastTenMinutes

- (id)categoricalFeatureValuesForContext:(id)a3 candidate:(id)a4
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "timeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "candidateIdentifiersLaunchAge", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
          objc_msgSend(v4, "candidateIdentifiersLaunchAge");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v4, "timeContext");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "date");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "timeIntervalSinceDate:", v15);
            v19 = v18;

            if (v19 > 0.0 && v19 <= 600.0)
              objc_msgSend(v7, "addObject:", v13);
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = (void *)objc_opt_new();
  }

  return v7;
}

@end
