@implementation MUISearchRankedSuggesterQuery

- (uint64_t)initWithPhraseManager:(void *)a3 handler:(void *)a4 suggester:
{
  id v8;
  id v9;
  _QWORD *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v18.receiver = (id)a1;
    v18.super_class = (Class)MUISearchRankedSuggesterQuery;
    v11 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = (uint64_t)v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      v12 = objc_msgSend(v9, "copy");
      v13 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v12;

      if (v10)
        v14 = (void *)v10[1];
      else
        v14 = 0;
      objc_storeStrong((id *)(a1 + 24), v14);
      -[MUISearchRankedSuggesterQuery _createTopHitsQuery](a1);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v15;

    }
  }

  return a1;
}

- (id)_createTopHitsQuery
{
  int v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location[2];

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 8), "phraseKind");
    v3 = 10;
    if (v2 == 1)
      v3 = 4;
    v27 = v3;
    v4 = *(id *)(a1 + 8);
    objc_msgSend(v4, "phrase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "inputLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_stringByRemovingQuotesForLanguages:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc(MEMORY[0x1E0D1E320]);
    v28 = *(id *)(a1 + 8);
    objc_msgSend(v28, "spotlightQueryStrings");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 24);
    v25 = *(id *)(a1 + 8);
    v23 = v9;
    objc_msgSend(v25, "inputLanguages");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(id *)(a1 + 8);
    objc_msgSend(v11, "updatedSuggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D1DFF0];
    v14 = *(id *)(a1 + 8);
    objc_msgSend(v14, "customFlags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(id *)(a1 + 8);
    v22 = v13;
    v17 = (void *)v8;
    v18 = (void *)objc_msgSend(v24, "initWithSearchString:filterQueries:bundleID:keyboardLanguage:updatedSuggestion:generateSuggestions:logDescription:resultLimit:suggestionLimit:customFlags:feedbackQueryID:", v7, v8, v23, v10, v12, 1, CFSTR("Ranked Suggestions"), v22, v27, v15, objc_msgSend(v16, "feedbackQueryID"));

    objc_msgSend(v18, "topHitsQuerySuggestionResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, (id)a1);
    v20 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke;
    v31[3] = &unk_1E99E31D8;
    objc_copyWeak(&v32, location);
    objc_msgSend(v19, "addSuccessBlock:", v31);
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_84;
    v29[3] = &unk_1E99E3200;
    objc_copyWeak(&v30, location);
    objc_msgSend(v19, "addFailureBlock:", v29);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(location);

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

void __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_2;
    v9[3] = &unk_1E99E31B0;
    v9[4] = WeakRetained;
    objc_msgSend(v5, "ef_compactMap:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MUISearchRankedSuggester log](MUISearchRankedSuggester, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "ef_mapSelector:", sel_ef_publicDescription);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D5522000, v7, OS_LOG_TYPE_DEFAULT, "Generated suggestions %@", buf, 0xCu);

    }
    (*(void (**)(void))(WeakRetained[2] + 16))();

  }
}

id __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = objc_msgSend(*(id *)(v4 + 8), "phraseKind") == 1;
  else
    v5 = 0;
  +[MUISearchAtomSuggestion suggestionFromSpotlightSuggestion:shouldShowAvaters:](MUISearchAtomSuggestion, "suggestionFromSpotlightSuggestion:shouldShowAvaters:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;

  v3 = a2;
  +[MUISearchRankedSuggester log](MUISearchRankedSuggester, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_84_cold_1(v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
    (*(void (**)(void))(*((_QWORD *)WeakRetained + 2) + 16))();

}

- (void)cancel
{
  if (self)
    self = (MUISearchRankedSuggesterQuery *)self->_topHitsQuery;
  -[MUISearchRankedSuggesterQuery cancel](self, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topHitsQuery, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_phraseManager, 0);
}

void __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_84_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ef_publicDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D5522000, a2, OS_LOG_TYPE_ERROR, "Failed to generate suggestions %@", (uint8_t *)&v4, 0xCu);

}

@end
