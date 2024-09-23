@implementation _MUISearchSuggestionsOperation

- (id)initWithRequestID:(void *)a3 phraseManager:(void *)a4 suggestionsGenerator:
{
  id v8;
  id v9;
  _QWORD *v10;
  id *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  objc_super v20;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)_MUISearchSuggestionsOperation;
    v11 = (id *)objc_msgSendSuper2(&v20, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
      if (v10)
        v12 = (void *)v10[2];
      else
        v12 = 0;
      v13 = v12;
      v14 = objc_msgSend(v13, "copy");
      v15 = a1[5];
      a1[5] = (id)v14;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = a1[6];
      a1[6] = (id)v16;

      objc_storeWeak(a1 + 2, v10);
      if (v10)
        v18 = (void *)v10[6];
      else
        v18 = 0;
      objc_storeStrong(a1 + 7, v18);
    }
  }

  return a1;
}

- (void)start
{
  _DWORD *v4;
  int v5;
  id v6;
  _DWORD *v7;
  int v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD **)(a1 + 24);
  if (v4)
    v5 = v4[2];
  else
    v5 = 0;
  v6 = *(id *)(a1 + 48);
  v7 = v4;
  v8 = objc_msgSend(v6, "count");
  -[_MUISearchSuggestionsOperation _runningSuggesterNames]((dispatch_queue_t *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 67109634;
  v10[1] = v5;
  v11 = 1024;
  v12 = v8;
  v13 = 2114;
  v14 = v9;
  _os_log_debug_impl(&dword_1D5522000, a2, OS_LOG_TYPE_DEBUG, "Search #%u, %u suggester(s) ('%{public}@') running async.", (uint8_t *)v10, 0x18u);

}

- (void)cancel
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  unsigned __int8 *v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  _DWORD *v10;
  int v11;
  const char *v12;
  _DWORD *v13;
  int v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1 + 8;
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 | 1, v1));
    if ((v2 & 1) == 0)
    {
      v3 = a1;
      signpostLog();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = os_signpost_enabled(v4);

      if (!v5)
      {
LABEL_19:

        v15 = *((_QWORD *)v3 + 7);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __40___MUISearchSuggestionsOperation_cancel__block_invoke;
        block[3] = &unk_1E99E1258;
        block[4] = v3;
        dispatch_async(v15, block);
        return;
      }
      v6 = objc_msgSend(*((id *)v3 + 4), "phraseKind");
      signpostLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*((id *)v3 + 4), "signpostID");
      v9 = v8;
      if (v6)
      {
        if ((unint64_t)(v8 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
          goto LABEL_18;
        v10 = *((id *)v3 + 3);
        if (v10)
        {
          v11 = v10[2];

        }
        else
        {
          v11 = 0;
        }
        *(_DWORD *)buf = 67109120;
        v18 = v11;
        v12 = "com.apple.mail.search.suggestion.zkw.cancel";
      }
      else
      {
        if ((unint64_t)(v8 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
          goto LABEL_18;
        v13 = *((id *)v3 + 3);
        if (v13)
        {
          v14 = v13[2];

        }
        else
        {
          v14 = 0;
        }
        *(_DWORD *)buf = 67109120;
        v18 = v14;
        v12 = "com.apple.mail.search.suggestion.ayt.cancel";
      }
      _os_signpost_emit_with_name_impl(&dword_1D5522000, v7, OS_SIGNPOST_EVENT, v9, v12, "Cancelled id=%{signpost.description:attribute}u", buf, 8u);
LABEL_18:

      goto LABEL_19;
    }
  }
}

- (id)_startQueryForSuggester:(dispatch_queue_t *)a1
{
  id v3;
  NSObject *v4;
  dispatch_queue_t *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  char *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _DWORD *v14;
  int v15;
  _DWORD *v16;
  void *v17;
  unint64_t v18;
  _DWORD *v19;
  int v20;
  _DWORD *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  id v31[3];
  uint8_t buf[8];
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[7]);
    v4 = a1[7];
    v5 = a1;
    v6 = v3;
    signpostLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_enabled(v7);

    if (v8)
    {
      signpostLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (char *)os_signpost_id_generate(v9);

      v11 = -[NSObject phraseKind](v5[4], "phraseKind");
      signpostLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
        {
          v14 = v5[3];
          if (v14)
            v15 = v14[2];
          else
            v15 = 0;
          v16 = v14;
          objc_msgSend(v6, "logIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v15;
          v33 = 2114;
          v34 = v17;
          _os_signpost_emit_with_name_impl(&dword_1D5522000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "com.apple.mail.search.suggestion.zkw.suggester", "id=%{signpost.description:attribute}u suggester=%{signpost.description:attribute,public}@", buf, 0x12u);

        }
      }
      else if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        v19 = v5[3];
        if (v19)
          v20 = v19[2];
        else
          v20 = 0;
        v21 = v19;
        objc_msgSend(v6, "logIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v20;
        v33 = 2114;
        v34 = v22;
        _os_signpost_emit_with_name_impl(&dword_1D5522000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "com.apple.mail.search.suggestion.ayt.suggester", "id=%{signpost.description:attribute}u suggester=%{signpost.description:attribute,public}@", buf, 0x12u);

      }
      v18 = -[NSObject phraseKind](v5[4], "phraseKind");
    }
    else
    {
      v18 = 0;
      v10 = 0;
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v5);
    v23 = v5[4];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __58___MUISearchSuggestionsOperation__startQueryForSuggester___block_invoke;
    v29[3] = &unk_1E99E3660;
    v31[1] = (id)v18;
    v31[2] = v10;
    v29[4] = v4;
    objc_copyWeak(v31, (id *)buf);
    v24 = v6;
    v30 = v24;
    objc_msgSend(v24, "generateSuggestionsUsingPhraseManager:handler:", v23, v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v5[6];
    objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v26, "addObject:", v27);

    objc_destroyWeak(v31);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)_asyncCompleteSuggester:(_QWORD *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v3 = a2;
  if (a1)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    v4 = (void *)a1[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58___MUISearchSuggestionsOperation__asyncCompleteSuggester___block_invoke;
    block[3] = &unk_1E99E35C0;
    v5 = v4;
    objc_copyWeak(&v8, &location);
    v7 = v3;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (id)_runningSuggesterNames
{
  id *v1;
  void *v2;

  v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[7]);
    objc_msgSend(v1[6], "ef_map:", &__block_literal_global_106);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)_suggester:(void *)a3 didCompleteWithSuggestions:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD *v11;
  int v12;
  _DWORD *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _DWORD *v20;
  int v21;
  _DWORD *v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  _DWORD *v26;
  int v27;
  _DWORD *v28;
  void *v29;
  void *v30;
  _DWORD *v31;
  int v32;
  _DWORD *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (v6)
      -[_MUISearchSuggestionsOperation suggester:producedSuggestions:](a1, v5, v6);
    v7 = *(void **)(a1 + 48);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __72___MUISearchSuggestionsOperation__suggester_didCompleteWithSuggestions___block_invoke;
    v35[3] = &unk_1E99E36C8;
    v8 = v5;
    v36 = v8;
    v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v35);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!objc_msgSend(v6, "count"))
      {
LABEL_27:

        goto LABEL_28;
      }
      +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_DWORD **)(a1 + 24);
        if (v11)
          v12 = v11[2];
        else
          v12 = 0;
        v13 = v11;
        objc_msgSend(v8, "logIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 67109634;
        v38 = v12;
        v39 = 2114;
        v40 = v14;
        v41 = 1024;
        LODWORD(v42) = v15;
        _os_log_error_impl(&dword_1D5522000, v10, OS_LOG_TYPE_ERROR, "Search #%u suggester '%{public}@' did produce %u suggestions but it is no longer running. Ignoring.", buf, 0x18u);

      }
    }
    else
    {
      v16 = v9;
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "second");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(_DWORD **)(a1 + 24);
          if (v20)
            v21 = v20[2];
          else
            v21 = 0;
          v22 = v20;
          objc_msgSend(v8, "logIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v38 = v21;
          v39 = 2114;
          v40 = v23;
          _os_log_impl(&dword_1D5522000, v19, OS_LOG_TYPE_DEFAULT, "Search #%u completed async suggester '%{public}@'.", buf, 0x12u);

        }
      }
      objc_msgSend(*(id *)(a1 + 48), "removeObjectAtIndex:", v16);
      v24 = objc_msgSend(*(id *)(a1 + 48), "count");
      +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (!v24)
      {
        if (v25)
        {
          v31 = *(_DWORD **)(a1 + 24);
          if (v31)
            v32 = v31[2];
          else
            v32 = 0;
          v33 = v31;
          objc_msgSend(v8, "logIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v38 = v32;
          v39 = 2114;
          v40 = v34;
          _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "Search #%u did complete suggester '%{public}@'. All suggesters done.", buf, 0x12u);

        }
        -[_MUISearchSuggestionsOperation _didCompleteAllSuggesters](a1);
        goto LABEL_27;
      }
      if (v25)
      {
        v26 = *(_DWORD **)(a1 + 24);
        if (v26)
          v27 = v26[2];
        else
          v27 = 0;
        v28 = v26;
        objc_msgSend(v8, "logIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MUISearchSuggestionsOperation _runningSuggesterNames]((dispatch_queue_t *)a1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v38 = v27;
        v39 = 2114;
        v40 = v29;
        v41 = 2114;
        v42 = v30;
        v43 = 1024;
        v44 = v24;
        _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "Search #%u did complete suggester '%{public}@'. '%{public}@' (%u) remaining.", buf, 0x22u);

      }
    }

    goto LABEL_27;
  }
LABEL_28:

}

- (void)suggester:(void *)a3 producedSuggestions:
{
  id v5;
  id v6;
  NSObject *v7;
  _DWORD *v8;
  int v9;
  _DWORD *v10;
  void *v11;
  MUISearchResult *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id *v17;
  id WeakRetained;
  _DWORD v19[2];
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_DWORD **)(a1 + 24);
      if (v8)
        v9 = v8[2];
      else
        v9 = 0;
      v10 = v8;
      objc_msgSend(v5, "logIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = 67109634;
      v19[1] = v9;
      v20 = 2114;
      v21 = v11;
      v22 = 1024;
      v23 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1D5522000, v7, OS_LOG_TYPE_DEFAULT, "Search #%u suggester '%{public}@' produced %u suggestions.", (uint8_t *)v19, 0x18u);

    }
    v12 = [MUISearchResult alloc];
    objc_msgSend(v5, "categories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 24);
    v15 = *(id *)(a1 + 32);
    v16 = v14;
    v17 = -[MUISearchResult initWithSuggestions:categories:requestID:phraseKind:]((id *)&v12->super.isa, v6, v13, v16, objc_msgSend(v15, "phraseKind"));

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    -[MUISearchSuggestionsGenerator _didProduceResult:]((uint64_t)WeakRetained, v17);

  }
}

- (void)_didCompleteAllSuggesters
{
  unsigned __int8 v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    v2 = atomic_load((unsigned __int8 *)(a1 + 8));
    +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if ((v2 & 1) != 0)
    {
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 24);
        if (v5)
          LODWORD(v5) = *(_DWORD *)(v5 + 8);
        v9 = 67109120;
        v10 = v5;
        v6 = "Cancelled search #%u did complete all suggesters.";
LABEL_11:
        _os_log_impl(&dword_1D5522000, v3, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 8u);
      }
    }
    else if (v4)
    {
      v7 = *(_QWORD *)(a1 + 24);
      if (v7)
        LODWORD(v7) = *(_DWORD *)(v7 + 8);
      v9 = 67109120;
      v10 = v7;
      v6 = "Search #%u did complete all suggesters.";
      goto LABEL_11;
    }

    signpostEndRunInterval((void *)a1, v2 & 1);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    -[MUISearchSuggestionsGenerator _operationDidComplete:]((uint64_t)WeakRetained, (void *)a1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_runningSuggesters, 0);
  objc_storeStrong((id *)&self->_suggesters, 0);
  objc_storeStrong((id *)&self->_phraseManager, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_destroyWeak((id *)&self->_generator);
}

@end
