@implementation ATXWebSuggestionsGenerator

- (ATXWebSuggestionsGenerator)init
{
  ATXWebSuggestionsGenerator *v2;
  uint64_t v3;
  ATXVerticalModelsCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXWebSuggestionsGenerator;
  v2 = -[ATXWebSuggestionsGenerator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (ATXVerticalModelsCache *)v3;

  }
  return v2;
}

- (void)refreshWebsitePredictions
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  ATXVerticalModelsCache *cache;
  void *v17;
  ATXVerticalModelsCache *v18;
  void *v19;
  uint64_t v20;
  ATXContextHeuristicsBiomeStream *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  ATXWebSuggestionsGenerator *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t *v42;
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[4];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[ATXWebSuggestionsGenerator webpageHistory](self, "webpageHistory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXWebSuggestionsGenerator urlToDatesGivenWebpageHistory:](self, "urlToDatesGivenWebpageHistory:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    v21 = objc_alloc_init(ATXContextHeuristicsBiomeStream);
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v51[3] = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__23;
    v49 = __Block_byref_object_dispose__23;
    v50 = (id)objc_opt_new();
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__23;
    v43[4] = __Block_byref_object_dispose__23;
    v44 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    -[ATXContextHeuristicsBiomeStream publisherFromStartTime:](v21, "publisherFromStartTime:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __55__ATXWebSuggestionsGenerator_refreshWebsitePredictions__block_invoke_2;
    v37[3] = &unk_1E82DE168;
    v38 = v23;
    v39 = self;
    v40 = v51;
    v41 = v43;
    v42 = &v45;
    v4 = (id)objc_msgSend(v3, "sinkWithCompletion:shouldContinue:", &__block_literal_global_50, v37);

    v27 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)v46[5];
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
    if (v5)
    {
      v26 = *(_QWORD *)v34;
      do
      {
        v28 = v5;
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v8 = (void *)objc_opt_new();
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend((id)v46[5], "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v52, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v30 != v11)
                  objc_enumerationMutation(v9);
                v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
                objc_msgSend((id)v46[5], "objectForKeyedSubscript:", v7, v21);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "countForObject:", v13);

                if (v15 >= 5)
                {
                  do
                  {
                    objc_msgSend(v8, "addObject:", v13);
                    --v15;
                  }
                  while (v15);
                }
              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v52, 16);
            }
            while (v10);
          }

          objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, v7);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
      }
      while (v5);
    }

    cache = self->_cache;
    v17 = (void *)objc_msgSend(v27, "copy");
    -[ATXVerticalModelsCache writeWebsiteSuggestionsCache:](cache, "writeWebsiteSuggestionsCache:", v17);

    v18 = self->_cache;
    -[ATXWebSuggestionsGenerator webpageTitlesAndSubtitlesGivenWebpageHistory:](self, "webpageTitlesAndSubtitlesGivenWebpageHistory:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXVerticalModelsCache writeWebsiteTitlesAndSubtitlesCache:](v18, "writeWebsiteTitlesAndSubtitlesCache:", v19);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(v51, 8);
  }
  else
  {
    v20 = MEMORY[0x1E0C9AA70];
    -[ATXVerticalModelsCache writeWebsiteSuggestionsCache:](self->_cache, "writeWebsiteSuggestionsCache:", MEMORY[0x1E0C9AA70]);
    -[ATXVerticalModelsCache writeWebsiteTitlesAndSubtitlesCache:](self->_cache, "writeWebsiteTitlesAndSubtitlesCache:", v20);
  }

}

uint64_t __55__ATXWebSuggestionsGenerator_refreshWebsitePredictions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v34 = v5;
    v35 = v3;
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "timestamp");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)v7;
    if (objc_msgSend(v12, "compare:", v7) == -1)
    {
      while (1)
      {
        v37 = v12;
        objc_msgSend(*(id *)(a1 + 40), "rootUrlFromUrl:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v17 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v39 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v23)
              {
                v24 = (void *)objc_opt_new();
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", v24, v22);

              }
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectForKeyedSubscript:", v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v10 && (objc_msgSend(v16, "isEqual:", v10) & 1) == 0)
              {
                objc_msgSend(v25, "addObject:", v10);
                objc_msgSend(v25, "addObject:", v10);
              }
              if (v16)
                objc_msgSend(v25, "addObject:", v16);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v19);
        }

        v26 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        if (v26 == objc_msgSend(*(id *)(a1 + 32), "count"))
          break;
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "allKeys");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)v14;
        v12 = v13;
        if (objc_msgSend(v13, "compare:", v7) != -1)
          goto LABEL_21;
      }

      v15 = 0;
      v5 = v34;
      v3 = v35;
      v13 = v37;
    }
    else
    {
      v13 = v12;
      v14 = (uint64_t)v10;
LABEL_21:
      v3 = v35;
      objc_msgSend(v35, "eventBody");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isStart");

      v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (v31)
      {
        v5 = v34;
        objc_msgSend(v32, "addObject:", v34);
      }
      else
      {
        v5 = v34;
        if (objc_msgSend(v32, "containsObject:", v34))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObject:", v34);
      }
      v15 = 1;
      v10 = (void *)v14;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (id)websitePredictionsForAllContexts
{
  void *v3;
  uint64_t v4;

  -[ATXVerticalModelsCache fetchWebsiteSuggestionsCache](self->_cache, "fetchWebsiteSuggestionsCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    -[ATXWebSuggestionsGenerator refreshWebsitePredictions](self, "refreshWebsitePredictions");
    -[ATXVerticalModelsCache fetchWebsiteSuggestionsCache](self->_cache, "fetchWebsiteSuggestionsCache");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)websitePredictionsForContextType:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  -[ATXWebSuggestionsGenerator websitePredictionsForAllContexts](self, "websitePredictionsForAllContexts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__ATXWebSuggestionsGenerator_websitePredictionsForContextType_limit___block_invoke;
    v13[3] = &unk_1E82DBFF8;
    v14 = v8;
    objc_msgSend(v9, "sortedArrayUsingComparator:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXWebSuggestionsGenerator dedupedUrlsFromUrls:limit:](self, "dedupedUrlsFromUrls:limit:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

uint64_t __69__ATXWebSuggestionsGenerator_websitePredictionsForContextType_limit___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 > v8)
    return -1;
  else
    return 1;
}

- (id)webpageTitlesAndSubtitles
{
  return -[ATXVerticalModelsCache fetchWebsiteTitlesAndSubtitlesCache](self->_cache, "fetchWebsiteTitlesAndSubtitlesCache");
}

- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  ATXVerticalModelsCache *cache;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATXWebSuggestionsGenerator refreshWebsitePredictions](self, "refreshWebsitePredictions");
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 10;
  do
  {
    objc_msgSend(v8, "addObject:", v9);
    --v10;
  }
  while (v10);
  cache = self->_cache;
  v13 = v7;
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXVerticalModelsCache writeWebsiteSuggestionsCache:](cache, "writeWebsiteSuggestionsCache:", v12);

}

- (id)urlToDatesGivenWebpageHistory:(id)a3
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "action", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "userActivity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "dateInterval");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "webpageURL");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v14, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v18);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)webpageHistory
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CF9198]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:", v3, v4, CFSTR("com.apple.mobilesafari"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rootUrlFromUrl:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v6);

  objc_msgSend(v4, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHost:", v7);
  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dedupedUrlsFromUrls:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v8);
      if (v11 == a4)
        break;
      v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
      -[ATXWebSuggestionsGenerator rootUrlFromUrl:](self, "rootUrlFromUrl:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 && (objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
      {
        objc_msgSend(v7, "addObject:", v15);
        objc_msgSend(v18, "addObject:", v14);
        ++v11;
      }

      if (v10 == ++v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  v16 = (void *)objc_msgSend(v18, "copy");
  return v16;
}

- (id)webpageTitlesAndSubtitlesGivenWebpageHistory:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "action", (_QWORD)v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userActivity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "webpageURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "actionTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "actionSubtitle");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v12)
          v16 = v13 == 0;
        else
          v16 = 1;
        if (!v16 && v14 != 0)
        {
          v25[0] = v13;
          v25[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = (void *)objc_msgSend(v4, "copy");
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
