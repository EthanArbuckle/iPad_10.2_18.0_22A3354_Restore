@implementation HFConditionNaturalLanguageOptions

+ (id)optionsForCondition:(id)a3 inHome:(id)a4 formattingContext:(int64_t)a5 formattingStyle:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  HFTimeConditionNaturalLanguageOptions *v12;
  uint64_t v13;
  HFPresenceConditionNaturalLanguageOptions *v14;
  HFPresenceConditionNaturalLanguageOptions *v15;

  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    v12 = [HFTimeConditionNaturalLanguageOptions alloc];
    v13 = objc_msgSend(v11, "timeConditionType");

    v14 = -[HFTimeConditionNaturalLanguageOptions initWithFormattingContext:formattingStyle:type:](v12, "initWithFormattingContext:formattingStyle:type:", a5, a6, v13);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[HFPresenceConditionNaturalLanguageOptions initWithHome:formattingContext:formattingStyle:]([HFPresenceConditionNaturalLanguageOptions alloc], "initWithHome:formattingContext:formattingStyle:", v10, a5, a6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = -[HFCharacteristicConditionNaturalLanguageOptions initWithFormattingContext:]([HFCharacteristicConditionNaturalLanguageOptions alloc], "initWithFormattingContext:", a5);
      else
        v14 = -[HFSubstringNaturalLanguageOptions initWithFormattingContext:formattingStyle:]([HFConditionNaturalLanguageOptions alloc], "initWithFormattingContext:formattingStyle:", a5, a6);
    }
  }
  v15 = v14;

  return v15;
}

@end
