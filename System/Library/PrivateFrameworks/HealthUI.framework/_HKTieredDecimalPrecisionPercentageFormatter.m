@implementation _HKTieredDecimalPrecisionPercentageFormatter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_257 != -1)
    dispatch_once(&sharedInstance_onceToken_257, &__block_literal_global_258);
  return (id)sharedInstance_numberFormatter_256;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 1;
}

- (unint64_t)style
{
  return 3;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v7 = a3;
  -[_HKTieredDecimalPrecisionNumberFormatter _numberFormatterForNumber:displayType:](self, "_numberFormatterForNumber:displayType:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "doubleValue");
  v11 = v10;

  objc_msgSend(v9, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
