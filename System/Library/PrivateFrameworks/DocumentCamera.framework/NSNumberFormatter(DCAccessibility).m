@implementation NSNumberFormatter(DCAccessibility)

+ (id)dcaxLocalizedUnsignedInteger:()DCAccessibility
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dcaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)dcaxLocalizedDouble:()DCAccessibility
{
  return objc_msgSend(a1, "dcaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)dcaxLocalizedDouble:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dcaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)dcaxLocalizedPercentage:()DCAccessibility
{
  return objc_msgSend(a1, "dcaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)dcaxLocalizedPercentage:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dcaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v5, 3, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility
{
  return objc_msgSend(a1, "dcaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1);
}

+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  return objc_msgSend(a1, "dcaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1, a4);
}

+ (uint64_t)dcaxLocalizedNumber:()DCAccessibility numberStyle:
{
  return objc_msgSend(a1, "dcaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, a4, 1);
}

+ (id)dcaxLocalizedNumber:()DCAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setNumberStyle:", a4);
  objc_msgSend(v8, "setMaximumFractionDigits:", a5);
  objc_msgSend(v8, "stringFromNumber:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
