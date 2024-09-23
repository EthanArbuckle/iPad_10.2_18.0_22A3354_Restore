@implementation MUIResultSuggestionQuery

- (id)initWithPhraseManager:(void *)a3 handler:(void *)a4 suggester:
{
  id v8;
  id v9;
  id *v10;
  id *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id *v21;
  uint64_t v23;
  id v24;
  id v25;
  objc_super v26;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!a1)
    goto LABEL_9;
  v26.receiver = a1;
  v26.super_class = (Class)MUIResultSuggestionQuery;
  v11 = (id *)objc_msgSendSuper2(&v26, sel_init);
  a1 = v11;
  if (!v11)
    goto LABEL_8;
  objc_storeStrong(v11 + 1, a2);
  v12 = objc_msgSend(v9, "copy");
  v13 = a1[2];
  a1[2] = (id)v12;

  if (v10)
  {
    v14 = v10[1];
    v15 = objc_msgSend(v14, "copy");
    v16 = a1[3];
    a1[3] = (id)v15;

    v17 = v10[2];
  }
  else
  {
    v23 = objc_msgSend(0, "copy");
    v24 = a1[3];
    a1[3] = (id)v23;

    v17 = 0;
  }
  objc_storeStrong(a1 + 4, v17);
  if (v10)
  {
    objc_storeStrong(a1 + 5, v10[3]);
    v18 = v10[4];
  }
  else
  {
    v25 = a1[5];
    a1[5] = 0;

    v18 = 0;
  }
  objc_storeStrong(a1 + 6, v18);
  -[MUIResultSuggestionQuery _createQuery](a1);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = a1[7];
  a1[7] = (id)v19;

  if (a1[7])
  {
LABEL_8:
    a1 = a1;
    v21 = a1;
  }
  else
  {
LABEL_9:
    v21 = 0;
  }

  return v21;
}

- (id)_createQuery
{
  id *v1;
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  _BYTE buf[12];
  __int16 v42;
  void *v43;
  uint64_t v44;

  v1 = a1;
  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1[5];
    objc_msgSend(v2, "senderFilterQueryFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v3, "resultWithTimeout:error:", &v39, 0.25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v39;

    if (!objc_msgSend(v4, "length") || v30)
    {
      +[MUISearchResultsSuggester log](MUISearchResultsSuggester, "log", v30);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[MUIResultSuggestionQuery _createQuery].cold.1((uint64_t)v1, v30, v5);

    }
    v6 = v1[1];
    v7 = v1[6];
    objc_msgSend(v7, "suggestionFilterQueryWithPhraseManager:senderFilterQuery:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0D1E318];
    v10 = v1[1];
    objc_msgSend(v10, "phrase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[1], "updatedSuggestion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "expressionWithQueryString:searchString:updatedSuggestion:", v8, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[MUISearchResultsSuggester log](MUISearchResultsSuggester, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v1[6];
        objc_msgSend(v15, "logIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v1[1];
        objc_msgSend(v17, "phrase");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v16;
        v42 = 2112;
        v43 = v18;
        _os_log_impl(&dword_1D5522000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Generating search result suggestions for phrase %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1[6], "fetchAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
      {
        objc_msgSend(v20, "arrayByAddingObject:", *MEMORY[0x1E0CA6800]);
      }
      else
      {
        v40 = *MEMORY[0x1E0CA6800];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v1);
      v22 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke;
      aBlock[3] = &unk_1E99E3370;
      objc_copyWeak(&v38, (id *)buf);
      v23 = v19;
      v37 = v23;
      v24 = _Block_copy(aBlock);
      v31[0] = v22;
      v31[1] = 3221225472;
      v31[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke_125;
      v31[3] = &unk_1E99E33E8;
      v31[4] = v1;
      v25 = v21;
      v32 = v25;
      v26 = v24;
      v34 = v26;
      objc_copyWeak(&v35, (id *)buf);
      v27 = v23;
      v33 = v27;
      v28 = _Block_copy(v31);
      objc_msgSend(MEMORY[0x1E0D1E328], "queryWithExpression:builder:", v13, v28);
      v1 = (id *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v35);
      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v8 = *(void **)(a1 + 32);
      v9 = WeakRetained[6];
      objc_msgSend(v8, "ef_prefix:", objc_msgSend(v9, "maxItemCount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    +[MUISearchResultsSuggester log](MUISearchResultsSuggester, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v7[6];
      objc_msgSend(v12, "logIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v7[2];
      v15 = _Block_copy(v14);
      v16 = 138544130;
      v17 = v13;
      v18 = 2048;
      v19 = v15;
      v20 = 2114;
      v21 = v5;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1D5522000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] _invokeHandler:<%p> reason:'%{public}@' suggestions:%@", (uint8_t *)&v16, 0x2Au);

    }
    (*((void (**)(void))v7[2] + 2))();

  }
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(_QWORD *)(v5 + 24);
  else
    v6 = 0;
  objc_msgSend(v3, "setBundleID:", v6);
  objc_msgSend(v4, "setFetchAttributes:", *(_QWORD *)(a1 + 40));
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke_2;
  v14[3] = &unk_1E99E1808;
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v4, "setCompletionBlock:", v14);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke_3;
  v11[3] = &unk_1E99E3398;
  objc_copyWeak(&v13, (id *)(a1 + 64));
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v4, "setResultsBlock:", v11);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __40__MUIResultSuggestionQuery__createQuery__block_invoke_129;
  v8[3] = &unk_1E99E33C0;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v4, "setFailureBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);

}

uint64_t __40__MUIResultSuggestionQuery__createQuery__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (uint64_t)WeakRetained;
  if (WeakRetained)
    WeakRetained = (_QWORD *)WeakRetained[6];
  v6 = objc_msgSend(WeakRetained, "maxItemCount");
  if (objc_msgSend(*(id *)(a1 + 32), "count") != v6)
  {
    -[MUIResultSuggestionQuery _messageListFromSearchableItems:](v5, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "first");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v10 = *(id *)(v5 + 48);
      v11 = *(void **)(v5 + 8);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v12 = v11;
    objc_msgSend(v10, "processSuggestionsResults:phraseManager:messageList:", v8, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[MUISearchResultsSuggester log](MUISearchResultsSuggester, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v15 = *(void **)(v5 + 48);
      else
        v15 = 0;
      v16 = v15;
      objc_msgSend(v16, "logIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v17;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_1D5522000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched suggestions results: %@ from searchable items %@", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v13);

  }
}

- (id)_messageListFromSearchableItems:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = v3;
  if (a1)
  {
    v4 = v3;
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D1E308], "persistentIDForSearchableItem:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v5, "addObject:", v13);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "messageObjectIDsForSearchableItemIdentifiers:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectIDByPersistentID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __60__MUIResultSuggestionQuery__messageListFromSearchableItems___block_invoke;
    v31[3] = &unk_1E99E3410;
    v32 = v16;
    v29 = v16;
    objc_msgSend(v7, "ef_compactMap:", v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E1E8], "predicateForMessagesWithObjectIDs:", v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
    v19 = a1;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0D1E2C0]);
    v22 = objc_opt_class();
    v37 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithTargetClass:predicate:sortDescriptors:", v22, v18, v23);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E238]), "initWithQuery:repository:", v24, *(_QWORD *)(v19 + 32));
    objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v17, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[MUISearchResultsSuggester log](MUISearchResultsSuggester, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __40__MUIResultSuggestionQuery__createQuery__block_invoke_129_cold_1((uint64_t)WeakRetained, (uint64_t)v3, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancel
{
  if (self)
    self = (MUIResultSuggestionQuery *)self->_underlyingQuery;
  -[MUIResultSuggestionQuery cancel](self, "cancel");
}

MUISearchSuggestionResult *__60__MUIResultSuggestionQuery__messageListFromSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  MUISearchSuggestionResult *v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D1E308], "persistentIDForSearchableItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    +[MUISearchResultsSuggester log](MUISearchResultsSuggester, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __60__MUIResultSuggestionQuery__messageListFromSearchableItems___block_invoke_cold_1(v3);

    v9 = 0;
  }
  else
  {
    v9 = -[MUISearchSuggestionResult initWithSearchableItem:objectID:]([MUISearchSuggestionResult alloc], "initWithSearchableItem:objectID:", v3, v5);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingQuery, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_senderQueryManager, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_phraseManager, 0);
}

- (void)_createQuery
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v5, "logIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "ef_publicDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_1_0(&dword_1D5522000, a3, v8, "[%{public}@] Sender filter query is empty (error=%{public}@)", (uint8_t *)&v9);

  OUTLINED_FUNCTION_3();
}

void __40__MUIResultSuggestionQuery__createQuery__block_invoke_129_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
    v5 = *(void **)(a1 + 48);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "logIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v7;
  v11 = 2112;
  v12 = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D5522000, a3, v8, "[%{public}@] Failed to fetch suggestions results: %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_3();
}

void __60__MUIResultSuggestionQuery__messageListFromSearchableItems___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D5522000, v2, v3, "No suggestion result for item %@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
