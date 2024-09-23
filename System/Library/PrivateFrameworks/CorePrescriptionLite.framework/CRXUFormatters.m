@implementation CRXUFormatters

+ (id)BOOLAsString:(BOOL)a3
{
  if (a3)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

+ (id)timeIntervalAsString:(double)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v5 = v4;
  if (a3 < 0.0)
  {
    objc_msgSend(v4, "appendString:", CFSTR("-"));
    a3 = -a3;
  }
  v6 = (unint64_t)a3;
  v7 = (a3 - (double)(unint64_t)a3) * 1000.0;
  v8 = v6 % 0xE10;
  v9 = v6 % 0xE10 / 0x3C;
  v10 = v6 % 0xE10 % 0x3C;
  if (v6 >= 0xE10)
    objc_msgSend(v5, "appendFormat:", CFSTR("%lu:"), v6 / 0xE10);
  if (objc_msgSend(v5, "length"))
  {
    v11 = CFSTR("%02lu:");
  }
  else
  {
    if (v8 < 0x3C)
      goto LABEL_10;
    v11 = CFSTR("%lu:");
  }
  objc_msgSend(v5, "appendFormat:", v11, v9);
LABEL_10:
  if (objc_msgSend(v5, "length"))
    v12 = CFSTR("%02lu");
  else
    v12 = CFSTR("%lu");
  objc_msgSend(v5, "appendFormat:", v12, v10);
  if ((unint64_t)v7)
    objc_msgSend(v5, "appendFormat:", CFSTR(".%03lu"), (unint64_t)v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
