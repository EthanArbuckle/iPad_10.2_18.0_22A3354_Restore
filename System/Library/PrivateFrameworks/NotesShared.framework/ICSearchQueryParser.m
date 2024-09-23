@implementation ICSearchQueryParser

+ (id)_queryStringForSingleTokenString:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5 queryFlags:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0D64278], "stringByEscapingSearchString:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__13;
  v29 = __Block_byref_object_dispose__13;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0D64278], "queryFields");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __89__ICSearchQueryParser__queryStringForSingleTokenString_queryFields_matchType_queryFlags___block_invoke;
  v20 = &unk_1E76C99A0;
  v13 = v12;
  v21 = v13;
  v14 = v11;
  v24 = a5;
  v22 = v14;
  v23 = &v25;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);
  objc_msgSend((id)v26[5], "componentsJoinedByString:", CFSTR(" || "), v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __89__ICSearchQueryParser__queryStringForSingleTokenString_queryFields_matchType_queryFlags___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v3)
    v4 = *(__CFString **)(a1 + 40);
  else
    v4 = &stru_1E76DB108;
  v5 = v4;
  switch(*(_BYTE *)(a1 + 56))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@\"%@"), v10, *(_QWORD *)(a1 + 32), v5);
      goto LABEL_10;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@*\"%@"), v10, *(_QWORD *)(a1 + 32), v5);
      goto LABEL_10;
    case 2:
      if (v3)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%3.3d"), 66);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("f%@"), v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = &stru_1E76DB108;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@*\"%@%@"), v10, *(_QWORD *)(a1 + 32), v5, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        break;
      goto LABEL_11;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"*%@*\"%@"), v10, *(_QWORD *)(a1 + 32), v5);
LABEL_10:
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
LABEL_11:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);

      }
      break;
    default:
      break;
  }

}

+ (id)queryStringForSearchString:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5
{
  return (id)objc_msgSend(a1, "_queryStringForSingleTokenString:queryFields:matchType:queryFlags:", a3, a4, a5, CFSTR("cwdt"));
}

+ (id)queryStringForExpandedTokens:(id)a3 queryFields:(id)a4 matchType:(unsigned __int8)a5
{
  unsigned int v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v11, "count"))
        {
          v13 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              v15 = 0;
            else
              v15 = v5;
            objc_msgSend(a1, "_queryStringForSingleTokenString:queryFields:matchType:queryFlags:", v14, v9, v15, CFSTR("cwd"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v16);

            ++v13;
          }
          while (v13 < objc_msgSend(v11, "count"));
        }
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" || "));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("(%@)"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "addObject:", v19);
        ++v10;
      }
      while (v10 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v25);
  }

  objc_msgSend(v24, "componentsJoinedByString:", CFSTR(" && "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)prefixMatchingQueryStringForSearchString:(id)a3 enableSpellCheckSPI:(BOOL)a4 languageForSpellchecking:(id)a5 expandedTokens:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  _QWORD v21[2];

  v8 = a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", *MEMORY[0x1E0D64470]);

  if (v13)
    v14 = 1;
  else
    v14 = !v8;
  if (v14)
  {
    v20 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "queryStringForSearchString:queryFields:matchType:", v10, 0, 1);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ICSearchQueryTokenizer expandedTokensForSearchString:language:](ICSearchQueryTokenizer, "expandedTokensForSearchString:language:", v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryStringForExpandedTokens:queryFields:matchType:", v16, 0, 1);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  if (a6)
    *a6 = objc_retainAutorelease(v16);

  return v18;
}

@end
