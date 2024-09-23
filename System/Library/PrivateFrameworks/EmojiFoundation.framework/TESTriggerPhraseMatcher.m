@implementation TESTriggerPhraseMatcher

- (TESTriggerPhraseMatcher)initWithLocale:(id)a3
{
  id v4;
  TESTriggerPhraseMatcher *v5;
  uint64_t v6;
  NSLocale *locale;
  TESTriggerPhraseCollection *v8;
  void *v9;
  uint64_t v10;
  TESTriggerPhraseCollection *phrases;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TESTriggerPhraseMatcher;
  v5 = -[TESTriggerPhraseMatcher init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = [TESTriggerPhraseCollection alloc];
    -[TESTriggerPhraseMatcher locale](v5, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TESTriggerPhraseCollection initWithLocale:](v8, "initWithLocale:", v9);
    phrases = v5->_phrases;
    v5->_phrases = (TESTriggerPhraseCollection *)v10;

  }
  return v5;
}

- (id)createMatchResultForMatchRange:(_NSRange)a3 sourceString:(id)a4 effectType:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  TESMatchResult *v9;
  objc_class *v10;
  void *v11;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v9 = objc_alloc_init(TESMatchResult);
  -[TESMatchResult setMatchType:](v9, "setMatchType:", 0);
  -[TESMatchResult setEffectType:](v9, "setEffectType:", a5);
  -[TESMatchResult setMatchRange:](v9, "setMatchRange:", location, length);
  -[TESMatchResult setSourceString:](v9, "setSourceString:", v8);

  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TESMatchResult setMatcherClass:](v9, "setMatcherClass:", v11);

  return v9;
}

- (id)matchesForString:(id)a3 searchRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  TESTriggerPhraseCollection *phrases;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  phrases = self->_phrases;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__TESTriggerPhraseMatcher_matchesForString_searchRange___block_invoke;
  v15[3] = &unk_1E66FA028;
  v15[4] = self;
  v16 = v7;
  v10 = v8;
  v17 = v10;
  v11 = v7;
  -[TESTriggerPhraseCollection enumerateMatchStringsInString:searchRange:usingBlock:](phrases, "enumerateMatchStringsInString:searchRange:usingBlock:", v11, location, length, v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __56__TESTriggerPhraseMatcher_matchesForString_searchRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;

  objc_msgSend(*(id *)(a1 + 32), "createMatchResultForMatchRange:sourceString:effectType:", a2, a3, *(_QWORD *)(a1 + 40), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "effectType") == 1)
  {
    objc_msgSend(v5, "matchingSubString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchingSubString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
      v10 = 2;
    else
      v10 = 1;
    objc_msgSend(v5, "setSuggestionBehavior:", v10);
  }
  emf_logging_get_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __56__TESTriggerPhraseMatcher_matchesForString_searchRange___block_invoke_cold_1(v5, v11);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
}

- (TESTriggerPhraseCollection)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
  objc_storeStrong((id *)&self->_phrases, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

void __56__TESTriggerPhraseMatcher_matchesForString_searchRange___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "matchingSubString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "matcherClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1B3DE1000, a2, OS_LOG_TYPE_DEBUG, "[TESPhraseMatcher]: found result '%{private}@' (matcher class: %{public}@)", (uint8_t *)&v6, 0x16u);

}

@end
