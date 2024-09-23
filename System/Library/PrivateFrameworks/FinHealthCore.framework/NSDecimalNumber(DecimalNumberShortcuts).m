@implementation NSDecimalNumber(DecimalNumberShortcuts)

- (BOOL)isNegative
{
  _BOOL8 v1;
  void *v2;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    if (objc_msgSend(a1, "isValid"))
    {
      objc_msgSend(MEMORY[0x24BDD1518], "zero");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend((id)v1, "compare:", v2) == -1;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)isPositive
{
  _BOOL8 v1;
  void *v2;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    if (objc_msgSend(a1, "isValid"))
    {
      objc_msgSend(MEMORY[0x24BDD1518], "zero");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend((id)v1, "compare:", v2) == 1;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)isZero
{
  _BOOL8 v1;
  void *v2;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    if (objc_msgSend(a1, "isValid"))
    {
      objc_msgSend(MEMORY[0x24BDD1518], "zero");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend((id)v1, "compare:", v2) == 0;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)isOne
{
  _BOOL8 v1;
  void *v2;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    if (objc_msgSend(a1, "isValid"))
    {
      objc_msgSend(MEMORY[0x24BDD1518], "one");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend((id)v1, "compare:", v2) == 0;

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)isValid
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2) != 0;

  return v3;
}

- (BOOL)lessThan:()DecimalNumberShortcuts
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "isValid")
    && objc_msgSend(v4, "isValid")
    && objc_msgSend(a1, "compare:", v4) == -1;

  return v5;
}

- (BOOL)lessThanOrEqual:()DecimalNumberShortcuts
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = (objc_msgSend(a1, "lessThan:", v4) & 1) != 0 || objc_msgSend(a1, "compare:", v4) == 0;

  return v5;
}

- (BOOL)greaterThan:()DecimalNumberShortcuts
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "isValid")
    && objc_msgSend(v4, "isValid")
    && objc_msgSend(a1, "compare:", v4) == 1;

  return v5;
}

- (BOOL)greaterThanOrEqual:()DecimalNumberShortcuts
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = (objc_msgSend(a1, "greaterThan:", v4) & 1) != 0 || objc_msgSend(a1, "compare:", v4) == 0;

  return v5;
}

+ (uint64_t)defaultDatabaseAmountMultiplier
{
  return objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithString:", CFSTR("100"));
}

+ (id)abs:()DecimalNumberShortcuts
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1518], "zero");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4);

  if (v5 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1518], "decimalNumberWithMantissa:exponent:isNegative:", 1, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decimalNumberByMultiplyingBy:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

@end
