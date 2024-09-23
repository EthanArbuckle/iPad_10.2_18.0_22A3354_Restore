@implementation _HKTieredDecimalPrecisionNumberFormatter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_58);
  return (id)sharedInstance_numberFormatter;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (unint64_t)style
{
  return 1;
}

- (id)_numberFormatterForNumber:(id)a3 displayType:(id)a4
{
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "doubleValue");
  v8 = v7;
  if (v7 >= 1.0)
  {
    v9 = objc_msgSend(v6, "roundingMode");
    v10 = -[_HKTieredDecimalPrecisionNumberFormatter style](self, "style");
    v11 = v8 < 100.0;
  }
  else
  {
    v9 = objc_msgSend(v6, "roundingMode");
    v10 = -[_HKTieredDecimalPrecisionNumberFormatter style](self, "style");
    v11 = 2;
  }
  HKNumberFormatterWithDecimalPrecisionAndStyle(v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  -[_HKTieredDecimalPrecisionNumberFormatter _numberFormatterForNumber:displayType:](self, "_numberFormatterForNumber:displayType:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
