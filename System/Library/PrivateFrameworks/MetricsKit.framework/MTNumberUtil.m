@implementation MTNumberUtil

+ (id)deResNumber:(id)a3
{
  return +[MTNumberUtil deResNumber:magnitude:significantDigits:](MTNumberUtil, "deResNumber:magnitude:significantDigits:", a3, 0, 0);
}

+ (id)deResNumber:(id)a3 magnitude:(id)a4 significantDigits:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend(v8, "unsignedIntegerValue");
    else
      v10 = 0x100000;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = objc_msgSend(v9, "unsignedIntegerValue");
    else
      v12 = 2;
    objc_msgSend(v7, "doubleValue");
    +[MTNumberUtil deResDouble:magnitude:significantDigits:](MTNumberUtil, "deResDouble:magnitude:significantDigits:", v10, v12);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (double)deResDouble:(double)a3 magnitude:(int64_t)a4 significantDigits:(int64_t)a5
{
  double result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  result = NAN;
  if (a4 >= 1 && (a5 & 0x8000000000000000) == 0)
  {
    v8 = (double)(unint64_t)__exp10((double)a5);
    v9 = a3 / (double)a4 / v8;
    v10 = floor(v9);
    v11 = ceil(v9);
    if (v9 <= 0.0)
      v12 = v11;
    else
      v12 = v10;
    return v12 * v8;
  }
  return result;
}

@end
