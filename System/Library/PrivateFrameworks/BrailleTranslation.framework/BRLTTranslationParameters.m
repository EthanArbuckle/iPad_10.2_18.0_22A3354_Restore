@implementation BRLTTranslationParameters

- (BRLTTranslationParameters)initWithLanguage:(id)a3 mode:(unint64_t)a4 partial:(BOOL)a5 useTechnicalTable:(BOOL)a6 textPositionsRange:(_NSRange)a7 textFormattingRanges:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  BRLTTranslationParameters *v16;
  uint64_t v17;
  NSString *language;
  objc_super v20;

  length = a7.length;
  location = a7.location;
  v14 = a3;
  v15 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BRLTTranslationParameters;
  v16 = -[BRLTTranslationParameters init](&v20, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    language = v16->_language;
    v16->_language = (NSString *)v17;

    v16->_mode = a4;
    v16->_partial = a5;
    v16->_useTechnicalTableIfPossible = a6;
    v16->_textPositionsRange.location = location;
    v16->_textPositionsRange.length = length;
    objc_storeStrong((id *)&v16->_textFormattingRanges, a8);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  objc_super v13;
  NSRange v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)BRLTTranslationParameters;
  -[BRLTTranslationParameters description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRLTTranslationParameters language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRLTTranslationParameters mode](self, "mode") - 1;
  if (v6 > 3)
    v7 = CFSTR("?");
  else
    v7 = off_24CBF0E78[v6];
  if (-[BRLTTranslationParameters isPartial](self, "isPartial"))
    v8 = " partial";
  else
    v8 = "";
  if (-[BRLTTranslationParameters useTechnicalTableIfPossible](self, "useTechnicalTableIfPossible"))
    v9 = "YES";
  else
    v9 = "NO";
  v14.location = -[BRLTTranslationParameters textPositionsRange](self, "textPositionsRange");
  NSStringFromRange(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ lang:%@ mode:%@%s useTechnicalTable:%s pos:%@>"), v4, v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BRLTTranslationParameters)initWithCoder:(id)a3
{
  id v4;
  BRLTTranslationParameters *v5;
  uint64_t v6;
  NSString *language;
  void *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BRLTTextFormattingRanges *textFormattingRanges;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BRLTTranslationParameters;
  v5 = -[BRLTTranslationParameters init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v6 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v6;

    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    v5->_partial = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("partial"));
    v5->_useTechnicalTableIfPossible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useTechnicalTable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textPositionsRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_textPositionsRange.location = objc_msgSend(v8, "rangeValue");
    v5->_textPositionsRange.length = v9;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("textFormatting"));
    v13 = objc_claimAutoreleasedReturnValue();
    textFormattingRanges = v5->_textFormattingRanges;
    v5->_textFormattingRanges = (BRLTTextFormattingRanges *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  -[BRLTTranslationParameters language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("language"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BRLTTranslationParameters mode](self, "mode"), CFSTR("mode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BRLTTranslationParameters isPartial](self, "isPartial"), CFSTR("partial"));
  objc_msgSend(v4, "encodeBool:forKey:", -[BRLTTranslationParameters useTechnicalTableIfPossible](self, "useTechnicalTableIfPossible"), CFSTR("useTechnicalTable"));
  v6 = (void *)MEMORY[0x24BDD1968];
  v7 = -[BRLTTranslationParameters textPositionsRange](self, "textPositionsRange");
  objc_msgSend(v6, "valueWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("textPositionsRange"));

  -[BRLTTranslationParameters textFormattingRanges](self, "textFormattingRanges");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("textFormatting"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)language
{
  return self->_language;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)isPartial
{
  return self->_partial;
}

- (BOOL)useTechnicalTableIfPossible
{
  return self->_useTechnicalTableIfPossible;
}

- (_NSRange)textPositionsRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textPositionsRange.length;
  location = self->_textPositionsRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BRLTTextFormattingRanges)textFormattingRanges
{
  return self->_textFormattingRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFormattingRanges, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
