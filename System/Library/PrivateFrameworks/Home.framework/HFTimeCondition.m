@implementation HFTimeCondition

- (id)hf_naturalLanguageSummaryWithOptions:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  HFConditionUISummary *v14;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 3)
  {
    v5 = 0;
    goto LABEL_3;
  }
  if (objc_msgSend(v4, "type") == 2)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultConditionForType:", objc_msgSend(v4, "type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFCondition isEqual:](self, "isEqual:", v10);
    v8 = objc_msgSend(v4, "formattingStyle") != 3 || v9;

  }
  v11 = objc_msgSend(v4, "timeContext");
  if (!v11)
  {
    if ((v8 & 1) == 0)
    {
      v5 = objc_msgSend(v4, "formattingStyle") != 3;
LABEL_3:
      objc_msgSend((id)objc_opt_class(), "_formattedStringForTimeCondition:style:formattingContext:", self, v5, objc_msgSend(v4, "formattingContext"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      if (v6)
        goto LABEL_18;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v11 != 1 || v9)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  objc_msgSend((id)objc_opt_class(), "_formattedStringForTimeCondition:style:formattingContext:", self, 1, objc_msgSend(v4, "formattingContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  objc_msgSend((id)objc_opt_class(), "_nameForConditionType:formattingStyle:formattingContext:", objc_msgSend(v4, "type"), objc_msgSend(v4, "formattingStyle"), objc_msgSend(v4, "formattingContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  if (objc_msgSend(v4, "formattingContext") != 5)
  {
    objc_msgSend(v6, "hf_stringByCapitalizingFirstWord");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "hf_stringByCapitalizingFirstWord");
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
    v6 = (void *)v12;
  }
  v14 = -[HFConditionUISummary initWithCondition:title:description:]([HFConditionUISummary alloc], "initWithCondition:title:description:", self, v6, v7);

  return v14;
}

+ (id)hf_naturalLanguageSummaryForTypeOnlyWithOptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  HFConditionUISummary *v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_nameForConditionType:formattingStyle:formattingContext:", objc_msgSend(v3, "type"), objc_msgSend(v3, "formattingStyle"), objc_msgSend(v3, "formattingContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "formattingContext");

  if (v5 != 5)
  {
    objc_msgSend(v4, "hf_stringByCapitalizingFirstWord");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v7 = -[HFConditionUISummary initWithCondition:title:description:]([HFConditionUISummary alloc], "initWithCondition:title:description:", 0, v4, 0);

  return v7;
}

+ (id)_nameForConditionType:(unint64_t)a3 formattingStyle:(int64_t)a4 formattingContext:(int64_t)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__HFTimeCondition_NaturalLanguage___nameForConditionType_formattingStyle_formattingContext___block_invoke;
  v11[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v11[4] = a3;
  __92__HFTimeCondition_NaturalLanguage___nameForConditionType_formattingStyle_formattingContext___block_invoke((uint64_t)v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4 != 3)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("_Short"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  _HFLocalizedStringWithDefaultValue(v7, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *__92__HFTimeCondition_NaturalLanguage___nameForConditionType_formattingStyle_formattingContext___block_invoke(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1 < 4)
    return off_1EA728FD8[v1];
  NSLog(CFSTR("Unknown type %d!"), *(_QWORD *)(a1 + 32));
  return 0;
}

+ (id)_formattedStringForTimeRangeCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  __CFString *v19;
  void *v20;

  v7 = a3;
  objc_msgSend(v7, "startCondition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_formattedStringForTimeCondition:style:formattingContext:", v8, 1, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endCondition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_formattedStringForTimeCondition:style:formattingContext:", v10, 1, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = CFSTR("HFConditionDescriptionTimeRangeFormat");
  if (a4 != 1)
    v18 = 0;
  if (a4)
    v19 = (__CFString *)v18;
  else
    v19 = CFSTR("HFConditionNameTimeRangeFormat");
  HFLocalizedStringWithFormat(v19, CFSTR("%1$@ %2$@"), v12, v13, v14, v15, v16, v17, (uint64_t)v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_formattedStringForTimeCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_formattedStringForTimeRangeCondition:style:formattingContext:", v8, a4, a5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_formattedStringForDateComponentsCondition:style:formattingContext:", v8, a4, a5);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSLog(CFSTR("Unknown time condition type %@"), v8);
        v10 = 0;
        goto LABEL_8;
      }
      objc_msgSend(a1, "_formattedStringForSunriseSunsetCondition:style:formattingContext:", v8, a4, a5);
      v9 = objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = (void *)v9;
LABEL_8:

  return v10;
}

+ (id)_formattedStringForDateComponentsCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  objc_msgSend(v6, "dateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v10, 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4 == 1)
    {
      v13 = v11;
    }
    else
    {
      v14 = objc_msgSend(v6, "comparisonType");
      if (v14 > 2)
        v15 = 0;
      else
        v15 = off_1EA728FF8[v14];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFConditionNameDate%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedStringWithFormat(v16, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_formattedStringForSunriseSunsetCondition:(id)a3 style:(unint64_t)a4 formattingContext:(int64_t)a5
{
  id v8;
  __CFString *v9;
  objc_class *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  char v16;
  const __CFString *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v38;

  v8 = a3;
  v9 = CFSTR("HFConditionDescription");
  if (a4 != 1)
    v9 = 0;
  if (!a4)
    v9 = CFSTR("HFConditionName");
  v10 = (objc_class *)MEMORY[0x1E0CB37A0];
  v11 = v9;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithString:", v11);

  if (a4 != 1)
  {
    v13 = objc_msgSend(v8, "comparisonType");
    if (v13)
    {
      if (v13 != 2)
        goto LABEL_23;
      v14 = CFSTR("After");
    }
    else
    {
      v14 = CFSTR("Before");
    }
    objc_msgSend(v12, "appendString:", v14);
  }
  objc_msgSend(v8, "significantEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB9B88]);

  if ((v16 & 1) != 0)
  {
    v17 = CFSTR("Sunrise");
    goto LABEL_15;
  }
  objc_msgSend(v8, "significantEvent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB9B90]);

  if (!v19)
  {
LABEL_23:
    v33 = 0;
    goto LABEL_30;
  }
  v17 = CFSTR("Sunset");
LABEL_15:
  objc_msgSend(v12, "appendString:", v17);
  objc_msgSend(v8, "offset");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20
    || (v21 = (void *)v20,
        objc_msgSend(v8, "offset"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v22, "hf_timeInterval"),
        v24 = v23,
        v22,
        v21,
        v24 == 0.0))
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(v8, "offset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hf_timeInterval");
    v27 = v26;

    objc_msgSend(v8, "offset");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a4 == 1)
    {
      objc_msgSend(v28, "hf_absoluteValue");
      v30 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v30;
    }
    objc_msgSend(a1, "_formattedStringForOffset:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 < 0.0)
      v32 = CFSTR("WithNegativeOffset");
    else
      v32 = CFSTR("WithPositiveOffset");
    objc_msgSend(v12, "appendString:", v32);

  }
  _HFLocalizedStringWithDefaultValue(v12, 0, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34)
    NSLog(CFSTR("No localized string for key %@"), v12);
  v38 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v34, CFSTR("%@"), &v38, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v38;
  if (!v33)
  {
    NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Couldn't localize format string in %@. Most likely, the format specifiers don't match. %@"), v36, v35);

  }
LABEL_30:

  return v33;
}

+ (id)_formattedStringForOffset:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3570];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setUnitsStyle:", 2);
  objc_msgSend(v5, "setAllowedUnits:", 96);
  objc_msgSend(v5, "stringFromDateComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)timeConditionType
{
  return 3;
}

+ (id)defaultConditionForType:(unint64_t)a3
{
  HFSunriseSunsetCondition *v3;
  HFSunriseSunsetCondition *v4;
  HFSunriseSunsetCondition *v5;
  _QWORD *v6;
  HFSunriseSunsetCondition *v7;
  HFDateComponentsCondition *v8;
  HFDateComponentsCondition *v9;
  HFTimeRangeCondition *v10;
  HFSunriseSunsetCondition *v11;

  if (a3 - 2 < 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hf_componentsWithHour:minute:", 9, 0);
    v4 = (HFSunriseSunsetCondition *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D78], "hf_componentsWithHour:minute:", 17, 0);
    v7 = (HFSunriseSunsetCondition *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFDateComponentsCondition initWithDateComponents:comparisonType:]([HFDateComponentsCondition alloc], "initWithDateComponents:comparisonType:", v4, 2);
    v9 = -[HFDateComponentsCondition initWithDateComponents:comparisonType:]([HFDateComponentsCondition alloc], "initWithDateComponents:comparisonType:", v7, 0);
    v10 = -[HFTimeRangeCondition initWithStartCondition:endCondition:]([HFTimeRangeCondition alloc], "initWithStartCondition:endCondition:", v8, v9);

  }
  else
  {
    if (a3 == 1)
    {
      v11 = [HFSunriseSunsetCondition alloc];
      v4 = -[HFSunriseSunsetCondition initWithSignificantEvent:comparisonType:](v11, "initWithSignificantEvent:comparisonType:", *MEMORY[0x1E0CB9B90], 2);
      v5 = [HFSunriseSunsetCondition alloc];
      v6 = (_QWORD *)MEMORY[0x1E0CB9B88];
    }
    else
    {
      if (a3)
      {
        NSLog(CFSTR("Unknown condition type %d"), a2, a3);
        v10 = 0;
        return v10;
      }
      v3 = [HFSunriseSunsetCondition alloc];
      v4 = -[HFSunriseSunsetCondition initWithSignificantEvent:comparisonType:](v3, "initWithSignificantEvent:comparisonType:", *MEMORY[0x1E0CB9B88], 2);
      v5 = [HFSunriseSunsetCondition alloc];
      v6 = (_QWORD *)MEMORY[0x1E0CB9B90];
    }
    v7 = -[HFSunriseSunsetCondition initWithSignificantEvent:comparisonType:](v5, "initWithSignificantEvent:comparisonType:", *v6, 0);
    v10 = -[HFTimeRangeCondition initWithStartCondition:endCondition:]([HFTimeRangeCondition alloc], "initWithStartCondition:endCondition:", v4, v7);
  }

  return v10;
}

@end
