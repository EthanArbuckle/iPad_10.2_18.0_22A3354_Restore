@implementation AXMSemanticTextFactory

- (NLTagger)tagger
{
  NLTagger *tagger;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NLTagger *v7;
  NLTagger *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  tagger = self->_tagger;
  if (!tagger)
  {
    v4 = *MEMORY[0x1E0CCE0C0];
    v10[0] = *MEMORY[0x1E0CCE0E8];
    v10[1] = v4;
    v5 = *MEMORY[0x1E0CCE0D0];
    v10[2] = *MEMORY[0x1E0CCE0C8];
    v10[3] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NLTagger *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE168]), "initWithTagSchemes:", v6);
    v8 = self->_tagger;
    self->_tagger = v7;

    tagger = self->_tagger;
  }
  return tagger;
}

- (NSMutableDictionary)cachedLexicons
{
  NSMutableDictionary *cachedLexicons;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  cachedLexicons = self->_cachedLexicons;
  if (!cachedLexicons)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedLexicons;
    self->_cachedLexicons = v4;

    cachedLexicons = self->_cachedLexicons;
  }
  return cachedLexicons;
}

- (NSNumberFormatter)numberFormatter
{
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    numberFormatter = self->_numberFormatter;
  }
  return numberFormatter;
}

- (NSMutableDictionary)compiledPatterns
{
  NSMutableDictionary *compiledPatterns;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  compiledPatterns = self->_compiledPatterns;
  if (!compiledPatterns)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_compiledPatterns;
    self->_compiledPatterns = v4;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLForResource:withExtension:", CFSTR("SemanticTextPatterns"), CFSTR("plist"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Patterns"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Identifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0CB38E8];
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Pattern"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          objc_msgSend(v12, "regularExpressionWithPattern:options:error:", v13, 2, &v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v22;

          if (v15)
          {
            AXMediaLogTextProcessing();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v11;
              v29 = 2112;
              v30 = v15;
              _os_log_error_impl(&dword_1B0E3B000, v16, OS_LOG_TYPE_ERROR, "Error compiling pattern '%@' : %@", buf, 0x16u);
            }

          }
          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_compiledPatterns, "setObject:forKeyedSubscript:", v14, v11);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v7);
    }

    compiledPatterns = self->_compiledPatterns;
  }
  return compiledPatterns;
}

- (NSDataDetector)dataDetector
{
  NSDataDetector *dataDetector;
  NSDataDetector *v4;
  id v5;
  NSDataDetector *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  dataDetector = self->_dataDetector;
  if (!dataDetector)
  {
    v15 = 0;
    v4 = (NSDataDetector *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", -1, &v15);
    v5 = v15;
    v6 = self->_dataDetector;
    self->_dataDetector = v4;

    if (v5)
    {
      AXMediaLogTextProcessing();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[AXMSemanticTextFactory dataDetector].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    }
    dataDetector = self->_dataDetector;
  }
  return dataDetector;
}

- (id)semanticTextForText:(id)a3 withLocale:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  AXMSemanticText *v9;
  void *v10;
  AXMSemanticText *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  AXMediaLogTextProcessing();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_DEFAULT, "input text: %@", (uint8_t *)&v13, 0xCu);
  }

  v9 = [AXMSemanticText alloc];
  -[AXMSemanticTextFactory _preprocessedText:](self, "_preprocessedText:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AXMSemanticText initWithText:locale:](v9, "initWithText:locale:", v10, v7);

  -[AXMSemanticTextFactory _applyNaturalLanguageTokens:](self, "_applyNaturalLanguageTokens:", v11);
  -[AXMSemanticTextFactory _applyDataDetectors:](self, "_applyDataDetectors:", v11);
  -[AXMSemanticTextFactory _applyCustomPatterns:](self, "_applyCustomPatterns:", v11);
  -[AXMSemanticTextFactory _performSemanticAnalysis:](self, "_performSemanticAnalysis:", v11);

  return v11;
}

- (id)_preprocessedText:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  v3 = a3;
  if (!objc_msgSend(v3, "length")
    || (objc_msgSend(v3, "rangeOfComposedCharacterSequenceAtIndex:", 0), v4 == 1)
    && objc_msgSend(v3, "characterAtIndex:", 0) == 0xFFFF)
  {
    v11 = &stru_1E6260C18;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invertedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".?"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "rangeOfCharacterFromSet:", v9) != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v5);
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (__CFString *)v10;
      }
      v8 = v8;

      v11 = v8;
    }
    else
    {
      v11 = &stru_1E6260C18;
    }

  }
  return v11;
}

- (BOOL)_string:(id)a3 containsOnlyCharactersFrom:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  objc_msgSend(a4, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v6);

  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_applyNaturalLanguageTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, uint64_t);
  void *v18;
  id v19;
  AXMSemanticTextFactory *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "preprocessedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSemanticTextFactory tagger](self, "tagger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v5);

  v7 = *MEMORY[0x1E0CCE0C8];
  AXMediaLogTextProcessing();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_DEFAULT, "will enumerate tags for scheme: %@. options: all", buf, 0xCu);
  }

  -[AXMSemanticTextFactory tagger](self, "tagger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "textRange");
  v12 = v11;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __54__AXMSemanticTextFactory__applyNaturalLanguageTokens___block_invoke;
  v18 = &unk_1E625E670;
  v19 = v4;
  v20 = self;
  v13 = v4;
  objc_msgSend(v9, "enumerateTagsInRange:unit:scheme:options:usingBlock:", v10, v12, 0, v7, 32, &v15);

  -[AXMSemanticTextFactory tagger](self, "tagger", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setString:", 0);

}

void __54__AXMSemanticTextFactory__applyNaturalLanguageTokens___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXMediaLogTextProcessing();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_1B0E3B000, v9, OS_LOG_TYPE_DEFAULT, "  %@ -> %@", (uint8_t *)&v27, 0x16u);
  }

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE100]))
  {
    v10 = *(void **)(a1 + 32);
    v11 = CFSTR("NLP:Whitespace");
LABEL_23:
    objc_msgSend(v10, "addNLPToken:withRange:", v11, a3, a4);
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE070]))
  {
    objc_msgSend(*(id *)(a1 + 32), "addNLPToken:withRange:", CFSTR("NLP:OtherWord"), a3, a4);
    v12 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "_textExistsInLexicon:withLocale:", v8, v13);

    objc_msgSend(*(id *)(a1 + 32), "addIsInLexionMarker:withRange:", v14, a3, a4);
    if ((v14 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "numberFormatter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberFromString:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_10:

        goto LABEL_24;
      }
      v17 = *(void **)(a1 + 32);
LABEL_9:
      objc_msgSend(v17, "addNumericToken:withRange:", v16, a3, a4);
      goto LABEL_10;
    }
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE080]))
    {
      v10 = *(void **)(a1 + 32);
      v11 = CFSTR("NLP:PersonalName");
      goto LABEL_23;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE060]))
    {
      v10 = *(void **)(a1 + 32);
      v11 = CFSTR("NLP:OrganizationName");
      goto LABEL_23;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE088]))
    {
      v10 = *(void **)(a1 + 32);
      v11 = CFSTR("NLP:PlaceName");
      goto LABEL_23;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE040]))
    {
      v10 = *(void **)(a1 + 32);
      v11 = CFSTR("NLP:Dash");
      goto LABEL_23;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE0A0]))
    {
      v10 = *(void **)(a1 + 32);
      v11 = CFSTR("NLP:Punctuation");
      goto LABEL_23;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE0F0]))
    {
      v10 = *(void **)(a1 + 32);
      v11 = CFSTR("NLP:SentenceTerminator");
      goto LABEL_23;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CCE068]))
    {
      v18 = objc_msgSend(*(id *)(a1 + 32), "tokenizedLength");
      v19 = *(void **)(a1 + 40);
      if (v18 > 3)
      {
        objc_msgSend(v8, "lowercaseString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "locale");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v19, "_textExistsInLexicon:withLocale:", v24, v25);

        objc_msgSend(*(id *)(a1 + 32), "addIsInLexionMarker:withRange:", v26, a3, a4);
        if (!(_DWORD)v26 || (unint64_t)objc_msgSend(v8, "length") < 3)
        {
          v10 = *(void **)(a1 + 32);
          v11 = CFSTR("NLP:Unknown");
          goto LABEL_23;
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "locale");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "_textExistsInLexicon:withLocale:", v8, v20);

        objc_msgSend(*(id *)(a1 + 32), "addIsInLexionMarker:withRange:", v21, a3, a4);
        if (!(_DWORD)v21 || (unint64_t)objc_msgSend(v8, "length") < 3)
        {
          objc_msgSend(*(id *)(a1 + 40), "numberFormatter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "numberFromString:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = *(void **)(a1 + 32);
          if (!v16)
          {
            objc_msgSend(v17, "addNLPToken:withRange:", CFSTR("NLP:Unknown"), a3, a4);
            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
      v10 = *(void **)(a1 + 32);
      v11 = CFSTR("NLP:OtherWord");
      goto LABEL_23;
    }
    AXMediaLogTextProcessing();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __54__AXMSemanticTextFactory__applyNaturalLanguageTokens___block_invoke_cold_1();

  }
LABEL_24:

}

- (void)_applyDataDetectors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[AXMSemanticTextFactory dataDetector](self, "dataDetector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preprocessedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "textRange");
  v9 = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__AXMSemanticTextFactory__applyDataDetectors___block_invoke;
  v11[3] = &unk_1E625E698;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, v7, v9, v11);

}

void __46__AXMSemanticTextFactory__applyDataDetectors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "resultType");
    if (v5 <= 31)
    {
      if (v5 == 8)
      {
        v6 = *(void **)(a1 + 32);
        v8 = objc_msgSend(v4, "range");
        v9 = CFSTR("DD:Date");
        goto LABEL_13;
      }
      if (v5 == 16)
      {
        v6 = *(void **)(a1 + 32);
        v8 = objc_msgSend(v4, "range");
        v9 = CFSTR("DD:Address");
        goto LABEL_13;
      }
    }
    else
    {
      switch(v5)
      {
        case 32:
          v6 = *(void **)(a1 + 32);
          v8 = objc_msgSend(v4, "range");
          v9 = CFSTR("DD:Link");
          goto LABEL_13;
        case 2048:
          v6 = *(void **)(a1 + 32);
          v8 = objc_msgSend(v4, "range");
          v9 = CFSTR("DD:PhoneNumber");
          goto LABEL_13;
        case 4096:
          v6 = *(void **)(a1 + 32);
          v8 = objc_msgSend(v4, "range");
          v9 = CFSTR("DD:TransitInfo");
LABEL_13:
          objc_msgSend(v6, "addDataDetector:withRange:", v9, v8, v7);
          goto LABEL_14;
      }
    }
    v10 = *(void **)(a1 + 32);
    v11 = objc_msgSend(v4, "range");
    objc_msgSend(v10, "substringWithRange:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AXMediaLogTextProcessing();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __46__AXMSemanticTextFactory__applyDataDetectors___block_invoke_cold_1();

  }
LABEL_14:

}

- (void)_applyCustomPatterns:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  -[AXMSemanticTextFactory compiledPatterns](self, "compiledPatterns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AXMSemanticTextFactory__applyCustomPatterns___block_invoke;
  v7[3] = &unk_1E625E6E8;
  v8 = v4;
  v9 = 0;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __47__AXMSemanticTextFactory__applyCustomPatterns___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "preprocessedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v10 = objc_msgSend(*(id *)(a1 + 32), "textRange");
  v12 = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__AXMSemanticTextFactory__applyCustomPatterns___block_invoke_2;
  v14[3] = &unk_1E625E6C0;
  v15 = *(id *)(a1 + 32);
  v16 = v5;
  v13 = v5;
  objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v8, v9, v10, v12, v14);

}

uint64_t __47__AXMSemanticTextFactory__applyCustomPatterns___block_invoke_2(uint64_t result, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a2)
  {
    v2 = *(void **)(result + 32);
    v3 = *(_QWORD *)(result + 40);
    v4 = objc_msgSend(a2, "range");
    return objc_msgSend(v2, "addCustomPattern:withRange:", v3, v4, v5);
  }
  return result;
}

- (void)_performSemanticAnalysis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  id *v15;
  id *v16;
  uint64_t *v17;
  uint64_t *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v3;
  objc_msgSend(v3, "makeCursor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    v32 = *MEMORY[0x1E0CB28A8];
    v31 = *MEMORY[0x1E0CB2D60];
    while (1)
    {
      AXMediaLogTextProcessing();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(v5, "remainingRange");
        objc_msgSend(v5, "remainingRange");
        v11 = v10;
        v12 = objc_msgSend(v5, "isOtherWord");
        v13 = objc_msgSend(v5, "isInLexicon");
        v14 = objc_msgSend(v5, "isWhitespace");
        *(_DWORD *)buf = 134219008;
        v50 = v9;
        v51 = 2048;
        v52 = v11;
        v53 = 2048;
        v54 = v12;
        v55 = 2048;
        v56 = v13;
        v57 = 2048;
        v58 = v14;
        _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_DEFAULT, "remaining:[%ld %ld] word:%ld lexicon:%ld whitespace:%ld", buf, 0x34u);
      }

      if (objc_msgSend(v5, "isCustomPattern"))
      {
        v45 = 0;
        v46 = 0;
        v15 = (id *)&v46;
        v16 = (id *)&v45;
        v17 = &v46;
        v18 = &v45;
        v19 = v5;
        v20 = CFSTR("CustomPattern");
        goto LABEL_16;
      }
      if (objc_msgSend(v5, "isDataDetector"))
        break;
      if ((objc_msgSend(v5, "isWhitespace") & 1) != 0 || objc_msgSend(v5, "isSentenceTerminator"))
      {
        v41 = 0;
        v42 = 0;
        v15 = (id *)&v42;
        v16 = (id *)&v41;
        v17 = &v42;
        v18 = &v41;
        goto LABEL_15;
      }
      if (objc_msgSend(v5, "isPunctuation"))
      {
        v39 = 0;
        v40 = 0;
        v15 = (id *)&v40;
        v16 = (id *)&v39;
        v17 = &v40;
        v18 = &v39;
        goto LABEL_15;
      }
      if (objc_msgSend(v5, "isProperNoun"))
      {
        v37 = 0;
        v38 = 0;
        v15 = (id *)&v38;
        v16 = (id *)&v37;
        v17 = &v38;
        v18 = &v37;
        goto LABEL_15;
      }
      if (objc_msgSend(v5, "isOtherWord"))
      {
        if (objc_msgSend(v5, "isInLexicon"))
        {
          v35 = 0;
          v36 = 0;
          v15 = (id *)&v36;
          v16 = (id *)&v35;
          v17 = &v36;
          v18 = &v35;
LABEL_15:
          v19 = v5;
          v20 = CFSTR("NLPToken");
LABEL_16:
          objc_msgSend(v19, "processAttribute:getSubstring:advanceCursor:markAsSemanticError:error:", v20, v17, 1, 0, v18);
          v21 = *v15;
          v22 = *v16;
          if (v21)
          {
            objc_msgSend(v4, "appendString:", v21);

          }
          goto LABEL_18;
        }
        v34 = 0;
        objc_msgSend(v5, "processAttribute:getSubstring:advanceCursor:markAsSemanticError:error:", CFSTR("NLPToken"), 0, 1, 1, &v34);
        v22 = v34;
      }
      else
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v47 = v31;
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "remainingRange"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "remainingRange");
        objc_msgSend(v25, "numberWithUnsignedInteger:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("Failed to match current cursor position. remaining:[%@ %@]"), v24, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", v32, 1, v29);
        v22 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_18:
      if (v22)
        objc_msgSend(v5, "markCurrentIndexAsSemanticErrorAndAdvanceCursor");

      if (objc_msgSend(v5, "isFinished"))
        goto LABEL_2;
    }
    v43 = 0;
    v44 = 0;
    v15 = (id *)&v44;
    v16 = (id *)&v43;
    v17 = &v44;
    v18 = &v43;
    v19 = v5;
    v20 = CFSTR("DataDetector");
    goto LABEL_16;
  }
LABEL_2:
  objc_msgSend(v33, "setTransformedSpeechText:", v4);
  AXMediaLogTextProcessing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v33, "isSemanticallyComplete");
    *(_DWORD *)buf = 134218242;
    v50 = v7;
    v51 = 2112;
    v52 = v4;
    _os_log_impl(&dword_1B0E3B000, v6, OS_LOG_TYPE_DEFAULT, "semanticallyComplete:%ld speechText: '%@'", buf, 0x16u);
  }

}

- (BOOL)_lexiconExistsForLocale:(id)a3
{
  return a3 && -[AXMSemanticTextFactory _lexiconForLocale:](self, "_lexiconForLocale:") != 0;
}

- (BOOL)_textExistsInLexicon:(id)a3 withLocale:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  if (-[AXMSemanticTextFactory _lexiconForLocale:](self, "_lexiconForLocale:", v7))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    LXLexiconEnumerateEntriesForString();
    v8 = v11[3] > 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __58__AXMSemanticTextFactory__textExistsInLexicon_withLocale___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int MetaFlags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int UsageCount;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)LXEntryCopyString();
  MetaFlags = LXEntryGetMetaFlags();
  LXEntryGetProbability();
  v5 = v4;
  LXEntryGetPartialProbability();
  v7 = v6;
  UsageCount = LXEntryGetUsageCount();
  AXMediaLogTextProcessing();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v11 = 134219266;
    v12 = v10;
    v13 = 2112;
    v14 = v2;
    v15 = 2048;
    v16 = MetaFlags;
    v17 = 2048;
    v18 = v5;
    v19 = 2048;
    v20 = v7;
    v21 = 1024;
    v22 = UsageCount;
    _os_log_impl(&dword_1B0E3B000, v9, OS_LOG_TYPE_DEFAULT, "lex #%ld: '%@' flags:%lu prob:%.2f partialProb:%.2f usageCount:%u", (uint8_t *)&v11, 0x3Au);
  }

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (_LXLexicon)_lexiconForLocale:(id)a3
{
  id v4;
  void *v5;
  _LXLexicon *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  id v29;
  _BYTE buf[12];
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[AXMSemanticTextFactory cachedLexicons](self, "cachedLexicons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_LXLexicon *)objc_msgSend(v5, "objectForKey:", v4);

  if (!v6 && v4)
  {
    AXMediaLogTextProcessing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "languageCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v4;
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_DEFAULT, "Creating new lexicon for locale (an expensive operation): %@ (language: %@) (id: %@)", buf, 0x20u);

    }
    v28 = *MEMORY[0x1E0D437B8];
    v29 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v11 = LXLexiconCreate();
    v6 = (_LXLexicon *)v11;
    if (*(_QWORD *)buf || !v11)
    {
      AXMediaLogTextProcessing();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AXMSemanticTextFactory _lexiconForLocale:].cold.2((uint64_t)buf, v13, v14, v15, v16, v17, v18, v19);

      if (!v6)
        goto LABEL_14;
    }
    else
    {
      -[AXMSemanticTextFactory cachedLexicons](self, "cachedLexicons");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v6, v4);

    }
    CFRelease(v6);
LABEL_14:

  }
  if (!v6)
  {
    AXMediaLogTextProcessing();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AXMSemanticTextFactory _lexiconForLocale:].cold.1((uint64_t)v4, v20, v21, v22, v23, v24, v25, v26);

  }
  return v6;
}

- (void)setDataDetector:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetector, a3);
}

- (void)setTagger:(id)a3
{
  objc_storeStrong((id *)&self->_tagger, a3);
}

- (void)setCachedLexicons:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLexicons, a3);
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void)setCompiledPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_compiledPatterns, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiledPatterns, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_cachedLexicons, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
  objc_storeStrong((id *)&self->_dataDetector, 0);
}

- (void)dataDetector
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Error creating data detector: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__AXMSemanticTextFactory__applyNaturalLanguageTokens___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_6(&dword_1B0E3B000, v0, v1, "  WARNING: Unhandled NLToken: %@ -> %@");
  OUTLINED_FUNCTION_1();
}

void __46__AXMSemanticTextFactory__applyDataDetectors___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_6(&dword_1B0E3B000, v0, v1, "  WARNING: Unhandled Data Detector: %@ -> %@");
  OUTLINED_FUNCTION_1();
}

- (void)_lexiconForLocale:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "No lexicon found for locale: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_lexiconForLocale:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B0E3B000, a2, a3, "Unable to create lexicon: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
