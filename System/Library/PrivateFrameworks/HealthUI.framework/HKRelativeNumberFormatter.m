@implementation HKRelativeNumberFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v6 = a3;
  HKNumberFormatterWithDecimalPrecisionAndStyle(2, objc_msgSend(a4, "roundingMode"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "plusSign");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPositivePrefix:", v9);

  objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableCurrentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v10);

  objc_msgSend(v8, "stringFromNumber:", &unk_1E9CED488);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", &unk_1E9CED498);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isEqualToString:", v11) & 1) != 0 || objc_msgSend(v13, "isEqualToString:", v12))
  {
    objc_msgSend(v8, "setPositivePrefix:", 0);
    objc_msgSend(v8, "stringFromNumber:", &unk_1E9CED498);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v13;
  }
  v15 = v14;

  return v15;
}

@end
