@implementation HKTimePeriodWithSecondsNumberFormatter

- (HKTimePeriodWithSecondsNumberFormatter)init
{
  HKTimePeriodWithSecondsNumberFormatter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKTimePeriodWithSecondsNumberFormatter;
  result = -[HKTimePeriodWithSecondsNumberFormatter init](&v3, sel_init);
  if (result)
    result->_secondsRoundingMode = 0;
  return result;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  double v6;
  double v7;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(a3, "doubleValue");
  v7 = v6;
  HKSeparateTimeIntervalComponents();
  if (v7 < 2.22044605e-16 || 0.0 > 2.22044605e-16)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[HKTimePeriodWithSecondsNumberFormatter allowMillisecondPrecision](self, "allowMillisecondPrecision"))
      v10 = 2;
    else
      v10 = 0;
    HKNumberFormatterWithDecimalPrecisionAndStyle(v10, -[HKTimePeriodWithSecondsNumberFormatter secondsRoundingMode](self, "secondsRoundingMode"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = &stru_1E9C4C428;
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SECONDS_PAIR_SHORT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v18);
    v19 = objc_msgSend(v9, "count");
    switch(v19)
    {
      case 3:
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("TIME_DISPLAY_3"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringWithFormat:", v22, v23, v25, v26);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 2:
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("TIME_DISPLAY_2"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringWithFormat:", v22, v23, v25);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("TIME_DISPLAY_1"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringWithFormat:", v22, v23);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:

        goto LABEL_17;
      default:
LABEL_17:

        goto LABEL_18;
    }

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  HKTimePeriodStringGenerator(v9, 0);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v16;
}

- (BOOL)allowMillisecondPrecision
{
  return self->_allowMillisecondPrecision;
}

- (void)setAllowMillisecondPrecision:(BOOL)a3
{
  self->_allowMillisecondPrecision = a3;
}

- (unint64_t)secondsRoundingMode
{
  return self->_secondsRoundingMode;
}

- (void)setSecondsRoundingMode:(unint64_t)a3
{
  self->_secondsRoundingMode = a3;
}

@end
