@implementation CSLocalizedString

- (CSLocalizedString)initWithLocalizedStrings:(NSDictionary *)localizedStrings
{
  NSDictionary *v4;
  CSLocalizedString *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  uint64_t v9;
  objc_super v11;

  v4 = localizedStrings;
  v11.receiver = self;
  v11.super_class = (Class)CSLocalizedString;
  v5 = -[CSLocalizedString init](&v11, sel_init);
  if (v5)
  {
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("LSDefaultLocalizedValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (NSDictionary *)-[NSDictionary mutableCopy](v4, "mutableCopy");
      -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", 0, CFSTR("LSDefaultLocalizedValue"));
      -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, &stru_1E2406B38);
      v8 = v5->_localizedStrings;
      v5->_localizedStrings = v7;
    }
    else
    {
      v9 = -[NSDictionary copy](v4, "copy");
      v8 = v5->_localizedStrings;
      v5->_localizedStrings = (NSDictionary *)v9;
    }

    v5->_didTrySettingDefaultString = 0;
  }

  return v5;
}

- (NSString)localizedString
{
  int *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  NSString *defaultString;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = &OBJC_IVAR___CSUserQuery__foundSuggestionCount;
  if (self->_didTrySettingDefaultString)
    return (NSString *)*(id *)((char *)&self->super.super.isa + v3[165]);
  v4 = 24;
  if (-[NSDictionary count](self->_localizedStrings, "count") == 1)
  {
    -[NSDictionary allValues](self->_localizedStrings, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    defaultString = self->_defaultString;
    self->_defaultString = v6;

    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  -[NSDictionary allKeys](self->_localizedStrings, "allKeys");
  v5 = (void *)MDRetrieveBestAvailableLanguage();
  if (v5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_localizedStrings, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_storeStrong((id *)&self->_defaultString, v8);
      goto LABEL_34;
    }
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v11)
  {
    v9 = 0;
    goto LABEL_33;
  }
  v12 = v11;
  v29 = v5;
  v13 = *(_QWORD *)v32;
  v14 = CFSTR("-");
  v30 = v10;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v32 != v13)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v4), "objectForKeyedSubscript:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v9 = (void *)v17;
LABEL_31:
        v3 = &OBJC_IVAR___CSUserQuery__foundSuggestionCount;
        objc_storeStrong((id *)&self->_defaultString, v9);
        goto LABEL_32;
      }
      v18 = objc_msgSend(v16, "rangeOfString:options:", v14, 6);
      if (v18)
        v19 = v18 == 0x7FFFFFFFFFFFFFFFLL;
      else
        v19 = 1;
      if (v19)
        continue;
      v20 = v4;
      v21 = v13;
      v22 = v14;
      objc_msgSend(v16, "substringToIndex:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSLocalizedString localizedStrings](self, "localizedStrings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v23);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {

        v10 = v30;
        goto LABEL_31;
      }
      v25 = objc_msgSend(v16, "rangeOfString:options:", v22, 6);
      if (v25 == 0x7FFFFFFFFFFFFFFFLL || v25 == 0)
      {

        v10 = v30;
        v14 = v22;
        v13 = v21;
        v4 = v20;
      }
      else
      {
        -[CSLocalizedString localizedStrings](self, "localizedStrings");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v30;
        v14 = v22;
        v13 = v21;
        v4 = v20;
        if (v9)
          goto LABEL_31;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v12)
      continue;
    break;
  }
  v9 = 0;
  v3 = &OBJC_IVAR___CSUserQuery__foundSuggestionCount;
LABEL_32:
  v5 = v29;
LABEL_33:

LABEL_34:
LABEL_35:

  self->_didTrySettingDefaultString = 1;
  return (NSString *)*(id *)((char *)&self->super.super.isa + v3[165]);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSLocalizedString localizedStrings](self, "localizedStrings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localizedStrings"));

}

- (CSLocalizedString)initWithCoder:(id)a3
{
  id v4;
  CSLocalizedString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *localizedStrings;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSLocalizedString;
  v5 = -[CSLocalizedString init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("localizedStrings"));
    v9 = objc_claimAutoreleasedReturnValue();
    localizedStrings = v5->_localizedStrings;
    v5->_localizedStrings = (NSDictionary *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)length
{
  NSString *defaultString;
  NSString *v3;
  NSString *v4;
  unint64_t v5;

  defaultString = self->_defaultString;
  if (defaultString)
  {
    v3 = defaultString;
  }
  else
  {
    -[CSLocalizedString localizedString](self, "localizedString");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v5 = -[NSString length](v3, "length");

  return v5;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  NSString *defaultString;
  NSString *v5;
  NSString *v6;
  unsigned __int16 v7;

  defaultString = self->_defaultString;
  if (defaultString)
  {
    v5 = defaultString;
  }
  else
  {
    -[CSLocalizedString localizedString](self, "localizedString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  v7 = -[NSString characterAtIndex:](v5, "characterAtIndex:", a3);

  return v7;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSString *defaultString;
  NSString *v8;
  NSString *v9;

  length = a4.length;
  location = a4.location;
  defaultString = self->_defaultString;
  if (defaultString)
  {
    v8 = defaultString;
  }
  else
  {
    -[CSLocalizedString localizedString](self, "localizedString");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[NSString getCharacters:range:](v8, "getCharacters:range:", a3, location, length);

}

- (NSString)defaultString
{
  return self->_defaultString;
}

- (BOOL)didTrySettingDefaultString
{
  return self->_didTrySettingDefaultString;
}

- (void)setDidTrySettingDefaultString:(BOOL)a3
{
  self->_didTrySettingDefaultString = a3;
}

- (NSDictionary)localizedStrings
{
  return self->_localizedStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStrings, 0);
  objc_storeStrong((id *)&self->_defaultString, 0);
}

- (void)encodeWithCSCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "beginType:", "CSLocalizedString");
  -[CSLocalizedString localizedStrings](self, "localizedStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v4);

  objc_msgSend(v5, "endType");
}

@end
