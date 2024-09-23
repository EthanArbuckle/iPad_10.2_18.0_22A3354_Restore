@implementation _NBNumberFormat

- (_NBNumberFormat)initWithPattern:(id)a3 withFormat:(id)a4 withLeadingDigitsPatterns:(id)a5 withNationalPrefixFormattingRule:(id)a6 whenFormatting:(BOOL)a7 withDomesticCarrierCodeFormattingRule:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _NBNumberFormat *v18;
  _NBNumberFormat *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_NBNumberFormat;
  v18 = -[_NBNumberFormat init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pattern, a3);
    objc_storeStrong((id *)&v19->_format, a4);
    objc_storeStrong((id *)&v19->_leadingDigitsPatterns, a5);
    objc_storeStrong((id *)&v19->_nationalPrefixFormattingRule, a6);
    v19->_nationalPrefixOptionalWhenFormatting = a7;
    objc_storeStrong((id *)&v19->_domesticCarrierCodeFormattingRule, a8);
  }

  return v19;
}

- (_NBNumberFormat)initWithEntry:(id)a3
{
  id v4;
  _NBNumberFormat *v5;
  _NBNumberFormat *v6;
  uint64_t v7;
  NSString *pattern;
  uint64_t v9;
  NSString *format;
  uint64_t v11;
  NSArray *leadingDigitsPatterns;
  uint64_t v13;
  NSString *nationalPrefixFormattingRule;
  void *v15;
  uint64_t v16;
  NSString *domesticCarrierCodeFormattingRule;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_NBNumberFormat;
  v5 = -[_NBNumberFormat init](&v19, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "nb_safeStringAtIndex:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    pattern = v6->_pattern;
    v6->_pattern = (NSString *)v7;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 2);
    v9 = objc_claimAutoreleasedReturnValue();
    format = v6->_format;
    v6->_format = (NSString *)v9;

    objc_msgSend(v4, "nb_safeArrayAtIndex:", 3);
    v11 = objc_claimAutoreleasedReturnValue();
    leadingDigitsPatterns = v6->_leadingDigitsPatterns;
    v6->_leadingDigitsPatterns = (NSArray *)v11;

    objc_msgSend(v4, "nb_safeStringAtIndex:", 4);
    v13 = objc_claimAutoreleasedReturnValue();
    nationalPrefixFormattingRule = v6->_nationalPrefixFormattingRule;
    v6->_nationalPrefixFormattingRule = (NSString *)v13;

    objc_msgSend(v4, "nb_safeNumberAtIndex:", 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_nationalPrefixOptionalWhenFormatting = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "nb_safeStringAtIndex:", 5);
    v16 = objc_claimAutoreleasedReturnValue();
    domesticCarrierCodeFormattingRule = v6->_domesticCarrierCodeFormattingRule;
    v6->_domesticCarrierCodeFormattingRule = (NSString *)v16;

  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_NBNumberFormat pattern](self, "pattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBNumberFormat format](self, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBNumberFormat leadingDigitsPatterns](self, "leadingDigitsPatterns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBNumberFormat nationalPrefixFormattingRule](self, "nationalPrefixFormattingRule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_NBNumberFormat nationalPrefixOptionalWhenFormatting](self, "nationalPrefixOptionalWhenFormatting"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  -[_NBNumberFormat domesticCarrierCodeFormattingRule](self, "domesticCarrierCodeFormattingRule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[pattern:%@, format:%@, leadingDigitsPattern:%@, nationalPrefixFormattingRule:%@, nationalPrefixOptionalWhenFormatting:%@, domesticCarrierCodeFormattingRule:%@]"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NBNumberFormat *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _NBNumberFormat *v11;

  v4 = [_NBNumberFormat alloc];
  -[_NBNumberFormat pattern](self, "pattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBNumberFormat format](self, "format");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBNumberFormat leadingDigitsPatterns](self, "leadingDigitsPatterns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NBNumberFormat nationalPrefixFormattingRule](self, "nationalPrefixFormattingRule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_NBNumberFormat nationalPrefixOptionalWhenFormatting](self, "nationalPrefixOptionalWhenFormatting");
  -[_NBNumberFormat domesticCarrierCodeFormattingRule](self, "domesticCarrierCodeFormattingRule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_NBNumberFormat initWithPattern:withFormat:withLeadingDigitsPatterns:withNationalPrefixFormattingRule:whenFormatting:withDomesticCarrierCodeFormattingRule:](v4, "initWithPattern:withFormat:withLeadingDigitsPatterns:withNationalPrefixFormattingRule:whenFormatting:withDomesticCarrierCodeFormattingRule:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (NSString)pattern
{
  return self->_pattern;
}

- (void)setPattern:(id)a3
{
  objc_storeStrong((id *)&self->_pattern, a3);
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (NSArray)leadingDigitsPatterns
{
  return self->_leadingDigitsPatterns;
}

- (void)setLeadingDigitsPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_leadingDigitsPatterns, a3);
}

- (NSString)nationalPrefixFormattingRule
{
  return self->_nationalPrefixFormattingRule;
}

- (void)setNationalPrefixFormattingRule:(id)a3
{
  objc_storeStrong((id *)&self->_nationalPrefixFormattingRule, a3);
}

- (BOOL)nationalPrefixOptionalWhenFormatting
{
  return self->_nationalPrefixOptionalWhenFormatting;
}

- (void)setNationalPrefixOptionalWhenFormatting:(BOOL)a3
{
  self->_nationalPrefixOptionalWhenFormatting = a3;
}

- (NSString)domesticCarrierCodeFormattingRule
{
  return self->_domesticCarrierCodeFormattingRule;
}

- (void)setDomesticCarrierCodeFormattingRule:(id)a3
{
  objc_storeStrong((id *)&self->_domesticCarrierCodeFormattingRule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domesticCarrierCodeFormattingRule, 0);
  objc_storeStrong((id *)&self->_nationalPrefixFormattingRule, 0);
  objc_storeStrong((id *)&self->_leadingDigitsPatterns, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
}

@end
