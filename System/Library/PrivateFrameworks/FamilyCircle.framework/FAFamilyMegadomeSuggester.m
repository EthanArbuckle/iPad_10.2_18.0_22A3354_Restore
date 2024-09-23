@implementation FAFamilyMegadomeSuggester

- (FAFamilyMegadomeSuggester)init
{
  FAMegadomeRecommendationsLoader *v3;
  FAFamilyMegadomeSuggester *v4;

  v3 = objc_alloc_init(FAMegadomeRecommendationsLoader);
  v4 = -[FAFamilyMegadomeSuggester initWithRecommendationLoader:](self, "initWithRecommendationLoader:", v3);

  return v4;
}

- (FAFamilyMegadomeSuggester)initWithRecommendationLoader:(id)a3
{
  id v5;
  FAFamilyMegadomeSuggester *v6;
  FAFamilyMegadomeSuggester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyMegadomeSuggester;
  v6 = -[FAFamilyMegadomeSuggester init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_recommendationLoader, a3);

  return v7;
}

- (int64_t)proactiveModel
{
  return 3;
}

- (id)getFamilyRecommendationsWithContext:(id *)a3 error:(id *)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void (**v14)(void *, _QWORD, FAFamilySuggesterFeedbackContext *);
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  FAFamilySuggesterFeedbackContext *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v43;
  id v44;
  _QWORD aBlock[8];
  uint8_t buf[16];

  _FASignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = _FASignpostCreate(v7);
  v10 = v9;

  _FASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MegadomeFetchRecommendation", ", buf, 2u);
  }

  _FASignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[FAFamilyMegadomeSuggester getFamilyRecommendationsWithContext:error:].cold.3(v8, v13);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__FAFamilyMegadomeSuggester_getFamilyRecommendationsWithContext_error___block_invoke;
  aBlock[3] = &__block_descriptor_64_e54_v24__0__NSError_8__FAFamilySuggesterFeedbackContext_16l;
  aBlock[4] = v8;
  aBlock[5] = v10;
  aBlock[6] = a3;
  aBlock[7] = a4;
  v14 = (void (**)(void *, _QWORD, FAFamilySuggesterFeedbackContext *))_Block_copy(aBlock);
  _FALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAEBA000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to get Family suggestions from Megadome", buf, 2u);
  }

  -[FAFamilyMegadomeSuggester recommendationLoader](self, "recommendationLoader");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v16, "peopleViewWithError:", &v44);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v44;

  if (v17)
  {
    -[FAFamilyMegadomeSuggester recommendationLoader](self, "recommendationLoader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v19, "megadomeResultsForFamilyTagWithError:", &v43);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v43;

    if (v20)
    {
      -[FAFamilyMegadomeSuggester recommendationLoader](self, "recommendationLoader");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scoredEntities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "megadomePeopleFromScoredEntities:inVisualIdentifierView:", v23, v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[FAFamilyMegadomeSuggester peopleNotAlreadyInFamilyInPersonArray:](self, "peopleNotAlreadyInFamilyInPersonArray:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyMegadomeSuggester recommendedFamilyMembersForMegadomeResults:](self, "recommendedFamilyMembersForMegadomeResults:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[FAFamilySuggesterFeedbackContext initWithMegadomeFeedbackEventID:]([FAFamilySuggesterFeedbackContext alloc], "initWithMegadomeFeedbackEventID:", objc_msgSend(v20, "feedbackEventId"));
      v14[2](v14, 0, v27);

    }
    else
    {
      _FALogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[FAFamilyMegadomeSuggester getFamilyRecommendationsWithContext:error:].cold.2((uint64_t)v21, v35, v36, v37, v38, v39, v40, v41);

      ((void (**)(void *, id, FAFamilySuggesterFeedbackContext *))v14)[2](v14, v21, 0);
      v26 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    _FALogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[FAFamilyMegadomeSuggester getFamilyRecommendationsWithContext:error:].cold.1((uint64_t)v18, v28, v29, v30, v31, v32, v33, v34);

    ((void (**)(void *, id, FAFamilySuggesterFeedbackContext *))v14)[2](v14, v18, 0);
    v26 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v26;
}

void __71__FAFamilyMegadomeSuggester_getFamilyRecommendationsWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a2;
  v6 = a3;
  Nanoseconds = _FASignpostGetNanoseconds(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  _FASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v9, OS_SIGNPOST_INTERVAL_END, v10, "MegadomeFetchRecommendation", ", v12, 2u);
  }

  _FASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __71__FAFamilyMegadomeSuggester_getFamilyRecommendationsWithContext_error___block_invoke_cold_1((uint64_t *)(a1 + 32), v11, (double)Nanoseconds / 1000000000.0);

  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v6);
  if (*(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = objc_retainAutorelease(v5);

}

- (id)peopleNotAlreadyInFamilyInPersonArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  const char *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v26;
  id v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FAFamilyMegadomeSuggester recommendationLoader](self, "recommendationLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "familyHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v26 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v7)
    {
      v8 = v7;
      v29 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v10, "emails");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "arrayWithArray:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "phoneNumbers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[FAMegadomeRecommendationsLoader normalizedPhoneNumbersForPhoneNumbers:](FAMegadomeRecommendationsLoader, "normalizedPhoneNumbersForPhoneNumbers:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "addObjectsFromArray:", v15);
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v16 = v13;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v31;
            while (2)
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v31 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(const char **)(*((_QWORD *)&v30 + 1) + 8 * j);
                if (objc_msgSend(v6, "containsObject:", v21))
                {
                  _FALogSystem();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v39 = v21;
                    v40 = 2112;
                    v41 = v10;
                    _os_log_impl(&dword_1CAEBA000, v22, OS_LOG_TYPE_DEFAULT, "Handle \"%@\" already in Family. Removing recommendation from array: %@", buf, 0x16u);
                  }

                  goto LABEL_19;
                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
              if (v18)
                continue;
              break;
            }
          }

          objc_msgSend(v27, "addObject:", v10);
LABEL_19:

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v8);
    }

    v23 = (id)objc_msgSend(v27, "copy");
    v4 = v26;
  }
  else
  {
    _FALogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[FAFamilyMegadomeSuggester peopleNotAlreadyInFamilyInPersonArray:]";
      _os_log_impl(&dword_1CAEBA000, v24, OS_LOG_TYPE_DEFAULT, "No Family handles. Returning early from %s.", buf, 0xCu);
    }

    v23 = v4;
  }

  return v23;
}

- (id)recommendedFamilyMembersForMegadomeResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FARecommendedFamilyMember *v11;
  FARecommendedFamilyMember *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [FARecommendedFamilyMember alloc];
        v12 = -[FARecommendedFamilyMember initWithMegadomeRecommendation:](v11, "initWithMegadomeRecommendation:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (FAMegadomeRecommendationLoading)recommendationLoader
{
  return self->_recommendationLoader;
}

- (void)setRecommendationLoader:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationLoader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationLoader, 0);
}

- (void)getFamilyRecommendationsWithContext:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, a2, a3, "Error initializing megadome visual identifier view: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

- (void)getFamilyRecommendationsWithContext:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, a2, a3, "Error initializing megadome entities for Family tag: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

- (void)getFamilyRecommendationsWithContext:(uint64_t)a1 error:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: MegadomeFetchRecommendation ", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

void __71__FAFamilyMegadomeSuggester_getFamilyRecommendationsWithContext_error___block_invoke_cold_1(uint64_t *a1, NSObject *a2, double a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a3;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:MegadomeFetchRecommendation ", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

@end
