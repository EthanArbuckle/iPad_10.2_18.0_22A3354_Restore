@implementation HFUnknownCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  HFConditionUISummary *v8;

  v4 = a3;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFConditionNameUnknown"), CFSTR("HFConditionNameUnknown"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "formattingContext");

  if (v6 != 5)
  {
    objc_msgSend(v5, "hf_stringByCapitalizingFirstWord");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  v8 = -[HFConditionUISummary initWithCondition:title:description:]([HFConditionUISummary alloc], "initWithCondition:title:description:", self, v5, 0);

  return v8;
}

+ (BOOL)canHandlePredicate:(id)a3
{
  return 1;
}

@end
