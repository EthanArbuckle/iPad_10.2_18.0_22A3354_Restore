@implementation HFTimeConditionNaturalLanguageOptions

- (HFTimeConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4 type:(unint64_t)a5
{
  HFTimeConditionNaturalLanguageOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFTimeConditionNaturalLanguageOptions;
  result = -[HFSubstringNaturalLanguageOptions initWithFormattingContext:formattingStyle:](&v7, sel_initWithFormattingContext_formattingStyle_, a3, a4);
  if (result)
  {
    result->_timeContext = 0;
    result->_type = a5;
  }
  return result;
}

- (HFTimeConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithFormattingContext_formattingStyle_type_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTimeCondition+NaturalLanguage.m"), 255, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTimeConditionNaturalLanguageOptions initWithFormattingContext:formattingStyle:]",
    v7);

  return 0;
}

- (unint64_t)timeContext
{
  return self->_timeContext;
}

- (void)setTimeContext:(unint64_t)a3
{
  self->_timeContext = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
