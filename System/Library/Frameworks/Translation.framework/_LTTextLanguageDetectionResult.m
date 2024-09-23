@implementation _LTTextLanguageDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTTextLanguageDetectionResult)initWithCoder:(id)a3
{
  id v4;
  _LTTextLanguageDetectionResult *v5;
  uint64_t v6;
  NSLocale *dominantLocale;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSCountedSet *localeDetectionCount;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSCountedSet *unsupportedLanguageCounts;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *lowConfidenceLocales;
  _LTTextLanguageDetectionResult *v23;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_LTTextLanguageDetectionResult;
  v5 = -[_LTTextLanguageDetectionResult init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dominantLocale"));
    v6 = objc_claimAutoreleasedReturnValue();
    dominantLocale = v5->_dominantLocale;
    v5->_dominantLocale = (NSLocale *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("localeDetectionCount"));
    v11 = objc_claimAutoreleasedReturnValue();
    localeDetectionCount = v5->_localeDetectionCount;
    v5->_localeDetectionCount = (NSCountedSet *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("unsupportedLanguageCount"));
    v16 = objc_claimAutoreleasedReturnValue();
    unsupportedLanguageCounts = v5->_unsupportedLanguageCounts;
    v5->_unsupportedLanguageCounts = (NSCountedSet *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("lowConfidenceLocales"));
    v21 = objc_claimAutoreleasedReturnValue();
    lowConfidenceLocales = v5->_lowConfidenceLocales;
    v5->_lowConfidenceLocales = (NSArray *)v21;

    v23 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSLocale *dominantLocale;
  id v5;

  dominantLocale = self->_dominantLocale;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dominantLocale, CFSTR("dominantLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localeDetectionCount, CFSTR("localeDetectionCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unsupportedLanguageCounts, CFSTR("unsupportedLanguageCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowConfidenceLocales, CFSTR("lowConfidenceLocales"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[NSCountedSet count](self->_localeDetectionCount, "count");
  v5 = -[NSCountedSet count](self->_unsupportedLanguageCounts, "count");
  -[NSLocale localeIdentifier](self->_dominantLocale, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Detection result locale count: %zd, unsupported count: %zd, dominant: %@, lowConfidenceLocales: %@"), v4, v5, v6, self->_lowConfidenceLocales);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSLocale)dominantUnsupportedLocale
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[_LTTextLanguageDetectionResult dominantLocale](self, "dominantLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (NSLocale *)0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_LTTextLanguageDetectionResult unsupportedLanguageCounts](self, "unsupportedLanguageCounts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {

    v10 = 0;
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      -[_LTTextLanguageDetectionResult unsupportedLanguageCounts](self, "unsupportedLanguageCounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countForObject:", v13);

      if (v15 > v9)
      {
        v16 = v13;

        v9 = v15;
        v10 = v16;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v8);

  if (!v9 || (objc_msgSend(v10, "isEqualToString:", CFSTR("__unknown__")) & 1) != 0)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return (NSLocale *)v17;
}

- (NSLocale)dominantLocale
{
  return self->_dominantLocale;
}

- (void)setDominantLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSCountedSet)localeDetectionCount
{
  return self->_localeDetectionCount;
}

- (void)setLocaleDetectionCount:(id)a3
{
  objc_storeStrong((id *)&self->_localeDetectionCount, a3);
}

- (NSCountedSet)unsupportedLanguageCounts
{
  return self->_unsupportedLanguageCounts;
}

- (void)setUnsupportedLanguageCounts:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedLanguageCounts, a3);
}

- (NSArray)lowConfidenceLocales
{
  return self->_lowConfidenceLocales;
}

- (void)setLowConfidenceLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowConfidenceLocales, 0);
  objc_storeStrong((id *)&self->_unsupportedLanguageCounts, 0);
  objc_storeStrong((id *)&self->_localeDetectionCount, 0);
  objc_storeStrong((id *)&self->_dominantLocale, 0);
}

@end
