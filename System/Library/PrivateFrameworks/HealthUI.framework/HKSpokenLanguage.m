@implementation HKSpokenLanguage

- (HKSpokenLanguage)initWithLanguageIdentifier:(id)a3 forCategory:(unint64_t)a4
{
  id v7;
  HKSpokenLanguage *v8;
  void *v9;
  uint64_t v10;
  NSString *languageInCurrentLocale;
  void *v12;
  uint64_t v13;
  NSString *languageInLanguageLocale;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKSpokenLanguage;
  v8 = -[HKSpokenLanguage init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForLanguage:context:", v7, 3);
    v10 = objc_claimAutoreleasedReturnValue();
    languageInCurrentLocale = v8->_languageInCurrentLocale;
    v8->_languageInCurrentLocale = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForLanguage:context:", v7, 3);
    v13 = objc_claimAutoreleasedReturnValue();
    languageInLanguageLocale = v8->_languageInLanguageLocale;
    v8->_languageInLanguageLocale = (NSString *)v13;

    objc_storeStrong((id *)&v8->_identifier, a3);
    v8->_languageCategoryType = a4;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t languageCategoryType;
  NSString *identifier;
  void *v7;
  NSString *languageInCurrentLocale;
  void *v9;
  NSString *languageInLanguageLocale;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (languageCategoryType = self->_languageCategoryType,
        languageCategoryType == objc_msgSend(v4, "languageCategoryType")))
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v7))
    {
      languageInCurrentLocale = self->_languageInCurrentLocale;
      objc_msgSend(v4, "languageInCurrentLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](languageInCurrentLocale, "isEqualToString:", v9))
      {
        languageInLanguageLocale = self->_languageInLanguageLocale;
        objc_msgSend(v4, "languageInLanguageLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqualToString:](languageInLanguageLocale, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_languageCategoryType + -[NSString hash](self->_identifier, "hash");
}

- (id)localizedStringForDisplay
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HKSpokenLanguage languageInCurrentLocale](self, "languageInCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSpokenLanguage languageInLanguageLocale](self, "languageInLanguageLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    -[HKSpokenLanguage languageInCurrentLocale](self, "languageInCurrentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%1$@ - %2$@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSpokenLanguage languageInCurrentLocale](self, "languageInCurrentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSpokenLanguage languageInLanguageLocale](self, "languageInLanguageLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v10, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

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

- (NSString)languageInCurrentLocale
{
  return self->_languageInCurrentLocale;
}

- (void)setLanguageInCurrentLocale:(id)a3
{
  objc_storeStrong((id *)&self->_languageInCurrentLocale, a3);
}

- (NSString)languageInLanguageLocale
{
  return self->_languageInLanguageLocale;
}

- (void)setLanguageInLanguageLocale:(id)a3
{
  objc_storeStrong((id *)&self->_languageInLanguageLocale, a3);
}

- (unint64_t)languageCategoryType
{
  return self->_languageCategoryType;
}

- (void)setLanguageCategoryType:(unint64_t)a3
{
  self->_languageCategoryType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageInLanguageLocale, 0);
  objc_storeStrong((id *)&self->_languageInCurrentLocale, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
