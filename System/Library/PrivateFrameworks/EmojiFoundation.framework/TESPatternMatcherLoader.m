@implementation TESPatternMatcherLoader

- (TESPatternMatcherLoader)initWithLocale:(id)a3
{
  id v4;
  TESPatternMatcherLoader *v5;
  uint64_t v6;
  NSLocale *locale;
  NSMutableArray *v8;
  NSMutableArray *matchers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TESPatternMatcherLoader;
  v5 = -[TESPatternMatcherLoader init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    matchers = v5->_matchers;
    v5->_matchers = v8;

    -[TESPatternMatcherLoader _loadPatternMatchers](v5, "_loadPatternMatchers");
  }

  return v5;
}

+ (id)_loadPatternMatcherForKey:(id)a3
{
  id v3;
  __objc2_class **v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("capitalLetter")) & 1) != 0)
  {
    v4 = off_1E66E34A0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("repeatedCharacter")) & 1) != 0)
  {
    v4 = off_1E66E34B8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("asterisk")) & 1) != 0)
  {
    v4 = off_1E66E3498;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("underScore")) & 1) != 0)
  {
    v4 = off_1E66E34D0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("slash")) & 1) != 0)
  {
    v4 = off_1E66E34C0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hyphen")) & 1) != 0)
  {
    v4 = off_1E66E34A8;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("tilde")))
    {
      v5 = 0;
      goto LABEL_16;
    }
    v4 = off_1E66E34C8;
  }
  v5 = objc_alloc_init(*v4);
LABEL_16:

  return v5;
}

- (void)_loadPatternMatchers
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  TESStylePatternLoader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_matchers, "count"))
  {
    -[TESPatternMatcherLoader locale](self, "locale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v4;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = -[TESStylePatternLoader initWithLocaleIdentifier:]([TESStylePatternLoader alloc], "initWithLocaleIdentifier:", v4);
    -[TESLocalizedPListLoader items](v13, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          +[TESPatternMatcherLoader _loadPatternMatcherForKey:](TESPatternMatcherLoader, "_loadPatternMatcherForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[NSMutableArray addObject:](self->_matchers, "addObject:", v11);
          }
          else
          {
            emf_logging_get_default_log();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v20 = v10;
              _os_log_error_impl(&dword_1B3DE1000, v12, OS_LOG_TYPE_ERROR, "Pattern matcher key '%{public}@' is not supported.", buf, 0xCu);
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v7);
    }

  }
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSMutableArray)matchers
{
  return self->_matchers;
}

- (void)setMatchers:(id)a3
{
  objc_storeStrong((id *)&self->_matchers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchers, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
