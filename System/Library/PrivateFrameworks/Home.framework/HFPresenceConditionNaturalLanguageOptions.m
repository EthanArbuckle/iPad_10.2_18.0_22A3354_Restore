@implementation HFPresenceConditionNaturalLanguageOptions

- (HFPresenceConditionNaturalLanguageOptions)initWithHome:(id)a3 formattingContext:(int64_t)a4 formattingStyle:(int64_t)a5
{
  id v9;
  HFPresenceConditionNaturalLanguageOptions *v10;
  HFPresenceConditionNaturalLanguageOptions *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFPresenceConditionNaturalLanguageOptions;
  v10 = -[HFSubstringNaturalLanguageOptions initWithFormattingContext:formattingStyle:](&v13, sel_initWithFormattingContext_formattingStyle_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_home, a3);

  return v11;
}

- (HFPresenceConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_formattingContext_formattingStyle_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPresenceCondition+NaturalLanguage.m"), 109, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPresenceConditionNaturalLanguageOptions initWithFormattingContext:formattingStyle:]",
    v7);

  return 0;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
