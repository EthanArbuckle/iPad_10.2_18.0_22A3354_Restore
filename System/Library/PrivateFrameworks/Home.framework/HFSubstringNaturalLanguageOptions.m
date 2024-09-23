@implementation HFSubstringNaturalLanguageOptions

- (HFSubstringNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4
{
  HFSubstringNaturalLanguageOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFSubstringNaturalLanguageOptions;
  result = -[HFNaturalLanguageOptions init](&v7, sel_init);
  if (result)
  {
    result->_formattingContext = a3;
    result->_formattingStyle = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFSubstringNaturalLanguageOptions;
  v4 = -[HFNaturalLanguageOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setFormattingContext:", -[HFSubstringNaturalLanguageOptions formattingContext](self, "formattingContext"));
  objc_msgSend(v4, "setFormattingStyle:", -[HFSubstringNaturalLanguageOptions formattingStyle](self, "formattingStyle"));
  return v4;
}

- (int64_t)formattingContext
{
  return self->_formattingContext;
}

- (void)setFormattingContext:(int64_t)a3
{
  self->_formattingContext = a3;
}

- (int64_t)formattingStyle
{
  return self->_formattingStyle;
}

- (void)setFormattingStyle:(int64_t)a3
{
  self->_formattingStyle = a3;
}

@end
