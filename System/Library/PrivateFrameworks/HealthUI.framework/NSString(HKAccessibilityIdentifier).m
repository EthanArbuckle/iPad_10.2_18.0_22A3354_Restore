@implementation NSString(HKAccessibilityIdentifier)

+ (id)healthAccessibilityIdentifier:()HKAccessibilityIdentifier suffix:
{
  id v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v5 = a4;
  if (a3)
  {
    v6 = &stru_1E9C4C428;
    if (a3 == 1)
      v6 = CFSTR("ECG");
    if (a3 == 2)
      v6 = CFSTR("IRN");
    objc_msgSend(CFSTR("UIA.Health"), "stringByAppendingFormat:", CFSTR(".%@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("UIA.Health");
  }
  v8 = v7;
  -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(".%@"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
