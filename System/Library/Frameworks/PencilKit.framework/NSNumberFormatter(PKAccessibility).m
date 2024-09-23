@implementation NSNumberFormatter(PKAccessibility)

+ (id)pkaxLocalizedUnsignedInteger:()PKAccessibility
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pkaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)pkaxLocalizedDouble:()PKAccessibility
{
  return objc_msgSend(a1, "pkaxLocalizedDouble:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)pkaxLocalizedDouble:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pkaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)pkaxLocalizedPercentage:()PKAccessibility
{
  return objc_msgSend(a1, "pkaxLocalizedPercentage:maximumNumberOfDigitsAfterDecimalSeparator:", 1);
}

+ (id)pkaxLocalizedPercentage:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pkaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", v5, 3, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility
{
  return objc_msgSend(a1, "pkaxLocalizedNumber:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1);
}

+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility maximumNumberOfDigitsAfterDecimalSeparator:
{
  return objc_msgSend(a1, "pkaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, 1, a4);
}

+ (uint64_t)pkaxLocalizedNumber:()PKAccessibility numberStyle:
{
  return objc_msgSend(a1, "pkaxLocalizedNumber:numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:", a3, a4, 1);
}

+ (id)pkaxLocalizedNumber:()PKAccessibility numberStyle:maximumNumberOfDigitsAfterDecimalSeparator:
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
