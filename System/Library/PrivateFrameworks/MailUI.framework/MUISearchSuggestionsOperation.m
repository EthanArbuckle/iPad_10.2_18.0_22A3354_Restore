@implementation MUISearchSuggestionsOperation

void __40___MUISearchSuggestionsOperation_cancel__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[6];
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "second", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cancel");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __58___MUISearchSuggestionsOperation__startQueryForSuggester___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_signpost_id_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
  {
    v5 = *(unsigned __int8 *)(a1 + 56);
    signpostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (v4 == -1 || !os_signpost_enabled(v6))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v8 = "com.apple.mail.search.suggestion.zkw.suggester";
    }
    else
    {
      if (v4 == -1 || !os_signpost_enabled(v6))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v8 = "com.apple.mail.search.suggestion.ayt.suggester";
    }
    _os_signpost_emit_with_name_impl(&dword_1D5522000, v7, OS_SIGNPOST_INTERVAL_END, v4, v8, "", buf, 2u);
LABEL_10:

  }
  v9 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___MUISearchSuggestionsOperation__startQueryForSuggester___block_invoke_2;
  block[3] = &unk_1E99E3578;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v12 = *(id *)(a1 + 40);
  v13 = v3;
  v10 = v3;
  dispatch_async(v9, block);

  objc_destroyWeak(&v14);
}

void __58___MUISearchSuggestionsOperation__startQueryForSuggester___block_invoke_2(void **a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  -[_MUISearchSuggestionsOperation _suggester:didCompleteWithSuggestions:]((uint64_t)WeakRetained, a1[4], a1[5]);

}

void __58___MUISearchSuggestionsOperation__asyncCompleteSuggester___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_MUISearchSuggestionsOperation _suggester:didCompleteWithSuggestions:]((uint64_t)WeakRetained, *(void **)(a1 + 32), 0);

}

id __56___MUISearchSuggestionsOperation__runningSuggesterNames__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "first");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __72___MUISearchSuggestionsOperation__suggester_didCompleteWithSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

@end
