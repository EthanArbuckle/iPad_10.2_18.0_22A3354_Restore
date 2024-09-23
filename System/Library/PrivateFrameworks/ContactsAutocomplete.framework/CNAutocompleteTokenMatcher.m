@implementation CNAutocompleteTokenMatcher

+ (BOOL)doSearchTokens:(id)a3 matchNameTokens:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 <= objc_msgSend(v7, "count"))
  {
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v6, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "indexesOfNameTokens:matchingSearchToken:", v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13828] + 16))() & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v6, "_cn_tail");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __61__CNAutocompleteTokenMatcher_doSearchTokens_matchNameTokens___block_invoke;
        v15[3] = &unk_1E70DF0A8;
        v17 = v12;
        v18 = a1;
        v16 = v7;
        v13 = v12;
        v9 = objc_msgSend(v11, "_cn_any:", v15);

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __61__CNAutocompleteTokenMatcher_doSearchTokens_matchNameTokens___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v4, "removeObjectAtIndex:", a2);
  v5 = objc_msgSend(*(id *)(a1 + 48), "doSearchTokens:matchNameTokens:", *(_QWORD *)(a1 + 40), v4);

  return v5;
}

+ (id)indexesOfNameTokens:(id)a3 matchingSearchToken:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CNAutocompleteTokenMatcher_indexesOfNameTokens_matchingSearchToken___block_invoke;
  v9[3] = &unk_1E70DF0D0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "indexesOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __70__CNAutocompleteTokenMatcher_indexesOfNameTokens_matchingSearchToken___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_hasPrefix:", *(_QWORD *)(a1 + 32));
}

+ (id)tokensForNameString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    if (tokensForNameString__cn_once_token_0 != -1)
      dispatch_once(&tokensForNameString__cn_once_token_0, &__block_literal_global_7);
    objc_msgSend((id)tokensForNameString__cn_once_object_0, "tokenizeNameString:inferredNameOrder:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void __50__CNAutocompleteTokenMatcher_tokensForNameString___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D13AE0]);
  +[CNAutocompleteResult localeForHashing](CNAutocompleteResult, "localeForHashing");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithLocale:", v3);
  v2 = (void *)tokensForNameString__cn_once_object_0;
  tokensForNameString__cn_once_object_0 = v1;

}

@end
