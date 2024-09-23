@implementation ATXLightweightClientModelCacheUpdate(ATXPredictionCacheProtocol)

- (id)identifierForPredictionAtIndex:()ATXPredictionCacheProtocol
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(a1, "suggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executableIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (uint64_t)confidenceCategoryForPredictionAtIndex:()ATXPredictionCacheProtocol
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0;
  objc_msgSend(a1, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scoreSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suggestedConfidenceCategory");

  return v10;
}

- (uint64_t)numberOfPredictionsWithConfidence:()ATXPredictionCacheProtocol
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "suggestions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "scoreSpecification");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "suggestedConfidenceCategory");

        if (v11 == a3)
          ++v7;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
