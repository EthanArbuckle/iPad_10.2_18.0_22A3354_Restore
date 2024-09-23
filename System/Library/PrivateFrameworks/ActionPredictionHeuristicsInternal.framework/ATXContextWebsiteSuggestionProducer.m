@implementation ATXContextWebsiteSuggestionProducer

- (ATXContextWebsiteSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5
{
  id v9;
  ATXContextWebsiteSuggestionProducer *v10;
  ATXContextWebsiteSuggestionProducer *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXContextWebsiteSuggestionProducer;
  v10 = -[ATXContextWebsiteSuggestionProducer init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_validDateInterval, a3);
    v11->_reasonCode = a4;
    v11->_score = a5;
  }

  return v11;
}

- (id)websiteSuggestions
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getATXWebSuggestionsGeneratorClass_softClass;
  v19 = getATXWebSuggestionsGeneratorClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getATXWebSuggestionsGeneratorClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v21 = __getATXWebSuggestionsGeneratorClass_block_invoke;
    v22 = &unk_1E82C46C8;
    v23 = &v16;
    __getATXWebSuggestionsGeneratorClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v17[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  v6 = objc_alloc_init(v5);
  stringForATXSuggestionPredictionReasonCode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "websitePredictionsForContextType:limit:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1C99DF000, v9, OS_LOG_TYPE_DEFAULT, "ATXContextWebsiteSuggestionProducer: websites %@", (uint8_t *)&buf, 0xCu);
  }

  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __57__ATXContextWebsiteSuggestionProducer_websiteSuggestions__block_invoke;
  v14[3] = &unk_1E82C5460;
  v14[4] = self;
  v15 = v6;
  v10 = v6;
  objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_DEFAULT, "ATXContextWebsiteSuggestionProducer: websiteSuggestions: %@", (uint8_t *)&buf, 0xCu);
  }

  return v11;
}

id __57__ATXContextWebsiteSuggestionProducer_websiteSuggestions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "webpageTitlesAndSubtitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_suggestionWithWebsite:titlesAndSubtitles:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_suggestionWithWebsite:(id)a3 titlesAndSubtitles:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[ATXContextWebsiteSuggestionProducer titleAndSubtitleForUrl:titlesAndSubtitles:](self, "titleAndSubtitleForUrl:titlesAndSubtitles:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CF8C28]);
    -[NSDateInterval startDate](self->_validDateInterval, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateInterval endDate](self->_validDateInterval, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:lockScreenEligible:predicate:", v11, v12, 0, 0);

    +[ATXContextHeuristicSuggestionProducer suggestionWithURL:actionTitle:subtitle:bundleID:score:predictionReasons:criteria:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithURL:actionTitle:subtitle:bundleID:score:predictionReasons:criteria:dateInterval:", v6, v8, v9, CFSTR("com.apple.mobilesafari"), 1 << self->_reasonCode, v13, self->_score, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)titleAndSubtitleForUrl:(id)a3 titlesAndSubtitles:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "URLByAppendingPathComponent:", &stru_1E82C5A18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLByAppendingPathComponent:", &stru_1E82C5A18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v14)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16 != 2)
            goto LABEL_13;
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v17 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v17;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validDateInterval, 0);
}

@end
