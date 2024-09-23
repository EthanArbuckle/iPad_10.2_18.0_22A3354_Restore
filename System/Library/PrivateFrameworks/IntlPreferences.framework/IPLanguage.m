@implementation IPLanguage

+ (id)languageWithIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "languageWithIdentifier:normalize:", a3, 1);
}

+ (id)languageWithIdentifier:(id)a3 normalize:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v4)
  {
    +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v8);

  }
  else
  {
    objc_msgSend(v6, "setIdentifier:", v5);
  }
  if (+[IntlUtility forceCapitalizationInLanguageLists](IntlUtility, "forceCapitalizationInLanguageLists"))
  {
    if (+[IntlUtility canCapitalizeAutonymForLanguage:](IntlUtility, "canCapitalizeAutonymForLanguage:", v5))
    {
      v9 = 4;
    }
    else
    {
      v9 = 3;
    }
    v10 = 4;
  }
  else
  {
    v10 = 3;
    v9 = 3;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForLanguage:context:", v5, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v12);

  v13 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeWithLocaleIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForLanguage:context:", v5, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedStringForName:", v16);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IPLanguage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IPLanguage identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPLanguage identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (IPLanguage)minimizedLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IPLanguage *v12;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99DC8];
  -[IPLanguage identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsFromLocaleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", v8))
  {
    v9 = (void *)MEMORY[0x1E0C99DC8];
    -[IPLanguage identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "baseLanguageFromLanguage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", v11);
    v12 = (IPLanguage *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = self;
  }

  return v12;
}

+ (id)IPLanguagesWithLanguages:(id)a3 normalize:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        +[IPLanguage languageWithIdentifier:normalize:](IPLanguage, "languageWithIdentifier:normalize:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v4, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)localizedStringForName
{
  return self->_localizedStringForName;
}

- (void)setLocalizedStringForName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedStringForName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStringForName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
