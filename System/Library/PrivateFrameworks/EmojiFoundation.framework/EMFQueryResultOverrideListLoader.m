@implementation EMFQueryResultOverrideListLoader

+ (id)overrideListForLocale:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  EMFQueryResultOverrideList *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  EMFQueryResultOverrideList *v13;
  int v15;
  NSObject *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreEmoji"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      _createStrippedLocaleIdentifierForLocale(v3);
      v5 = objc_claimAutoreleasedReturnValue();
      _overridePlistForLocaleIdentifierCheckingBothLocations(v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _createStrippedFallbackLocaleIdentifierForLocale(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        _overridePlistForLocaleIdentifierCheckingBothLocations(v4, v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          emf_logging_get_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            v15 = 138412290;
            v16 = v5;
            _os_log_impl(&dword_1B3DE1000, v8, OS_LOG_TYPE_INFO, "No search engine override list found for locale '%@'", (uint8_t *)&v15, 0xCu);
          }

          v6 = 0;
        }
      }

    }
    else
    {
      emf_logging_get_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[EMFQueryResultOverrideListLoader overrideListForLocale:].cold.1(v5);
      v6 = 0;
    }

    if (v6)
    {
      v9 = -[EMFQueryResultOverrideList initWithOverrideListURL:]([EMFQueryResultOverrideList alloc], "initWithOverrideListURL:", v6);
      if (v9)
      {
        emf_logging_get_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "localeIdentifier");
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "absoluteString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138412546;
          v16 = v11;
          v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_1B3DE1000, v10, OS_LOG_TYPE_INFO, "Loaded override list for locale '%@' (%@)", (uint8_t *)&v15, 0x16u);

        }
        v13 = v9;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)overrideListForLocale:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3DE1000, log, OS_LOG_TYPE_ERROR, "Could not locate CoreEmoji's on-disk framework bundle", v1, 2u);
}

@end
