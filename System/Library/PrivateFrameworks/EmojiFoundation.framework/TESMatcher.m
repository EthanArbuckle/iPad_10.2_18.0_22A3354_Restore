@implementation TESMatcher

- (TESMatcher)initWithLocale:(id)a3
{
  id v4;
  TESMatcher *v5;
  uint64_t v6;
  NSLocale *locale;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TESMatcher;
  v5 = -[TESMatcher init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    -[TESMatcher _loadPatternMatchers](v5, "_loadPatternMatchers");
  }

  return v5;
}

- (void)enumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger location;
  id v9;
  void (**v10)(id, _QWORD, char *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *obj;
  NSUInteger length;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  length = a4.length;
  location = a4.location;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, _QWORD, char *))a6;
  v31 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_matchers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v13)
        objc_enumerationMutation(obj);
      if (v31)
        break;
      objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "matchesForString:searchRange:", v9, location, length);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
LABEL_9:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          if (v31)
            break;
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++), &v31);
          if (v18 == v20)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            if (v18)
              goto LABEL_9;
            break;
          }
        }
      }

      if (++v14 == v12)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)asynchronouslyEnumerateTextEffectCandidatesInString:(id)a3 searchRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger location;
  id v9;
  void (**v10)(id, _QWORD, char *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *obj;
  NSUInteger length;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  length = a4.length;
  location = a4.location;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, _QWORD, char *))a6;
  v31 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_matchers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v13)
        objc_enumerationMutation(obj);
      if (v31)
        break;
      objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "matchesForString:searchRange:", v9, location, length);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
LABEL_9:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          if (v31)
            break;
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++), &v31);
          if (v18 == v20)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            if (v18)
              goto LABEL_9;
            break;
          }
        }
      }

      if (++v14 == v12)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_loadPatternMatchers
{
  TESTriggerPhraseMatcher *v3;
  void *v4;
  TESTriggerPhraseMatcher *v5;
  TESTriggerPhraseMatcher *phraseMatcher;
  NSMutableArray *matchers;
  TESPatternMatcherLoader *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  TESPatternMatcherLoader *v12;

  v3 = [TESTriggerPhraseMatcher alloc];
  -[TESMatcher locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TESTriggerPhraseMatcher initWithLocale:](v3, "initWithLocale:", v4);
  phraseMatcher = self->_phraseMatcher;
  self->_phraseMatcher = v5;

  matchers = self->_matchers;
  if (!matchers || !-[NSMutableArray count](matchers, "count"))
  {
    v8 = [TESPatternMatcherLoader alloc];
    -[TESMatcher locale](self, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TESPatternMatcherLoader initWithLocale:](v8, "initWithLocale:", v9);

    -[TESPatternMatcherLoader matchers](v12, "matchers");
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_matchers;
    self->_matchers = v10;

  }
}

- (NSMutableArray)matchers
{
  return self->_matchers;
}

- (void)setMatchers:(id)a3
{
  objc_storeStrong((id *)&self->_matchers, a3);
}

- (TESTriggerPhraseMatcher)phraseMatcher
{
  return self->_phraseMatcher;
}

- (void)setPhraseMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_phraseMatcher, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_phraseMatcher, 0);
  objc_storeStrong((id *)&self->_matchers, 0);
}

@end
