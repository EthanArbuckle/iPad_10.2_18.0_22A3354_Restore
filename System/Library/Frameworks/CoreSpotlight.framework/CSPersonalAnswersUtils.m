@implementation CSPersonalAnswersUtils

+ (void)dataForLocale:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)localizedData;
  if (!localizedData)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)localizedData;
    localizedData = v5;

    v4 = (void *)localizedData;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSpotlight"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("mapPersonalAnswersIntentToPhrase"), CFSTR("plist"), 0, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v34 = v9;
        v35 = v8;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v33 = v10;
        v12 = v10;
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v45;
          v36 = *(_QWORD *)v45;
          v37 = v12;
          do
          {
            v16 = 0;
            v38 = v14;
            do
            {
              if (*(_QWORD *)v45 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v16);
              -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v17, v33);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = 0u;
                v43 = 0u;
                v40 = 0u;
                v41 = 0u;
                v39 = v18;
                v19 = v18;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v41;
                  do
                  {
                    for (i = 0; i != v21; ++i)
                    {
                      if (*(_QWORD *)v41 != v22)
                        objc_enumerationMutation(v19);
                      v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
                      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v24);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v25)
                      {
                        -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v24);
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "addObject:", v17);
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v17);
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v26, v24);
                      }

                    }
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                  }
                  while (v21);
                }

                v15 = v36;
                v12 = v37;
                v14 = v38;
                v18 = v39;
              }

              ++v16;
            }
            while (v16 != v14);
            v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          }
          while (v14);
        }

        objc_msgSend((id)localizedData, "setObject:forKeyedSubscript:", v11, v3);
        v9 = v34;
        v8 = v35;
        v10 = v33;
      }
      else
      {
        logForCSLogCategoryDefault();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          +[CSPersonalAnswersUtils dataForLocale:].cold.2((uint64_t)v3, v11, v27, v28, v29, v30, v31, v32);
      }

    }
    else
    {
      logForCSLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[CSPersonalAnswersUtils dataForLocale:].cold.1();
    }

  }
}

+ (void)getCategoryAttributeMap
{
  if (getCategoryAttributeMap_onceToken != -1)
    dispatch_once(&getCategoryAttributeMap_onceToken, &__block_literal_global_22);
}

void __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v0 = (id *)&unk_1EE03A000;
  if (!categoryAttributeMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)categoryAttributeMap;
    categoryAttributeMap = v1;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSpotlight"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:inDirectory:", CFSTR("mapPersonalAnswersCategoryToAttributes"), CFSTR("plist"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v33 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v33)
        {
          v30 = v4;
          v31 = v3;
          v7 = *(_QWORD *)v39;
          v8 = 0x1E0CB3000uLL;
          v9 = 0x1E0C99000uLL;
          v32 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v39 != v7)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(*(id *)(v8 + 2024), "numberWithInteger:", CategoryIntentFromString(v11));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v9 + 3616), "set");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = v6;
                v16 = v0;
                v36 = 0u;
                v37 = 0u;
                v34 = 0u;
                v35 = 0u;
                v17 = v13;
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
                if (v18)
                {
                  v19 = v18;
                  v20 = *(_QWORD *)v35;
                  do
                  {
                    for (j = 0; j != v19; ++j)
                    {
                      if (*(_QWORD *)v35 != v20)
                        objc_enumerationMutation(v17);
                      objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v30, v31);
                    }
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
                  }
                  while (v19);
                }

                v0 = v16;
                v6 = v15;
                v7 = v32;
                v8 = 0x1E0CB3000;
                v9 = 0x1E0C99000;
              }
              objc_msgSend(v0[420], "setObject:forKey:", v14, v12, v30, v31);

            }
            v33 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v33);
          v4 = v30;
          v3 = v31;
        }
      }
      else
      {
        logForCSLogCategoryDefault();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);

      }
    }
    else
    {
      logForCSLogCategoryDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke_cold_1();
    }

  }
}

+ (void)filterCandidateAttributeIntents:(id)a3 withCategoryIntents:(id)a4 attributeIntents:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!categoryAttributeMap)
    +[CSPersonalAnswersUtils getCategoryAttributeMap](CSPersonalAnswersUtils, "getCategoryAttributeMap");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend((id)categoryAttributeMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unionSet:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v13);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        if (objc_msgSend(v10, "containsObject:", v22, (_QWORD)v23))
          objc_msgSend(v9, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v19);
  }

}

+ (void)processIntentSet:(id)a3 withPhrase:(id)a4 filteredTokens:(id)a5 categoryIntents:(id)a6 candidateAttributeIntents:(id)a7 hasAmbiguousDateIntent:(BOOL *)a8 hasStartDateIntent:(BOOL *)a9 hasEndDateIntent:(BOOL *)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v32 = a7;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v18)
    goto LABEL_22;
  v19 = v18;
  v29 = v16;
  v30 = v15;
  v20 = 0;
  v21 = *(_QWORD *)v34;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v34 != v21)
        objc_enumerationMutation(v14);
      v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v22);
      if (objc_msgSend(v23, "hasPrefix:", CFSTR("CAT_"), v29, v30))
      {
        v24 = CategoryIntentFromString(v23);
        if (v24 != 7)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v17;
LABEL_9:
          objc_msgSend(v26, "addObject:", v25);

          v20 = 1;
        }
      }
      else if (objc_msgSend(v23, "hasPrefix:", CFSTR("ATTR_")))
      {
        v20 = 1;
        switch(AttributeIntentFromString(v23))
        {
          case 13:
            v27 = a8;
            goto LABEL_16;
          case 14:
            v27 = a9;
            goto LABEL_16;
          case 15:
            v27 = a10;
LABEL_16:
            *v27 = 1;
            break;
          case 16:
            break;
          default:
            objc_msgSend(v23, "substringFromIndex:", 5);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v32;
            goto LABEL_9;
        }
      }
      else
      {
        v20 |= objc_msgSend(v23, "isEqualToString:", CFSTR("STOPWORDS"));
      }
      ++v22;
    }
    while (v19 != v22);
    v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v19 = v28;
  }
  while (v28);
  v16 = v29;
  v15 = v30;
  if ((v20 & 1) == 0)
LABEL_22:
    objc_msgSend(v16, "addObject:", v15);

}

+ (void)intentsForStringTokens:(id)a3 filteredTokens:(id)a4 categoryIntents:(id)a5 attributeIntents:(id)a6 locale:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  char v32;
  __int16 v33;

  v11 = a3;
  v12 = a4;
  v31 = a5;
  v30 = a6;
  v13 = a7;
  +[CSPersonalAnswersUtils dataForLocale:](CSPersonalAnswersUtils, "dataForLocale:", v13);
  v29 = v13;
  objc_msgSend((id)localizedData, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v32 = 0;
  if (objc_msgSend(v11, "count"))
  {
    v16 = 0;
    while (v16 < objc_msgSend(v11, "count") - 1)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v16 + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ %@"), v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_8;
      objc_msgSend(v14, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_8;
      objc_msgSend(v14, "objectForKeyedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSPersonalAnswersUtils processIntentSet:withPhrase:filteredTokens:categoryIntents:candidateAttributeIntents:hasAmbiguousDateIntent:hasStartDateIntent:hasEndDateIntent:](CSPersonalAnswersUtils, "processIntentSet:withPhrase:filteredTokens:categoryIntents:candidateAttributeIntents:hasAmbiguousDateIntent:hasStartDateIntent:hasEndDateIntent:", v22, v20, v12, v31, v15, (char *)&v33 + 1, &v33, &v32);
      ++v16;
LABEL_11:

      if (++v16 >= objc_msgSend(v11, "count"))
        goto LABEL_12;
    }
    v20 = 0;
LABEL_8:
    objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
    if (v24)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSPersonalAnswersUtils processIntentSet:withPhrase:filteredTokens:categoryIntents:candidateAttributeIntents:hasAmbiguousDateIntent:hasStartDateIntent:hasEndDateIntent:](CSPersonalAnswersUtils, "processIntentSet:withPhrase:filteredTokens:categoryIntents:candidateAttributeIntents:hasAmbiguousDateIntent:hasStartDateIntent:hasEndDateIntent:", v25, v26, v12, v31, v15, (char *)&v33 + 1, &v33, &v32);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v22);
    }
    goto LABEL_11;
  }
LABEL_12:
  +[CSPersonalAnswersUtils filterCandidateAttributeIntents:withCategoryIntents:attributeIntents:](CSPersonalAnswersUtils, "filterCandidateAttributeIntents:withCategoryIntents:attributeIntents:", v15, v31, v30);
  if (v32)
  {
    v27 = CFSTR("kMDItemEndDate");
    v28 = v29;
LABEL_16:
    objc_msgSend(v30, "addObject:", v27);
    goto LABEL_17;
  }
  v28 = v29;
  if (HIBYTE(v33) | v33)
  {
    v27 = CFSTR("kMDItemStartDate");
    goto LABEL_16;
  }
LABEL_17:

}

+ (void)dataForLocale:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 138412802;
  OUTLINED_FUNCTION_2_5();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_18C42F000, v2, OS_LOG_TYPE_ERROR, "%@ file for bundle ID %@ and locale %@ not found.", (uint8_t *)v3, 0x20u);
}

+ (void)dataForLocale:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, a2, a3, "Failed to load the PersonalAnswers plist dictionary for locale %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke_cold_1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_2_5();
  _os_log_error_impl(&dword_18C42F000, v0, OS_LOG_TYPE_ERROR, "%@ file for bundle ID %@ not found.", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __49__CSPersonalAnswersUtils_getCategoryAttributeMap__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, a1, a3, "Failed to load plist dictionary from file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
