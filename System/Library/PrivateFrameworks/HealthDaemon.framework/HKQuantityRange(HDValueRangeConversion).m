@implementation HKQuantityRange(HDValueRangeConversion)

- (_HDValueRange)valueRangeWithUnit:()HDValueRangeConversion
{
  id v4;
  _HDValueRange *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _HDValueRange *v12;

  v4 = a3;
  v5 = [_HDValueRange alloc];
  objc_msgSend(a1, "minimum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v4);
  v8 = v7;
  objc_msgSend(a1, "maximum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v4);
  v11 = v10;

  v12 = -[_HDValueRange initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:](v5, "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", objc_msgSend(a1, "isMinimumInclusive"), objc_msgSend(a1, "isMaximumInclusive"), v8, v11);
  return v12;
}

@end
