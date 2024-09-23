@implementation EMFEmojiLocaleData

+ (EMFEmojiLocaleData)emojiLocaleDataWithCEMEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  return (EMFEmojiLocaleData *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCEMEmojiLocaleData:", a3);
}

- (EMFEmojiLocaleData)initWithCEMEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  EMFEmojiLocaleData *v4;
  uint64_t v5;
  NSString *localeIdentifier;
  objc_super v8;

  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)EMFEmojiLocaleData;
    v4 = -[EMFEmojiLocaleData init](&v8, sel_init);
    if (v4)
    {
      v5 = objc_msgSend((id)CEMEmojiLocaleDataGetLocaleIdentifier(), "copy");
      localeIdentifier = v4->_localeIdentifier;
      v4->_localeIdentifier = (NSString *)v5;

      v4->_localeDataRef = (__EmojiLocaleDataWrapper *)CFRetain(a3);
      v4->_didTryLoadingSearchEngine = 0;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

+ (EMFEmojiLocaleData)emojiLocaleDataWithLocaleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocaleIdentifier:", v4);

  return (EMFEmojiLocaleData *)v5;
}

- (EMFEmojiLocaleData)initWithLocaleIdentifier:(id)a3
{
  id v4;
  EMFEmojiLocaleData *v5;
  uint64_t v6;
  NSString *localeIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFEmojiLocaleData;
  v5 = -[EMFEmojiLocaleData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v6;

    v5->_localeDataRef = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
  }

  return v5;
}

- (void)dealloc
{
  __EmojiLocaleDataWrapper *localeDataRef;
  NSString *localeIdentifier;
  objc_super v5;

  localeDataRef = self->_localeDataRef;
  if (localeDataRef)
    CFRelease(localeDataRef);
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = 0;
  self->_localeDataRef = 0;

  v5.receiver = self;
  v5.super_class = (Class)EMFEmojiLocaleData;
  -[EMFEmojiLocaleData dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; locale = \"%@\"), self->_localeIdentifier);
  return v3;
}

- (NSArray)emojiTokens
{
  const void *v2;
  void *v3;

  v2 = (const void *)CEMEmojiLocaleDataCopyCommonEmojiTokens();
  +[EMFEmojiToken emojiTokensForCEMEmojiTokens:](EMFEmojiToken, "emojiTokensForCEMEmojiTokens:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    CFRelease(v2);
  return (NSArray *)v3;
}

- (unint64_t)cfCompareFlagsFromNSOptions:(unint64_t)a3
{
  return (a3 & 0x3CD | (16 * ((a3 >> 1) & 1))) ^ 0x10;
}

- (void)enumerateSearchResultsInText:(id)a3 range:(_NSRange)a4 options:(unint64_t)a5 searchType:(int)a6 usingBlock:(id)a7
{
  id v10;
  id v11;
  id v12;

  v10 = a7;
  if (v10)
  {
    v11 = a3;
    -[EMFEmojiLocaleData cfCompareFlagsFromNSOptions:](self, "cfCompareFlagsFromNSOptions:", a5);
    v12 = v10;
    CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock();

  }
}

void __87__EMFEmojiLocaleData_enumerateSearchResultsInText_range_options_searchType_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[EMFEmojiToken emojiTokensForCEMEmojiTokens:](EMFEmojiToken, "emojiTokensForCEMEmojiTokens:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)emojiTokensForText:(id)a3 phoneticReading:(id)a4 options:(unint64_t)a5 searchType:(int)a6 includePrefixMatches:(BOOL)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *EmojiTokensForString;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[EMFEmojiLocaleData searchEngine](self, "searchEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[EMFEmojiLocaleData searchEngine](self, "searchEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performStringQuery:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v25 = v11;
      v19 = 0;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        v22 = v19;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v16);
          +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21), self);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addObject:", v19);
          ++v21;
          v22 = v19;
        }
        while (v18 != v21);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);

      v11 = v25;
    }

  }
  else
  {
    -[EMFEmojiLocaleData cfCompareFlagsFromNSOptions:](self, "cfCompareFlagsFromNSOptions:", a5);
    EmojiTokensForString = (const void *)CEMEmojiLocaleDataCreateEmojiTokensForString();
    +[EMFEmojiToken emojiTokensForCEMEmojiTokens:](EMFEmojiToken, "emojiTokensForCEMEmojiTokens:", EmojiTokensForString);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (EmojiTokensForString)
      CFRelease(EmojiTokensForString);
  }

  return v15;
}

- (id)emojiTokensForOptions:(unint64_t)a3 presentationStyle:(int)a4
{
  char v4;
  const void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v6 = (const void *)CEMCopyEmojiTokens();
  +[EMFEmojiToken emojiTokensForCEMEmojiTokens:](EMFEmojiToken, "emojiTokensForCEMEmojiTokens:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFRelease(v6);
  if ((v4 & 4) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    +[EMFEmojiCategory categoryWithIdentifier:](EMFEmojiCategory, "categoryWithIdentifier:", CFSTR("EMFEmojiCategoryFlags"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emojiTokensForLocaleData:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsInArray:", v10);

    v7 = v8;
  }
  return v7;
}

- (EMFEmojiSearchEngine)searchEngine
{
  EMFEmojiSearchEngine *searchEngine;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSString *localeIdentifier;
  NSString **p_localeIdentifier;
  void *v11;
  EMFEmojiSearchEngine *v12;
  NSObject *v13;
  NSString *v14;
  EMFEmojiSearchEngine *v15;
  EMFEmojiSearchEngine *v16;
  NSObject *v17;
  NSObject *v18;
  NSString *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  searchEngine = self->_searchEngine;
  if (!searchEngine)
  {
    if (self->_didTryLoadingSearchEngine)
      return (EMFEmojiSearchEngine *)0;
    emf_signpost_get_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);

    emf_signpost_get_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B3DE1000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadSearchEngine", (const char *)&unk_1B3E4DDFE, (uint8_t *)&v22, 2u);
    }

    p_localeIdentifier = &self->_localeIdentifier;
    localeIdentifier = self->_localeIdentifier;
    self->_didTryLoadingSearchEngine = 1;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", localeIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[EMFEmojiSearchEngine isLocaleSupported:](EMFEmojiSearchEngine, "isLocaleSupported:", v11))
    {
      v12 = -[EMFEmojiSearchEngine initWithLocale:]([EMFEmojiSearchEngine alloc], "initWithLocale:", v11);
    }
    else
    {
      emf_logging_get_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *p_localeIdentifier;
        v22 = 138412290;
        v23 = v14;
        _os_log_impl(&dword_1B3DE1000, v13, OS_LOG_TYPE_INFO, "CoreEmoji disabled search engine for locale '%@'; not loading search engine resources",
          (uint8_t *)&v22,
          0xCu);
      }

      v12 = 0;
    }
    v15 = self->_searchEngine;
    self->_searchEngine = v12;

    v16 = self->_searchEngine;
    emf_logging_get_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[EMFEmojiLocaleData searchEngine].cold.1((uint64_t *)&self->_localeIdentifier, v18);
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = *p_localeIdentifier;
      v22 = 138412290;
      v23 = v19;
      _os_log_impl(&dword_1B3DE1000, v18, OS_LOG_TYPE_INFO, "Emoji search engine could not be loaded for locale '%@'", (uint8_t *)&v22, 0xCu);
    }

    emf_signpost_get_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B3DE1000, v21, OS_SIGNPOST_INTERVAL_END, v6, "LoadSearchEngine", (const char *)&unk_1B3E4DDFE, (uint8_t *)&v22, 2u);
    }

    searchEngine = self->_searchEngine;
  }
  return searchEngine;
}

- (void)preheatSearchEngine
{
  id v3;
  id v4;

  v3 = -[EMFEmojiLocaleData searchEngine](self, "searchEngine");
  -[EMFEmojiLocaleData searchEngine](self, "searchEngine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preheat");

}

- (id)_rawSearchEngineReference
{
  return self->_searchEngine;
}

- (EMFAnchoredSearchManager)anchoredSearchManager
{
  EMFAnchoredSearchManager *anchoredSearchManager;
  EMFAnchoredSearchManager *v4;
  EMFAnchoredSearchManager *v5;

  anchoredSearchManager = self->_anchoredSearchManager;
  if (!anchoredSearchManager)
  {
    v4 = -[EMFAnchoredSearchManager initWithLocaleData:]([EMFAnchoredSearchManager alloc], "initWithLocaleData:", self);
    v5 = self->_anchoredSearchManager;
    self->_anchoredSearchManager = v4;

    anchoredSearchManager = self->_anchoredSearchManager;
  }
  return anchoredSearchManager;
}

- (void)enumerateAnchoredReplacementCandidatesForContext:(id)a3 withOptions:(unsigned int)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[EMFEmojiLocaleData anchoredSearchManager](self, "anchoredSearchManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enumerateAnchoredReplacementCandidatesForContext:withOptions:usingBlock:", v9, a4, v8);

}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (__EmojiLocaleDataWrapper)emojiLocaleDataRef
{
  return self->_localeDataRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchoredSearchManager, 0);
  objc_storeStrong((id *)&self->_searchEngine, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (void)searchEngine
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1B3DE1000, a2, OS_LOG_TYPE_DEBUG, "Loaded emoji search engine for locale '%@'", (uint8_t *)&v3, 0xCu);
}

@end
