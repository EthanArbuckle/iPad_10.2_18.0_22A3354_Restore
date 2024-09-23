@implementation ATXStaticSuggestionsManager

+ (id)preservePreviousAppPositionsForPreviousSuggestions:(id)a3 newSuggestions:(id)a4 uiLimit:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (+[ATXStaticSuggestionsManager suggestionsAreAllAppExecutableTypeAndHaveValidHash:](ATXStaticSuggestionsManager, "suggestionsAreAllAppExecutableTypeAndHaveValidHash:", v7)&& +[ATXStaticSuggestionsManager suggestionsAreAllAppExecutableTypeAndHaveValidHash:](ATXStaticSuggestionsManager, "suggestionsAreAllAppExecutableTypeAndHaveValidHash:", v8))
  {
    v30 = v7;
    +[ATXStaticSuggestionsManager executableObjectHashToPositionMappingForSuggestions:](ATXStaticSuggestionsManager, "executableObjectHashToPositionMappingForSuggestions:", v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "mutableCopy");
    v31 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    v11 = objc_msgSend(v8, "count");
    if (v11 >= a5)
      v12 = a5;
    else
      v12 = v11;
    if (v12)
    {
      for (i = 0; i < v20; ++i)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v14, "executableSpecification");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "executableObjectHash"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[ATXStaticSuggestionsManager isValidPreviousPosition:uiLimit:newSuggestionsCount:](ATXStaticSuggestionsManager, "isValidPreviousPosition:uiLimit:newSuggestionsCount:", v18, a5, objc_msgSend(v8, "count")))
        {
          objc_msgSend(v9, "setObject:atIndexedSubscript:", v14, objc_msgSend(v18, "unsignedIntegerValue"));
          objc_msgSend(v10, "addIndex:", objc_msgSend(v18, "unsignedIntegerValue"));
        }
        else
        {
          objc_msgSend(v31, "addObject:", v14);
        }

        v19 = objc_msgSend(v8, "count");
        if (v19 >= a5)
          v20 = a5;
        else
          v20 = v19;
      }
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = v31;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v34;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v21);
          v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v26);
          if (v24 < objc_msgSend(v9, "count"))
          {
            v28 = v24;
            while ((objc_msgSend(v10, "containsIndex:", v28) & 1) != 0)
            {
              if (++v28 >= objc_msgSend(v9, "count"))
                goto LABEL_26;
            }
            objc_msgSend(v9, "setObject:atIndexedSubscript:", v27, v28);
            v24 = v28 + 1;
          }
LABEL_26:
          ++v26;
        }
        while (v26 != v23);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v23);
    }

    v7 = v30;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

+ (BOOL)suggestionsAreAllAppExecutableTypeAndHaveValidHash:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "executableSpecification", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "executableType");

        if (v10 == 1)
        {
          objc_msgSend(v8, "executableSpecification");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "executableObjectHash");

          if (v12)
            continue;
        }
        v13 = 0;
        goto LABEL_13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v13 = 1;
  }
LABEL_13:

  return v13;
}

+ (BOOL)isValidPreviousPosition:(id)a3 uiLimit:(unint64_t)a4 newSuggestionsCount:(unint64_t)a5
{
  id v7;
  void *v8;
  BOOL v9;

  v7 = a3;
  v8 = v7;
  v9 = v7 && objc_msgSend(v7, "unsignedIntegerValue") < a4 && objc_msgSend(v8, "unsignedIntegerValue") < a5;

  return v9;
}

+ (id)executableObjectHashToPositionMappingForSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__ATXStaticSuggestionsManager_executableObjectHashToPositionMappingForSuggestions___block_invoke;
  v7[3] = &unk_1E82DDF00;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __83__ATXStaticSuggestionsManager_executableObjectHashToPositionMappingForSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "executableSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "executableObjectHash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v10);

}

@end
