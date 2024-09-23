@implementation NSDate(CATCasting)

+ (id)cat_dateWithObject:()CATCasting
{
  id v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "cat_dateWithInternetTimeString:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          goto LABEL_6;
        objc_msgSend(MEMORY[0x24BDD16E0], "cat_numberWithObject:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = v7;
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v7, "integerValue"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_6;
        }
      }
      v5 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "integerValue"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_6:

  return v5;
}

@end
