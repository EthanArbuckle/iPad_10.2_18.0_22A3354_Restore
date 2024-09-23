@implementation INDeferredLocalizedString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLocalization, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_formatKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (id)_intents_encodeForProto
{
  void *v2;
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v11;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[INDeferredLocalizedString(ProtoUtils) _intents_encodeForProto]";
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_ERROR, "%s Failed to encode string for proto: %@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (INDeferredLocalizedString)initWithCoder:(id)a3
{
  id v4;
  INDeferredLocalizedString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *formatKey;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *table;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *bundleIdentifier;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSURL *bundleURL;
  NSURL *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSString *cachedLocalization;
  uint64_t v34;
  NSString *v35;
  INDeferredLocalizedString *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)INDeferredLocalizedString;
  v5 = -[INDeferredLocalizedString init](&v38, sel_init);
  if (!v5)
    goto LABEL_9;
  v6 = objc_opt_class();
  NSStringFromSelector(sel__formatKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  formatKey = v5->_formatKey;
  v5->_formatKey = (NSString *)v8;

  if (!v5->_formatKey)
    goto LABEL_9;
  v10 = objc_opt_class();
  NSStringFromSelector(sel__table);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  table = v5->_table;
  v5->_table = (NSString *)v12;

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__arguments);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = (void *)(v18 ? v18 : MEMORY[0x1E0C9AA60]);
  objc_storeStrong((id *)&v5->_arguments, v20);

  v21 = objc_opt_class();
  NSStringFromSelector(sel__bundleIdentifier);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v23;

  v25 = objc_opt_class();
  NSStringFromSelector(sel__bundleURL);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  bundleURL = v5->_bundleURL;
  v5->_bundleURL = (NSURL *)v27;

  v29 = v5->_bundleURL;
  if (!v29 || -[NSURL isFileURL](v29, "isFileURL"))
  {
    v30 = objc_opt_class();
    NSStringFromSelector(sel__cachedLocalization);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    cachedLocalization = v5->_cachedLocalization;
    v5->_cachedLocalization = (NSString *)v32;

    -[INDeferredLocalizedString localizeForLanguage:](v5, "localizeForLanguage:", 0);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v5->_cachedLocalization;
    v5->_cachedLocalization = (NSString *)v34;

    v36 = v5;
  }
  else
  {
LABEL_9:
    v36 = 0;
  }

  return v36;
}

- (INDeferredLocalizedString)initWithDeferredFormat:(id)a3 fromTable:(id)a4 bundleIdentifier:(id)a5 bundleURL:(id)a6 arguments:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INDeferredLocalizedString *v17;
  uint64_t v18;
  NSString *formatKey;
  uint64_t v20;
  NSString *table;
  uint64_t v22;
  NSString *bundleIdentifier;
  uint64_t v24;
  NSURL *bundleURL;
  uint64_t v26;
  NSArray *arguments;
  NSString *v28;
  NSURL *v29;
  INDeferredLocalizedString *v30;
  NSString *v31;
  NSString *v32;
  NSString *cachedLocalization;
  void *v34;
  NSString *v35;
  uint64_t v36;
  NSString *v37;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v42.receiver = self;
  v42.super_class = (Class)INDeferredLocalizedString;
  v17 = -[INDeferredLocalizedString init](&v42, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    formatKey = v17->_formatKey;
    v17->_formatKey = (NSString *)v18;

    v41 = v13;
    v20 = objc_msgSend(v13, "copy");
    table = v17->_table;
    v17->_table = (NSString *)v20;

    v40 = v14;
    v22 = objc_msgSend(v14, "copy");
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    bundleURL = v17->_bundleURL;
    v17->_bundleURL = (NSURL *)v24;

    v26 = objc_msgSend(v16, "copy");
    arguments = v17->_arguments;
    v17->_arguments = (NSArray *)v26;

    v28 = v17->_bundleIdentifier;
    v29 = v17->_bundleURL;
    if (*(_OWORD *)&v17->_bundleIdentifier == 0)
    {
      v30 = 0;
    }
    else
    {
      v39 = v12;
      v31 = v17->_formatKey;
      v32 = v17->_table;
      cachedLocalization = v17->_cachedLocalization;
      +[INImageServiceConnection sharedConnection](INImageServiceConnection, "sharedConnection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v31;
      v12 = v39;
      INLocalizedDeferredString(v35, (id *)&v17->_arguments, v32, v28, v29, cachedLocalization, 0, v34);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v17->_cachedLocalization;
      v17->_cachedLocalization = (NSString *)v36;

      v30 = v17;
    }
    v14 = v40;
    v13 = v41;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)localizeForLanguage:(id)a3
{
  NSString *formatKey;
  NSString *table;
  NSString *bundleIdentifier;
  NSURL *bundleURL;
  NSString *cachedLocalization;
  id v10;
  void *v11;
  void *v12;
  NSArray *v14;

  v14 = self->_arguments;
  formatKey = self->_formatKey;
  table = self->_table;
  bundleIdentifier = self->_bundleIdentifier;
  bundleURL = self->_bundleURL;
  cachedLocalization = self->_cachedLocalization;
  v10 = a3;
  +[INImageServiceConnection sharedConnection](INImageServiceConnection, "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedDeferredString(formatKey, (id *)&v14, table, bundleIdentifier, bundleURL, cachedLocalization, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (INDeferredLocalizedString)initWithDeferredFormat:(id)a3 fromTable:(id)a4 bundle:(id)a5 arguments:(char *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *i;
  char *v23;
  INDeferredLocalizedString *v24;
  char *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = a6;
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      v16 = v15;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "containingBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v16, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bundleURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  INLocalizedFormat(v10, v11, v13, v14, 0, 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  INSharedFormatRegularExpression();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length"));

  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21); v21; --v21)
  {
    v23 = v26;
    v26 += 8;
    objc_msgSend(i, "addObject:", *(_QWORD *)v23);
  }
  v24 = -[INDeferredLocalizedString initWithDeferredFormat:fromTable:bundleIdentifier:bundleURL:arguments:](self, "initWithDeferredFormat:fromTable:bundleIdentifier:bundleURL:arguments:", v10, v11, v13, v14, i);

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[INDeferredLocalizedString _formatKey](self, "_formatKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__formatKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[INDeferredLocalizedString _table](self, "_table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__table);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[INDeferredLocalizedString _arguments](self, "_arguments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__arguments);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[INDeferredLocalizedString _bundleIdentifier](self, "_bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__bundleIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[INDeferredLocalizedString _bundleURL](self, "_bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__bundleURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[INDeferredLocalizedString _cachedLocalization](self, "_cachedLocalization");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__cachedLocalization);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

- (NSString)_table
{
  return self->_table;
}

- (NSString)_formatKey
{
  return self->_formatKey;
}

- (NSString)_cachedLocalization
{
  return self->_cachedLocalization;
}

- (NSURL)_bundleURL
{
  return self->_bundleURL;
}

- (NSString)_bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)_arguments
{
  return self->_arguments;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (id)description
{
  return self->_cachedLocalization;
}

- (unint64_t)length
{
  return -[NSString length](self->_cachedLocalization, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_cachedLocalization, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSString getCharacters:range:](self->_cachedLocalization, "getCharacters:range:", a3, a4.location, a4.length);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INDeferredLocalizedString _formatKey](self, "_formatKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__formatKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, v9);

  -[INDeferredLocalizedString _table](self, "_table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__table);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v10, v11);

  -[INDeferredLocalizedString _arguments](self, "_arguments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__arguments);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v12, v13);

  -[INDeferredLocalizedString _bundleIdentifier](self, "_bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__bundleIdentifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v14, v15);

  -[INDeferredLocalizedString _bundleURL](self, "_bundleURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__bundleURL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v16, v17);

  objc_msgSend(v6, "languageCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    -[INDeferredLocalizedString localizeForLanguage:](self, "localizeForLanguage:", v18);
  else
    -[INDeferredLocalizedString _cachedLocalization](self, "_cachedLocalization");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__cachedLocalization);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v19, v20);

  v21 = (void *)objc_msgSend(v7, "copy");
  return v21;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4;
  INDeferredLocalizedString *v5;
  void *v6;
  uint64_t v7;
  NSString *formatKey;
  void *v9;
  uint64_t v10;
  NSString *table;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *bundleIdentifier;
  void *v19;
  uint64_t v20;
  NSURL *bundleURL;
  NSURL *v22;
  void *v23;
  uint64_t v24;
  NSString *cachedLocalization;
  uint64_t v26;
  NSString *v27;
  INDeferredLocalizedString *v28;

  v4 = a3;
  v5 = objc_alloc_init(INDeferredLocalizedString);
  NSStringFromSelector(sel__formatKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intents_stringForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  formatKey = v5->_formatKey;
  v5->_formatKey = (NSString *)v7;

  if (!v5->_formatKey)
    goto LABEL_8;
  NSStringFromSelector(sel__table);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intents_stringForKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  table = v5->_table;
  v5->_table = (NSString *)v10;

  NSStringFromSelector(sel__arguments);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intents_safeObjectForKey:ofType:", v12, objc_opt_class());
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)(v13 ? v13 : MEMORY[0x1E0C9AA60]);
  objc_storeStrong((id *)&v5->_arguments, v15);

  NSStringFromSelector(sel__bundleIdentifier);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intents_stringForKey:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v17;

  NSStringFromSelector(sel__bundleURL);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intents_urlForKey:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  bundleURL = v5->_bundleURL;
  v5->_bundleURL = (NSURL *)v20;

  v22 = v5->_bundleURL;
  if (!v22 || -[NSURL isFileURL](v22, "isFileURL"))
  {
    NSStringFromSelector(sel__cachedLocalization);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intents_stringForKey:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    cachedLocalization = v5->_cachedLocalization;
    v5->_cachedLocalization = (NSString *)v24;

    -[INDeferredLocalizedString localizeForLanguage:](v5, "localizeForLanguage:", 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v5->_cachedLocalization;
    v5->_cachedLocalization = (NSString *)v26;

    v28 = v5;
  }
  else
  {
LABEL_8:
    v28 = 0;
  }

  return v28;
}

@end
