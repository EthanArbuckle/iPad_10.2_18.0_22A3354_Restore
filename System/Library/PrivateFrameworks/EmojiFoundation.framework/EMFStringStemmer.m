@implementation EMFStringStemmer

+ (unsigned)supportsLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  char **v8;
  const char *v9;
  const char **v10;
  int v11;
  unsigned __int8 v12;
  const char *v13;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "stemmerLanguageNameForLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (v6 = objc_msgSend(objc_retainAutorelease(v4), "cStringUsingEncoding:", 1)) != 0
    && (v7 = (const char *)v6, v8 = sb_stemmer_list(), (v9 = *v8) != 0))
  {
    v10 = (const char **)(v8 + 1);
    do
    {
      v11 = strcmp(v9, v7);
      v12 = v11 == 0;
      if (!v11)
        break;
      v13 = *v10++;
      v9 = v13;
    }
    while (v13);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)supportedLanguageNames
{
  id v2;
  char **v3;
  _QWORD *v4;
  void *v5;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = sb_stemmer_list();
  if (*v3)
  {
    v4 = v3 + 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v5);

    }
    while (*v4++);
  }
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

+ (id)stemmerLanguageNameForLocale:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "localeWithLocaleIdentifier:", CFSTR("en"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedStringForLanguageCode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v8;
  v13 = v12;

  return v13;
}

- (EMFStringStemmer)initWithLocale:(id)a3
{
  id v5;
  EMFStringStemmer *v6;
  EMFStringStemmer *v7;
  NSLock *v8;
  NSLock *stemmerLock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFStringStemmer;
  v6 = -[EMFStringStemmer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_encoding = 4;
    objc_storeStrong((id *)&v6->_locale, a3);
    v7->_stemmer = (sb_stemmer *)objc_msgSend((id)objc_opt_class(), "_createSnowballStemmerForLocale:", v5);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    stemmerLock = v7->_stemmerLock;
    v7->_stemmerLock = v8;

  }
  return v7;
}

- (void)dealloc
{
  sb_stemmer *stemmer;
  objc_super v4;

  stemmer = self->_stemmer;
  if (stemmer)
    sb_stemmer_delete(stemmer);
  v4.receiver = self;
  v4.super_class = (Class)EMFStringStemmer;
  -[EMFStringStemmer dealloc](&v4, sel_dealloc);
}

- (id)stemToken:(id)a3
{
  char *v4;
  int v5;
  uint64_t v6;
  void *v7;

  if (self->_stemmer)
  {
    v4 = (char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", self->_encoding);
    -[NSLock lock](self->_stemmerLock, "lock");
    v5 = strlen(v4);
    v6 = sb_stemmer_stem((uint64_t)self->_stemmer, v4, v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6, (int)sb_stemmer_length((uint64_t)self->_stemmer), self->_encoding);
    -[NSLock unlock](self->_stemmerLock, "unlock");
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)stemTokens:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[EMFStringStemmer stemToken:](self, "stemToken:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

+ (sb_stemmer)_createSnowballStemmerForLocale:(id)a3
{
  id v3;
  void *v4;
  id v5;
  sb_stemmer *v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "stemmerLanguageNameForLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  v6 = (sb_stemmer *)sb_stemmer_new((char *)objc_msgSend(v5, "cStringUsingEncoding:", 1), "UTF_8");

  return v6;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(unint64_t)a3
{
  self->_encoding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_stemmerLock, 0);
}

@end
