@implementation EMFQueryLogger

- (EMFQueryLogger)initWithEmojiLocaleData:(__EmojiLocaleDataWrapper *)a3
{
  EMFQueryLogger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EMFQueryLogger;
  v4 = -[EMFQueryLogger init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_localeData = a3;
  }
  return v4;
}

- (void)dealloc
{
  __EmojiLocaleDataWrapper *localeData;
  objc_super v4;

  localeData = self->_localeData;
  if (localeData)
    CFRelease(localeData);
  v4.receiver = self;
  v4.super_class = (Class)EMFQueryLogger;
  -[EMFQueryLogger dealloc](&v4, sel_dealloc);
}

- (void)logQueryResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "documentWeightsStringFromQueryResult:usingLocaleData:", v4, self->_localeData);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "overriddenResultsStringFromQueryResult:usingLocaleData:", v4, self->_localeData);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  emf_logging_get_query_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138413058;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    v17 = 2080;
    v18 = objc_msgSend(objc_retainAutorelease(v10), "cStringUsingEncoding:", 4);
    v19 = 2112;
    v20 = v11;
    _os_log_debug_impl(&dword_1B3DE1000, v12, OS_LOG_TYPE_DEBUG, "\nQuery Result Info\nQuery string: '%@'\nQuery tokens: '%@'\nDocument Weights:\n%s\nQueryOverride: '%@'", (uint8_t *)&v13, 0x2Au);
  }

}

+ (id)documentWeightsStringFromQueryResult:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "emojiMatchesAndDocumentWeightsUsingEmojiLocaleData:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:\t %@"), v13, v14, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)overriddenResultsStringFromQueryResult:(id)a3 usingLocaleData:(__EmojiLocaleDataWrapper *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "resultOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<["));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v5, "emojiMatchesForOverriddenResultsUsingEmojiLocaleData:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "appendString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(v5, "resultOverride");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "overrideBehavior");
    objc_msgSend(v5, "resultOverride");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("] behavior=%lu; searchType=%lu>"),
      v14,
      objc_msgSend(v15, "overrideSearchType"));

    v16 = (__CFString *)objc_msgSend(v7, "copy");
  }
  else
  {
    v16 = &stru_1E670BD50;
  }

  return v16;
}

- (__EmojiLocaleDataWrapper)localeData
{
  return self->_localeData;
}

@end
