@implementation IPFeatureSentence

+ (id)buildRegexForType:(id)a3 languageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 400);
  objc_msgSend(a1, "regexArrayForType:languageID:", v6, CFSTR("common"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  objc_msgSend(a1, "regexArrayForType:languageID:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v7)
  {
    objc_msgSend(a1, "regexArrayForType:languageID:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v13);

  }
  if ((objc_msgSend(v7, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || objc_msgSend(v12, "hasPrefix:", CFSTR("zh")))
  {
    objc_msgSend(a1, "regexArrayForType:languageID:", v6, CFSTR("zh-Hans"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v14);

    objc_msgSend(a1, "regexArrayForType:languageID:", v6, CFSTR("zh-Hant-TW"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v15);

    objc_msgSend(a1, "regexArrayForType:languageID:", v6, CFSTR("zh-Hant-HK"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v16);

  }
  v17 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v17);
  +[IPRegexToolbox regexPatternForLanguageID:eventVocabularyArray:](IPRegexToolbox, "regexPatternForLanguageID:eventVocabularyArray:", v7, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x219A2F708]();
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v21, 64, &v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v27;
  objc_autoreleasePoolPop(v22);
  if (v24)
  {
    NSLog(CFSTR("Can't build regex for type:%@ languageID:%@ --> %@"), v6, v7, v24);
    v25 = 0;
  }
  else
  {
    v25 = v23;
  }

  return v25;
}

+ (id)bestLanguageIDFromText:(id)a3
{
  return (id)objc_msgSend(a1, "bestLanguageIDFromText:linesElided:", a3, 0);
}

id __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BE7A610]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A5F0]), "initWithCountLimit:", 50);
  v2 = (void *)objc_msgSend(v0, "initWithGuardedData:", v1);

  return v2;
}

+ (id)eventVocabularyRejectionKeywordInString:(id)a3 languageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (!v7)
    {
      objc_msgSend(a1, "bestLanguageIDFromText:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "eventVocabularyRejectionRegexForLanguageID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IPRegexToolbox firstMatchingKeywordForRegex:inString:needsToLowercase:](IPRegexToolbox, "firstMatchingKeywordForRegex:inString:needsToLowercase:", v8, v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)regexArrayForType:(id)a3 languageID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Patterns-%@-%@"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  objc_msgSend(&unk_24DB1AAD8, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (IPFeatureSentence)initWithLanguageID:(id)a3 responseKitSentence:(id)a4
{
  id v6;
  id v7;
  IPFeatureSentence *v8;
  IPFeatureSentence *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IPFeatureSentence;
  v8 = -[IPFeatureSentence init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[IPFeatureSentence setLanguageID:](v8, "setLanguageID:", v6);
    -[IPFeatureSentence setResponseKitSentence:](v9, "setResponseKitSentence:", v7);
    -[IPFeatureSentence setStoredPolarity:](v9, "setStoredPolarity:", 0);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)IPFeatureSentence;
  -[IPFeature description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPFeatureSentence humanReadableFeaturePolarity:](IPFeatureSentence, "humanReadableFeaturePolarity:", -[IPFeatureSentence storedPolarity](self, "storedPolarity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPEventClassificationType humanReadableClusterType:](IPEventClassificationType, "humanReadableClusterType:", -[IPFeatureSentence clusterType](self, "clusterType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Polarity:%@ Cluster:%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addFragment:(id)a3
{
  NSArray *v4;
  NSArray *fragments;
  void *v6;
  id v7;

  v7 = a3;
  if (!self->_fragments)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    fragments = self->_fragments;
    self->_fragments = v4;

  }
  -[IPFeatureSentence fragments](self, "fragments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (unint64_t)clusterType
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14E0]), "initWithCapacity:", 5);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[IPFeatureSentence fragments](self, "fragments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "clusterType");
        if (v10)
        {
          v11 = v10;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

          v7 |= v11 == 6;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        v21 = objc_msgSend(v20, "integerValue", (_QWORD)v25);
        v22 = objc_msgSend(v13, "countForObject:", v20);
        if (v21 != 6 && v22 > v16)
        {
          v16 = v22;
          v17 = v21;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v15);

    v23 = 6;
    if ((v7 & 1) == 0)
      v23 = 0;
    if (!v17)
      v17 = v23;
  }
  else
  {

    if ((v7 & 1) != 0)
      v17 = 6;
    else
      v17 = 0;
  }

  return v17;
}

- (unint64_t)polarityForRange:(_NSRange)a3
{
  return -[IPFeatureSentence polarityForRange:confidence:](self, "polarityForRange:confidence:", a3.location, a3.length, 0);
}

- (unint64_t)polarityForRange:(_NSRange)a3 confidence:(double *)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  NSUInteger v20;
  NSRange v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  double v33;
  double v34;
  double v36;
  double v37;
  double v38;
  double *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;
  NSRange v49;
  NSRange v50;

  length = a3.length;
  location = a3.location;
  v48 = *MEMORY[0x24BDAC8D0];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[IPFeatureSentence fragments](self, "fragments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (!v8)
  {

    v16 = 0.0;
LABEL_24:
    if (a4)
      *a4 = v16;
    return 1;
  }
  v9 = v8;
  v39 = a4;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v42;
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  do
  {
    v17 = 0;
    do
    {
      v18 = v10;
      if (*(_QWORD *)v42 != v12)
        objc_enumerationMutation(v7);
      v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v17);
      v50.location = objc_msgSend(v19, "range");
      v50.length = v20;
      v49.location = location;
      v49.length = length;
      v21 = NSIntersectionRange(v49, v50);
      v10 = v21.length != 0;
      if (v21.length)
      {
        objc_msgSend(v19, "probability_None");
        v23 = v22;
        objc_msgSend(v19, "probability_Rejection");
        v25 = v24;
        objc_msgSend(v19, "probability_Proposal");
        v27 = v26;
        objc_msgSend(v19, "probability_Confirmation");
        v29 = v28;
        if (IPDebuggingModeEnabled_once_1 != -1)
          dispatch_once(&IPDebuggingModeEnabled_once_1, &__block_literal_global_236);
        v16 = v16 + v23;
        v15 = v15 + v25;
        v14 = v14 + v27;
        ++v11;
        v13 = v13 + v29;
        if (IPDebuggingModeEnabled_sEnabled_1)
        {
          v30 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v30 = _IPLogHandle;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = v30;
            -[IPFeatureSentence descriptionForFragment:](self, "descriptionForFragment:", v19);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v46 = v32;
            _os_log_impl(&dword_219581000, v31, OS_LOG_TYPE_INFO, "FRAGMENT: %@ #Generic", buf, 0xCu);

          }
        }
      }
      else if (v18)
      {
        goto LABEL_17;
      }
      ++v17;
    }
    while (v9 != v17);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  }
  while (v9);
LABEL_17:

  if (!v11)
  {
    a4 = v39;
    goto LABEL_24;
  }
  v33 = (double)v11;
  v34 = v15 / (double)v11;
  if (v34 > 0.35)
  {
    if (v39)
      *v39 = v34;
    return 4;
  }
  v36 = v14 / v33;
  v37 = v13 / v33;
  v38 = v13 / v33 + v14 / v33;
  a4 = v39;
  if (v38 < 0.66)
  {
    if (v36 > 0.54 && v36 > v37 && v36 > v34)
    {
      if (v39)
        *v39 = v36;
      return 2;
    }
    v16 = v16 / v33;
    if (v37 > 0.54 && v37 > v36 && v37 > v34)
    {
      if (v39)
        *v39 = v37;
      return 3;
    }
    goto LABEL_24;
  }
  if (v39)
    *v39 = v38;
  if (v37 <= v36)
    return 2;
  else
    return 3;
}

- (unint64_t)polarity
{
  uint64_t v3;
  double v5;

  if (!-[IPFeatureSentence storedPolarity](self, "storedPolarity"))
  {
    v5 = 0.0;
    -[IPFeature matchRange](self, "matchRange");
    -[IPFeatureSentence setStoredPolarity:](self, "setStoredPolarity:", -[IPFeatureSentence polarityForRange:confidence:](self, "polarityForRange:confidence:", 0, v3, &v5));
    -[IPFeature setConfidence:](self, "setConfidence:", v5);
  }
  return -[IPFeatureSentence storedPolarity](self, "storedPolarity");
}

- (NSString)eventVocabularyRejectionKeyword
{
  -[IPFeatureSentence checkEventVocabularyKeywordsIfNeeded](self, "checkEventVocabularyKeywordsIfNeeded");
  return -[IPFeatureSentence storedEventVocabularyRejectionKeyword](self, "storedEventVocabularyRejectionKeyword");
}

- (NSString)eventVocabularyIgnoreDateKeyword
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!self->_hasCheckedEventVocabularyIgnoreDateKeyword)
  {
    v3 = (void *)objc_opt_class();
    -[IPFeature matchString](self, "matchString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureSentence languageID](self, "languageID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventVocabularyIgnoreDateKeywordInString:languageID:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureSentence setStoredEventVocabularyIgnoreDateKeyword:](self, "setStoredEventVocabularyIgnoreDateKeyword:", v6);

    self->_hasCheckedEventVocabularyIgnoreDateKeyword = 1;
  }
  return -[IPFeatureSentence storedEventVocabularyIgnoreDateKeyword](self, "storedEventVocabularyIgnoreDateKeyword");
}

- (void)checkEventVocabularyKeywordsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_hasCheckedEventVocabularyKeyword)
  {
    self->_hasCheckedEventVocabularyKeyword = 1;
    v3 = (void *)objc_opt_class();
    -[IPFeature matchString](self, "matchString");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[IPFeatureSentence languageID](self, "languageID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventVocabularyRejectionKeywordInString:languageID:", v6, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureSentence setStoredEventVocabularyRejectionKeyword:](self, "setStoredEventVocabularyRejectionKeyword:", v5);

  }
}

- (BOOL)isQuoteAttributionLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x219A2F708](self, a2);
  +[IPRegexToolbox regularExpressionWithKey:generator:](IPRegexToolbox, "regularExpressionWithKey:generator:", CFSTR("isQuoteAttributionLine"), &__block_literal_global_7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeature matchString](self, "matchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v5, 2, 0, objc_msgSend(v5, "length")) != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_9;
  if (IPLocalizedString_once_0 != -1)
    dispatch_once(&IPLocalizedString_once_0, &__block_literal_global_240);
  objc_msgSend((id)IPLocalizedString_bundle_0, "localizedStringForKey:value:table:", CFSTR("Sent"), &stru_24DAA6418, CFSTR("DataDetectorsNaturalLanguage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPrefix:", v6) & 1) != 0)
  {

LABEL_9:
    v8 = 1;
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "hasSuffix:", CFSTR(":\n")) & 1) != 0
    || objc_msgSend(v5, "hasSuffix:", CFSTR(":")))
  {
    v7 = objc_msgSend(v5, "containsString:", CFSTR("@"));

    if ((v7 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  if (IPLocalizedString_once_0 != -1)
    dispatch_once(&IPLocalizedString_once_0, &__block_literal_global_240);
  objc_msgSend((id)IPLocalizedString_bundle_0, "localizedStringForKey:value:table:", CFSTR("Sent"), &stru_24DAA6418, CFSTR("DataDetectorsNaturalLanguage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", v10))
  {
    v11 = v10;
  }
  else
  {
    if (IPLocalizedString_once_0 != -1)
      dispatch_once(&IPLocalizedString_once_0, &__block_literal_global_240);
    objc_msgSend((id)IPLocalizedString_bundle_0, "localizedStringForKey:value:table:", CFSTR("Subject"), &stru_24DAA6418, CFSTR("DataDetectorsNaturalLanguage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", v12))
      v11 = v12;
    else
      v11 = 0;

  }
  v19 = v10;
  if (v11
    && (v22 = 0u,
        v23 = 0u,
        v20 = 0u,
        v21 = 0u,
        (v13 = objc_msgSend(&unk_24DB100B0, "countByEnumeratingWithState:objects:count:", &v20, v24, 16)) != 0))
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    v18 = v3;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(&unk_24DB100B0);
        objc_msgSend(v5, "rangeOfString:options:range:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 8, objc_msgSend(v11, "length", v18, v19), objc_msgSend(v5, "length") - objc_msgSend(v11, "length"));
        if (v17)
        {
          v8 = 1;
          v3 = v18;
          goto LABEL_34;
        }
      }
      v14 = objc_msgSend(&unk_24DB100B0, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v8 = 0;
      v3 = v18;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_34:

LABEL_10:
  objc_autoreleasePoolPop(v3);
  return v8;
}

id __43__IPFeatureSentence_isQuoteAttributionLine__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v0 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("[ -\\/,]2\\d{3}(.{0,4}) \\d{1,2}[:hH]\\d{2}()?(am|AM|pm|PM)?, "), CFSTR("在 2\\d{3}年\\d{1,2}月\\d{1,2}日，下午\\d{1,2}:\\d{2}"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v1, "_pas_componentsJoinedByString:", CFSTR("|"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\\b(%@)\\b"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v4, 65, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v0);
  return v5;
}

+ (id)eventVocabularyRegexForType:(id)a3 languageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = v9;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (eventVocabularyRegexForType_languageID___pasOnceToken3 != -1)
    dispatch_once(&eventVocabularyRegexForType_languageID___pasOnceToken3, &__block_literal_global_103);
  objc_msgSend((id)eventVocabularyRegexForType_languageID___pasExprOnceResult, "result");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_109;
  v17[3] = &unk_24DAA5858;
  v21 = &v23;
  v12 = v10;
  v18 = v12;
  v22 = a1;
  v13 = v6;
  v19 = v13;
  v14 = v7;
  v20 = v14;
  objc_msgSend(v11, "runWithLockAcquired:", v17);
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A2F708]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A600]), "initWithBlock:idleTimeout:", &__block_literal_global_106, 1.0);
  v2 = (void *)eventVocabularyRegexForType_languageID___pasExprOnceResult;
  eventVocabularyRegexForType_languageID___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];

  v12 = a2;
  objc_msgSend(v12, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = v12;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v7 = (void *)MEMORY[0x219A2F708](v12);
    objc_msgSend(*(id *)(a1 + 64), "buildRegexForType:languageID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(a1 + 56);
    if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40))
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_2_110;
      v13[3] = &unk_24DAA5830;
      v13[4] = v11;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v13);
      objc_msgSend(v12, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32));
    }
    objc_autoreleasePoolPop(v7);
    v6 = v12;
  }

}

void __60__IPFeatureSentence_eventVocabularyRegexForType_languageID___block_invoke_2_110(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

+ (id)eventVocabularyPositiveRegexForLanguageID:(id)a3
{
  return (id)objc_msgSend(a1, "eventVocabularyRegexForType:languageID:", CFSTR("Positive"), a3);
}

+ (id)eventVocabularyRejectionRegexForLanguageID:(id)a3
{
  return (id)objc_msgSend(a1, "eventVocabularyRegexForType:languageID:", CFSTR("Rejection"), a3);
}

+ (id)eventVocabularyIgnoreDateRegexForLanguageID:(id)a3
{
  return (id)objc_msgSend(a1, "eventVocabularyRegexForType:languageID:", CFSTR("IgnoreDate"), a3);
}

+ (id)eventVocabularySubjectTitleRegexForLanguageID:(id)a3
{
  return (id)objc_msgSend(a1, "eventVocabularyRegexForType:languageID:", CFSTR("Subject-title"), a3);
}

+ (_NSRange)_rangeExcludingLeadingAndTrailingCharacters:(id)a3 inRange:(_NSRange)a4 ofString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = location + length;
  if (v10)
  {
    v11 = 0;
    while (objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11)))
    {
      if (v10 == ++v11)
      {
        v11 = v10;
        goto LABEL_7;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  do
  {
LABEL_7:
    v12 = v10 - v11;
    if (v10 <= v11)
      break;
    --v10;
  }
  while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v10)) & 1) != 0);

  v13 = v11;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

+ (id)_substringWithRange:(_NSRange)a3 ofString:(id)a4 removingCharactersFromSet:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  NSUInteger v18;
  size_t v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v9 = a5;
  if (length
    && (v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v9, 2, location, length),
        v10 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v13 = v10;
    v14 = v11;
    v24 = v9;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = location + length;
    v19 = 2 * length - 2;
    do
    {
      if (!v17)
      {
        v17 = (char *)malloc_type_malloc(v19, 0x31FF56CBuLL);
        v15 = v19;
        if (!v17)
          +[IPFeatureSentence _substringWithRange:ofString:removingCharactersFromSet:].cold.1();
      }
      objc_msgSend(v8, "getCharacters:range:", &v17[2 * v16], location, v13 - location);
      v16 += v13 - location;
      location = v13 + v14;
      v20 = v18 - (v13 + v14);
      v13 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v24, 2, v13 + v14, v20);
      v14 = v21;
    }
    while (v13 != 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v8, "getCharacters:range:", &v17[2 * v16], location, v20);
    v22 = v20 + v16;
    if (v20 + v16)
    {
      if (2 * v22 >= v15)
      {
        v9 = v24;
      }
      else
      {
        v17 = (char *)malloc_type_realloc(v17, 2 * v22, 0x1000040BDFB0063uLL);
        v9 = v24;
        if (!v17)
          +[IPFeatureSentence _substringWithRange:ofString:removingCharactersFromSet:].cold.2();
      }
      v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", v17, v20 + v16, 1);
    }
    else
    {
      free(v17);
      v12 = &stru_24DAA6418;
      v9 = v24;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)bestLanguageIDFromText:(id)a3 linesElided:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t location;
  NSUInteger v15;
  NSUInteger length;
  NSRange v17;
  void *v18;
  void *v19;
  CFIndex v20;
  CFIndex v21;
  CFIndex v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  id v28;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  NSUInteger v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  NSRange v39;
  CFRange v40;
  NSRange v41;

  v6 = a3;
  if (bestLanguageIDFromText_linesElided___onceToken != -1)
    dispatch_once(&bestLanguageIDFromText_linesElided___onceToken, &__block_literal_global_125);
  v7 = (id)bestLanguageIDFromText_linesElided___ipExprOnceResult;
  objc_sync_enter(v7);
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_sync_exit(v7);

  }
  else
  {
    objc_sync_exit(v7);

    v10 = (void *)MEMORY[0x219A2F708]();
    v11 = (__CFString *)v6;
    v12 = -[__CFString length](v11, "length");
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    location = objc_msgSend(a1, "_rangeExcludingLeadingAndTrailingCharacters:inRange:ofString:", v13, 0, v12, v11);
    length = v15;

    if (a4 <= 1
      && -[__CFString rangeOfString:options:range:](v11, "rangeOfString:options:range:", CFSTR("\n"), 2, location, length) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v38 = a4;
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = location + length;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __56__IPFeatureSentence_bestLanguageIDFromText_linesElided___block_invoke_2;
      v30[3] = &unk_24DAA58A0;
      v30[4] = &v35;
      v30[5] = &v31;
      -[__CFString enumerateSubstringsInRange:options:usingBlock:](v11, "enumerateSubstringsInRange:options:usingBlock:", location, length, 256, v30);
      if ((unint64_t)v36[3] >= 5)
      {
        v41.length = v32[3];
        v39.location = location;
        v39.length = length;
        v41.location = 0;
        v17 = NSIntersectionRange(v39, v41);
        location = v17.location;
        length = v17.length;
      }
      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(&v35, 8);
    }
    if (length >= 0x200)
      length = 512;
    v18 = (void *)MEMORY[0x219A2F708]();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-–—_"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v18);
    v20 = objc_msgSend(a1, "_rangeExcludingLeadingAndTrailingCharacters:inRange:ofString:", v19, location, length, v11);
    v22 = v21;
    objc_msgSend(a1, "_substringWithRange:ofString:removingCharactersFromSet:", v20, v21, v11, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v22 = objc_msgSend(v23, "length");
      v25 = v24;

      v20 = 0;
    }
    else
    {
      v25 = v11;
    }
    v40.location = v20;
    v40.length = v22;
    v26 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v25, v40);
    if (!v26)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", *MEMORY[0x24BDBCB20]);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    if (-[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("yue")))
    {

      v26 = CFSTR("zh-Hant");
    }
    v28 = v7;
    objc_sync_enter(v28);
    if ((unint64_t)objc_msgSend(v28, "count") >= 5)
      objc_msgSend(v28, "removeAllObjects");
    objc_msgSend(v28, "setObject:forKey:", v26, v11);
    objc_sync_exit(v28);

    objc_autoreleasePoolPop(v10);
    v9 = v26;
  }

  return v9;
}

void __56__IPFeatureSentence_bestLanguageIDFromText_linesElided___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A2F708]();
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 517, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)bestLanguageIDFromText_linesElided___ipExprOnceResult;
  bestLanguageIDFromText_linesElided___ipExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __56__IPFeatureSentence_bestLanguageIDFromText_linesElided___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  unint64_t v7;

  v7 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (v7 == 2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  }
  else if (v7 >= 5)
  {
    *a7 = 1;
  }
  return result;
}

+ (id)eventVocabularyIgnoreDateKeywordInString:(id)a3 languageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (!v7)
    {
      objc_msgSend(a1, "bestLanguageIDFromText:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "eventVocabularyIgnoreDateRegexForLanguageID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IPRegexToolbox firstMatchingKeywordForRegex:inString:needsToLowercase:](IPRegexToolbox, "firstMatchingKeywordForRegex:inString:needsToLowercase:", v8, v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)eventVocabularySubjectTitleInString:(id)a3 languageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (!v7)
    {
      objc_msgSend(a1, "bestLanguageIDFromText:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "eventVocabularySubjectTitleRegexForLanguageID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IPRegexToolbox firstMatchingKeywordForRegex:inString:needsToLowercase:](IPRegexToolbox, "firstMatchingKeywordForRegex:inString:needsToLowercase:", v8, v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (unint64_t)numberOfMatchesForEventVocabularySubjectTitleInString:(id)a3 languageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (!v7)
    {
      objc_msgSend(a1, "bestLanguageIDFromText:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(a1, "eventVocabularySubjectTitleRegexForLanguageID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[IPRegexToolbox numberOfMatchesForRegex:inString:needsToLowercase:](IPRegexToolbox, "numberOfMatchesForRegex:inString:needsToLowercase:", v8, v6, 1);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)descriptionForFragment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[IPFeature matchString](self, "matchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "range");
  objc_msgSend(v6, "substringWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]   %@"), v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)descriptionForFragmentAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[IPFeatureSentence fragments](self, "fragments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureSentence descriptionForFragment:](self, "descriptionForFragment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)humanReadableFeaturePolarity:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("undefined");
  else
    return off_24DAA5900[a3 - 1];
}

- (RKText)responseKitSentence
{
  return (RKText *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResponseKitSentence:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)fragments
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFragments:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)languageID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLanguageID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (unint64_t)storedPolarity
{
  return self->_storedPolarity;
}

- (void)setStoredPolarity:(unint64_t)a3
{
  self->_storedPolarity = a3;
}

- (NSString)storedEventVocabularyRejectionKeyword
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStoredEventVocabularyRejectionKeyword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)storedEventVocabularyIgnoreDateKeyword
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStoredEventVocabularyIgnoreDateKeyword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedEventVocabularyIgnoreDateKeyword, 0);
  objc_storeStrong((id *)&self->_storedEventVocabularyRejectionKeyword, 0);
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_fragments, 0);
  objc_storeStrong((id *)&self->_responseKitSentence, 0);
}

+ (void)_substringWithRange:ofString:removingCharactersFromSet:.cold.1()
{
  __assert_rtn("+[IPFeatureSentence _substringWithRange:ofString:removingCharactersFromSet:]", "IPFeatureSentence.m", 497, "newStringBuffer");
}

+ (void)_substringWithRange:ofString:removingCharactersFromSet:.cold.2()
{
  __assert_rtn("+[IPFeatureSentence _substringWithRange:ofString:removingCharactersFromSet:]", "IPFeatureSentence.m", 511, "newStringBuffer");
}

@end
