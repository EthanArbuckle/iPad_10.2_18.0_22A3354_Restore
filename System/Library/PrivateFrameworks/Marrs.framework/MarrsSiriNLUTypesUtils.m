@implementation MarrsSiriNLUTypesUtils

+ (BOOL)isResponseEmpty:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "rewriteHypotheses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

+ (id)firstRewrittenUtteranceOfResponse:(id)a3 WithDefaultValue:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (+[MarrsSiriNLUTypesUtils isResponseEmpty:](MarrsSiriNLUTypesUtils, "isResponseEmpty:", v5))
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v5, "rewriteHypotheses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "utterance");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)firstRewrittenUtteranceOfResponse:(id)a3
{
  +[MarrsSiriNLUTypesUtils firstRewrittenUtteranceOfResponse:WithDefaultValue:](MarrsSiriNLUTypesUtils, "firstRewrittenUtteranceOfResponse:WithDefaultValue:", a3, &stru_1E7C67E88);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)emptyResponse
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0D9FA18]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "copy");
  objc_msgSend(v2, "setRewriteHypotheses:", v3);

  objc_msgSend(v2, "setRepetitionType:", 0);
  return v2;
}

+ (BOOL)isRequestEmpty:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "originalInteractions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "originalInteractions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originalUtterances");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)firstUtteranceOfRequest:(id)a3 WithDefaultValue:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (+[MarrsSiriNLUTypesUtils isRequestEmpty:](MarrsSiriNLUTypesUtils, "isRequestEmpty:", v5))
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v5, "originalInteractions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "originalUtterances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "utterance");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)firstUtteranceOfRequest:(id)a3
{
  objc_msgSend(a1, "firstUtteranceOfRequest:WithDefaultValue:", a3, &stru_1E7C67E88);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)firstRewriteHypothesisOfResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[MarrsSiriNLUTypesUtils isResponseEmpty:](MarrsSiriNLUTypesUtils, "isResponseEmpty:", v3))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "rewriteHypotheses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)requestFromMdfDictionary:(id)a3 turnsKey:(id)a4 tokensKey:(id)a5 utteranceKey:(id)a6 valueKey:(id)a7 siriResponseKey:(id)a8 locale:(id)a9
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  void *v38;
  id obj;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v45 = a5;
  v42 = a6;
  v16 = a7;
  v43 = a8;
  v41 = a9;
  v37 = v14;
  v38 = v15;
  v44 = objc_alloc_init(MEMORY[0x1E0D9FA10]);
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v17)
  {
    v40 = *(_QWORD *)v57;
    do
    {
      v46 = v17;
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v57 != v40)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKeyedSubscript:", v45);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v20, "count"));
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v22 = v20;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v53 != v24)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "objectForKeyedSubscript:", v16);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v26);

            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          }
          while (v23);
        }

        objc_msgSend(v19, "objectForKeyedSubscript:", v42);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v43);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v29 = v27;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v49;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v49 != v31)
                objc_enumerationMutation(v29);
              objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "objectForKeyedSubscript:", v16);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v33);

            }
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          }
          while (v30);
        }

        +[MarrsSiriNLUTypesUtils interactionFromTokenValues:responseTokenValues:utteranceString:locale:](MarrsSiriNLUTypesUtils, "interactionFromTokenValues:responseTokenValues:utteranceString:locale:", v21, v28, v47, v41);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addOriginalInteractions:", v34);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v17);
  }

  v35 = objc_alloc_init(MEMORY[0x1E0D9F9A0]);
  objc_msgSend(v44, "setRequestId:", v35);

  return v44;
}

+ (id)QRTokenFromTokenValue:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D9FA30]);
  objc_msgSend(v4, "setValue:", v3);
  objc_msgSend(v4, "setAsrConfidence:", 1000.0);
  objc_msgSend(v4, "setStartIndex:", 0);
  objc_msgSend(v4, "setEndIndex:", 0);
  objc_msgSend(v4, "setPhoneSequence:", &stru_1E7C67E88);
  objc_msgSend(v4, "setRemoveSpaceAfter:", 0);

  return v4;
}

+ (id)internalTokenFromTokenValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 isSignificant:(BOOL)a6 isWhitespace:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;

  v7 = a7;
  v8 = a6;
  v10 = a3;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0D9FA98]);
  objc_msgSend(v12, "setValue:", v10);
  objc_msgSend(v12, "setCleanValue:", v10);
  objc_msgSend(v12, "setNormalizedValues:", v11);
  objc_msgSend(v12, "setIsSignificant:", v8);
  objc_msgSend(v12, "setIsWhitespace:", v7);
  objc_msgSend(v12, "setBegin:", 0);
  objc_msgSend(v12, "setEnd:", 0);

  return v12;
}

+ (id)utteranceFromTokenValues:(id)a3 utteranceString:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0D9FA38]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v16;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[MarrsSiriNLUTypesUtils internalTokenFromTokenValue:cleanValue:normalizedValues:isSignificant:isWhitespace:](MarrsSiriNLUTypesUtils, "internalTokenFromTokenValue:cleanValue:normalizedValues:isSignificant:isWhitespace:", v10, v10, v11, 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addNluInternalTokens:", v12);

        +[MarrsSiriNLUTypesUtils QRTokenFromTokenValue:](MarrsSiriNLUTypesUtils, "QRTokenFromTokenValue:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addAsrUtteranceTokens:", v13);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "setUtterance:", v17);
  objc_msgSend(v5, "setConfidence:", 1.0);
  v14 = objc_alloc_init(MEMORY[0x1E0D9F9A0]);
  objc_msgSend(v5, "setAsrId:", v14);

  return v5;
}

+ (id)interactionFromTokenValues:(id)a3 responseTokenValues:(id)a4 utteranceString:(id)a5 locale:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v9 = a4;
  v21 = a5;
  v22 = a6;
  v10 = objc_alloc_init(MEMORY[0x1E0D9FA28]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[MarrsSiriNLUTypesUtils internalTokenFromTokenValue:cleanValue:normalizedValues:isSignificant:isWhitespace:](MarrsSiriNLUTypesUtils, "internalTokenFromTokenValue:cleanValue:normalizedValues:isSignificant:isWhitespace:", v15, v15, v16, 1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSiriResponse:", v17);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  +[MarrsSiriNLUTypesUtils utteranceFromTokenValues:utteranceString:](MarrsSiriNLUTypesUtils, "utteranceFromTokenValues:utteranceString:", v20, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOriginalUtterances:", v18);

  objc_msgSend(v10, "setLocale:", v22);
  objc_msgSend(v10, "setTap2edit:", 0);

  return v10;
}

@end
