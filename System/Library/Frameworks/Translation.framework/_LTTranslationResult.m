@implementation _LTTranslationResult

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_translations, CFSTR("translations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceString, CFSTR("sourceString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sanitizedSourceString, CFSTR("sanitizedSourceString"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFinal, CFSTR("isFinal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alignments, CFSTR("alignments"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_route, CFSTR("route"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disambiguableResult, CFSTR("disambiguableResult"));

}

- (_LTTranslationResult)init
{
  _LTTranslationResult *v2;
  _LTTranslationResult *v3;
  _LTTranslationResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LTTranslationResult;
  v2 = -[_LTTranslationResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isFinal = 1;
    v4 = v2;
  }

  return v3;
}

- (_LTTranslationResult)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationResult *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSLocale *locale;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *translations;
  uint64_t v15;
  NSString *sourceString;
  uint64_t v17;
  NSString *sanitizedSourceString;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *alignments;
  uint64_t v24;
  _LTDisambiguableResult *disambiguableResult;
  _LTTranslationResult *v26;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[_LTTranslationResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v8 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("translations"));
    v13 = objc_claimAutoreleasedReturnValue();
    translations = v5->_translations;
    v5->_translations = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceString"));
    v15 = objc_claimAutoreleasedReturnValue();
    sourceString = v5->_sourceString;
    v5->_sourceString = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedSourceString"));
    v17 = objc_claimAutoreleasedReturnValue();
    sanitizedSourceString = v5->_sanitizedSourceString;
    v5->_sanitizedSourceString = (NSString *)v17;

    v5->_isFinal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinal"));
    v5->_route = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("route"));
    v19 = (void *)MEMORY[0x24BDBCF20];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("alignments"));
    v22 = objc_claimAutoreleasedReturnValue();
    alignments = v5->_alignments;
    v5->_alignments = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disambiguableResult"));
    v24 = objc_claimAutoreleasedReturnValue();
    disambiguableResult = v5->_disambiguableResult;
    v5->_disambiguableResult = (_LTDisambiguableResult *)v24;

    v26 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)translations
{
  return self->_translations;
}

- (void)setTranslations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sourceString
{
  return self->_sourceString;
}

- (void)setSourceString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sanitizedSourceString
{
  return self->_sanitizedSourceString;
}

- (void)setSanitizedSourceString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (int64_t)route
{
  return self->_route;
}

- (void)setRoute:(int64_t)a3
{
  self->_route = a3;
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setAlignments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_LTDisambiguableResult)disambiguableResult
{
  return self->_disambiguableResult;
}

- (void)setDisambiguableResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguableResult, 0);
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_sanitizedSourceString, 0);
  objc_storeStrong((id *)&self->_sourceString, 0);
  objc_storeStrong((id *)&self->_translations, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
