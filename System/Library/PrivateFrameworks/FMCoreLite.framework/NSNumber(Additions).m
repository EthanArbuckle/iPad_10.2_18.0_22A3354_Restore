@implementation NSNumber(Additions)

- (BOOL)fm_isEqualToNumber:()Additions withPrecision:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = a4;
  objc_msgSend(a1, "doubleValue");
  v8 = v7;
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  return vabdd_f64(v8, v10) <= a2;
}

@end
