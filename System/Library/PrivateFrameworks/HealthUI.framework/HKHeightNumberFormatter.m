@implementation HKHeightNumberFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "unitForDisplayType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    objc_msgSend(v7, "doubleValue");
    HKFormattedFeetAndInches(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HKNumberFormatterWithDecimalPrecisionAndStyle(2, objc_msgSend(v8, "roundingMode"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromNumber:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

@end
