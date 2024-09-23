@implementation AXSSLanguageTagger

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    _nlLanguageIdentifier = NLLanguageIdentifierCreate();
    v2 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v3 = (void *)_nlLanguageIdentifierLock;
    _nlLanguageIdentifierLock = (uint64_t)v2;

  }
}

+ (id)systemLocale
{
  void *v2;
  AXSSSystemLocale *v3;
  void *v4;

  v2 = (void *)_systemLocale;
  if (!_systemLocale)
  {
    v3 = objc_alloc_init(AXSSSystemLocale);
    v4 = (void *)_systemLocale;
    _systemLocale = (uint64_t)v3;

    v2 = (void *)_systemLocale;
  }
  return v2;
}

+ (id)languageTagsForContent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  _QWORD v14[3];
  char v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(a1, "_scriptTaggerForContent:", v4);
  v7 = 0;
  if (objc_msgSend(v4, "length") && v6)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3010000000;
    v22 = 0;
    v23 = 0;
    v21 = &unk_1AF6194A5;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__6;
    v16[4] = __Block_byref_object_dispose__6;
    v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v15 = 0;
    objc_msgSend(v4, "length");
    v8 = v4;
    v13 = v8;
    v9 = v5;
    NLTaggerEnumerateTokens();
    v10 = v19[4];
    v11 = v19[5];
    if (v11 + v10 == objc_msgSend(v8, "length"))
      objc_msgSend(a1, "_tagRange:document:tags:createdFromNewline:", v19[4], v19[5], v8, v9, 1);
    v7 = v9;

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(&v18, 8);
  }

  return v7;
}

void __45__AXSSLanguageTagger_languageTagsForContent___block_invoke(uint64_t a1, NSUInteger *a2)
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSRange v17;
  NSRange v18;

  v4 = *a2;
  v3 = a2[1];
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *a2, v3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)NLTaggerCopyTagForCurrentToken();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v7 = (id *)(v6 + 40);
  if (!v8)
    objc_storeStrong(v7, v5);
  v9 = objc_msgSend(*(id *)(a1 + 80), "_isNewline:", v16);
  if (v5)
  {
    v10 = v9;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqualToString:", v5))
    {
      v17.location = v4;
      v17.length = v3;
      *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = NSUnionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)+ 8)+ 32), v17);
      if ((_DWORD)v10)
      {
        objc_msgSend(*(id *)(a1 + 80), "_tagRange:document:tags:createdFromNewline:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    else
    {
      if ((_DWORD)v10)
      {
        v18.location = v4;
        v18.length = v3;
        *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = NSUnionRange(*(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)+ 8)+ 32), v18);
      }
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(_QWORD *)(v14 + 40);
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 80), "_tagRange:document:tags:createdFromNewline:", *(_QWORD *)(v14 + 32), v15, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v10);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      *(_QWORD *)(v14 + 32) = v4;
      *(_QWORD *)(v14 + 40) = v3;
    }
    if (objc_msgSend(v5, "length"))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 80), "_manuallyProcessContent:tokenRange:currentRange:", *(_QWORD *)(a1 + 32), v4, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(_QWORD *)(v12 + 32) = v11;
    *(_QWORD *)(v12 + 40) = v13;
  }

}

+ (id)primaryLanguageForContent:(id)a3 hints:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    objc_msgSend(a1, "_hypothesesForContent:withHints:guesses:", v6, a4, &v15);
    +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dialectForSystemLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v9) = HIDWORD(v15);
    if (*((float *)&v15 + 1) > 0.8 || (v15 & 0xFFFFFFFE) == 4 && (v16 & 0xFFFFFFFE) == 4)
    {
      +[AXSSLanguageManager shared](AXSSLanguageManager, "shared", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "langCodeForlangId:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dialectForLanguageID:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    objc_msgSend(v8, "specificLanguageID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)primaryLanguageForContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "_createLanguageHintsForContent:", v4);
  objc_msgSend(a1, "primaryLanguageForContent:hints:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    free(v5);
  return v6;
}

+ (id)primaryLanguageWithHigherProbInDefaultLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "_createLanguageHintWithHighProbInDefault:", v4);
  objc_msgSend(a1, "primaryLanguageForContent:hints:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    free(v5);
  return v6;
}

+ (id)markupLanguageTagForAttributedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v4);
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "languageTagsForContent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "dialect", (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "specificLanguageID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_msgSend(v13, "taggedRange");
          objc_msgSend(v5, "addAttribute:value:range:", CFSTR("AXLanguage"), v15, v16, v17);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v5, "copy");
  return v18;
}

+ (void)_scriptTaggerForContent:(id)a3
{
  return (void *)objc_msgSend(a1, "_taggerForContent:tagScheme:", a3, *MEMORY[0x1E0D174E8]);
}

+ (void)_languageTaggerForContent:(id)a3
{
  return (void *)objc_msgSend(a1, "_taggerForContent:tagScheme:", a3, *MEMORY[0x1E0D174C8]);
}

+ (void)_tokenTaggerForContent:(id)a3
{
  return (void *)objc_msgSend(a1, "_taggerForContent:tagScheme:", a3, *MEMORY[0x1E0D174F0]);
}

+ (void)_taggerForContent:(id)a3 tagScheme:(id)a4
{
  void *v5;
  id v6;
  id v7;
  const void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v10, 1);

  v8 = (const void *)NLTaggerCreate();
  NLTaggerSetString();

  return (void *)CFAutorelease(v8);
}

+ (void)_tagRange:(_NSRange)a3 document:(id)a4 tags:(id)a5 createdFromNewline:(BOOL)a6
{
  _BOOL8 v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a6;
  length = a3.length;
  location = a3.location;
  v14 = a5;
  v11 = a4;
  objc_msgSend(v11, "substringWithRange:", location, length);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createTagForContent:tokenRange:document:createdFromNewline:", v12, location, length, v11, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v14, "addObject:", v13);

}

+ (id)_createTagForContent:(id)a3 tokenRange:(_NSRange)a4 document:(id)a5 createdFromNewline:(BOOL)a6
{
  _BOOL8 v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AXSSLanguageTag *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v24[3] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0CB3500];
  v13 = a3;
  objc_msgSend(v12, "newlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "substringWithRange:", location, length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_languageTagForDateIfNecessary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = -[AXSSLanguageTag initWithDialect:range:content:createdFromNewline:]([AXSSLanguageTag alloc], "initWithDialect:range:content:createdFromNewline:", v17, location, length, v11, v6);
  }
  else
  {
    v19 = (void *)objc_msgSend(a1, "_createLanguageHintsForContent:", v15);
    memset(v24, 0, 24);
    objc_msgSend(a1, "_hypothesesForContent:withHints:guesses:", v15, v19, v24);
    objc_msgSend(a1, "_dialectWithHighestProbability:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dialectForSystemLanguage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = -[AXSSLanguageTag initWithDialect:range:content:createdFromNewline:]([AXSSLanguageTag alloc], "initWithDialect:range:content:createdFromNewline:", v20, location, length, v11, v6);
    objc_msgSend(a1, "_secondaryDialects:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSLanguageTag setPredictedSecondaryDialects:](v18, "setPredictedSecondaryDialects:", v22);

    if (v19)
      free(v19);

  }
  return v18;
}

+ (id)_languageTagForDateIfNecessary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  v7 = 0;
  if (objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 0, 0, v5))
    v8 = 0;
  else
    v8 = v6 == v5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dialectForSystemLanguage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v12, "specificLanguageID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localeWithLocaleIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v15);

    objc_msgSend(v10, "shortMonthSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v16);

    objc_msgSend(v10, "shortWeekdaySymbols");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v17);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v9;
    v7 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v19 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v18);
          if (objc_msgSend(v3, "containsString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), (_QWORD)v22))
          {
            v7 = v12;
            goto LABEL_16;
          }
        }
        v7 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_16:

  }
  return v7;
}

+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsForContent:(id)a3
{
  id v4;
  $1230CF39250A084FEEB876D19862D23B *v5;

  v4 = a3;
  objc_msgSend(a1, "_systemLanguageProbabilityForContent:", v4);
  v5 = ($1230CF39250A084FEEB876D19862D23B *)objc_msgSend(a1, "_createLanguageHintsForContent:probInSystemLanguage:", v4);

  return v5;
}

+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintWithHighProbInDefault:(id)a3
{
  double v3;

  LODWORD(v3) = 1063675494;
  return ($1230CF39250A084FEEB876D19862D23B *)objc_msgSend(a1, "_createLanguageHintsForContent:probInSystemLanguage:", a3, v3);
}

+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsForContent:(id)a3 probInSystemLanguage:(float)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  double v11;
  uint64_t v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  $1230CF39250A084FEEB876D19862D23B *v18;

  objc_msgSend(a1, "systemLocale", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8 >= 3)
    v9 = 3;
  else
    v9 = v8;
  v10 = (void *)objc_opt_new();
  if (v9)
  {
    v12 = 0;
    v13 = (float)((v9 + v9 * v9) >> 1);
    do
    {
      *(float *)&v11 = (float)((float)v9 * a4) / v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithUnsignedInt:", objc_msgSend(a1, "langIDforLangCode:", v16));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v17);

      ++v12;
      --v9;
    }
    while (v9);
  }
  *(float *)&v11 = 1.0 - a4;
  v18 = ($1230CF39250A084FEEB876D19862D23B *)objc_msgSend(a1, "_createLanguageHintsEvenlyDistributedWithProbability:excludingHints:", v10, v11);

  return v18;
}

+ (float)_systemLanguageProbabilityForContent:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  float v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(a1, "_tokenTaggerForContent:", v4);
  objc_msgSend(v4, "length");
  NLTaggerEnumerateTokens();
  v5 = v10[3];
  if (v5 > 39)
    v6 = 0.600000024;
  else
    v6 = (float)((float)((float)v5 / -100.0) + 1.0);
  if (v6 > 0.95)
    v6 = 0.95;
  v7 = v6;
  _Block_object_dispose(&v9, 8);

  return v7;
}

uint64_t __59__AXSSLanguageTagger__systemLanguageProbabilityForContent___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = NLTaggerCopyTagForCurrentToken();
  if (result == *MEMORY[0x1E0D17288] && (uint64_t)++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 41)
    *a3 = 1;
  return result;
}

+ (void)_hypothesesForContent:(id)a3 withHints:(id *)a4 guesses:(id *)a5
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)_nlLanguageIdentifierLock;
  v7 = a3;
  objc_msgSend(v6, "lock");
  NLLanguageIdentifierReset();
  objc_msgSend(v7, "length");
  NLLanguageIdentifierConsumeString();

  objc_msgSend(a1, "_allLangIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "count");
  NLLanguageIdentifierSetLanguageHints();

  NLLanguageIdentifierGetTopHypotheses();
  objc_msgSend((id)_nlLanguageIdentifierLock, "unlock");
}

+ (id)_dialectWithHighestProbability:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "langCodeForlangId:", a3->var0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialectForLanguageID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_secondaryDialects:(id *)a3
{
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i != 3; ++i)
  {
    if (a3[i].var0 < 2u)
      break;
    if (a3[i].var1 > 0.2)
    {
      objc_msgSend(a1, "langCodeForlangId:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(a1, "systemLocale", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredLanguages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        while (2)
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "hasPrefix:", v7))
            {
              +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "dialectForLanguageID:", v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
                objc_msgSend(v5, "addObject:", v15);

              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_16:

    }
  }
  return v5;
}

+ (id)_overrideLanguageDetection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v3 = a3;
  +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dialectForSystemLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specificLanguageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasPrefix:", CFSTR("zh"))
    && (objc_msgSend(v6, "hasPrefix:", CFSTR("ja")) & 1) != 0
    || objc_msgSend(v3, "hasPrefix:", CFSTR("ja"))
    && objc_msgSend(v6, "hasPrefix:", CFSTR("zh")))
  {
    +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dialectForSystemLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specificLanguageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("zh")) & 1) == 0
      && (objc_msgSend(v6, "hasPrefix:", CFSTR("ja")) & 1) == 0
      && !objc_msgSend(v6, "hasPrefix:", CFSTR("ko")))
    {
      goto LABEL_12;
    }
    +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dialectForSystemLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "languageMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generalLanguageID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "hasPrefix:", v13);

    if ((v14 & 1) != 0)
      goto LABEL_12;
    +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dialectForLanguageID:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "languageMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isWestern");

    if (v18)
      v19 = v6;
    else
LABEL_12:
      v19 = v3;
    v9 = v19;
  }

  return v9;
}

+ (_NSRange)_manuallyProcessContent:(id)a3 tokenRange:(_NSRange)a4 currentRange:(_NSRange)a5
{
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v5 = objc_msgSend(a1, "_extendRange:forContent:withRange:", a5.location, a5.length, a3, a4.location, a4.length);
  result.length = v6;
  result.location = v5;
  return result;
}

+ (_NSRange)_extendRange:(_NSRange)a3 forContent:(id)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id v9;
  void *v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  v7 = a3.length;
  v8 = a3.location;
  v9 = a4;
  +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (length)
  {
    v11 = length;
    do
    {
      v12 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", location);
      objc_msgSend(v9, "substringWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "characterAtIndex:", 0);
      if (objc_msgSend(v14, "length") == 1)
        objc_msgSend(v10, "isCharacterCommon:", v15);

      ++location;
      --v11;
    }
    while (v11);
    v7 += length;
  }

  v16 = v8;
  v17 = v7;
  result.length = v17;
  result.location = v16;
  return result;
}

+ (BOOL)_isNewline:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", 0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ ($1230CF39250A084FEEB876D19862D23B)_createLanguageHintsEvenlyDistributedWithProbability:(float)a3 excludingHints:(id)a4
{
  id v6;
  void *v7;
  $1230CF39250A084FEEB876D19862D23B *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  unint64_t v12;
  float *p_var1;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;

  v6 = a4;
  objc_msgSend(a1, "_allLangIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ($1230CF39250A084FEEB876D19862D23B *)malloc_type_malloc(8 * objc_msgSend(v7, "count"), 0x100004000313F17uLL);
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v6, "count");
  v11 = 0.0;
  if (v9 != v10)
    v11 = a3 / (float)(unint64_t)(v9 - v10);
  if (objc_msgSend(v7, "count"))
  {
    v12 = 0;
    p_var1 = &v8->var1;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)p_var1 - 1) = objc_msgSend(v14, "intValue");

      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        *(_DWORD *)p_var1 = v19;

      }
      else
      {
        *p_var1 = v11;
      }
      ++v12;
      p_var1 += 2;
    }
    while (v12 < objc_msgSend(v7, "count"));
  }

  return v8;
}

+ (id)_allLangIDs
{
  return &unk_1E5FA87E8;
}

+ (id)langCodeForlangId:(int)a3
{
  if ((a3 - 2) > 0x38)
    return CFSTR("und");
  else
    return off_1E5F99A08[a3 - 2];
}

+ (int)langIDforLangCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ar")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("bg")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh-Hans")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh-Hant")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh-Hant-HK")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hr")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("cs")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("da")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("nl")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("en")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("fi")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("fr")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("de")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("el")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("he")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hi")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hu")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("is")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("it")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ja")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ko")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("mr")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("nb")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("pl")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("pt")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ro")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ru")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("sk")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("es")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("sv")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("th")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("tr")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("uk")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ur")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("hy")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("bn")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("pa")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("gu")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("or")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ta")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("te")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("kn")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ml")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("si")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("lo")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("bo")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("my")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("ka")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("am")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("chr")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iu")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("km")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("mn")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("vi")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("fa")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("id")) & 1) != 0)
  {
    v4 = 57;
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("kk")))
  {
    v4 = 58;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)isSupportedLanguage:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  v4 = a3;
  v5 = +[AXSSLanguageTagger langIDforLangCode:](AXSSLanguageTagger, "langIDforLangCode:", v4);
  objc_msgSend(a1, "_allLangIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if ((v8 & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v4, "hasPrefix:", CFSTR("zh"));

  return v9;
}

+ (void)setSystemLocale:(id)a3
{
  objc_storeStrong((id *)&_systemLocale, a3);
}

@end
