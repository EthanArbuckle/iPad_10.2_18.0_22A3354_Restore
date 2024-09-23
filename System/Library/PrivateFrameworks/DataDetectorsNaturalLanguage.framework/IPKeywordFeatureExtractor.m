@implementation IPKeywordFeatureExtractor

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *context;
  uint64_t v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v7 = a4;
  v30 = a5;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v39 = v7;
  objc_msgSend(v7, "bestLanguageID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v33 = objc_msgSend(&unk_24DB090F0, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v49;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v49 != v31)
          objc_enumerationMutation(&unk_24DB090F0);
        v36 = v9;
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v9);
        context = (void *)MEMORY[0x219A2F708]();
        +[IPEventClassificationType taxonomyForLanguageID:clusterType:](IPEventClassificationType, "taxonomyForLanguageID:clusterType:", v32, objc_msgSend(v10, "integerValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v34, 0);
        if (objc_msgSend(v11, "count"))
        {
          v37 = v11;
          do
          {
            v12 = (void *)MEMORY[0x219A2F708]();
            objc_msgSend(v11, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeObjectAtIndex:", 0);
            -[IPKeywordFeatureExtractor matchesForTextString:inMessageUnit:eventType:](self, "matchesForTextString:inMessageUnit:eventType:", v40, v39, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "count"))
            {
              v41 = v14;
              v42 = v12;
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              obj = v14;
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v45;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v45 != v17)
                      objc_enumerationMutation(obj);
                    v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v18);
                    v20 = (void *)MEMORY[0x219A2F708]();
                    v21 = (void *)MEMORY[0x24BDD17C8];
                    v22 = objc_msgSend(v19, "matchRange");
                    objc_msgSend(v19, "matchRange");
                    objc_msgSend(v21, "stringWithFormat:", CFSTR("%lu-%lu-%lu"), v22, v23, objc_msgSend(v19, "type"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "objectForKeyedSubscript:", v24);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v25)
                      objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v24);
                    objc_msgSend(v8, "objectForKeyedSubscript:", v24);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "addEventType:", v13);

                    objc_autoreleasePoolPop(v20);
                    ++v18;
                  }
                  while (v16 != v18);
                  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                }
                while (v16);
              }

              objc_msgSend(v13, "children");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v37;
              objc_msgSend(v37, "addObjectsFromArray:", v27);

              v14 = v41;
              v12 = v42;
            }

            objc_autoreleasePoolPop(v12);
          }
          while (objc_msgSend(v11, "count"));
        }

        objc_autoreleasePoolPop(context);
        v9 = v36 + 1;
      }
      while (v36 + 1 != v33);
      v33 = objc_msgSend(&unk_24DB090F0, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v33);
  }
  objc_msgSend(v8, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)matchesForTextString:(id)a3 inMessageUnit:(id)a4 eventType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  IPKeywordFeatureExtractor *v45;
  id v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  NSRange v72;
  NSRange v73;
  NSRange v74;
  NSRange v75;

  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IPKeywordFeatureExtractor matchesForTextString:inMessageUnit:eventType:keywordType:](self, "matchesForTextString:inMessageUnit:eventType:keywordType:", v8, v9, v10, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v11, "mutableCopy");

  v44 = v8;
  v45 = self;
  v42 = v10;
  v43 = v9;
  -[IPKeywordFeatureExtractor matchesForTextString:inMessageUnit:eventType:keywordType:](self, "matchesForTextString:inMessageUnit:eventType:keywordType:", v8, v9, v10, 0);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v12)
  {
    v13 = v12;
    v48 = *(_QWORD *)v64;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v64 != v48)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v14);
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v16 = v50;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v60;
          while (2)
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v60 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v20);
              v22 = objc_msgSend(v15, "matchRange");
              v24 = v23;
              v74.location = objc_msgSend(v21, "matchRange");
              v74.length = v25;
              v72.location = v22;
              v72.length = v24;
              if (NSIntersectionRange(v72, v74).length)
              {

                goto LABEL_16;
              }
              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
            if (v18)
              continue;
            break;
          }
        }

        objc_msgSend(v16, "addObject:", v15);
LABEL_16:
        ++v14;
      }
      while (v14 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v13);
  }
  -[IPKeywordFeatureExtractor matchesForTextString:inMessageUnit:eventType:keywordType:](v45, "matchesForTextString:inMessageUnit:eventType:keywordType:", v44, v43, v42, 1);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (v26)
  {
    v27 = v26;
    v49 = *(_QWORD *)v56;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v56 != v49)
          objc_enumerationMutation(v46);
        v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v28);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v30 = v50;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v52;
          while (2)
          {
            v34 = 0;
            do
            {
              if (*(_QWORD *)v52 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v34);
              v36 = objc_msgSend(v29, "matchRange");
              v38 = v37;
              v75.location = objc_msgSend(v35, "matchRange");
              v75.length = v39;
              v73.location = v36;
              v73.length = v38;
              if (NSIntersectionRange(v73, v75).length)
              {

                goto LABEL_33;
              }
              ++v34;
            }
            while (v32 != v34);
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
            if (v32)
              continue;
            break;
          }
        }

        objc_msgSend(v30, "addObject:", v29);
LABEL_33:
        ++v28;
      }
      while (v28 != v27);
      v27 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (v27);
  }
  v40 = (void *)objc_msgSend(v50, "copy");

  return v40;
}

- (id)matchesForTextString:(id)a3 inMessageUnit:(id)a4 eventType:(id)a5 keywordType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  switch(a6)
  {
    case 2uLL:
      objc_msgSend(v12, "titleKeywords");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(v12, "genericPatternKeywords");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0uLL:
      objc_msgSend(v12, "patternKeywords");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v15 = (void *)v14;
      goto LABEL_9;
  }
  v15 = (void *)MEMORY[0x24BDBD1A8];
LABEL_9:
  if (objc_msgSend(v15, "count"))
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "language");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@-%@-%lu"), v17, v18, CFSTR("keywords"), a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __86__IPKeywordFeatureExtractor_matchesForTextString_inMessageUnit_eventType_keywordType___block_invoke;
    v25[3] = &unk_24DAA5370;
    v20 = v13;
    v26 = v20;
    v27 = v15;
    +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", v19, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "originalMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPKeywordFeatureExtractor _matchingKeywordsForRegex:inText:message:eventType:keywordType:](self, "_matchingKeywordsForRegex:inText:message:eventType:keywordType:", v21, v10, v22, v20, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v23;
}

id __86__IPKeywordFeatureExtractor_matchesForTextString_inMessageUnit_eventType_keywordType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPRegexToolbox regexPatternForLanguageID:eventVocabularyArray:](IPRegexToolbox, "regexPatternForLanguageID:eventVocabularyArray:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v3, 64, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v5)
  {
    v6 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v6 = _IPLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "language");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_219581000, v8, OS_LOG_TYPE_ERROR, "Can't compile regex: [language=%{public}@ identifier=%{public}@]\n%{public}@ #EventClassification", buf, 0x20u);

    }
  }

  return v4;
}

- (id)_matchingKeywordsForRegex:(id)a3 inText:(id)a4 message:(id)a5 eventType:(id)a6 keywordType:(unint64_t)a7
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  id v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v36 = a6;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = v9;
  +[IPRegexToolbox matchingKeywordResultsForRegex:inString:needsToLowercase:](IPRegexToolbox, "matchingKeywordResultsForRegex:inString:needsToLowercase:", v9, v10, 0);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v14);
        v16 = objc_msgSend(v15, "range");
        if (!+[IPRegexToolbox isRangeInsideQuotationMarks:text:limitToSurroundingText:](IPRegexToolbox, "isRangeInsideQuotationMarks:text:limitToSurroundingText:", v16, v17, v10, 1))
        {
          v18 = objc_msgSend(v15, "range");
          v20 = v19;
          objc_msgSend(v36, "language");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[IPRegexToolbox isRangeNearbyExclusionKeyword:text:limitToSurroundingText:language:](IPRegexToolbox, "isRangeNearbyExclusionKeyword:text:limitToSurroundingText:language:", v18, v20, v10, 1, v21);

          if (!v22)
          {
            v28 = objc_msgSend(v15, "range");
            objc_msgSend(v10, "substringWithRange:", v28, v29);
            v24 = objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v15, "range");
            +[IPFeatureKeyword featureKeywordWithType:string:matchRange:](IPFeatureKeyword, "featureKeywordWithType:string:matchRange:", a7, v24, v30, v31);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setTextUnit:", v10);
            objc_msgSend(v35, "addObject:", v27);
            goto LABEL_16;
          }
          if (IPDebuggingModeEnabled_once_0 != -1)
            dispatch_once(&IPDebuggingModeEnabled_once_0, &__block_literal_global_28);
          if (IPDebuggingModeEnabled_sEnabled_0)
          {
            v23 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v23 = _IPLogHandle;
            }
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = v23;
              v25 = objc_msgSend(v15, "range");
              objc_msgSend(v10, "substringWithRange:", v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v43 = v27;
              _os_log_impl(&dword_219581000, v24, OS_LOG_TYPE_INFO, "      --> not counted because too close to an exclusion keyword [%@] #EventClassification", buf, 0xCu);
LABEL_16:

            }
          }
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v12);
  }

  return v35;
}

- (id)queue
{
  if (queue__onceToken != -1)
    dispatch_once(&queue__onceToken, &__block_literal_global_2);
  return (id)queue__ipExprOnceResult;
}

void __34__IPKeywordFeatureExtractor_queue__block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x219A2F708]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("IPKeywordFeatureExtractor", v1);
  v3 = (void *)queue__ipExprOnceResult;
  queue__ipExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

@end
