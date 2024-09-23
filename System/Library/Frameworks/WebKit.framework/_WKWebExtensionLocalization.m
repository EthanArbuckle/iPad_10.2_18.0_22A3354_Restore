@implementation _WKWebExtensionLocalization

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKWebExtensionLocalization)initWithWebExtension:(void *)a3
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  NSObject *v12;
  _WKWebExtensionLocalization *v13;
  void *v14;
  NSObject *v15;
  __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  const __CFString *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WebKit::WebExtension::defaultLocale((id *)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "languageCode");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "countryCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v7, v25);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionLocalization _localizationDictionaryForWebExtension:withLocale:](self, "_localizationDictionaryForWebExtension:withLocale:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = qword_1ECE710C8;
      if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v6;
        _os_log_debug_impl(&dword_196BCC000, v10, OS_LOG_TYPE_DEBUG, "Default locale available for %{public}@", buf, 0xCu);
      }
      v11 = v6;
    }
    else
    {
      v11 = 0;
    }
    if ((-[__CFString isEqualToString:](v7, "isEqualToString:", v6) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      -[_WKWebExtensionLocalization _localizationDictionaryForWebExtension:withLocale:](self, "_localizationDictionaryForWebExtension:withLocale:", a3, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = qword_1ECE710C8;
        if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v7;
          _os_log_debug_impl(&dword_196BCC000, v15, OS_LOG_TYPE_DEBUG, "Language locale available for %{public}@", buf, 0xCu);
        }
        v16 = v7;

        v11 = v16;
      }
    }
    if ((-[__CFString isEqualToString:](v8, "isEqualToString:", v6) & 1) != 0
      || (-[_WKWebExtensionLocalization _localizationDictionaryForWebExtension:withLocale:](self, "_localizationDictionaryForWebExtension:withLocale:", a3, v8), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v20 = 0;
    }
    else
    {
      v18 = qword_1ECE710C8;
      if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v8;
        _os_log_debug_impl(&dword_196BCC000, v18, OS_LOG_TYPE_DEBUG, "Regional locale available for %{public}@", buf, 0xCu);
      }
      v19 = v8;

      v11 = v19;
      v20 = (void *)v17;
    }
    v21 = qword_1ECE710C8;
    if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_DEBUG))
    {
      v23 = CFSTR("undefined");
      if (v11)
        v23 = v11;
      *(_DWORD *)buf = 138543362;
      v27 = v23;
      _os_log_debug_impl(&dword_196BCC000, v21, OS_LOG_TYPE_DEBUG, "Best locale is %{public}@", buf, 0xCu);
    }
    v13 = -[_WKWebExtensionLocalization initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:](self, "initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:", v20, v14, v9, v11, 0);

  }
  else
  {
    v12 = qword_1ECE710C8;
    if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_196BCC000, v12, OS_LOG_TYPE_DEBUG, "No default locale provided", buf, 2u);
    }
    v13 = -[_WKWebExtensionLocalization initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:](self, "initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:", 0, 0, 0, 0, 0);
  }

  return v13;
}

- (_WKWebExtensionLocalization)initWithLocalizedDictionary:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _WKWebExtensionLocalization *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("@@ui_locale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("message"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_WKWebExtensionLocalization initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:](self, "initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:", v6, 0, 0, v9, v7);
  return v10;
}

- (_WKWebExtensionLocalization)initWithRegionalLocalization:(id)a3 languageLocalization:(id)a4 defaultLocalization:(id)a5 withBestLocale:(id)a6 uniqueIdentifier:(id)a7
{
  WebKit *v12;
  WebKit *v13;
  WebKit *v14;
  id v15;
  id v16;
  _WKWebExtensionLocalization *v17;
  uint64_t v18;
  NSLocale *locale;
  WebKit *v20;
  NSDictionary *v21;
  WebKit *v22;
  NSDictionary *v23;
  NSDictionary *v24;
  NSDictionary *v25;
  WebKit *v26;
  NSDictionary *v27;
  NSDictionary *v28;
  NSDictionary *v29;
  WebKit *v30;
  NSDictionary *v31;
  NSDictionary *v32;
  NSDictionary *v33;
  uint64_t v34;
  NSDictionary *localizationDictionary;
  _WKWebExtensionLocalization *v36;
  objc_super v38;

  v12 = (WebKit *)a3;
  v13 = (WebKit *)a4;
  v14 = (WebKit *)a5;
  v15 = a6;
  v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)_WKWebExtensionLocalization;
  v17 = -[_WKWebExtensionLocalization init](&v38, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v15);
    v18 = objc_claimAutoreleasedReturnValue();
    locale = v17->_locale;
    v17->_locale = (NSLocale *)v18;

    objc_storeStrong((id *)&v17->_localeString, a6);
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a7);
    -[_WKWebExtensionLocalization _predefinedMessages](v17, "_predefinedMessages");
    v20 = (WebKit *)objc_claimAutoreleasedReturnValue();
    WebKit::dictionaryWithLowercaseKeys(v20, v21);
    v22 = (WebKit *)objc_claimAutoreleasedReturnValue();

    WebKit::dictionaryWithLowercaseKeys(v12, v23);
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    WebKit::mergeDictionaries(v22, v24, v25);
    v26 = (WebKit *)objc_claimAutoreleasedReturnValue();

    WebKit::dictionaryWithLowercaseKeys(v13, v27);
    v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    WebKit::mergeDictionaries(v26, v28, v29);
    v30 = (WebKit *)objc_claimAutoreleasedReturnValue();

    WebKit::dictionaryWithLowercaseKeys(v14, v31);
    v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    WebKit::mergeDictionaries(v30, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();

    localizationDictionary = v17->_localizationDictionary;
    v17->_localizationDictionary = (NSDictionary *)v34;

    v36 = v17;
  }

  return v17;
}

- (id)localizedDictionaryForDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSDictionary count](self->_localizationDictionary, "count"))
  {
    v13 = v4;
    v4 = (id)objc_msgSend(v4, "mutableCopy");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (!v6)
      goto LABEL_16;
    v7 = *(_QWORD *)v15;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_WKWebExtensionLocalization localizedStringForString:](self, "localizedStringForString:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v9);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[_WKWebExtensionLocalization _localizedArrayForArray:](self, "_localizedArrayForArray:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v9);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_14;
            -[_WKWebExtensionLocalization localizedDictionaryForDictionary:](self, "localizedDictionaryForDictionary:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v9);
          }
        }

LABEL_14:
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v6)
      {
LABEL_16:

        return v4;
      }
    }
  }
  return v4;
}

- (id)localizedStringForKey:(id)a3 withPlaceholders:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSDictionary *localizationDictionary;
  void *v10;
  void *v11;
  void *v12;
  WebKit *v13;
  NSDictionary *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") <= 9)
  {
    if (-[NSDictionary count](self->_localizationDictionary, "count"))
    {
      localizationDictionary = self->_localizationDictionary;
      objc_msgSend(v6, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      WebKit::objectForKey<NSDictionary>(localizationDictionary, (uint64_t)v10, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      WebKit::objectForKey<NSString>(v11, (uint64_t)CFSTR("message"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {
        WebKit::objectForKey<NSDictionary>(v11, (uint64_t)CFSTR("placeholders"), 1, 0);
        v13 = (WebKit *)objc_claimAutoreleasedReturnValue();
        WebKit::dictionaryWithLowercaseKeys(v13, v14);
        v15 = objc_claimAutoreleasedReturnValue();

        -[_WKWebExtensionLocalization _stringByReplacingNamedPlaceholdersInString:withNamedPlaceholders:](self, "_stringByReplacingNamedPlaceholdersInString:withNamedPlaceholders:", v12, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[_WKWebExtensionLocalization _stringByReplacingPositionalPlaceholdersInString:withValues:](self, "_stringByReplacingPositionalPlaceholdersInString:withValues:", v16, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$$"), CFSTR("$"));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)v15;
      }
      else
      {
        v8 = &stru_1E351F1B8;
      }

    }
    else
    {
      v8 = &stru_1E351F1B8;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_localizedArrayForArray:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v7[5];

  v4 = a3;
  if (-[NSDictionary count](self->_localizationDictionary, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55___WKWebExtensionLocalization__localizedArrayForArray___block_invoke;
    v7[3] = &unk_1E34AAEF8;
    v7[4] = self;
    WebKit::mapObjects<NSArray>(v4, v7);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  return v4;
}

- (id)localizedStringForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("__MSG_([A-Za-z0-9_@]+)__"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v6)
  {
    v8 = v4;
    do
    {
      v9 = objc_msgSend(v6, "rangeAtIndex:", 1);
      objc_msgSend(v8, "substringWithRange:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WKWebExtensionLocalization localizedStringForKey:withPlaceholders:](self, "localizedStringForKey:withPlaceholders:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "range");
      objc_msgSend(v8, "substringWithRange:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", v15, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = v7;
      v6 = (void *)v16;
    }
    while (v16);
  }

  return v7;
}

- (id)_localizationDictionaryForWebExtension:(void *)a3 withLocale:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_locales/%@/messages.json"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D50];
  WebKit::WebExtension::resourceDataForPath((uint64_t)a3, v5, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WebKit::parseJSON(v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_predefinedMessages
{
  NSLocale *locale;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *localeString;
  void *v15;
  NSString *uniqueIdentifier;
  void *v17;
  void *v18;
  const __CFString *v20;
  NSString *v21;
  const __CFString *v22;
  NSString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  _QWORD v32[4];
  _QWORD v33[4];
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  _QWORD v42[4];
  _QWORD v43[5];

  v43[4] = *MEMORY[0x1E0C80C00];
  locale = self->_locale;
  if (!locale)
    goto LABEL_5;
  v4 = (void *)MEMORY[0x1E0CEA238];
  -[NSLocale languageCode](locale, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "defaultWritingDirectionForLanguage:", v5);

  if (!v6)
  {
    v40 = CFSTR("message");
    v41 = CFSTR("ltr");
    v42[0] = CFSTR("@@bidi_dir");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v7;
    v42[1] = CFSTR("@@bidi_reversed_dir");
    v38 = CFSTR("message");
    v39 = CFSTR("rtl");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v8;
    v42[2] = CFSTR("@@bidi_start_edge");
    v36 = CFSTR("message");
    v37 = CFSTR("left");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v9;
    v42[3] = CFSTR("@@bidi_end_edge");
    v34 = CFSTR("message");
    v35 = CFSTR("right");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    goto LABEL_7;
  }
  if (!self->_locale)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v30 = CFSTR("message");
  v31 = CFSTR("rtl");
  v32[0] = CFSTR("@@bidi_dir");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v7;
  v32[1] = CFSTR("@@bidi_reversed_dir");
  v28 = CFSTR("message");
  v29 = CFSTR("ltr");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v8;
  v32[2] = CFSTR("@@bidi_start_edge");
  v26 = CFSTR("message");
  v27 = CFSTR("right");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v9;
  v32[3] = CFSTR("@@bidi_end_edge");
  v24 = CFSTR("message");
  v25 = CFSTR("left");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mutableCopy");
LABEL_7:
  v13 = (void *)v12;

LABEL_8:
  localeString = self->_localeString;
  if (localeString)
  {
    v22 = CFSTR("message");
    v23 = localeString;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("@@ui_locale"));

  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v20 = CFSTR("message");
    v21 = uniqueIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("@@extension_id"));

  }
  v18 = (void *)objc_msgSend(v13, "copy");

  return v18;
}

- (id)_stringByReplacingNamedPlaceholdersInString:(id)a3 withNamedPlaceholders:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:[^$]|^)(\\$([A-Za-z0-9_@]+)\\$)"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    do
    {
      v9 = objc_msgSend(v8, "rangeAtIndex:", 2);
      objc_msgSend(v5, "substringWithRange:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      WebKit::objectForKey<NSDictionary>(v6, (uint64_t)v12, 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WebKit::objectForKey<NSString>(v13, (uint64_t)CFSTR("content"), 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = &stru_1E351F1B8;
      if (v14)
        v16 = (__CFString *)v14;
      v17 = v16;

      v18 = objc_msgSend(v8, "rangeAtIndex:", 1);
      objc_msgSend(v5, "substringWithRange:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v20, v17, 1, 0, objc_msgSend(v5, "length"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "firstMatchInString:options:range:", v21, 0, 0, objc_msgSend(v21, "length"));
      v22 = objc_claimAutoreleasedReturnValue();

      v5 = v21;
      v8 = (void *)v22;
    }
    while (v22);
  }
  else
  {
    v21 = v5;
  }

  return v21;
}

- (id)_stringByReplacingPositionalPlaceholdersInString:(id)a3 withValues:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:[^$]|^)(\\$([0-9]))"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    do
    {
      v10 = objc_msgSend(v9, "rangeAtIndex:", 2);
      objc_msgSend(v5, "substringWithRange:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      v14 = &stru_1E351F1B8;
      if (v13 >= 1 && v13 <= v7)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v13 - 1);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v15 = objc_msgSend(v9, "rangeAtIndex:", 1);
      objc_msgSend(v5, "substringWithRange:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v17, v14, 1, 0, objc_msgSend(v5, "length"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "firstMatchInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length"));
      v19 = objc_claimAutoreleasedReturnValue();

      v5 = v18;
      v9 = (void *)v19;
    }
    while (v19);
  }
  else
  {
    v18 = v5;
  }

  return v18;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)localizationDictionary
{
  return self->_localizationDictionary;
}

- (void)setLocalizationDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationDictionary, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localeString, 0);
}

@end
